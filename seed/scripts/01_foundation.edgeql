# Foundation Seed Data - Agent 1
# Creates foundational data with NO dependencies:
# - Access roles and permissions  
# - Tag system (impact, sector, technology, region, stage)
# - Platform categories

# =============================================================================
# PRE-CLEANUP: Remove existing foundation data for idempotent operation
# =============================================================================

# Delete existing access policies to prevent constraint violations
DELETE access::Policy;

# Delete existing goals to prevent constraint violations  
DELETE taxonomy::Goal;

# Delete existing tags to prevent constraint violations
DELETE taxonomy::Tag;

# =============================================================================
# ACCESS ROLES AND PERMISSIONS
# =============================================================================

# Platform Administrator Role
insert access::Policy {
    name := "Platform Administrator",
    description := "Full platform access for internal team",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    permissions := {
        access::Permission.Admin,
        access::Permission.Company,
        access::Permission.Investor,
        access::Permission.Investments,
        access::Permission.Profile,
        access::Permission.Documents,
        access::Permission.Financials,
        access::Permission.Personnel,
        access::Permission.View,
        access::Permission.Download,
        access::Permission.Upload,
        access::Permission.Deals,
        access::Permission.Impact,
        access::Permission.Messages,
        access::Permission.Connections
    }
};

# Company Owner Role
insert access::Policy {
    name := "Company Owner",
    description := "Primary company user with full company management access",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    permissions := {
        access::Permission.Company,
        access::Permission.Profile,
        access::Permission.Documents,
        access::Permission.Financials,
        access::Permission.Personnel,
        access::Permission.View,
        access::Permission.Download,
        access::Permission.Upload,
        access::Permission.Deals,
        access::Permission.Impact,
        access::Permission.Messages,
        access::Permission.Connections
    }
};

# Company Team Member Role
insert access::Policy {
    name := "Company Team Member",
    description := "Company team member with limited access",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    permissions := {
        access::Permission.Basic,
        access::Permission.Profile,
        access::Permission.View,
        access::Permission.Messages,
        access::Permission.Connections
    }
};

# Investor Role
insert access::Policy {
    name := "Investor",
    description := "Investment professional with portfolio management access",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    permissions := {
        access::Permission.Investor,
        access::Permission.Investments,
        access::Permission.View,
        access::Permission.Download,
        access::Permission.Deals,
        access::Permission.Impact,
        access::Permission.Messages,
        access::Permission.Connections
    }
};

# Basic User Role  
insert access::Policy {
    name := "Basic User",
    description := "Standard platform user with view-only access",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    permissions := {
        access::Permission.Basic,
        access::Permission.View,
        access::Permission.Messages,
        access::Permission.Connections
    }
};

# Document Viewer Role
insert access::Policy {
    name := "Document Viewer",
    description := "Read-only access to shared documents",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    permissions := {
        access::Permission.View,
        access::Permission.Download
    }
};

# =============================================================================
# IMPACT GOALS - VesCap's 12 Core Values-Based Goals
# =============================================================================

