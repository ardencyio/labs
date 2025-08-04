# Investment Seed Data - Agent 3
# Creates investors, VC funds, and funding ecosystem using entity data  
# Dependencies: 02_entities.edgeql (people and companies)

# =============================================================================
# ANGEL INVESTORS - 5 Independent Angel Investors
# =============================================================================

# 1. Tech Industry Angel Investor - Sarah Mitchell
insert people::Person {
    firstname := "Sarah",
    lastname := "Mitchell",
    email := "sarah.mitchell@example.com",
    profile := "Former VP of Engineering at Google, now angel investor focused on AI and impact technology. Successfully exited two startups and invested in 45+ companies including 3 unicorns. Passionate about supporting founders building technology for social good.",
    role := people::Role.Investor,
    job_title := "Angel Investor & Former Tech Executive",
    linkedin_url := "https://linkedin.com/in/sarahmitchell-angel",
    joined_date := <datetime>'2015-01-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# 2. Healthcare Industry Angel - Dr. Robert Chen
insert people::Person {
    firstname := "Dr. Robert",
    lastname := "Chen",
    email := "robert.chen@example.com",
    profile := "Former Chief Medical Officer at Johnson & Johnson and serial healthcare entrepreneur. Founded and sold two medical device companies. Now focuses on angel investing in digital health, medical devices, and healthcare AI with emphasis on improving patient outcomes.",
    role := people::Role.Investor,
    job_title := "Angel Investor & Healthcare Entrepreneur",
    linkedin_url := "https://linkedin.com/in/robertchen-healthcare",
    joined_date := <datetime>'2018-06-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# 3. Fintech Angel Investor - Maria Gonzalez
insert people::Person {
    firstname := "Maria",
    lastname := "Gonzalez",
    email := "maria.gonzalez@example.com",
    profile := "Former Managing Director at Goldman Sachs and fintech pioneer. Co-founded PayPal's international expansion team and later founded two successful fintech startups. Angel investor focused on financial inclusion, microfinance, and blockchain technology.",
    role := people::Role.Investor,
    job_title := "Angel Investor & Fintech Pioneer",
    linkedin_url := "https://linkedin.com/in/mariagonzalez-fintech",
    joined_date := <datetime>'2016-03-15T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# 4. Clean Energy Angel - James Patterson
insert people::Person {
    firstname := "James",
    lastname := "Patterson",
    email := "james.patterson@example.com",
    profile := "Former Tesla Energy executive and clean technology entrepreneur. Led development of Tesla's commercial energy storage products before founding renewable energy consulting firm. Angel investor specializing in clean energy, sustainability, and climate tech.",
    role := people::Role.Investor,
    job_title := "Angel Investor & Clean Energy Expert",
    linkedin_url := "https://linkedin.com/in/jamespatterson-cleantech",
    joined_date := <datetime>'2017-09-20T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# 5. Impact Investing Angel - Dr. Jennifer Williams
insert people::Person {
    firstname := "Dr. Jennifer",
    lastname := "Williams",
    email := "jennifer.williams@example.com",
    profile := "Former Executive Director at Acumen Academy and impact investing pioneer. PhD in Development Economics from Harvard, authored 'The Impact Investor's Handbook'. Angel investor focused exclusively on companies with measurable social and environmental impact.",
    role := people::Role.Investor,
    job_title := "Angel Investor & Impact Investing Expert",
    linkedin_url := "https://linkedin.com/in/jenniferwilliams-impact",
    joined_date := <datetime>'2014-11-10T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    policies := {
        (select access::Policy filter .name = "Investor")  
    }
};

# =============================================================================
# VENTURE CAPITAL FUNDS - 5 VC Fund Companies
# =============================================================================

# 1. Eagle Fund Ventures - Early Stage Tech VC
insert companies::Company {
    name := "Eagle Fund Ventures",
    tagline := "Early-stage venture capital for transformative technology",
    mission := "Partnering with visionary founders building technology solutions that create significant value for society while generating exceptional returns for our investors.",
    description := "Eagle Fund Ventures is a $200M early-stage venture capital fund investing in Series A and B companies in AI, healthcare technology, fintech, and enterprise software. We've invested in 85+ companies with 12 exits including 3 unicorns. Our portfolio companies have created over 15,000 jobs and generated $8B in enterprise value.",
    founded := <datetime>'2012-05-15T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "Palo Alto, California, USA",
    operations := {"United States", "Canada"},
    team_size := 18,
    technical_staff := 5,
    website := "https://eaglefund.vc",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Financial Technology"),
        (select taxonomy::Tag filter .name = "Artificial Intelligence"),
        (select taxonomy::Tag filter .name = "North America"),
        (select taxonomy::Tag filter .name = "Venture Capital")
    })
};

# 2. Impact Capital Partners - Impact-First VC
insert companies::Company {
    name := "Impact Capital Partners", 
    tagline := "Venture capital for companies creating positive impact",
    mission := "Investing in companies that generate measurable positive impact on society and the environment while delivering competitive financial returns through market-driven solutions.",
    description := "Impact Capital Partners is a $150M impact-focused venture capital fund investing in companies addressing global challenges in healthcare, education, financial inclusion, clean energy, and sustainable agriculture. We measure success through both financial returns and verified social/environmental impact metrics.",
    founded := <datetime>'2015-03-20T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "San Francisco, California, USA",
    operations := {"Global", "United States", "Europe", "Africa"},
    team_size := 22,
    technical_staff := 4,
    website := "https://impactcp.com",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Healthcare & Biotechnology"),
        (select taxonomy::Tag filter .name = "Clean Energy & Environment"),
        (select taxonomy::Tag filter .name = "Global"),
        (select taxonomy::Tag filter .name = "Venture Capital"),
        (select taxonomy::Tag filter .name = "Impact Investing")
    })
};

