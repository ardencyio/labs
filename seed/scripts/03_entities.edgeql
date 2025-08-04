# Entity Seed Data - Agent 2  
# Creates people and companies using foundation data
# Dependencies: 01_foundation.edgeql (tags and roles), 02_industries.edgeql (industry taxonomy)

# =============================================================================
# PRE-CLEANUP: Remove existing entity data for idempotent operation
# =============================================================================

# Delete existing people to prevent constraint violations (must come first due to foreign keys)
DELETE people::Person;

# Delete existing companies to prevent constraint violations
DELETE companies::Company;

# Delete existing company metrics
DELETE companies::KeyMetrics;

# =============================================================================
# STARTUP COMPANIES - 7 Impact-Driven Companies Across Different Sectors
# =============================================================================

# 1. AGTECH COMPANY - CropWise AI
insert companies::Company {
    name := "CropWise AI",
    tagline := "AI-powered precision agriculture for sustainable farming",
    mission := "Empowering farmers with intelligent insights to maximize yield while minimizing environmental impact through precision agriculture technology.",
    description := "CropWise AI combines computer vision, satellite imagery, and IoT sensors to provide farmers with real-time crop health monitoring, predictive analytics for pest and disease management, and precision irrigation recommendations. Our platform helps farmers increase yields by 20-30% while reducing water usage by 40% and pesticide use by 60%.",
    founded := <datetime>'2021-03-15T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "Davis, California, USA",
    operations := {"United States", "Canada", "Mexico"},
    team_size := 28,
    technical_staff := 18,
    website := "https://cropwise.ai",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    industries := assert_distinct({
        (select taxonomy::Industry filter .sic = "0161"),  # Vegetables and Melons
        (select taxonomy::Industry filter .sic = "7371"),  # Computer Programming Services
        (select taxonomy::Industry filter .sic = "7379")   # Artificial Intelligence Services
    }),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Agriculture & Food"),
        (select taxonomy::Tag filter .name = "Artificial Intelligence"),
        (select taxonomy::Tag filter .name = "Internet of Things"),
        (select taxonomy::Tag filter .name = "North America"),
        (select taxonomy::Tag filter .name = "Seed Stage"),
        (select taxonomy::Tag filter .name = "SDG 2: Zero Hunger"),
        (select taxonomy::Tag filter .name = "SDG 13: Climate Action"),
        (select taxonomy::Tag filter .name = "B2B"),
        (select taxonomy::Tag filter .name = "SaaS"),
        (select taxonomy::Tag filter .name = "Medium Team"),
        (select taxonomy::Tag filter .name = "Measurable Impact")
    })
};

# 2. FINTECH COMPANY - FairLend
insert companies::Company {
    name := "FairLend",
    tagline := "Transparent microfinance for underserved communities",
    mission := "Democratizing access to fair, transparent financial services for small business owners and entrepreneurs in underserved communities worldwide.",
    description := "FairLend operates a digital microfinance platform that uses alternative credit scoring and blockchain technology to provide transparent, fair loans to small business owners who lack traditional credit history. Our platform has served over 50,000 borrowers across 15 countries with a 95% repayment rate and average loan sizes of $500-$5,000.",
    founded := <datetime>'2020-08-20T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "San Francisco, California, USA",
    operations := {"Global", "Africa", "Latin America", "Asia"},
    team_size := 45,
    technical_staff := 25,
    website := "https://fairlend.io",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    industries := assert_distinct({
        (select taxonomy::Industry filter .sic = "6141"),  # Credit Institutions
        (select taxonomy::Industry filter .sic = "7371"),  # Computer Programming Services
        (select taxonomy::Industry filter .sic = "6099")   # Financial Technology
    }),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Financial Technology"),
        (select taxonomy::Tag filter .name = "Blockchain & Web3"),
        (select taxonomy::Tag filter .name = "Mobile Technology"),
        (select taxonomy::Tag filter .name = "Global"),
        (select taxonomy::Tag filter .name = "Series A"),
        (select taxonomy::Tag filter .name = "SDG 1: No Poverty"),
        (select taxonomy::Tag filter .name = "SDG 8: Decent Work"),
        (select taxonomy::Tag filter .name = "B2C"),
        (select taxonomy::Tag filter .name = "Platform"),
        (select taxonomy::Tag filter .name = "Medium Team"),
        (select taxonomy::Tag filter .name = "Measurable Impact")
    })
};

