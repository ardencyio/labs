# Gel Database Setup with Environment Variable Configuration

This project uses Gel (EdgeDB) with a secure multi-user authentication system that allows admin access to bypass access policies while keeping application-level policies active for regular users.

## Quick Start

### Automated Setup (Recommended)

```bash
# 1. Copy environment template and configure credentials
cp .env.example .env
# Edit .env with your secure credentials (see Required Environment Variables below)

# 2. Run the complete setup script
./setup.sh           # Default: wipe branch data only (safe for development)
./setup.sh -w        # Explicit: wipe branch data only  
./setup.sh -d        # Drop and recreate branch (DESTRUCTIVE)
./setup.sh --help    # Show usage options
```

The setup script will:
- Create main and dev branches if they don't exist
- Reset the main branch (wipe data by default, or drop/recreate with -d flag)
- Apply schema migrations 
- Configure authentication with environment variables
- Load all seed data (companies, people, investments, etc.)
- Verify the setup completed successfully

### Manual Setup (Alternative)

If you prefer manual setup or need to troubleshoot:

```bash
# 1. Environment setup
cp .env.example .env
# Edit .env with your secure credentials

# 2. Start Gel server  
gel project init
gel instance create labs
gel project upgrade

# 3. Setup branches and reset database
gel -I labs branch create main 2>/dev/null || echo "main exists"
gel -I labs branch create dev 2>/dev/null || echo "dev exists"  
gel -I labs branch switch main
gel -I labs branch wipe main --non-interactive

# 4. Apply schema and configuration
gel migrate
source .env && export GEL_SERVER_PASSWORD AUTH_SIGNING_KEY && envsubst < config.edgeql | gel query -f -

# 5. Load seed data
gel query -f seed/scripts/01_foundation.edgeql
gel query -f seed/scripts/02_industries.edgeql  
gel query -f seed/scripts/03_entities.edgeql
gel query -f seed/scripts/04_investment.edgeql
```

### Required Environment Variables

- `GEL_SERVER_PASSWORD`: Strong password for goose superuser (minimum 20 characters)
- `AUTH_SIGNING_KEY`: Secure JWT signing key (generate with: `openssl rand -base64 256 | tr -d '\n'`)

## Authentication Architecture

### User Roles & Access

1. **`goose` (Single Admin User)**
   - **Purpose**: Combined UI and CLI admin access with policy bypass
   - **Authentication**: 
     - Trust (no password required for UI access)
     - SCRAM (password required for CLI/API access)
   - **Privileges**: Superuser - bypasses all access policies
   - **Use Case**: All admin operations (UI, CLI, migration, data inspection)

2. **Application Users**
   - **Purpose**: Regular application access
   - **Authentication**: SCRAM (password required)
   - **Privileges**: Subject to access policies defined in schema
   - **Use Case**: Normal application operations with policy enforcement

### Access Policy Behavior

- **Superuser** (goose): Automatically bypasses ALL access policies
- **Regular Users**: Subject to schema-defined access policies:
  - `people::Criteria` - Owner-only access (personal financial data)
  - `people::Person` - Owner-only access (personal profile data)
  - Other types: No policies (application-layer authorization via gRPC)

## Security Features

### Development Mode
- `GEL_SERVER_SECURITY=insecure_dev_mode`
- Self-signed TLS certificates
- Trust authentication for UI admin
- Admin UI enabled

### Production Mode
```bash
# Update .env.local for production:
GEL_SERVER_SECURITY=strict
GEL_SERVER_TLS_CERT_MODE=require_file
GEL_CLIENT_TLS_SECURITY=strict
GEL_SERVER_ADMIN_UI=disabled
```

### Credential Security
- All sensitive data in `.env` (git-ignored) using standard Gel environment variables
- Main config file (`config.edgeql`) uses environment variable placeholders and is safe to commit
- Template provided for team setup (`.env.example` and `config.template.edgeql`)
- No credentials in committed code
- Industry-standard approach: environment variables with `envsubst` substitution

## Troubleshooting

### UI Access Issues
If tables don't load in Gel UI:

1. **Check User**: Ensure you're connecting as `goose` user
2. **Check Authentication**: Verify Trust auth is configured for `goose`
3. **Check Superuser Status**: Confirm `goose` is a superuser role

```sql
-- Check current user and superuser status
SELECT global current_user;
SELECT name, superuser FROM sys::Role WHERE name = 'goose';
```

### Policy Issues
```sql
-- Check access policy configuration
SELECT priority, user, method FROM cfg::Auth ORDER BY priority;

-- Verify current policies
SELECT name, subject FROM schema::AccessPolicy;
```

### Connection Issues
```bash
# Test connection with goose user
gel -u goose --password-from-stdin query "SELECT 'Connected as goose'"

# Test UI connection (no password needed)
gel ui  # Opens admin UI with Trust authentication
```

## Project Structure

```
├── .env                           # Sensitive environment variables (git-ignored)
├── .env.example                   # Template for environment setup (safe to commit)
├── gel.toml                       # Gel project configuration (safe to commit)
├── config.edgeql                  # Configuration with environment variable placeholders (safe to commit)
├── config.template.edgeql         # Configuration template with documentation (safe to commit)
├── dbschema/
│   ├── default.gel                # Main schema with access policies
│   └── migrations/                # Generated migration files
└── README.md                      # Documentation (this file)
```

## Commands Reference

```bash
# Environment management
cp .env.example .env
source .env

# Project setup
gel project init
gel instance create labs
gel project upgrade

# Migration management
gel migration create
gel migrate

# Configuration with environment variables
source .env && envsubst < config.edgeql | gel query -f -

# User management (using environment variables)
gel query "CREATE SUPERUSER ROLE myuser { SET password := '\$GEL_SERVER_PASSWORD' };"
gel query "ALTER ROLE myuser SET password := '\$NEW_PASSWORD';"

# Status checks
gel instance status
gel describe schema
```

## Security Best Practices

### Password and Credential Security
1. **Never commit** `.env` - it contains sensitive data and is git-ignored
2. **Use strong passwords** for all database users (minimum 20 characters)
3. **Generate secure JWT signing keys** (minimum 256 bits of entropy): `openssl rand -base64 256 | tr -d '\n'`
4. **Rotate credentials** regularly (passwords every 90 days, JWT keys every 6 months)
5. **Use different credentials** for development, staging, and production environments

### File Security Strategy
- **`config.edgeql`**: Safe to commit, contains environment variable placeholders (`${VAR_NAME}`)
- **`config.template.edgeql`**: Safe to commit template showing configuration structure
- **`.env`**: Git-ignored environment variables with all sensitive data
- **`.env.example`**: Safe to commit template for team setup

### Production Security
1. **Use production security mode** (`GEL_SERVER_SECURITY=strict`)
2. **Enable TLS certificate validation** (`GEL_CLIENT_TLS_SECURITY=strict`)
3. **Disable admin UI** in production (`GEL_SERVER_ADMIN_UI=disabled`)
4. **Monitor access logs** for suspicious activity
5. **Keep Gel version updated** for security patches
6. **Use proper SMTP security** (TLS, certificate validation) in production

## Support

For issues with:
- **Gel Database**: [Gel Documentation](https://docs.geldata.com/)
- **Access Policies**: Check schema access policy definitions
- **Authentication**: Verify cfg::Auth configuration
- **Project Setup**: Review this README and environment configuration