# 3. Frontier Growth Capital - Growth Stage VC
insert companies::Company {
    name := "Frontier Growth Capital",
    tagline := "Growth capital for scaling technology companies", 
    mission := "Providing capital and expertise to help high-growth technology companies scale from Series B through IPO, with focus on companies building the future of work, commerce, and society.",
    description := "Frontier Growth Capital is a $400M growth-stage venture capital fund investing in Series B, C, and D companies with proven product-market fit and strong unit economics. We specialize in B2B software, marketplace platforms, fintech, and digital health companies preparing for public markets.",
    founded := <datetime>'2010-08-10T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "New York, New York, USA",
    operations := {"United States", "Europe"},
    team_size := 25,
    technical_staff := 8,
    website := "https://frontiergrowth.vc",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Financial Technology"),
        (select taxonomy::Tag filter .name = "Enterprise Software"),
        (select taxonomy::Tag filter .name = "North America"),
        (select taxonomy::Tag filter .name = "Venture Capital"),
        (select taxonomy::Tag filter .name = "Growth Capital")
    })
};

# 4. Health Innovation Fund - Healthcare-Focused VC
insert companies::Company {
    name := "Health Innovation Fund",
    tagline := "Venture capital for transformative healthcare solutions",
    mission := "Investing in breakthrough healthcare technologies that improve patient outcomes, reduce costs, and increase access to quality care for underserved populations worldwide.",
    description := "Health Innovation Fund is a $250M healthcare-focused venture capital fund investing in digital health, medical devices, biotechnology, and healthcare services. Our portfolio includes 60+ companies developing solutions for chronic disease management, mental health, remote care, and personalized medicine.",
    founded := <datetime>'2013-11-05T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "Boston, Massachusetts, USA",
    operations := {"United States", "Canada", "United Kingdom"},
    team_size := 20,
    technical_staff := 7,
    website := "https://healthinnovation.vc",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Healthcare & Biotechnology"),
        (select taxonomy::Tag filter .name = "Artificial Intelligence"),
        (select taxonomy::Tag filter .name = "North America"),
        (select taxonomy::Tag filter .name = "Venture Capital"),
        (select taxonomy::Tag filter .name = "SDG 3: Good Health")
    })
};

# 5. Catalyst Ventures - Mission-Driven VC
insert companies::Company {
    name := "Catalyst Ventures",
    tagline := "Mission-driven venture capital for purpose-led founders",
    mission := "Backing bold entrepreneurs building companies that align profit with purpose, creating sustainable solutions to society's greatest challenges while generating exceptional returns.",
    description := "Catalyst Ventures is a $180M mission-driven venture capital fund investing in companies that integrate social and environmental purpose into their core business model. We focus on education technology, financial inclusion, sustainable food systems, and circular economy solutions.",
    founded := <datetime>'2016-01-25T00:00:00Z',
    public := false,
    status := default::Activation.Active,
    headquarters := "Austin, Texas, USA",
    operations := {"United States", "Latin America"},
    team_size := 16,
    technical_staff := 4,
    website := "https://catalyst.vc",
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    tags := assert_distinct({
        (select taxonomy::Tag filter .name = "Education & Training"),
        (select taxonomy::Tag filter .name = "Agriculture & Food"),
        (select taxonomy::Tag filter .name = "Global"),
        (select taxonomy::Tag filter .name = "Venture Capital"),
        (select taxonomy::Tag filter .name = "Impact Investing")
    })
};

# =============================================================================
# VC FUND EMPLOYEES - 15 Senior Staff Across 5 VC Funds (3 per fund)
# =============================================================================