insert taxonomy::Goal {
    name := "Stewardship",
    description := "Responsible management of resources and long-term thinking",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Goal {
    name := "Human Dignity", 
    description := "Recognizing the inherent worth and value of every person",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Goal {
    name := "Justice",
    description := "Promoting fairness, fighting corruption, and protecting the vulnerable",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Goal {
    name := "Compassion",
    description := "Caring for those in need and promoting human welfare",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Goal {
    name := "Truth",
    description := "Promoting honesty, transparency, and accurate information",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Goal {
    name := "Community",
    description := "Building strong relationships and social connections",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Goal {
    name := "Freedom",
    description := "Promoting liberty, self-determination, and personal responsibility",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Goal {
    name := "Redemption",
    description := "Providing second chances and supporting transformation",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Goal {
    name := "Worship",
    description := "Facilitating spiritual growth and religious expression",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Goal {
    name := "Evangelism",
    description := "Sharing hope, transformation, and positive change",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Goal {
    name := "Family",
    description := "Supporting and strengthening family structures and relationships",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Goal {
    name := "Life",
    description := "Protecting and promoting human life at all stages",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# BUSINESS MODEL TAGS - Revenue and Business Structure
# =============================================================================

insert taxonomy::Tag {
    name := "B2B",
    description := "Business-to-business model serving other companies",
    color := "#455A64",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "B2C",
    description := "Business-to-consumer model serving individual customers",
    color := "#FF7043",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "B2B2C",
    description := "Business-to-business-to-consumer platform model",
    color := "#8E24AA",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SaaS",
    description := "Software-as-a-Service subscription model",
    color := "#2196F3",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Marketplace",
    description := "Platform connecting buyers and sellers",
    color := "#FF9800",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Freemium",
    description := "Free basic service with premium upgrades",
    color := "#4CAF50",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Platform",
    description := "Technology platform enabling third-party services",
    color := "#9C27B0",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# TEAM SIZE TAGS - Company Scale Categories  
# =============================================================================

insert taxonomy::Tag {
    name := "Solo Founder",
    description := "Single founder company",
    color := "#E91E63",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Small Team",
    description := "2-10 team members",
    color := "#FF9800",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Medium Team",
    description := "11-50 team members",
    color := "#2196F3",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Large Team",
    description := "51-200 team members",
    color := "#4CAF50",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Enterprise",
    description := "200+ team members",
    color := "#9C27B0",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# IMPACT MEASUREMENT TAGS - Impact Assessment Categories
# =============================================================================

insert taxonomy::Tag {
    name := "Measurable Impact",
    description := "Companies with quantified social/environmental impact metrics",
    color := "#4CAF50",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "B-Corp",
    description := "Certified B Corporation meeting social and environmental standards",
    color := "#2E7D32",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "ESG Focused",
    description := "Strong Environmental, Social, and Governance practices",
    color := "#1976D2",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Carbon Neutral",
    description := "Companies with net-zero carbon emissions",
    color := "#388E3C",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Diversity & Inclusion",
    description := "Strong commitment to diverse and inclusive practices",
    color := "#E91E63",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# SECTOR TAGS - Industry Categories
# =============================================================================

insert taxonomy::Tag {
    name := "Agriculture & Food",
    description := "Agricultural technology, food production, and nutrition",
    color := "#4CAF50",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Financial Technology",
    description := "Banking, payments, lending, and financial services",
    color := "#2196F3",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Healthcare & Biotechnology",
    description := "Medical technology, pharmaceuticals, and health services",
    color := "#E91E63",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Clean Energy & Environment",
    description := "Renewable energy, environmental sustainability, and climate solutions",
    color := "#FF9800",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Education & Training",
    description := "Educational technology, skills training, and knowledge platforms",
    color := "#9C27B0",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Water & Sanitation",
    description := "Water purification, distribution, and sanitation solutions",
    color := "#00BCD4",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Transportation & Mobility",
    description := "Transportation technology, logistics, and mobility solutions",
    color := "#607D8B",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Circular Economy",
    description := "Recycling, waste management, and sustainable resource use",
    color := "#795548",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Housing & Real Estate",
    description := "Housing solutions, real estate technology, and construction",
    color := "#FF5722",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# TECHNOLOGY TAGS - Technical Categories
# =============================================================================

insert taxonomy::Tag {
    name := "Artificial Intelligence",
    description := "AI, machine learning, and intelligent automation",
    color := "#3F51B5",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Blockchain & Web3",
    description := "Distributed ledger technology and decentralized applications",
    color := "#FF9800",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Internet of Things",
    description := "Connected devices and sensor networks",
    color := "#009688",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Mobile Technology",
    description := "Mobile applications and mobile-first solutions",
    color := "#4CAF50",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Cloud Computing",
    description := "Cloud infrastructure and software-as-a-service",
    color := "#2196F3",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Data Analytics",
    description := "Big data, analytics, and business intelligence",
    color := "#9C27B0",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Robotics & Automation",
    description := "Robotic systems and process automation",
    color := "#607D8B",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Cybersecurity",
    description := "Information security and privacy protection",
    color := "#F44336",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# REGION TAGS - Geographic Focus
# =============================================================================

insert taxonomy::Tag {
    name := "North America",
    description := "United States, Canada, and Mexico",
    color := "#1976D2",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Europe",
    description := "European Union and associated countries",
    color := "#388E3C",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Asia Pacific",
    description := "Asia and Pacific region countries",
    color := "#F44336",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Latin America",
    description := "Central and South American countries",
    color := "#FF9800",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Middle East & Africa",
    description := "Middle Eastern and African countries",
    color := "#9C27B0",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Global",
    description := "Worldwide operations and market focus",
    color := "#607D8B",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# STAGE TAGS - Company Development Stages
# =============================================================================

insert taxonomy::Tag {
    name := "Idea Stage",
    description := "Early concept development and validation",
    color := "#E91E63",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Pre-Seed",
    description := "Initial development and product-market fit",
    color := "#9C27B0",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Seed Stage",
    description := "Early revenue and market validation",
    color := "#673AB7",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Series A",
    description := "Proven business model and scaling",
    color := "#3F51B5",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Series B+",
    description := "Growth stage and market expansion",
    color := "#2196F3",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Revenue Positive",
    description := "Profitable operations and sustainable growth",
    color := "#4CAF50",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "Exit Ready",
    description := "Prepared for acquisition or IPO",
    color := "#FF9800",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# SDG TAGS - UN Sustainable Development Goals (for reference)
# =============================================================================

insert taxonomy::Tag {
    name := "SDG 1: No Poverty",
    description := "End poverty in all its forms everywhere",
    color := "#E5243B",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 2: Zero Hunger", 
    description := "End hunger, achieve food security and improved nutrition",
    color := "#DDA63A",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 3: Good Health",
    description := "Ensure healthy lives and promote well-being for all",
    color := "#4C9F38",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 4: Quality Education",
    description := "Ensure inclusive and equitable quality education",
    color := "#C5192D",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 5: Gender Equality",
    description := "Achieve gender equality and empower all women and girls",
    color := "#FF3A21",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 6: Clean Water",
    description := "Ensure availability and sustainable management of water",
    color := "#26BDE2",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 7: Affordable Energy",
    description := "Ensure access to affordable, reliable, sustainable energy",
    color := "#FCC30B",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 8: Decent Work",
    description := "Promote sustained, inclusive economic growth and employment",
    color := "#A21942",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 9: Innovation",
    description := "Build resilient infrastructure and promote innovation",
    color := "#FD6925",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 10: Reduced Inequalities",
    description := "Reduce inequality within and among countries",
    color := "#DD1367",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 11: Sustainable Cities",
    description := "Make cities and human settlements inclusive and sustainable",
    color := "#FD9D24",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 12: Responsible Consumption",
    description := "Ensure sustainable consumption and production patterns",
    color := "#BF8B2E",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 13: Climate Action",
    description := "Take urgent action to combat climate change",
    color := "#3F7E44",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 14: Life Below Water",
    description := "Conserve and sustainably use oceans and marine resources",
    color := "#0A97D9",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 15: Life on Land",
    description := "Protect and restore terrestrial ecosystems",
    color := "#56C02B",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 16: Peace and Justice",
    description := "Promote peaceful and inclusive societies",
    color := "#00689D",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Tag {
    name := "SDG 17: Partnerships",
    description := "Strengthen global partnerships for sustainable development",
    color := "#19486A",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};