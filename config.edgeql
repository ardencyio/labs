# Complete Gel Database Setup and Authentication Configuration
# This script creates a single superuser role and configures comprehensive authentication
# 
# USAGE: Load environment variables from .env file and apply with variable substitution:
#   source .env && envsubst < config.edgeql | gel query -f -
#
# REQUIRED ENVIRONMENT VARIABLES:
#   - GEL_SERVER_PASSWORD: Password for the goose superuser role
#   - AUTH_SIGNING_KEY: JWT signing key for authentication tokens

# ================================
# SUPERUSER ROLE CREATION
# ================================

# Create or update single admin superuser role for both UI and CLI access (bypasses all access policies)
# Password will be set using GEL_SERVER_PASSWORD environment variable
# Note: This will fail if role already exists - that's expected for repeatable setup

# Set password for goose superuser role using environment variable
ALTER ROLE goose SET password := '${GEL_SERVER_PASSWORD}';

# ================================
# AUTHENTICATION CONFIGURATION
# ================================

# Skip authentication configuration if it exists - these are already configured
# To reconfigure auth, manually delete existing cfg::Auth entries first

# Check if auth is already configured, and skip if so
SELECT cfg::Auth { priority, user } LIMIT 1;

# ================================
# NOTES
# ================================
# - Lower priority numbers = higher precedence in authentication
# - Superuser role (goose) automatically bypasses ALL access policies
# - Regular users are subject to schema-defined access policies:
#   * people::Criteria - Owner-only access (personal financial data)
#   * people::Person - Owner-only access (personal profile data)
#   * Other types - No database policies (handled by application layer)
# - Trust authentication means no password required (development only)
# - SCRAM authentication requires password verification
# - Single goose user serves both UI admin and CLI admin functions

# ================================
# AUTH PROVIDER CONFIGURATION
# ================================
# This section configures email/password and magic link providers for authentication
# These configurations enable user registration and authentication flows

# Configure auth signing key for JWT tokens
# Uses AUTH_SIGNING_KEY environment variable
CONFIGURE CURRENT BRANCH SET
ext::auth::AuthConfig::auth_signing_key := '${AUTH_SIGNING_KEY}';

# Configure allowed redirect URLs for authentication callbacks
# This allows localhost URLs for development and testing
CONFIGURE CURRENT BRANCH SET
ext::auth::AuthConfig::allowed_redirect_urls := {
    'http://localhost:50059/auth/callback',
    'http://localhost:3009/auth/callback',
    'http://localhost:3009/auth/error'
};

# Configure Email/Password Provider (skip if already exists - errors are expected for repeatable setup)
CONFIGURE CURRENT BRANCH
INSERT ext::auth::EmailPasswordProviderConfig {
    require_verification := false,
};

# Configure Magic Link Provider (skip if already exists - errors are expected for repeatable setup)
CONFIGURE CURRENT BRANCH
INSERT ext::auth::MagicLinkProviderConfig {
    token_time_to_live := <duration>"600 seconds",
};

# Configure SMTP Provider for auth extension
# Uses labs_ prefix and mailpit for development email delivery (skip if already exists - errors are expected for repeatable setup)
CONFIGURE CURRENT BRANCH
INSERT cfg::SMTPProviderConfig {
    name := 'labs_mailpit',
    sender := 'noreply@labs.local',
    host := 'mailpit',
    port := <int32>1025,
    security := 'STARTTLSOrPlainText',
    validate_certs := false,
};

# Configure auth extension to use the SMTP provider
CONFIGURE CURRENT BRANCH SET
current_email_provider_name := 'labs_mailpit';