# EAGLE FUND VENTURES TEAM
# Managing Partner
insert people::Person {
    firstname := "Michael",
    lastname := "Stanford",
    email := "michael.stanford@example.com",
    profile := "Managing Partner at Eagle Fund Ventures with 20+ years in venture capital and technology. Former Partner at Kleiner Perkins, led investments in 12 unicorns including Uber and Airbnb. MBA from Stanford GSB, focuses on AI and enterprise software investments.",
    role := people::Role.Investor,
    job_title := "Managing Partner",
    linkedin_url := "https://linkedin.com/in/michaelstanford-vc",
    joined_date := <datetime>'2012-05-15T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Eagle Fund Ventures")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# General Partner
insert people::Person {
    firstname := "Lisa",
    lastname := "Zhang",
    email := "lisa.zhang@example.com", 
    profile := "General Partner focusing on fintech and healthcare technology investments. Former entrepreneur who founded and sold payment processing company to Square for $150M. MS Engineering from MIT, passionate about technology that democratizes access to financial services.",
    role := people::Role.Investor,
    job_title := "General Partner",
    linkedin_url := "https://linkedin.com/in/lisazhang-gp",
    joined_date := <datetime>'2014-08-01T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Eagle Fund Ventures")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# Principal
insert people::Person {
    firstname := "David",
    lastname := "Morrison",
    email := "david.morrison@example.com",
    profile := "Principal focused on early-stage enterprise software and AI investments. Former product manager at Salesforce, led enterprise platform development for 50,000+ customers. MBA from Wharton, joined Eagle Fund after successful B2B SaaS startup exit.",
    role := people::Role.Investor,
    job_title := "Principal",
    linkedin_url := "https://linkedin.com/in/davidmorrison-principal",
    joined_date := <datetime>'2017-01-15T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Eagle Fund Ventures")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# IMPACT CAPITAL PARTNERS TEAM
# Founding Partner
insert people::Person {
    firstname := "Dr. Patricia",
    lastname := "Johnson",
    email := "patricia.johnson@example.com",
    profile := "Founding Partner and impact investing pioneer. Former program officer at Gates Foundation, PhD in Development Economics from Harvard. Led $500M+ in impact investments across 40+ countries, recognized as top impact investor by Forbes.",
    role := people::Role.Founder,
    job_title := "Founding Partner",
    linkedin_url := "https://linkedin.com/in/patriciajohnson-impact",
    joined_date := <datetime>'2015-03-20T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Impact Capital Partners")),
    policies := {
        (select access::Policy filter .name = "Company Owner")
    }
};

# Managing Director
insert people::Person {
    firstname := "Carlos",
    lastname := "Ramirez",
    email := "carlos.ramirez@example.com",
    profile := "Managing Director with focus on Latin American and African markets. Former investment banker at Morgan Stanley, led $2B+ in infrastructure and development finance transactions. Fluent in Spanish, Portuguese, and French.",
    role := people::Role.Investor,
    job_title := "Managing Director",
    linkedin_url := "https://linkedin.com/in/carlosramirez-md",
    joined_date := <datetime>'2016-06-01T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Impact Capital Partners")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# Partner
insert people::Person {
    firstname := "Dr. Aisha",
    lastname := "Patel",
    email := "aisha.patel@example.com",
    profile := "Partner focused on healthcare and education technology investments in emerging markets. Former McKinsey consultant specializing in social sector strategy, PhD in Public Health from Johns Hopkins. Expert in impact measurement and ESG frameworks.",
    role := people::Role.Investor,
    job_title := "Partner",
    linkedin_url := "https://linkedin.com/in/aishapatel-partner",
    joined_date := <datetime>'2017-09-10T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Impact Capital Partners")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# FRONTIER GROWTH CAPITAL TEAM
# Senior Partner
insert people::Person {
    firstname := "Robert",
    lastname := "Thompson",
    email := "robert.thompson@example.com",
    profile := "Senior Partner with 25+ years experience in growth equity and private equity. Former Managing Director at TPG Growth, led investments in 50+ growth companies with aggregate value of $15B+. Expert in scaling B2B software and marketplace businesses.",
    role := people::Role.Investor,
    job_title := "Senior Partner",
    linkedin_url := "https://linkedin.com/in/robertthompson-senior",
    joined_date := <datetime>'2010-08-10T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Frontier Growth Capital")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# Partner
insert people::Person {
    firstname := "Amanda",
    lastname := "Foster",
    email := "amanda.foster@example.com",
    profile := "Partner specializing in fintech and digital commerce investments. Former VP Strategy at PayPal, led strategic initiatives for merchant services and international expansion. MBA from Kellogg, expertise in payments, lending, and financial infrastructure.",
    role := people::Role.Investor,
    job_title := "Partner",
    linkedin_url := "https://linkedin.com/in/amandafoster-partner",
    joined_date := <datetime>'2013-11-20T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Frontier Growth Capital")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# Vice President
insert people::Person {
    firstname := "Jonathan",
    lastname := "Lee",
    email := "jonathan.lee@example.com",
    profile := "Vice President focused on enterprise software and SaaS investments. Former consultant at Bain & Company, specialized in technology and growth strategy. MBA from Harvard Business School, expertise in B2B software market analysis and due diligence.",
    role := people::Role.Investor,
    job_title := "Vice President",
    linkedin_url := "https://linkedin.com/in/jonathanlee-vp",
    joined_date := <datetime>'2016-02-01T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Frontier Growth Capital")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# HEALTH INNOVATION FUND TEAM
# Managing Partner
insert people::Person {
    firstname := "Dr. Susan",
    lastname := "Rodriguez",
    email := "susan.rodriguez@example.com",
    profile := "Managing Partner and former healthcare entrepreneur. MD from Harvard Medical School, founded and sold two medical device companies. Led venture investing in 40+ healthcare companies including 3 IPOs. Expert in digital health and medical device regulatory pathways.",
    role := people::Role.Investor,
    job_title := "Managing Partner",
    linkedin_url := "https://linkedin.com/in/susanrodriguez-mp",
    joined_date := <datetime>'2013-11-05T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Health Innovation Fund")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# Partner
insert people::Person {
    firstname := "Mark",
    lastname := "Williams",
    email := "mark.williams@example.com",
    profile := "Partner focused on digital health and healthcare AI investments. Former VP Product at Epic Systems, led development of AI-powered clinical decision support tools. MS Computer Science from Stanford, expertise in healthcare technology implementation.",
    role := people::Role.Investor,
    job_title := "Partner",
    linkedin_url := "https://linkedin.com/in/markwilliams-healthtech",
    joined_date := <datetime>'2015-04-10T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Health Innovation Fund")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# Director
insert people::Person {
    firstname := "Dr. Emily",
    lastname := "Chen",
    email := "emily.chen@example.com",
    profile := "Director focusing on biotechnology and medical device investments. PhD in Biomedical Engineering from MIT, former research scientist at Genentech. Expert in biotech investment due diligence, regulatory strategy, and commercialization pathways.",
    role := people::Role.Investor,
    job_title := "Director",
    linkedin_url := "https://linkedin.com/in/emilychen-biotech",
    joined_date := <datetime>'2017-07-15T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Health Innovation Fund")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# CATALYST VENTURES TEAM
# Founding Partner
insert people::Person {
    firstname := "Jessica",
    lastname := "Martinez",
    email := "jessica.martinez@example.com",
    profile := "Founding Partner and social entrepreneur. Former Executive Director at Teach for America, MBA from Stanford GSB. Pioneer in mission-driven investing, founded Catalyst after recognizing need for capital that aligns profit with purpose in education and social impact.",
    role := people::Role.Founder,
    job_title := "Founding Partner", 
    linkedin_url := "https://linkedin.com/in/jessicamartinez-catalyst",
    joined_date := <datetime>'2016-01-25T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Catalyst Ventures")),
    policies := {
        (select access::Policy filter .name = "Company Owner")
    }
};

# General Partner
insert people::Person {
    firstname := "Thomas",
    lastname := "Anderson",
    email := "thomas.anderson@example.com",
    profile := "General Partner with focus on education technology and workforce development. Former COO at Khan Academy, led scaling from 10M to 100M+ learners globally. Expert in online learning platforms, credentialing systems, and future of work technologies.",
    role := people::Role.Investor,
    job_title := "General Partner",
    linkedin_url := "https://linkedin.com/in/thomasanderson-edtech",
    joined_date := <datetime>'2016-08-01T00:00:00Z',
    is_key_executive := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Catalyst Ventures")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# Principal
insert people::Person {
    firstname := "Maya",
    lastname := "Singh",
    email := "maya.singh@example.com",
    profile := "Principal focused on financial inclusion and sustainable agriculture investments. Former program manager at Grameen Foundation, MS in Agricultural Economics from UC Davis. Expert in smallholder farmer financing, supply chain technology, and rural market development.",
    role := people::Role.Investor,
    job_title := "Principal",
    linkedin_url := "https://linkedin.com/in/mayasingh-impact",
    joined_date := <datetime>'2018-03-10T00:00:00Z',
    is_key_executive := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    employer := assert_single((select companies::Company filter .name = "Catalyst Ventures")),
    policies := {
        (select access::Policy filter .name = "Investor")
    }
};

# =============================================================================
# FUNDING ROUNDS - 7 Funding Rounds for Portfolio Companies
# =============================================================================

# 1. CropWise AI - Seed Round
insert funding::Capital {
    company := assert_single((select companies::Company filter .name = "CropWise AI")),
    round := funding::Round.Seed,
    target := 1800000,
    raised := 1800000,
    opens := <datetime>'2021-06-01T00:00:00Z',
    closes := <datetime>'2021-08-15T00:00:00Z',
    minimum := 25000,
    pre := 7200000,
    post := 9000000,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    leads := {
        (select people::Person filter .firstname = "Dr. Jennifer" and .lastname = "Williams")
    },
    stage := default::Stage.Closed,
    outcomes := {"Expand to 3 new states", "Hire 10 additional engineers", "Launch mobile platform"}
};

# 2. FairLend - Series A Round
insert funding::Capital {
    company := assert_single((select companies::Company filter .name = "FairLend")),
    round := funding::Round.A,
    target := 8500000,
    raised := 8500000,
    opens := <datetime>'2021-09-01T00:00:00Z',
    closes := <datetime>'2021-12-15T00:00:00Z',
    minimum := 100000,
    pre := 22000000,
    post := 30500000,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    leads := {
        (select people::Person filter .firstname = "Dr. Patricia" and .lastname = "Johnson")
    },
    stage := default::Stage.Closed,
    outcomes := {"Launch in 10 new countries", "Reach 100K active borrowers", "Achieve profitability"}
};

# 3. MindBridge Therapeutics - Series A Round  
insert funding::Capital {
    company := assert_single((select companies::Company filter .name = "MindBridge Therapeutics")),
    round := funding::Round.A,
    target := 12000000,
    raised := 12000000,
    opens := <datetime>'2021-03-01T00:00:00Z',
    closes := <datetime>'2021-06-30T00:00:00Z',
    minimum := 250000,
    pre := 28000000,
    post := 40000000,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    leads := {
        (select people::Person filter .firstname = "Dr. Susan" and .lastname = "Rodriguez")
    },
    stage := default::Stage.Closed,
    outcomes := {"Complete Phase II clinical trials", "FDA approval submission", "Launch in 5 new states"}
};

# 4. SolarGrid Solutions - Series A Round
insert funding::Capital {
    company := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    round := funding::Round.A,
    target := 15000000,
    raised := 15000000,
    opens := <datetime>'2021-01-15T00:00:00Z',
    closes := <datetime>'2021-04-30T00:00:00Z',
    minimum := 500000,
    pre := 35000000,
    post := 50000000,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    leads := assert_distinct({
        (select people::Person filter .firstname = "James" and .lastname = "Patterson"),
        (select people::Person filter .firstname = "Carlos" and .lastname = "Ramirez")
    }),
    stage := default::Stage.Closed,
    outcomes := {"Deploy 50 new microgrids", "Expand to 3 new countries", "Achieve $10M ARR"}
};

# 5. LearnBridge Academy - Growth Round (Revenue-Based)
insert funding::Capital {
    company := assert_single((select companies::Company filter .name = "LearnBridge Academy")),
    round := funding::Round.Other,
    target := 5000000,
    raised := 5000000,
    opens := <datetime>'2020-08-01T00:00:00Z',
    closes := <datetime>'2020-11-15T00:00:00Z',
    minimum := 100000,
    pre := 45000000,
    post := 50000000,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    leads := {
        (select people::Person filter .firstname = "Jessica" and .lastname = "Martinez")
    },
    stage := default::Stage.Closed,
    outcomes := {"Launch high school curriculum", "Expand to 25K students", "International markets entry"}
};

# 6. AquaPure Systems - Seed Round
insert funding::Capital {
    company := assert_single((select companies::Company filter .name = "AquaPure Systems")),
    round := funding::Round.Seed,
    target := 2500000,
    raised := 2500000,
    opens := <datetime>'2020-09-01T00:00:00Z',
    closes := <datetime>'2020-12-31T00:00:00Z',
    minimum := 50000,
    pre := 7500000,
    post := 10000000,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    leads := {
        (select people::Person filter .firstname = "Dr. Patricia" and .lastname = "Johnson")
    },
    stage := default::Stage.Closed,
    outcomes := {"Deploy 100 water systems", "Serve 500K people", "Achieve unit economics"}
};

# 7. AccessRide - Seed Round
insert funding::Capital {
    company := assert_single((select companies::Company filter .name = "AccessRide")),
    round := funding::Round.Seed,
    target := 3200000,
    raised := 3200000,
    opens := <datetime>'2021-02-01T00:00:00Z',
    closes := <datetime>'2021-05-15T00:00:00Z',
    minimum := 75000,
    pre := 9800000,
    post := 13000000,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    leads := {
        (select people::Person filter .firstname = "Dr. Jennifer" and .lastname = "Williams")
    },
    stage := default::Stage.Closed,
    outcomes := {"Launch in 8 new cities", "Scale to 1M rides/year", "Build driver network"}
};

# =============================================================================
# FUNDING ALLOCATIONS - How Capital is Allocated per Round
# =============================================================================

# CropWise AI Seed Round Allocations
insert funding::Allocation {
    purpose := "Product Development",
    percent := 45,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "CropWise AI" and .round = funding::Round.Seed))
};

insert funding::Allocation {
    purpose := "Sales & Marketing", 
    percent := 30,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "CropWise AI" and .round = funding::Round.Seed))
};

insert funding::Allocation {
    purpose := "Team Expansion",
    percent := 20,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "CropWise AI" and .round = funding::Round.Seed))
};

insert funding::Allocation {
    purpose := "Working Capital",
    percent := 5,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "CropWise AI" and .round = funding::Round.Seed))
};

# FairLend Series A Round Allocations
insert funding::Allocation {
    purpose := "International Expansion",
    percent := 40,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "FairLend" and .round = funding::Round.A))
};

insert funding::Allocation {
    purpose := "Technology Development",
    percent := 25,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "FairLend" and .round = funding::Round.A))
};

