# Complete Gel Database Setup and Authentication Configuration Template
# This is a template file showing the structure of config.edgeql with placeholder values
# 
# SETUP INSTRUCTIONS:
# 1. Copy this file to understand the configuration structure
# 2. Use the actual config.edgeql file which references environment variables
# 3. Set up your .env file with the required values (see .env.example)
# 4. Apply configuration: source .env && envsubst < config.edgeql | gel query -f -
#
# REQUIRED ENVIRONMENT VARIABLES:
#   - GEL_SERVER_PASSWORD: Strong password for the goose superuser role (min 20 chars)
#   - AUTH_SIGNING_KEY: Secure JWT signing key (min 256 bits entropy)

# ================================
# SUPERUSER ROLE CREATION
# ================================

# Create single admin superuser role for both UI and CLI access (bypasses all access policies)
# Password will be set using GEL_SERVER_PASSWORD environment variable
CREATE SUPERUSER ROLE IF NOT EXISTS goose;

# Set password for goose superuser role using environment variable
ALTER ROLE goose SET password := '<YOUR_SECURE_ADMIN_PASSWORD>';

# ================================
# AUTHENTICATION CONFIGURATION
# ================================

# Highest Priority: Trust authentication for goose user (UI Admin - no password needed)
# This allows seamless Gel Admin UI access with full policy bypass
CONFIGURE INSTANCE INSERT cfg::Auth {
    priority := -10,
    user := 'goose',
    comment := 'UI Admin - Policy bypass for Gel Admin UI',
    method := (INSERT cfg::Trust { transports := 'HTTP' })
};

# High Priority: SCRAM authentication for goose user (CLI/API access)
CONFIGURE INSTANCE INSERT cfg::Auth {
    priority := 0,
    user := 'goose', 
    comment := 'CLI/API admin with password authentication',
    method := (INSERT cfg::SCRAM)
};

# Low Priority: Default SCRAM authentication for all other users
# Application users will be subject to access policies defined in schema
CONFIGURE INSTANCE INSERT cfg::Auth {
    priority := 10,
    user := '*',
    comment := 'Default authentication for all application users',
    method := (INSERT cfg::SCRAM)
};

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
ext::auth::AuthConfig::auth_signing_key := '<YOUR_JWT_SIGNING_KEY>';

# Configure allowed redirect URLs for authentication callbacks
# This allows localhost URLs for development and testing
CONFIGURE CURRENT BRANCH SET
ext::auth::AuthConfig::allowed_redirect_urls := {
    'http://localhost:50059/auth/callback',
    'http://localhost:3009/auth/callback',
    'http://localhost:3009/auth/error'
};

# Configure Email/Password Provider (skip if already exists)
CONFIGURE CURRENT BRANCH
INSERT ext::auth::EmailPasswordProviderConfig {
    require_verification := false,
};

# Configure Magic Link Provider (skip if already exists)
CONFIGURE CURRENT BRANCH
INSERT ext::auth::MagicLinkProviderConfig {
    token_time_to_live := <duration>"600 seconds",
};

# Configure SMTP Provider for auth extension
# Uses labs_ prefix and mailpit for development email delivery
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

# ================================
# SECURITY BEST PRACTICES
# ================================
# 1. Use strong passwords (minimum 20 characters with mixed case, numbers, symbols)
# 2. Generate secure JWT signing keys (minimum 256 bits of entropy)
# 3. Never commit the actual .env file to version control
# 4. Rotate credentials regularly (passwords every 90 days, JWT keys every 6 months)
# 5. Use different credentials for development, staging, and production
# 6. Monitor access logs for suspicious activity
# 7. Keep Gel version updated for security patches