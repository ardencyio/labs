# Database Schema Structure

This directory contains the Gel database schema split into modular files for better organization and maintainability.

## File Loading Order

EdgeDB loads schema files automatically from this directory. Files are numbered to ensure proper loading order:

1. **default.gel** - Extensions and core types (pgvector, pgcrypto, auth, ai + base types)
2. **02_access.gel** - Permission and policy system
3. **03_taxonomy.gel** - Tags, industries, and goals
4. **04_people.gel** - Person profiles and investment criteria
5. **05_companies.gel** - Company profiles and metrics
6. **06_funding.gel** - Investment rounds and funding data
7. **07_ownership.gel** - Equity and ownership tables
8. **08_content.gel** - Articles and recognition content

## Module Dependencies

The modules have the following dependency relationships:

- **Default** → Extensions and base types used by all other modules
- **Access** → Referenced by people module for policies
- **Taxonomy** → Referenced by companies, funding, and people modules
- **People** → Referenced by companies, funding, ownership, and content modules
- **Companies** → Referenced by funding, ownership, and content modules
- **Funding** → Referenced by ownership module
- **Ownership** → No external dependencies
- **Content** → No external dependencies

## Cross-Module References

Modules reference each other using fully-qualified names:

```edgeql
# Example: Company references taxonomy and people modules
multi industries: taxonomy::Industry;
multi people: people::Person;
```

## Migration Compatibility

The modular schema structure is functionally identical to the original monolithic schema. EdgeDB migration system confirms "No schema changes detected" when switching between structures.

## Benefits

- **Better Organization**: Logical separation of concerns
- **Easier Maintenance**: Smaller, focused files  
- **Improved Collaboration**: Multiple developers can work on different modules
- **Clear Dependencies**: Explicit module relationships
- **Loading Order**: Numbered prefixes ensure proper dependency resolution