insert funding::Allocation {
    purpose := "Team Growth",
    percent := 25,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "FairLend" and .round = funding::Round.A))
};

insert funding::Allocation {
    purpose := "Regulatory & Compliance",
    percent := 10,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "FairLend" and .round = funding::Round.A))
};

# MindBridge Therapeutics Series A Round Allocations
insert funding::Allocation {
    purpose := "Clinical Trials",
    percent := 50,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "MindBridge Therapeutics" and .round = funding::Round.A))
};

insert funding::Allocation {
    purpose := "Regulatory Affairs",
    percent := 20,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "MindBridge Therapeutics" and .round = funding::Round.A))
};

insert funding::Allocation {
    purpose := "Product Development",
    percent := 20,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "MindBridge Therapeutics" and .round = funding::Round.A))
};

insert funding::Allocation {
    purpose := "Operations",
    percent := 10,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "MindBridge Therapeutics" and .round = funding::Round.A))
};

# SolarGrid Solutions Series A Round Allocations
insert funding::Allocation {
    purpose := "Project Deployment",
    percent := 45,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "SolarGrid Solutions" and .round = funding::Round.A))
};

insert funding::Allocation {
    purpose := "International Expansion",
    percent := 25,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "SolarGrid Solutions" and .round = funding::Round.A))
};