# 3. HEALTHTECH COMPANY - MindBridge Therapeutics  
insert companies::Company {
    name := "MindBridge Therapeutics",
    tagline := "Digital mental health platform for addiction recovery",
    mission := "Providing accessible, evidence-based digital therapeutics for addiction recovery and mental health support, bridging the gap between traditional treatment and ongoing care.",
    description := "MindBridge Therapeutics develops FDA-approved digital therapeutics for substance abuse recovery, combining cognitive behavioral therapy with AI-powered personalized support. Our platform provides 24/7 access to recovery tools, peer support networks, and clinical oversight, resulting in 60% higher long-term sobriety rates compared to traditional treatment alone.",
    founded := <datetime>'2019-11-10T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "Boston, Massachusetts, USA",
    operations := {"United States", "Canada", "United Kingdom"},
    team_size := 38,
    technical_staff := 16,
    website := "https://mindbridgethx.com",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    industries := assert_distinct({
        (select taxonomy::Industry filter .sic = "8099"),  # Health and Allied Services
        (select taxonomy::Industry filter .sic = "7371"),  # Computer Programming Services
        (select taxonomy::Industry filter .sic = "7379")   # Artificial Intelligence Services
    }),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Healthcare & Biotechnology"),
        (select taxonomy::Tag filter .name = "Artificial Intelligence"),
        (select taxonomy::Tag filter .name = "Mobile Technology"),
        (select taxonomy::Tag filter .name = "North America"),
        (select taxonomy::Tag filter .name = "Series A"),
        (select taxonomy::Tag filter .name = "SDG 3: Good Health"),
        (select taxonomy::Tag filter .name = "B2B"),
        (select taxonomy::Tag filter .name = "SaaS"),
        (select taxonomy::Tag filter .name = "Medium Team"),
        (select taxonomy::Tag filter .name = "Measurable Impact")
    })
};

# 4. CLEAN ENERGY COMPANY - SolarGrid Solutions
insert companies::Company {
    name := "SolarGrid Solutions",
    tagline := "Community-owned renewable energy microgrids",
    mission := "Enabling communities to achieve energy independence through locally-owned solar microgrids that provide reliable, affordable clean energy while creating local economic opportunities.",
    description := "SolarGrid Solutions designs, builds, and operates community-owned solar microgrids that provide reliable electricity to underserved rural and urban communities. Our innovative financing model allows communities to own their energy infrastructure, reducing electricity costs by 40% while creating local jobs and energy independence.",
    founded := <datetime>'2020-01-25T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "Austin, Texas, USA",
    operations := {"United States", "Mexico", "Philippines", "Kenya"},
    team_size := 52,
    technical_staff := 25,
    website := "https://solargridsolutions.com",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    industries := assert_distinct({
        (select taxonomy::Industry filter .sic = "4911"),  # Electric Services
        (select taxonomy::Industry filter .sic = "8711"),  # Engineering Services
        (select taxonomy::Industry filter .sic = "3699")   # Renewable Energy Technology
    }),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Clean Energy & Environment"),
        (select taxonomy::Tag filter .name = "Internet of Things"),
        (select taxonomy::Tag filter .name = "Data Analytics"),
        (select taxonomy::Tag filter .name = "Global"),
        (select taxonomy::Tag filter .name = "Series A"),
        (select taxonomy::Tag filter .name = "SDG 7: Affordable Energy"),
        (select taxonomy::Tag filter .name = "SDG 13: Climate Action"),
        (select taxonomy::Tag filter .name = "B2B"),
        (select taxonomy::Tag filter .name = "SaaS"),
        (select taxonomy::Tag filter .name = "Medium Team"),
        (select taxonomy::Tag filter .name = "Carbon Neutral")
    })
};

# 5. EDUCATION COMPANY - LearnBridge Academy
insert companies::Company {
    name := "LearnBridge Academy",
    tagline := "Faith-integrated online education for homeschooling families",
    mission := "Providing high-quality, faith-integrated online education that empowers families to educate their children with both academic excellence and strong moral foundations.",
    description := "LearnBridge Academy offers a comprehensive K-12 online curriculum that integrates faith-based perspectives with rigorous academic content. Our platform serves over 15,000 homeschooling families worldwide with live classes, interactive learning tools, and strong community support, achieving test scores 25% above national averages.",
    founded := <datetime>'2018-09-05T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "Nashville, Tennessee, USA",
    operations := {"United States", "Canada", "Australia", "United Kingdom"},
    team_size := 85,
    technical_staff := 30,
    website := "https://learnbridgeacademy.org",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    industries := assert_distinct({
        (select taxonomy::Industry filter .sic = "8299"),  # Educational Services
        (select taxonomy::Industry filter .sic = "7371"),  # Computer Programming Services
        (select taxonomy::Industry filter .sic = "7379")   # Artificial Intelligence Services
    }),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Education & Training"),
        (select taxonomy::Tag filter .name = "Cloud Computing"),
        (select taxonomy::Tag filter .name = "Mobile Technology"),
        (select taxonomy::Tag filter .name = "Global"),
        (select taxonomy::Tag filter .name = "Revenue Positive"),
        (select taxonomy::Tag filter .name = "SDG 4: Quality Education"),
        (select taxonomy::Tag filter .name = "B2B"),
        (select taxonomy::Tag filter .name = "SaaS"),
        (select taxonomy::Tag filter .name = "Medium Team"),
        (select taxonomy::Tag filter .name = "ESG Focused")
    })
};

