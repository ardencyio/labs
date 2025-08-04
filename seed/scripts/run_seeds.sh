#!/bin/bash

# VesCap Database Seed Script Orchestrator
# Simple and reliable fresh database seeding with dependency-ordered cleanup

set -e # Exit on any error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SEED_DIR="$(dirname "$SCRIPT_DIR")"

# Use provided instance name or default to 'gel'
INSTANCE_NAME="${INSTANCE_NAME:-gel}"

echo "==> Starting VesCap fresh database seeding process..."
echo "   Instance: $INSTANCE_NAME"

# Check if gel CLI is available
if ! command -v gel &>/dev/null; then
  echo "✗ Error: 'gel' CLI not found. Please install or check your PATH."
  exit 1
fi

# Function to execute EdgeQL with error handling
execute_edgeql() {
  local description="$1"
  local query="$2"

  echo "==> $description..."
  if gel -I "$INSTANCE_NAME" query "$query" >/dev/null 2>&1; then
    echo "✓ $description completed successfully"
    return 0
  else
    echo "✗ Error: $description failed"
    return 1
  fi
}

# Function to run a seed script
run_seed_script() {
  local script_name="$1"
  local script_path="$SCRIPT_DIR/$script_name"

  if [[ ! -f "$script_path" ]]; then
    echo "✗ Error: Script $script_name not found at $script_path"
    exit 1
  fi

  echo "==> Running $script_name..."
  if gel -I "$INSTANCE_NAME" query "$(cat "$script_path")"; then
    echo "✓ $script_name completed successfully"
  else
    echo "✗ Error: $script_name failed"
    echo "==> Attempting to re-enable access policies before exit..."
    execute_edgeql "Re-enabling access policies" "CONFIGURE SYSTEM SET apply_access_policies := true;"
    exit 1
  fi
  echo ""
}

# Function to perform complete database reset using dependency-aware cleanup
reset_database_completely() {
  echo "==>  Performing complete database reset with dependency cleanup..."
  echo "   This will resolve schema dependencies and perform complete wipe"
  echo ""

  # Step 1: Disable access policies first
  echo "==> Disabling access policies for cleanup..."
  execute_edgeql "Disabling access policies" "CONFIGURE SYSTEM SET apply_access_policies := false;"
  echo ""

  # Step 2: Drop the current_user global to resolve dependencies
  echo "==> Dropping current_user global to resolve schema dependencies..."
  if gel -I "$INSTANCE_NAME" query "DROP GLOBAL default::current_user;" 2>/dev/null; then
    echo "✓ Current user global dropped successfully"
  else
    echo "⚠  Current user global may not exist or have dependencies, continuing..."
  fi
  echo ""

  # Step 3: Drop access policies to remove remaining dependencies
  echo "==> Dropping access policies to resolve dependencies..."
  if gel -I "$INSTANCE_NAME" query "DELETE access::Policy;" 2>/dev/null; then
    echo "✓ Access policies dropped successfully"
    # Verify they were actually deleted
    if policy_count=$(gel -I "$INSTANCE_NAME" query "select count(access::Policy);" 2>/dev/null | grep -o '[0-9]\+'); then
      if [ "$policy_count" -eq "0" ]; then
        echo "✓ Verified: All access policies successfully removed"
      else
        echo "⚠  Warning: $policy_count access policies still remain after deletion"
        # Force delete each policy individually
        echo "==> Attempting individual policy deletion..."
        gel -I "$INSTANCE_NAME" query "DELETE access::Policy FILTER .name = 'Platform Administrator';" 2>/dev/null || true
        gel -I "$INSTANCE_NAME" query "DELETE access::Policy FILTER .name = 'Company Owner';" 2>/dev/null || true
        gel -I "$INSTANCE_NAME" query "DELETE access::Policy FILTER .name = 'Company Team Member';" 2>/dev/null || true
        gel -I "$INSTANCE_NAME" query "DELETE access::Policy FILTER .name = 'Investor';" 2>/dev/null || true
        gel -I "$INSTANCE_NAME" query "DELETE access::Policy FILTER .name = 'Basic User';" 2>/dev/null || true
        gel -I "$INSTANCE_NAME" query "DELETE access::Policy FILTER .name = 'Document Viewer';" 2>/dev/null || true
      fi
    fi
  else
    echo "⚠  Access policies may not exist, continuing..."
  fi
  echo ""

  # Step 4: Now attempt the branch wipe
  echo "==> Wiping database branch 'main'..."
  if gel -I "$INSTANCE_NAME" branch wipe main --non-interactive 2>/dev/null; then
    echo "✓ Database branch wiped successfully"
  else
    echo "⚠  Branch wipe encountered issues, attempting manual cleanup..."
    # Fallback to manual data cleanup if branch wipe still fails
    manual_data_cleanup
  fi
  echo ""

  # Step 5: Reapply migrations to recreate schema
  echo "==> Reapplying migrations to recreate schema..."
  if gel -I "$INSTANCE_NAME" migrate 2>/dev/null; then
    echo "✓ Schema recreated successfully"
  else
    echo "✗ Error: Failed to recreate schema"
    return 1
  fi
  echo ""

  # Step 6: Disable access policies for seeding
  echo "==> Disabling access policies for seeding..."
  if execute_edgeql "Disabling access policies" "CONFIGURE SYSTEM SET apply_access_policies := false;"; then
    echo "✓ Access policies disabled for seeding"
  else
    echo "⚠  Warning: Could not disable access policies, continuing anyway..."
  fi
  echo ""
}