insert funding::Allocation {
    purpose := "Technology & R&D",
    percent := 20,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "SolarGrid Solutions" and .round = funding::Round.A))
};

insert funding::Allocation {
    purpose := "Working Capital",
    percent := 10,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "SolarGrid Solutions" and .round = funding::Round.A))
};

# LearnBridge Academy Growth Round Allocations
insert funding::Allocation {
    purpose := "Curriculum Development",
    percent := 35,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "LearnBridge Academy" and .round = funding::Round.Other))
};

insert funding::Allocation {
    purpose := "Platform Technology",
    percent := 25,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "LearnBridge Academy" and .round = funding::Round.Other))
};

insert funding::Allocation {  
    purpose := "Teacher Recruitment",
    percent := 25,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "LearnBridge Academy" and .round = funding::Round.Other))
};

insert funding::Allocation {
    purpose := "Marketing & Sales",
    percent := 15,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "LearnBridge Academy" and .round = funding::Round.Other))
};

# AquaPure Systems Seed Round Allocations
insert funding::Allocation {
    purpose := "Manufacturing & Deployment",
    percent := 40,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "AquaPure Systems" and .round = funding::Round.Seed))
};

insert funding::Allocation {
    purpose := "Field Operations",
    percent := 30,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "AquaPure Systems" and .round = funding::Round.Seed))
};