# 6. WATER COMPANY - AquaPure Systems
insert companies::Company {
    name := "AquaPure Systems",
    tagline := "Solar-powered water purification for remote communities",
    mission := "Bringing clean, safe drinking water to remote and underserved communities through innovative solar-powered purification systems that require minimal maintenance and local operation.",
    description := "AquaPure Systems develops and deploys solar-powered water purification systems specifically designed for remote communities lacking access to clean water infrastructure. Our systems can purify 10,000 liters per day, require minimal maintenance, and have brought clean water to over 200,000 people across 25 countries.",
    founded := <datetime>'2019-06-12T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "Denver, Colorado, USA",
    operations := {"Africa", "Latin America", "Asia", "Pacific Islands"},
    team_size := 34,
    technical_staff := 20,
    website := "https://aquapuresystems.org",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    industries := assert_distinct({
        (select taxonomy::Industry filter .sic = "4941"),  # Water Supply
        (select taxonomy::Industry filter .sic = "8711"),  # Engineering Services
        (select taxonomy::Industry filter .sic = "8999")   # Environmental Technology
    }),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Water & Sanitation"),
        (select taxonomy::Tag filter .name = "Clean Energy & Environment"),
        (select taxonomy::Tag filter .name = "Internet of Things"),
        (select taxonomy::Tag filter .name = "Global"),
        (select taxonomy::Tag filter .name = "Seed Stage"),
        (select taxonomy::Tag filter .name = "SDG 6: Clean Water"),
        (select taxonomy::Tag filter .name = "SDG 7: Affordable Energy"),
        (select taxonomy::Tag filter .name = "B2B"),
        (select taxonomy::Tag filter .name = "SaaS"),
        (select taxonomy::Tag filter .name = "Small Team"),
        (select taxonomy::Tag filter .name = "Measurable Impact")
    })
};

# 7. MOBILITY COMPANY - AccessRide
insert companies::Company {
    name := "AccessRide",
    tagline := "Accessible transportation for people with disabilities",
    mission := "Creating inclusive transportation solutions that provide dignified, accessible mobility options for people with disabilities in urban and rural communities.",
    description := "AccessRide operates a specialized ride-sharing platform designed specifically for people with disabilities, featuring wheelchair-accessible vehicles, trained drivers, and assistive technology integration. Our service operates in 12 major metropolitan areas and has completed over 500,000 rides with 99.2% customer satisfaction.",
    founded := <datetime>'2020-04-18T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "Seattle, Washington, USA",
    operations := {"United States", "Canada"},
    team_size := 42,
    technical_staff := 19,
    website := "https://accessride.com",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    industries := assert_distinct({
        (select taxonomy::Industry filter .sic = "4119"),  # Local Passenger Transportation
        (select taxonomy::Industry filter .sic = "7371"),  # Computer Programming Services
        (select taxonomy::Industry filter .sic = "7379")   # Social Impact Technology
    }),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Transportation & Mobility"),
        (select taxonomy::Tag filter .name = "Mobile Technology"),
        (select taxonomy::Tag filter .name = "Data Analytics"),
        (select taxonomy::Tag filter .name = "North America"),
        (select taxonomy::Tag filter .name = "Seed Stage"),
        (select taxonomy::Tag filter .name = "SDG 10: Reduced Inequalities"),
        (select taxonomy::Tag filter .name = "SDG 11: Sustainable Cities"),
        (select taxonomy::Tag filter .name = "B2C"),
        (select taxonomy::Tag filter .name = "Platform"),
        (select taxonomy::Tag filter .name = "Small Team"),
        (select taxonomy::Tag filter .name = "Diversity & Inclusion")
    })
};

# =============================================================================
# PEOPLE - Founders, Executives, and Team Members
# =============================================================================

