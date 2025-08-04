#!/bin/bash
# Complete Gel Database Setup Script
# This script provides a repeatable process that configures the database, applies schema, and loads seed data
#
# Usage: ./setup.sh -I INSTANCE [OPTIONS]
# Required:
#   -I INSTANCE   Gel instance name (required)
# Options:
#   -b BRANCH     Target branch name (default: dev)
#   -c, --config  Apply configuration only (no schema/data changes)
#   -d, --drop    Drop and recreate branch (DESTRUCTIVE)  
#   -m, --migrate Migration only (create and/or apply migrations)
#   -p, --policies Configure access policies (enable/disable based on branch)
#   -s, --seed    Seed only steps (load seed data)
#   -w, --wipe    Wipe branch data only (preserves branch)
#   -h, --help    Show this help
#
# Default: wipe dev branch data only
# Access policies: main=enabled, dev=disabled

set -e

# Default options
INSTANCE_NAME=""
BRANCH_NAME="dev"
DROP_BRANCH=false
WIPE_ONLY=true
CONFIG_ONLY=false
MIGRATE_ONLY=false
SEED_ONLY=false
POLICIES_ONLY=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -I|--instance)
            INSTANCE_NAME="$2"
            shift 2
            ;;
        -b|--branch)
            BRANCH_NAME="$2"
            shift 2
            ;;
        -c|--config)
            CONFIG_ONLY=true
            shift
            ;;
        -d|--drop)
            DROP_BRANCH=true
            WIPE_ONLY=false
            shift
            ;;
        -m|--migrate)
            MIGRATE_ONLY=true
            shift
            ;;
        -p|--policies)
            POLICIES_ONLY=true
            shift
            ;;
        -s|--seed)
            SEED_ONLY=true
            shift
            ;;
        -w|--wipe)
            DROP_BRANCH=false
            WIPE_ONLY=true
            shift
            ;;
        -h|--help)
            echo "Gel Database Setup Script"
            echo ""
            echo "Usage: $0 -I INSTANCE [OPTIONS]"
            echo ""
            echo "Required:"
            echo "  -I INSTANCE   Gel instance name (required)"
            echo ""
            echo "Options:"
            echo "  -b BRANCH     Target branch name (default: dev)"
            echo "  -c, --config  Apply configuration only (no schema/data changes)"
            echo "  -d, --drop    Drop and recreate branch (DESTRUCTIVE)"
            echo "  -m, --migrate Migration only (create and/or apply migrations)"
            echo "  -p, --policies Configure access policies (main=enabled, dev=disabled)"
            echo "  -s, --seed    Seed only steps (load seed data)"
            echo "  -w, --wipe    Wipe branch data only (preserves branch)"
            echo "  -h, --help    Show this help"
            echo ""
            echo "Default: wipe dev branch data only"
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            echo "Use -h or --help for usage information"
            exit 1
            ;;
    esac