insert funding::Allocation {
    purpose := "Product Development",
    percent := 20,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "AquaPure Systems" and .round = funding::Round.Seed))
};

insert funding::Allocation {
    purpose := "Working Capital",
    percent := 10,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "AquaPure Systems" and .round = funding::Round.Seed))
};

# AccessRide Seed Round Allocations
insert funding::Allocation {
    purpose := "Market Expansion",
    percent := 35,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "AccessRide" and .round = funding::Round.Seed))
};

insert funding::Allocation {
    purpose := "Driver Network Growth",
    percent := 25,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "AccessRide" and .round = funding::Round.Seed))
};

insert funding::Allocation {
    purpose := "Technology Platform",
    percent := 25,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "AccessRide" and .round = funding::Round.Seed))
};

insert funding::Allocation {
    purpose := "Operations",
    percent := 15,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement(),
    capital := assert_single((select funding::Capital filter .company.name = "AccessRide" and .round = funding::Round.Seed))
};

# =============================================================================
# INVESTMENT RECORDS - Individual Investments in Funding Rounds
# =============================================================================

# CROPWISE AI SEED ROUND INVESTMENTS
insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "Dr. Jennifer" and .lastname = "Williams")),
    company := assert_single((select companies::Company filter .name = "CropWise AI")),
    capital := assert_single((select funding::Capital filter .company.name = "CropWise AI" and .round = funding::Round.Seed)),
    amount := 500000,
    shares := 62500,
    price := <decimal>8.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "Sarah" and .lastname = "Mitchell")), 
    company := assert_single((select companies::Company filter .name = "CropWise AI")),
    capital := assert_single((select funding::Capital filter .company.name = "CropWise AI" and .round = funding::Round.Seed)),
    amount := 300000,
    shares := 37500,
    price := <decimal>8.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Catalyst Ventures")),
    company := assert_single((select companies::Company filter .name = "CropWise AI")),
    capital := assert_single((select funding::Capital filter .company.name = "CropWise AI" and .round = funding::Round.Seed)),
    amount := 700000,
    shares := 87500,
    price := <decimal>8.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Impact Capital Partners")),
    company := assert_single((select companies::Company filter .name = "CropWise AI")),
    capital := assert_single((select funding::Capital filter .company.name = "CropWise AI" and .round = funding::Round.Seed)),
    amount := 300000,
    shares := 37500,
    price := <decimal>8.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