# Fallback manual data cleanup function
manual_data_cleanup() {
  echo "==> Performing manual data cleanup..."

  # Delete in reverse dependency order (children first, parents last)
  local cleanup_commands=(
    "DELETE funding::Allocation;"
    "DELETE funding::Investment;"
    "DELETE funding::Capital;"
    "DELETE people::Criteria;"
    "DELETE people::Person;"
    "DELETE companies::KeyMetrics;"
    "DELETE companies::Company;"
    "DELETE taxonomy::Industry;"
    "DELETE taxonomy::Goal;"
    "DELETE taxonomy::Tag;"
  )

  for cmd in "${cleanup_commands[@]}"; do
    echo "==> Executing: $cmd"
    if gel -I "$INSTANCE_NAME" query "$cmd" >/dev/null 2>&1; then
      echo "✓ Cleanup command completed"
    else
      echo "⚠  Cleanup command failed (may be expected if no data exists)"
    fi
  done

  echo "✓ Manual data cleanup completed"
}

# Function to validate entity counts
validate_seeding() {
  echo "==> Validating seeded data..."
  echo ""

  # Define expected counts and validation queries
  local validation_queries=(
    "select count(access::Policy);"
    "select count(taxonomy::Goal);"
    "select count(taxonomy::Tag);"
    "select count(taxonomy::Industry);"
    "select count(companies::Company);"
    "select count(people::Person);"
    "select count(funding::Capital);"
    "select count(funding::Investment);"
    "select count(funding::Allocation);"
  )

  local entity_names=(
    "Access Policies"
    "Impact Goals"
    "Tags"
    "Industries"
    "Companies"
    "People"
    "Funding Rounds"
    "Investments"
    "Funding Allocations"
  )

  local expected_counts=(6 12 64 120 12 39 7 28 28)
  local all_counts_correct=true
  local total_entities=0

  for i in "${!validation_queries[@]}"; do
    local query="${validation_queries[i]}"
    local entity="${entity_names[i]}"
    local expected="${expected_counts[i]}"

    echo -n "==> $entity: "
    if result=$(gel -I "$INSTANCE_NAME" query "$query" 2>/dev/null | grep -o '[0-9]\+'); then
      total_entities=$((total_entities + result))
      if [[ $result -ge $expected ]]; then
        echo "$result (✓ >= $expected expected)"
      else
        echo "$result (⚠  < $expected expected)"
        all_counts_correct=false
      fi
    else
      echo "✗ Query failed"
      all_counts_correct=false
    fi
  done

  echo ""
  echo "==> Total entities created: $total_entities"
  echo ""

  if $all_counts_correct; then
    echo "✓ All entity counts meet or exceed expectations!"
  else
    echo "⚠  Some entity counts are below expected values"
  fi

  echo ""
  echo "==> Additional validation queries:"
  echo "   • Companies with funding: $(gel -I "$INSTANCE_NAME" query "select count(companies::Company filter exists .funding);" 2>/dev/null | grep -o '[0-9]\+' || echo 'N/A')"
  echo "   • Investors with investments: $(gel -I "$INSTANCE_NAME" query "select count(people::Person filter exists .portfolio);" 2>/dev/null | grep -o '[0-9]\+' || echo 'N/A')"
  echo "   • Companies with industry links: $(gel -I "$INSTANCE_NAME" query "select count(companies::Company filter exists .industries);" 2>/dev/null | grep -o '[0-9]\+' || echo 'N/A')"
  echo "   • Total funding raised: \$$(gel -I "$INSTANCE_NAME" query "select sum(funding::Capital.raised) / 1000000;" 2>/dev/null | grep -o '[0-9.]\+' || echo 'N/A')M"

  # Detailed breakdown by investor type
  echo ""
  echo "==> Investor Breakdown:"
  echo "   • Angels: $(gel -I "$INSTANCE_NAME" query "select count(people::Person filter .role = people::Role.Investor and exists .criteria);" 2>/dev/null | grep -o '[0-9]\+' || echo 'N/A')"
  echo "   • VC Fund Staff: $(gel -I "$INSTANCE_NAME" query "select count(people::Person filter .role in {people::Role.Investor, people::Role.Other} and exists .employer);" 2>/dev/null | grep -o '[0-9]\+' || echo 'N/A')"
  echo "   • Founders: $(gel -I "$INSTANCE_NAME" query "select count(people::Person filter .role = people::Role.Founder);" 2>/dev/null | grep -o '[0-9]\+' || echo 'N/A')"

  return 0
}

