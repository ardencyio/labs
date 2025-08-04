# VesCap Main Seed Data Script
# Executes all seed scripts in the correct dependency order
# This script can be run directly with: gel -c "$(cat seed_data.edgeql)"

# Step 1: Foundation data (NO dependencies)
# - Access roles and permissions
# - 12 Impact Goals in Pascal case (Stewardship, Human Dignity, Justice, etc.)
# - Tag system with proper spacing:
#   * Business Model: B2B, B2C, B2B2C, SaaS, Marketplace, Platform, Freemium
#   * Team Size: Solo Founder, Small Team, Medium Team, Large Team, Enterprise  
#   * Impact Measurement: Measurable Impact, B-Corp, ESG Focused, Carbon Neutral, Diversity & Inclusion
#   * Sector: Agriculture & Food, Financial Technology, Healthcare & Biotechnology, etc.
#   * Technology: Artificial Intelligence, Blockchain & Web3, IoT, Mobile, Cloud, etc.
#   * Region: North America, Europe, Asia Pacific, Latin America, Global, etc.
#   * Stage: Idea Stage, Pre-Seed, Seed Stage, Series A, Series B+, Revenue Positive, Exit Ready
#   * SDG: UN Sustainable Development Goals 1-17
# - Note: Impact Goals are separate entities for core values measurement
# - Platform categories

# Foundation script content will be inserted here when ready for deployment
# For development, use the individual scripts in the scripts/ directory

# Run this to execute foundation data:
# gel -c "$(cat scripts/01_foundation.edgeql)"

# Step 2: Entity data (depends on foundation)
# gel -c "$(cat scripts/02_entities.edgeql)"

# Step 3: Investment data (depends on entities)  
# gel -c "$(cat scripts/03_investment.edgeql)"

# NOTE: For production deployment, all scripts will be consolidated here
# For development, use ./scripts/run_seeds.sh to run individual scripts