# FAIRLEND SERIES A ROUND INVESTMENTS
insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Impact Capital Partners")),
    company := assert_single((select companies::Company filter .name = "FairLend")),
    capital := assert_single((select funding::Capital filter .company.name = "FairLend" and .round = funding::Round.A)),
    amount := 4000000,
    shares := 131148,
    price := <decimal>30.50,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "Maria" and .lastname = "Gonzalez")),
    company := assert_single((select companies::Company filter .name = "FairLend")),
    capital := assert_single((select funding::Capital filter .company.name = "FairLend" and .round = funding::Round.A)),
    amount := 1500000,
    shares := 49180,
    price := <decimal>30.50,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Eagle Fund Ventures")),
    company := assert_single((select companies::Company filter .name = "FairLend")),
    capital := assert_single((select funding::Capital filter .company.name = "FairLend" and .round = funding::Round.A)),
    amount := 2000000,
    shares := 65574,
    price := <decimal>30.50,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "Dr. Robert" and .lastname = "Chen")),
    company := assert_single((select companies::Company filter .name = "FairLend")),
    capital := assert_single((select funding::Capital filter .company.name = "FairLend" and .round = funding::Round.A)),
    amount := 1000000,
    shares := 32787,
    price := <decimal>30.50,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

# MINDBRIDGE THERAPEUTICS SERIES A ROUND INVESTMENTS
insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Health Innovation Fund")),
    company := assert_single((select companies::Company filter .name = "MindBridge Therapeutics")),
    capital := assert_single((select funding::Capital filter .company.name = "MindBridge Therapeutics" and .round = funding::Round.A)),
    amount := 6000000,
    shares := 150000,
    price := <decimal>40.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "Dr. Robert" and .lastname = "Chen")),
    company := assert_single((select companies::Company filter .name = "MindBridge Therapeutics")),
    capital := assert_single((select funding::Capital filter .company.name = "MindBridge Therapeutics" and .round = funding::Round.A)),
    amount := 2500000,
    shares := 62500,
    price := <decimal>40.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Impact Capital Partners")),
    company := assert_single((select companies::Company filter .name = "MindBridge Therapeutics")),
    capital := assert_single((select funding::Capital filter .company.name = "MindBridge Therapeutics" and .round = funding::Round.A)),
    amount := 2000000,
    shares := 50000,
    price := <decimal>40.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "Sarah" and .lastname = "Mitchell")),
    company := assert_single((select companies::Company filter .name = "MindBridge Therapeutics")),
    capital := assert_single((select funding::Capital filter .company.name = "MindBridge Therapeutics" and .round = funding::Round.A)),
    amount := 1500000,
    shares := 37500,
    price := <decimal>40.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