# Main execution flow
main() {
  echo "==> Starting fresh database seeding process..."
  echo "   Strategy: Complete database reset + Sequential seeding"
  echo "   Scripts: 01_foundation → 02_industries → 03_entities → 04_investment"
  echo ""

  # Step 1: Complete database reset using branch wipe (unless skipped)
  if [[ -z "$SKIP_RESET" ]]; then
    reset_database_completely
  else
    echo "⚠  Skipping database reset (SKIP_RESET=1)"
    echo ""
  fi

  # Access policies are already disabled in reset_database_completely
  # Proceed directly to seeding

  # Step 2: Run seed scripts in dependency order
  echo "==>  Step 1: Foundation data (access policies, goals, tags)"
  run_seed_script "01_foundation.edgeql"

  echo "==> Step 2: Industry taxonomy (120+ SIC industries)"
  run_seed_script "02_industries.edgeql"

  echo "==> Step 3: Entity data (companies and people)"
  run_seed_script "03_entities.edgeql"

  echo "==> Step 4: Investment data (funding rounds and investments)"
  run_seed_script "04_investment.edgeql"

  # Step 3: Keep access policies disabled for development
  echo "==> Keeping access policies disabled for development UI access..."
  echo "   Access policies remain disabled to allow UI and development queries"
  echo "   To enable access policies later: gel -I "$INSTANCE_NAME" query 'CONFIGURE SYSTEM SET apply_access_policies := true;'"
  echo ""

  # Step 4: Validate seeded data
  validate_seeding

  echo "✓ All seed scripts completed successfully!"
  echo ""
  echo "✓ VesCap database is now ready with complete seed data:"
  echo "   • 12 Impact-driven companies with full teams and industry classifications"
  echo "   • 5 Angel investors with investment criteria and 5 VC funds with staff"
  echo "   • 7 Funding rounds with detailed investment allocations"
  echo "   • 28+ Individual investment records with realistic amounts"
  echo "   • 120+ SIC industry classifications covering all business sectors"
  echo "   • 64+ categorization tags for business models, stages, and regions"
  echo "   • 12 Core impact goals aligned with VesCap values framework"
  echo "   • 6 Access policies for role-based permissions"
  echo ""
  echo "==> Sample verification queries:"
  echo "   gel -I "$INSTANCE_NAME" query 'select companies::Company { name, team_size, industries: { name } } limit 3'"
  echo "   gel -I "$INSTANCE_NAME" query 'select funding::Investment { investor: { [is people::Person].fullname, [is companies::Company].name }, amount } limit 5'"
  echo "   gel -I "$INSTANCE_NAME" query 'select people::Person { fullname, employer: { name }, role } filter .role = people::Role.Founder'"
  echo "   gel -I "$INSTANCE_NAME" query 'select funding::Capital { company: { name }, target, raised, stage } order by .raised desc'"
}

# Execute main function
main "$@"