# CROPWISE AI TEAM
# Founder & CEO
insert people::Person {
    firstname := "Sarah",
    lastname := "Chen",
    email := "sarah.chen@example.com",
    profile := "Agricultural engineer turned entrepreneur with 12 years experience in precision agriculture. PhD in Agricultural Engineering from UC Davis, former research scientist at John Deere. Passionate about using technology to help farmers feed the world sustainably.",
    role := people::Role.Founder,
    job_title := "Founder & CEO",
    linkedin_url := "https://linkedin.com/in/sarahchen-cropwise",
    joined_date := <datetime>'2021-03-15T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "CropWise AI")),
    policies := {
        (select access::Policy filter .name = "Company Owner")
    }
};

# CTO
insert people::Person {
    firstname := "Marcus",
    lastname := "Rodriguez",
    email := "marcus.rodriguez@example.com",
    profile := "Full-stack engineer and AI specialist with expertise in computer vision and IoT systems. Former senior engineer at Google focusing on agricultural applications of machine learning. MS Computer Science from Stanford.",
    role := people::Role.Cto,
    job_title := "Chief Technology Officer",
    linkedin_url := "https://linkedin.com/in/marcusrodriguez-tech",
    joined_date := <datetime>'2021-04-01T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "CropWise AI")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Head of Product
insert people::Person {
    firstname := "Emily",
    lastname := "Thompson",
    email := "emily.thompson@example.com",
    profile := "Product management leader with deep expertise in agricultural technology and farmer needs. Previously led product at Climate Corporation. Strong background in user research and agtech market dynamics.",
    role := people::Role.Employee,
    job_title := "Head of Product",
    linkedin_url := "https://linkedin.com/in/emilythompson-product",
    joined_date := <datetime>'2021-06-15T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "CropWise AI")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Senior Data Scientist
insert people::Person {
    firstname := "David",
    lastname := "Park",
    email := "david.park@example.com",
    profile := "Data scientist specializing in agricultural analytics and predictive modeling. PhD in Statistics from Berkeley, expert in satellite imagery analysis and crop yield prediction algorithms.",
    role := people::Role.Employee,
    job_title := "Senior Data Scientist",
    linkedin_url := "https://linkedin.com/in/davidpark-datascience",
    joined_date := <datetime>'2021-08-20T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "CropWise AI")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# FAIRLEND TEAM
# Founder & CEO
insert people::Person {
    firstname := "Amara",
    lastname := "Okafor",
    email := "amara.okafor@example.com",
    profile := "Social entrepreneur and financial inclusion advocate. Previously worked at Kiva and Grameen Foundation on microfinance initiatives. MBA from Wharton, passionate about using technology to expand access to fair financial services globally.",
    role := people::Role.Founder,
    job_title := "Founder & CEO",
    linkedin_url := "https://linkedin.com/in/amaraokafor-fairlend",
    joined_date := <datetime>'2020-08-20T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "FairLend")),
    policies := {
        (select access::Policy filter .name = "Company Owner")
    }
};

# Co-Founder & CTO
insert people::Person {
    firstname := "Roberto",
    lastname := "Silva",
    email := "roberto.silva@example.com",
    profile := "Blockchain engineer and financial technology expert. Former lead developer at Coinbase, specialized in building secure, scalable financial platforms. Strong advocate for financial transparency and inclusion.",
    role := people::Role.Founder,
    job_title := "Co-Founder & CTO",
    linkedin_url := "https://linkedin.com/in/robertosilva-blockchain",
    joined_date := <datetime>'2020-08-20T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "FairLend")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# CFO
insert people::Person {
    firstname := "Jennifer",
    lastname := "Liu",
    email := "jennifer.liu@example.com",
    profile := "Financial executive with extensive experience in fintech and impact investing. Former VP Finance at Prosper Loans, CPA with deep expertise in alternative lending models and regulatory compliance.",
    role := people::Role.Cfo,
    job_title := "Chief Financial Officer",
    linkedin_url := "https://linkedin.com/in/jenniferliu-fintech",
    joined_date := <datetime>'2021-02-10T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "FairLend")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Head of Risk & Compliance
insert people::Person {
    firstname := "Michael",
    lastname := "Johnson",
    email := "michael.johnson@example.com",
    profile := "Risk management specialist with expertise in alternative credit scoring and international compliance. Former risk director at LendingClub, deep understanding of regulatory requirements across multiple jurisdictions.",
    role := people::Role.Employee,
    job_title := "Head of Risk & Compliance",
    linkedin_url := "https://linkedin.com/in/michaeljohnson-risk",
    joined_date := <datetime>'2021-04-15T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "FairLend")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Senior Software Engineer
insert people::Person {
    firstname := "Priya",
    lastname := "Patel",
    email := "priya.patel@example.com",
    profile := "Full-stack software engineer with expertise in mobile development and API design. Former engineer at Square, passionate about building user-friendly financial technology for underserved markets.",
    role := people::Role.Employee,
    job_title := "Senior Software Engineer",
    linkedin_url := "https://linkedin.com/in/priyapatel-software",
    joined_date := <datetime>'2021-07-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "FairLend")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# MINDBRIDGE THERAPEUTICS TEAM
# Founder & CEO
insert people::Person {
    firstname := "Dr. Rachel",
    lastname := "Martinez",
    email := "rachel.martinez@example.com",
    profile := "Clinical psychologist and digital health entrepreneur. PhD in Clinical Psychology from Harvard, former researcher at McLean Hospital specializing in addiction treatment. Personal experience with family addiction recovery drives her mission.",
    role := people::Role.Founder,
    job_title := "Founder & CEO",
    linkedin_url := "https://linkedin.com/in/rachelmartinez-digitalhealth",
    joined_date := <datetime>'2019-11-10T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "MindBridge Therapeutics")),
    policies := {
        (select access::Policy filter .name = "Company Owner")
    }
};

# Chief Medical Officer
insert people::Person {
    firstname := "Dr. James",
    lastname := "Anderson",
    email := "james.anderson@example.com",
    profile := "Addiction medicine specialist and digital therapeutics expert. MD from Johns Hopkins, board-certified in addiction medicine. Former medical director at Pear Therapeutics, leading expert in evidence-based digital interventions.",
    role := people::Role.Employee,
    job_title := "Chief Medical Officer",
    linkedin_url := "https://linkedin.com/in/jamesanderson-addiction",
    joined_date := <datetime>'2020-01-15T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "MindBridge Therapeutics")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# CTO
insert people::Person {
    firstname := "Lisa",
    lastname := "Wong",
    email := "lisa.wong@example.com",
    profile := "Healthcare technology executive with expertise in AI and mobile health platforms. Former engineering director at Teladoc, MS in Biomedical Engineering from MIT. Passionate about using technology to improve mental health outcomes.",
    role := people::Role.Cto,
    job_title := "Chief Technology Officer",
    linkedin_url := "https://linkedin.com/in/lisawong-healthtech",
    joined_date := <datetime>'2020-03-01T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "MindBridge Therapeutics")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Head of Clinical Research
insert people::Person {
    firstname := "Dr. Kevin",
    lastname := "O'Brien",
    email := "kevin.obrien@example.com",
    profile := "Clinical researcher specializing in addiction treatment outcomes and digital therapeutics validation. PhD in Clinical Psychology, former researcher at NIDA. Expert in clinical trial design and FDA regulatory processes.",
    role := people::Role.Employee,
    job_title := "Head of Clinical Research",
    linkedin_url := "https://linkedin.com/in/kevinobrien-clinical",
    joined_date := <datetime>'2020-05-20T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "MindBridge Therapeutics")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# SOLARGRID SOLUTIONS TEAM
# Founder & CEO
insert people::Person {
    firstname := "Carlos",
    lastname := "Mendoza",
    email := "carlos.mendoza@example.com",
    profile := "Clean energy entrepreneur and community development advocate. Former project manager at Tesla Energy, MS in Electrical Engineering from UT Austin. Grew up in rural Mexico where unreliable electricity access motivated his mission.",
    role := people::Role.Founder,
    job_title := "Founder & CEO",
    linkedin_url := "https://linkedin.com/in/carlosmendoza-solar",
    joined_date := <datetime>'2020-01-25T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    policies := {
        (select access::Policy filter .name = "Company Owner")
    }
};

# Co-Founder & CTO
insert people::Person {
    firstname := "Jessica",
    lastname := "Kim",
    email := "jessica.kim@example.com",
    profile := "Power systems engineer and grid technology expert. Former senior engineer at General Electric focusing on microgrid solutions. PhD in Electrical Engineering from Stanford, expert in distributed energy systems.",
    role := people::Role.Founder,
    job_title := "Co-Founder & CTO",
    linkedin_url := "https://linkedin.com/in/jessicakim-power",
    joined_date := <datetime>'2020-01-25T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Head of Community Development
insert people::Person {
    firstname := "Maria",
    lastname := "Santos",
    email := "maria.santos@example.com",
    profile := "Community development specialist with expertise in rural electrification projects. Former program manager at Acumen Academy, fluent in Spanish and Tagalog. Deep experience in community engagement and local partnership development.",
    role := people::Role.Employee,
    job_title := "Head of Community Development",
    linkedin_url := "https://linkedin.com/in/mariasantos-community",
    joined_date := <datetime>'2020-04-01T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Head of Finance & Operations
insert people::Person {
    firstname := "Thomas",
    lastname := "Williams",
    email := "thomas.williams@example.com",
    profile := "Finance executive with expertise in impact investing and project finance. Former director at Kiva Microfunds, CFA with extensive experience in community-based financing models and impact measurement.",
    role := people::Role.Employee,
    job_title := "Head of Finance & Operations",
    linkedin_url := "https://linkedin.com/in/thomaswilliams-impact",
    joined_date := <datetime>'2020-06-15T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# LEARNBRIDGE ACADEMY TEAM
# Founder & CEO
insert people::Person {
    firstname := "Pastor Daniel",
    lastname := "Thompson",
    email := "daniel.thompson@example.com",
    profile := "Educator and ministry leader with 20 years experience in Christian education. Former headmaster at classical Christian school, M.Ed. from Vanderbilt. Father of 5 homeschooled children, passionate about providing excellent faith-integrated education.",
    role := people::Role.Founder,
    job_title := "Founder & CEO",
    linkedin_url := "https://linkedin.com/in/danielthompson-education",
    joined_date := <datetime>'2018-09-05T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "LearnBridge Academy")),
    policies := {
        (select access::Policy filter .name = "Company Owner")
    }
};

# Co-Founder & Head of Curriculum
insert people::Person {
    firstname := "Dr. Susan",
    lastname := "Thompson",
    email := "susan.thompson@example.com",
    profile := "Curriculum designer and educational researcher. PhD in Education from Peabody College, former curriculum director for classical Christian schools. Expert in faith-integrated learning and educational assessment.",
    role := people::Role.Founder,
    job_title := "Co-Founder & Head of Curriculum",
    linkedin_url := "https://linkedin.com/in/susanthompson-curriculum",
    joined_date := <datetime>'2018-09-05T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "LearnBridge Academy")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# CTO
insert people::Person {
    firstname := "Mark",
    lastname := "Davis",
    email := "mark.davis@example.com",
    profile := "EdTech platform architect and homeschool parent. Former senior engineer at Khan Academy, MS Computer Science from Georgia Tech. Deep understanding of online learning platforms and educational technology needs.",
    role := people::Role.Cto,
    job_title := "Chief Technology Officer",
    linkedin_url := "https://linkedin.com/in/markdavis-edtech",
    joined_date := <datetime>'2019-01-10T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "LearnBridge Academy")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Head of Student Success
insert people::Person {
    firstname := "Hannah",
    lastname := "Miller",
    email := "hannah.miller@example.com",
    profile := "Student support specialist and homeschool advocate. Former guidance counselor and homeschool co-op leader. M.Ed. in Student Affairs, passionate about supporting homeschool families and student achievement.",
    role := people::Role.Employee,
    job_title := "Head of Student Success",
    linkedin_url := "https://linkedin.com/in/hannahmiller-student",
    joined_date := <datetime>'2019-06-01T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "LearnBridge Academy")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Head of Teacher Relations  
insert people::Person {
    firstname := "John",
    lastname := "Roberts",
    email := "john.roberts@example.com",
    profile := "Master teacher and online education specialist. 15 years classroom experience, M.Ed. in Curriculum and Instruction. Expert in live online teaching and building strong teacher-student-parent relationships in virtual environments.",
    role := people::Role.Employee,
    job_title := "Head of Teacher Relations",
    linkedin_url := "https://linkedin.com/in/johnroberts-teacher",
    joined_date := <datetime>'2019-08-15T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "LearnBridge Academy")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# AQUAPURE SYSTEMS TEAM
# Founder & CEO
insert people::Person {
    firstname := "Dr. Grace",
    lastname := "Nakamura",
    email := "grace.nakamura@example.com",
    profile := "Environmental engineer and water access advocate. PhD in Environmental Engineering from MIT, former research scientist at Lawrence Berkeley National Laboratory. Spent 5 years with Engineers Without Borders in sub-Saharan Africa.",
    role := people::Role.Founder,
    job_title := "Founder & CEO",
    linkedin_url := "https://linkedin.com/in/gracenakamura-water",
    joined_date := <datetime>'2019-06-12T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "AquaPure Systems")),
    policies := {
        (select access::Policy filter .name = "Company Owner")
    }
};

# CTO
insert people::Person {
    firstname := "Ahmed",
    lastname := "Hassan",
    email := "ahmed.hassan@example.com",
    profile := "Water treatment systems engineer with expertise in off-grid solutions. MS in Chemical Engineering from Colorado School of Mines, former engineer at Pentair. Expert in solar-powered water treatment and remote monitoring systems.",
    role := people::Role.Cto,
    job_title := "Chief Technology Officer",
    linkedin_url := "https://linkedin.com/in/ahmedhassan-water",
    joined_date := <datetime>'2019-08-01T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "AquaPure Systems")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Head of Operations
insert people::Person {
    firstname := "Catherine",
    lastname := "Oduya",
    email := "catherine.oduya@example.com",
    profile := "International development professional with expertise in water project implementation. Former program manager at Water.org, MBA from Kellogg. Fluent in English, French, and Swahili with deep African market knowledge.",
    role := people::Role.Coo,
    job_title := "Head of Operations",
    linkedin_url := "https://linkedin.com/in/catherineoduya-development",
    joined_date := <datetime>'2020-01-15T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "AquaPure Systems")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Field Engineer
insert people::Person {
    firstname := "Peter",
    lastname := "Gonzalez",
    email := "peter.gonzalez@example.com",
    profile := "Field engineer specializing in remote system installation and maintenance. BS Mechanical Engineering, former Peace Corps volunteer in Guatemala. Expert in training local technicians and building sustainable maintenance programs.",
    role := people::Role.Employee,
    job_title := "Senior Field Engineer",
    linkedin_url := "https://linkedin.com/in/petergonzalez-field",
    joined_date := <datetime>'2020-03-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "AquaPure Systems")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# ACCESSRIDE TEAM
# Founder & CEO
insert people::Person {
    firstname := "Alex",
    lastname := "Rivera",
    email := "alex.rivera@example.com",
    profile := "Disability rights advocate and transportation entrepreneur. Wheelchair user with personal experience navigating transportation barriers. Former program manager at United Spinal Association, MBA from University of Washington.",
    role := people::Role.Founder,
    job_title := "Founder & CEO",
    linkedin_url := "https://linkedin.com/in/alexrivera-accessibility",
    joined_date := <datetime>'2020-04-18T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "AccessRide")),
    policies := {
        (select access::Policy filter .name = "Company Owner")
    }
};

# Co-Founder & CTO
insert people::Person {
    firstname := "Samantha",
    lastname := "Chang",
    email := "samantha.chang@example.com",
    profile := "Mobile platform architect with expertise in accessibility technology. Former senior engineer at Uber focusing on accessibility features. MS Computer Science from Carnegie Mellon, passionate about inclusive design.",
    role := people::Role.Founder,
    job_title := "Co-Founder & CTO",
    linkedin_url := "https://linkedin.com/in/samanthachang-accessibility",
    joined_date := <datetime>'2020-04-18T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "AccessRide")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Head of Operations
insert people::Person {
    firstname := "Marcus",
    lastname := "Washington",
    email := "marcus.washington@example.com",
    profile := "Transportation operations specialist with expertise in fleet management and driver training. Former operations manager at medical transport company, deep understanding of accessibility requirements and ADA compliance.",
    role := people::Role.Coo,
    job_title := "Head of Operations",
    linkedin_url := "https://linkedin.com/in/marcuswashington-transport",
    joined_date := <datetime>'2020-07-01T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "AccessRide")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Head of Community Outreach
insert people::Person {
    firstname := "Julia",
    lastname := "Martinez",
    email := "julia.martinez@example.com",
    profile := "Community engagement specialist and disability advocacy expert. Former outreach coordinator at National MS Society, fluent in English and Spanish. Expert in building partnerships with disability service organizations.",
    role := people::Role.Employee,
    job_title := "Head of Community Outreach",
    linkedin_url := "https://linkedin.com/in/juliamartinez-outreach",
    joined_date := <datetime>'2020-09-15T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "AccessRide")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# =============================================================================
# ADDITIONAL TEAM MEMBERS - Supporting Staff Across Companies
# =============================================================================

# Additional CropWise AI team members
insert people::Person {
    firstname := "Jennifer",
    lastname := "Adams",
    email := "jennifer.adams@example.com",
    profile := "Sales and customer success manager with deep agricultural industry experience. Former account manager at DowDuPont Agricultural Division.",
    role := people::Role.Employee,
    job_title := "Customer Success Manager",
    joined_date := <datetime>'2021-10-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "CropWise AI")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

insert people::Person {
    firstname := "Robert",
    lastname := "Taylor",
    email := "robert.taylor@example.com",
    profile := "IoT systems engineer specializing in agricultural sensor networks and edge computing solutions.",
    role := people::Role.Employee,
    job_title := "Senior IoT Engineer",
    joined_date := <datetime>'2021-11-15T00:00:00Z',  
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "CropWise AI")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Additional FairLend team members
insert people::Person {
    firstname := "Grace",
    lastname := "Nkomo",
    email := "grace.nkomo@example.com",
    profile := "Regional director for Africa operations with extensive microfinance experience in Kenya and Ghana.",
    role := people::Role.Employee,
    job_title := "Africa Regional Director",
    joined_date := <datetime>'2021-01-10T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "FairLend")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

insert people::Person {
    firstname := "James",
    lastname := "Murphy",
    email := "james.murphy@example.com",
    profile := "Machine learning engineer focusing on alternative credit scoring models and fraud detection systems.",
    role := people::Role.Employee,
    job_title := "Senior ML Engineer",
    joined_date := <datetime>'2021-03-05T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "FairLend")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Additional MindBridge team members
insert people::Person {
    firstname := "Dr. Maria",
    lastname := "Rossi",
    email := "maria.rossi@example.com",
    profile := "Licensed clinical social worker specializing in substance abuse counseling and family therapy.",
    role := people::Role.Employee,
    job_title := "Clinical Director",
    joined_date := <datetime>'2020-08-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "MindBridge Therapeutics")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

insert people::Person {
    firstname := "Andrew",
    lastname := "Foster",
    email := "andrew.foster@example.com",
    profile := "UX/UI designer with specialization in healthcare applications and accessibility design for mental health platforms.",
    role := people::Role.Employee,
    job_title := "Senior UX Designer",
    joined_date := <datetime>'2020-10-15T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "MindBridge Therapeutics")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Additional SolarGrid team members
insert people::Person {
    firstname := "Samuel",
    lastname := "Ochieng",
    email := "samuel.ochieng@example.com",
    profile := "Project manager for East Africa operations with expertise in rural electrification and community engagement.",
    role := people::Role.Employee,
    job_title := "East Africa Project Manager",
    joined_date := <datetime>'2020-08-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

insert people::Person {
    firstname := "Lisa",
    lastname := "Brown",
    email := "lisa.brown@example.com",
    profile := "Electrical engineer specializing in microgrid design and battery storage systems.",
    role := people::Role.Employee,
    job_title := "Senior Electrical Engineer",
    joined_date := <datetime>'2020-10-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Additional LearnBridge team members
insert people::Person {
    firstname := "Timothy",
    lastname := "Johnson",
    email := "timothy.johnson@example.com",
    profile := "Master teacher with expertise in classical education and Latin instruction. 12 years experience in Christian classical schools.",
    role := people::Role.Employee,
    job_title := "Master Teacher - Classics",
    joined_date := <datetime>'2019-02-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "LearnBridge Academy")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

insert people::Person {
    firstname := "Sarah",
    lastname := "Wilson",
    email := "sarah.wilson@example.com",
    profile := "Mathematics teacher and curriculum developer with specialty in Saxon math methodology and advanced mathematics.",
    role := people::Role.Employee,
    job_title := "Master Teacher - Mathematics",
    joined_date := <datetime>'2019-04-15T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "LearnBridge Academy")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Additional AquaPure team members
insert people::Person {
    firstname := "Carlos",
    lastname := "Fernandez",
    email := "carlos.fernandez@example.com",
    profile := "Supply chain manager with expertise in international logistics and equipment procurement for development projects.",
    role := people::Role.Employee,
    job_title := "Supply Chain Manager",
    joined_date := <datetime>'2020-05-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "AquaPure Systems")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

# Additional AccessRide team members
insert people::Person {
    firstname := "David",
    lastname := "Kim",
    email := "david.kim@example.com",
    profile := "Driver training coordinator with specialization in disability awareness and accessibility service protocols.",
    role := people::Role.Employee,
    job_title := "Driver Training Coordinator",
    joined_date := <datetime>'2020-08-15T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "AccessRide")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};

insert people::Person {
    firstname := "Michelle",
    lastname := "Harris",
    email := "michelle.harris@example.com",
    profile := "Customer experience specialist focused on accessibility requirements and service quality improvement.",
    role := people::Role.Employee,
    job_title := "Customer Experience Manager",
    joined_date := <datetime>'2020-11-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "AccessRide")),
    policies := {
        (select access::Policy filter .name = "Company Team Member")
    }
};