# SOLARGRID SOLUTIONS SERIES A ROUND INVESTMENTS
insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "James" and .lastname = "Patterson")),
    company := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    capital := assert_single((select funding::Capital filter .company.name = "SolarGrid Solutions" and .round = funding::Round.A)),
    amount := 3000000,
    shares := 60000,
    price := <decimal>50.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Impact Capital Partners")),
    company := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    capital := assert_single((select funding::Capital filter .company.name = "SolarGrid Solutions" and .round = funding::Round.A)),
    amount := 5000000,
    shares := 100000,
    price := <decimal>50.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Catalyst Ventures")),
    company := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    capital := assert_single((select funding::Capital filter .company.name = "SolarGrid Solutions" and .round = funding::Round.A)),
    amount := 4000000,
    shares := 80000,
    price := <decimal>50.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "Dr. Jennifer" and .lastname = "Williams")),
    company := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    capital := assert_single((select funding::Capital filter .company.name = "SolarGrid Solutions" and .round = funding::Round.A)),
    amount := 2000000,
    shares := 40000,
    price := <decimal>50.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Eagle Fund Ventures")),
    company := assert_single((select companies::Company filter .name = "SolarGrid Solutions")),
    capital := assert_single((select funding::Capital filter .company.name = "SolarGrid Solutions" and .round = funding::Round.A)),
    amount := 1000000,
    shares := 20000,
    price := <decimal>50.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

# LEARNBRIDGE ACADEMY GROWTH ROUND INVESTMENTS  
insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Catalyst Ventures")),
    company := assert_single((select companies::Company filter .name = "LearnBridge Academy")),
    capital := assert_single((select funding::Capital filter .company.name = "LearnBridge Academy" and .round = funding::Round.Other)),
    amount := 2500000,
    shares := 50000,
    price := <decimal>50.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "Dr. Jennifer" and .lastname = "Williams")),
    company := assert_single((select companies::Company filter .name = "LearnBridge Academy")),
    capital := assert_single((select funding::Capital filter .company.name = "LearnBridge Academy" and .round = funding::Round.Other)),
    amount := 1500000,
    shares := 30000,
    price := <decimal>50.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Impact Capital Partners")),
    company := assert_single((select companies::Company filter .name = "LearnBridge Academy")),
    capital := assert_single((select funding::Capital filter .company.name = "LearnBridge Academy" and .round = funding::Round.Other)),
    amount := 1000000,
    shares := 20000,
    price := <decimal>50.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

# AQUAPURE SYSTEMS SEED ROUND INVESTMENTS
insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Impact Capital Partners")),
    company := assert_single((select companies::Company filter .name = "AquaPure Systems")),
    capital := assert_single((select funding::Capital filter .company.name = "AquaPure Systems" and .round = funding::Round.Seed)),
    amount := 1200000,
    shares := 120000,
    price := <decimal>10.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "Dr. Jennifer" and .lastname = "Williams")),
    company := assert_single((select companies::Company filter .name = "AquaPure Systems")),
    capital := assert_single((select funding::Capital filter .company.name = "AquaPure Systems" and .round = funding::Round.Seed)),
    amount := 750000,
    shares := 75000,
    price := <decimal>10.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "James" and .lastname = "Patterson")),
    company := assert_single((select companies::Company filter .name = "AquaPure Systems")),
    capital := assert_single((select funding::Capital filter .company.name = "AquaPure Systems" and .round = funding::Round.Seed)),
    amount := 300000,
    shares := 30000,
    price := <decimal>10.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Catalyst Ventures")),
    company := assert_single((select companies::Company filter .name = "AquaPure Systems")),
    capital := assert_single((select funding::Capital filter .company.name = "AquaPure Systems" and .round = funding::Round.Seed)),
    amount := 250000,
    shares := 25000,
    price := <decimal>10.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

# ACCESSRIDE SEED ROUND INVESTMENTS
insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "Dr. Jennifer" and .lastname = "Williams")),
    company := assert_single((select companies::Company filter .name = "AccessRide")),
    capital := assert_single((select funding::Capital filter .company.name = "AccessRide" and .round = funding::Round.Seed)),
    amount := 1000000,
    shares := 76923,
    price := <decimal>13.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Impact Capital Partners")),
    company := assert_single((select companies::Company filter .name = "AccessRide")),
    capital := assert_single((select funding::Capital filter .company.name = "AccessRide" and .round = funding::Round.Seed)),
    amount := 1200000,
    shares := 92308,
    price := <decimal>13.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select people::Person filter .firstname = "Sarah" and .lastname = "Mitchell")),
    company := assert_single((select companies::Company filter .name = "AccessRide")),
    capital := assert_single((select funding::Capital filter .company.name = "AccessRide" and .round = funding::Round.Seed)),
    amount := 500000,
    shares := 38462,
    price := <decimal>13.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};

insert funding::Investment {
    investor := assert_single((select companies::Company filter .name = "Health Innovation Fund")),
    company := assert_single((select companies::Company filter .name = "AccessRide")),
    capital := assert_single((select funding::Capital filter .company.name = "AccessRide" and .round = funding::Round.Seed)),
    amount := 500000,
    shares := 38462,
    price := <decimal>13.00,
    created := datetime_of_statement(),
    updated := datetime_of_statement()
};