done

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_step() {
    echo -e "${BLUE}==>${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Validate required arguments
if [[ -z "$INSTANCE_NAME" ]]; then
    print_error "Instance name is required. Use -I to specify instance."
    echo "Example: $0 -I labs"
    echo "Use -h or --help for usage information"
    exit 1
fi

# Check if .env file exists
if [[ ! -f ".env" ]]; then
    print_error ".env file not found!"
    echo "Please copy .env.example to .env and configure your credentials:"
    echo "  cp .env.example .env"
    echo "  # Edit .env with your secure credentials"
    exit 1
fi

# Load environment variables
print_step "Loading environment variables from .env"
source .env

# Check required environment variables
if [[ -z "$GEL_SERVER_PASSWORD" ]]; then
    print_error "GEL_SERVER_PASSWORD not set in .env file"
    exit 1
fi

if [[ -z "$AUTH_SIGNING_KEY" ]]; then
    print_error "AUTH_SIGNING_KEY not set in .env file"
    exit 1
fi

print_success "Environment variables loaded"

# Function to apply migrations only
apply_migrations() {
    print_step "Applying migrations only"
    
    # Switch to target branch if needed
    current_branch=$(gel -I "$INSTANCE_NAME" branch list | grep "Current" | awk '{print $1}' | sed 's/\x1b\[[0-9;]*m//g')
    if [[ "$current_branch" != "$BRANCH_NAME" ]]; then
        gel -I "$INSTANCE_NAME" branch switch "$BRANCH_NAME"
        print_success "Switched to $BRANCH_NAME branch"
    fi
    
    # Create migration if needed and apply
    print_step "Creating migration if needed"
    if gel -I "$INSTANCE_NAME" migration create 2>/dev/null; then
        print_success "Migration created"
    else
        print_success "No migration needed or already exists"
    fi
    
    print_step "Applying migrations"
    gel -I "$INSTANCE_NAME" migrate
    print_success "Migrations applied"
}

# Function to apply seed data only
apply_seed_data() {
    print_step "Loading seed data only"
    
    # Switch to target branch if needed
    current_branch=$(gel -I "$INSTANCE_NAME" branch list | grep "Current" | awk '{print $1}' | sed 's/\x1b\[[0-9;]*m//g')
    if [[ "$current_branch" != "$BRANCH_NAME" ]]; then
        gel -I "$INSTANCE_NAME" branch switch "$BRANCH_NAME"
        print_success "Switched to $BRANCH_NAME branch"
    fi
    
    # Configure access policies based on branch
    if [[ "$BRANCH_NAME" == "main" ]]; then
        print_step "Temporarily disabling access policies for seeding on main branch"
        if gel -I "$INSTANCE_NAME" query "CONFIGURE SYSTEM SET apply_access_policies := false;" 2>/dev/null; then
            print_success "Access policies temporarily disabled for seeding"
        else
            print_warning "Could not disable access policies, continuing anyway"
        fi
    else
        print_step "Disabling access policies for dev branch"
        if gel -I "$INSTANCE_NAME" query "CONFIGURE SYSTEM SET apply_access_policies := false;" 2>/dev/null; then
            print_success "Access policies disabled for dev branch"
        else
            print_warning "Could not disable access policies, continuing anyway"
        fi
    fi
    
    # Run seed scripts using existing orchestrator (skip its reset since we're seed-only)
    print_step "Running seed scripts"
    if cd seed/scripts && SKIP_RESET=1 INSTANCE_NAME="$INSTANCE_NAME" ./run_seeds.sh && cd ../..; then
        print_success "Seed data loaded"
    else
        print_error "Failed to load seed data"
        return 1
    fi
    
    # Re-enable access policies for main branch after seeding
    if [[ "$BRANCH_NAME" == "main" ]]; then
        print_step "Re-enabling access policies for main branch"
        if gel -I "$INSTANCE_NAME" query "CONFIGURE SYSTEM SET apply_access_policies := true;" 2>/dev/null; then
            print_success "Access policies re-enabled for main branch"
        else
            print_warning "Could not re-enable access policies"
        fi
    fi
}

# Function to configure access policies only
configure_access_policies() {
    print_step "Configuring access policies based on branch"
    
    # Switch to target branch if needed
    current_branch=$(gel -I "$INSTANCE_NAME" branch list | grep "Current" | awk '{print $1}' | sed 's/\x1b\[[0-9;]*m//g')
    if [[ "$current_branch" != "$BRANCH_NAME" ]]; then
        gel -I "$INSTANCE_NAME" branch switch "$BRANCH_NAME"
        print_success "Switched to $BRANCH_NAME branch"
    fi
    
    # Configure policies based on branch
    if [[ "$BRANCH_NAME" == "main" ]]; then
        print_step "Enabling access policies for main branch"
        if gel -I "$INSTANCE_NAME" query "CONFIGURE SYSTEM SET apply_access_policies := true;" 2>/dev/null; then
            print_success "Access policies enabled for main branch"
        else
            print_warning "Could not enable access policies"
        fi
    else
        print_step "Disabling access policies for dev branch"
        if gel -I "$INSTANCE_NAME" query "CONFIGURE SYSTEM SET apply_access_policies := false;" 2>/dev/null; then
            print_success "Access policies disabled for dev branch"
        else
            print_warning "Could not disable access policies"
        fi
    fi
}

# Function to apply configuration only
apply_configuration() {
    print_step "Applying configuration only"
    
    # Switch to target branch if needed
    current_branch=$(gel -I "$INSTANCE_NAME" branch list | grep "Current" | awk '{print $1}' | sed 's/\x1b\[[0-9;]*m//g')
    if [[ "$current_branch" != "$BRANCH_NAME" ]]; then
        gel -I "$INSTANCE_NAME" branch switch "$BRANCH_NAME"
        print_success "Switched to $BRANCH_NAME branch"
    fi
    
    # Apply configuration with environment variables
    print_step "Applying configuration"
    export GEL_SERVER_PASSWORD AUTH_SIGNING_KEY
    if envsubst < config.edgeql | gel query -f - 2>/dev/null; then
        print_success "Configuration applied"
    else
        print_warning "Configuration partially applied (some providers may already exist)"
    fi
}

# Function to setup database
setup_database() {
    print_step "Setting up fresh database"
    
    # Create main and dev branches if they don't exist
    print_step "Ensuring main and dev branches exist"
    
    # Check if branches exist before creating
    if ! gel -I "$INSTANCE_NAME" branch list | grep -q "main"; then
        gel -I "$INSTANCE_NAME" branch create main
        print_success "Created main branch"
    else
        print_success "Main branch exists"
    fi
    
    if ! gel -I "$INSTANCE_NAME" branch list | grep -q "dev"; then
        gel -I "$INSTANCE_NAME" branch create dev
        print_success "Created dev branch"
    else
        print_success "Dev branch exists"
    fi
    
    # Switch to target branch
    current_branch=$(gel -I "$INSTANCE_NAME" branch list | grep "Current" | awk '{print $1}' | sed 's/\x1b\[[0-9;]*m//g')
    if [[ "$current_branch" != "$BRANCH_NAME" ]]; then
        gel -I "$INSTANCE_NAME" branch switch "$BRANCH_NAME"
        print_success "Switched to $BRANCH_NAME branch"
    fi
    
    # Handle branch reset based on flags
    if [[ "$DROP_BRANCH" == true ]]; then
        print_step "Dropping and recreating $BRANCH_NAME branch"
        # Switch to a different branch to drop the target
        if [[ "$BRANCH_NAME" == "main" ]]; then
            gel -I "$INSTANCE_NAME" branch switch dev
        else
            gel -I "$INSTANCE_NAME" branch switch main
        fi
        gel -I "$INSTANCE_NAME" branch drop "$BRANCH_NAME" --force
        gel -I "$INSTANCE_NAME" branch create "$BRANCH_NAME"
        gel -I "$INSTANCE_NAME" branch switch "$BRANCH_NAME"
        print_success "Branch dropped and recreated"
    elif [[ "$WIPE_ONLY" == true ]]; then
        print_step "Wiping $BRANCH_NAME branch data"
        gel -I "$INSTANCE_NAME" branch wipe "$BRANCH_NAME" --non-interactive
        print_success "Branch data wiped"
    fi
    
    # Apply schema migrations
    print_step "Applying schema migrations"
    gel migrate
    print_success "Schema migrations applied"
    
    # Apply configuration with environment variables
    print_step "Applying configuration"
    export GEL_SERVER_PASSWORD AUTH_SIGNING_KEY
    if envsubst < config.edgeql | gel query -f - 2>/dev/null; then
        print_success "Configuration applied"
    else
        print_warning "Configuration partially applied (some providers may already exist)"
    fi
    
    # Configure access policies based on branch
    if [[ "$BRANCH_NAME" == "main" ]]; then
        print_step "Temporarily disabling access policies for seeding on main branch"
        if gel -I "$INSTANCE_NAME" query "CONFIGURE SYSTEM SET apply_access_policies := false;" 2>/dev/null; then
            print_success "Access policies temporarily disabled for seeding"
        else
            print_warning "Could not disable access policies, continuing anyway"
        fi
    else
        print_step "Disabling access policies for dev branch"
        if gel -I "$INSTANCE_NAME" query "CONFIGURE SYSTEM SET apply_access_policies := false;" 2>/dev/null; then
            print_success "Access policies disabled for dev branch"
        else
            print_warning "Could not disable access policies, continuing anyway"
        fi
    fi
    
    # Run seed scripts using existing orchestrator (skip its reset since we already did it)
    print_step "Running seed scripts"
    if cd seed/scripts && SKIP_RESET=1 INSTANCE_NAME="$INSTANCE_NAME" ./run_seeds.sh && cd ../..; then
        print_success "Seed data loaded"
    else
        print_error "Failed to load seed data"
        return 1
    fi
    
    # Re-enable access policies for main branch after seeding
    if [[ "$BRANCH_NAME" == "main" ]]; then
        print_step "Re-enabling access policies for main branch"
        if gel -I "$INSTANCE_NAME" query "CONFIGURE SYSTEM SET apply_access_policies := true;" 2>/dev/null; then
            print_success "Access policies re-enabled for main branch"
        else
            print_warning "Could not re-enable access policies"
        fi
    fi
}

# Function to verify setup
verify_setup() {
    print_step "Verifying setup"
    
    # Check admin user
    admin_check=$(gel query "SELECT sys::Role { name, superuser } FILTER .name = 'goose';" 2>/dev/null || echo "")
    if [[ $admin_check == *"\"superuser\": true"* ]]; then
        print_success "Admin user configured"
    else
        print_error "Admin user not configured"
        return 1
    fi
    
    # Check authentication configuration
    auth_count=$(gel query "SELECT count(cfg::Auth);" 2>/dev/null || echo "0")
    if [[ $auth_count -gt 0 ]]; then
        print_success "Authentication configured"
    else
        print_warning "Authentication may be incomplete"
    fi
    
    print_success "Setup verification completed"
}

# Main execution
main() {
    echo -e "${BLUE}======================================\n    Gel Database Setup Script         \n======================================${NC}\n"
    
    # Confirm with user before proceeding
    echo -e "${YELLOW}This will:"
    if [[ "$CONFIG_ONLY" == true ]]; then
        echo "  - Apply configuration only (no schema/data changes)"
        echo "  - Switch to $BRANCH_NAME branch if needed"
    elif [[ "$MIGRATE_ONLY" == true ]]; then
        echo "  - Apply migrations only (create and/or apply)"
        echo "  - Switch to $BRANCH_NAME branch if needed"
    elif [[ "$SEED_ONLY" == true ]]; then
        echo "  - Load seed data only"
        echo "  - Switch to $BRANCH_NAME branch if needed"
    elif [[ "$POLICIES_ONLY" == true ]]; then
        echo "  - Configure access policies based on branch"
        echo "  - main branch: enable access policies"
        echo "  - dev branch: disable access policies"
        echo "  - Switch to $BRANCH_NAME branch if needed"
    else
        if [[ "$DROP_BRANCH" == true ]]; then
            echo "  - Drop and recreate $BRANCH_NAME branch (DESTRUCTIVE)"
        else
            echo "  - Wipe $BRANCH_NAME branch data (preserves branch)"
        fi
        echo "  - Create main and dev branches if needed"
        echo "  - Apply schema migrations"
        echo "  - Configure authentication"
        echo "  - Load seed data"
    fi
    echo ""
    echo "Instance: $INSTANCE_NAME"
    echo "Branch: $BRANCH_NAME"
    echo -e "${NC}"
    
    read -p "Continue? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_warning "Setup cancelled"
        exit 0
    fi
    
    # Run setup based on mode
    if [[ "$CONFIG_ONLY" == true ]]; then
        apply_configuration
        print_success "Configuration applied successfully"
    elif [[ "$MIGRATE_ONLY" == true ]]; then
        apply_migrations
        print_success "Migrations applied successfully"
    elif [[ "$SEED_ONLY" == true ]]; then
        apply_seed_data
        print_success "Seed data loaded successfully"
    elif [[ "$POLICIES_ONLY" == true ]]; then
        configure_access_policies
        print_success "Access policies configured successfully"
    else
        setup_database
        verify_setup
    fi
    
    echo -e "\n${GREEN}======================================\n         Setup Complete               \n======================================${NC}\n"
    if [[ "$CONFIG_ONLY" == true ]]; then
        echo "Configuration applied:"
        echo "  - Authentication configured (user: goose)"
        echo "  - Environment variables applied"
        echo
        echo "Next: gel ui"
    elif [[ "$MIGRATE_ONLY" == true ]]; then
        echo "Migrations applied:"
        echo "  - Schema migrations created (if needed)"
        echo "  - Database schema updated"
        echo
        echo "Next: gel ui"
    elif [[ "$SEED_ONLY" == true ]]; then
        echo "Seed data loaded:"
        echo "  - Foundation data"
        echo "  - Industries and entities"
        echo "  - Investment data"
        echo
        echo "Next: gel ui"
    elif [[ "$POLICIES_ONLY" == true ]]; then
        echo "Access policies configured:"
        if [[ "$BRANCH_NAME" == "main" ]]; then
            echo "  - main branch: access policies enabled"
            echo "  - Data access controlled by schema policies"
        else
            echo "  - dev branch: access policies disabled"
            echo "  - Full data access for development"
        fi
        echo
        echo "Next: gel ui"
    else
        echo "Database ready with:"
        echo "  - Authentication configured (user: goose)"
        echo "  - Schema and policies applied"
        echo "  - Seed data loaded"
        echo
        echo "Next: gel ui"
    fi
}

# Run main function
main "$@"