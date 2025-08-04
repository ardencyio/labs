# Industry Seed Data - Agent 4
# Creates comprehensive SIC industry taxonomy
# Dependencies: 01_foundation.edgeql (foundation data)

# =============================================================================
# COMPREHENSIVE SIC INDUSTRY TAXONOMY
# Coverage: All 10 SIC divisions (A-J) with primary and detailed industry codes
# =============================================================================

# =============================================================================
# DIVISION A - AGRICULTURE, FORESTRY, AND FISHING (01-09)
# =============================================================================

# Major Group 01 - Agricultural Production - Crops
insert taxonomy::Industry {
    name := "Wheat",
    description := "Wheat farming operations",
    sic := "0111",
    sic_division := "A",
    sic_group := "01",
    naics := "111140",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Corn",
    description := "Corn farming operations", 
    sic := "0115",
    sic_division := "A",
    sic_group := "01",
    naics := "111150",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Soybeans",
    description := "Soybean farming operations",
    sic := "0116",
    sic_division := "A", 
    sic_group := "01",
    naics := "111110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Vegetables and Melons",
    description := "Vegetable and melon farming",
    sic := "0161",
    sic_division := "A",
    sic_group := "01",
    naics := "111219",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Fruits and Tree Nuts",
    description := "Fruit and tree nut farming",
    sic := "0171",
    sic_division := "A",
    sic_group := "01", 
    naics := "111310",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 02 - Agricultural Production - Livestock
insert taxonomy::Industry {
    name := "Beef Cattle Ranching",
    description := "Beef cattle ranching and farming",
    sic := "0212",
    sic_division := "A",
    sic_group := "02",
    naics := "112111",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Dairy Cattle and Milk Production",
    description := "Dairy cattle and milk production",
    sic := "0241",
    sic_division := "A",
    sic_group := "02",
    naics := "112120",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Poultry and Eggs",
    description := "Poultry and egg production",
    sic := "0251",
    sic_division := "A",
    sic_group := "02",
    naics := "112310",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 07 - Agricultural Services
insert taxonomy::Industry {
    name := "Crop Services",
    description := "Soil preparation, planting, and cultivating services",
    sic := "0711",
    sic_division := "A",
    sic_group := "07",
    naics := "115112",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Veterinary Services",
    description := "Veterinary services for livestock",
    sic := "0742",
    sic_division := "A",
    sic_group := "07",
    naics := "541940",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 08 - Forestry
insert taxonomy::Industry {
    name := "Forestry Services",
    description := "Forestry and logging services",
    sic := "0851",
    sic_division := "A",
    sic_group := "08",
    naics := "115310",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 09 - Fishing, Hunting, and Trapping
insert taxonomy::Industry {
    name := "Commercial Fishing",
    description := "Commercial fishing operations",
    sic := "0912",
    sic_division := "A",
    sic_group := "09",
    naics := "114111",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# DIVISION B - MINING (10-14)
# =============================================================================

# Major Group 10 - Metal Mining
insert taxonomy::Industry {
    name := "Iron Ore Mining",
    description := "Iron ore mining operations",
    sic := "1011",
    sic_division := "B",
    sic_group := "10",
    naics := "212210",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Gold Ore Mining",
    description := "Gold ore and silver ore mining",
    sic := "1041",
    sic_division := "B",
    sic_group := "10",
    naics := "212221",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 12 - Coal Mining
insert taxonomy::Industry {
    name := "Bituminous Coal Mining",
    description := "Bituminous coal underground mining",
    sic := "1211",
    sic_division := "B",
    sic_group := "12",
    naics := "212111",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 13 - Oil and Gas Extraction
insert taxonomy::Industry {
    name := "Crude Petroleum and Natural Gas",
    description := "Crude petroleum and natural gas extraction",
    sic := "1311",
    sic_division := "B",
    sic_group := "13",
    naics := "211111",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Natural Gas Liquids",
    description := "Natural gas liquids extraction",
    sic := "1321",
    sic_division := "B",
    sic_group := "13",
    naics := "211112",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 14 - Mining and Quarrying of Nonmetallic Minerals
insert taxonomy::Industry {
    name := "Dimension Stone",
    description := "Dimension stone mining and quarrying",
    sic := "1411",
    sic_division := "B",
    sic_group := "14",
    naics := "212311",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# DIVISION C - CONSTRUCTION (15-17)
# =============================================================================

# Major Group 15 - Building Construction - General Contractors
insert taxonomy::Industry {
    name := "Residential Building Construction",
    description := "Single-family housing construction",
    sic := "1521",
    sic_division := "C",
    sic_group := "15",
    naics := "236115",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Commercial Building Construction",
    description := "Industrial buildings and warehouses",
    sic := "1541",
    sic_division := "C",
    sic_group := "15",
    naics := "236210",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 16 - Heavy Construction
insert taxonomy::Industry {
    name := "Highway and Street Construction",
    description := "Highway, street, and bridge construction",
    sic := "1611",
    sic_division := "C",
    sic_group := "16",
    naics := "237310",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Water and Sewer Systems",
    description := "Water, sewer, pipeline, and communications construction",
    sic := "1623",
    sic_division := "C",
    sic_group := "16",
    naics := "237110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 17 - Construction - Special Trade Contractors
insert taxonomy::Industry {
    name := "Electrical Work",
    description := "Electrical work contractors",
    sic := "1731",
    sic_division := "C",
    sic_group := "17",
    naics := "238210",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Plumbing, Heating, Air-Conditioning",
    description := "Plumbing, heating, and air-conditioning contractors",
    sic := "1711",
    sic_division := "C",
    sic_group := "17",
    naics := "238220",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# DIVISION D - MANUFACTURING (20-39)
# =============================================================================

# Major Group 20 - Food and Kindred Products
insert taxonomy::Industry {
    name := "Meat Packing Plants",
    description := "Meat packing plants and processing",
    sic := "2011",
    sic_division := "D",
    sic_group := "20",
    naics := "311611",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Dairy Products",
    description := "Creamery butter and other dairy products",
    sic := "2021",
    sic_division := "D",
    sic_group := "20",
    naics := "311512",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Bakery Products",
    description := "Bread and other bakery products",
    sic := "2051",
    sic_division := "D",
    sic_group := "20",
    naics := "311812",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 22 - Textile Mill Products
insert taxonomy::Industry {
    name := "Cotton Weaving Mills",
    description := "Broadwoven fabric mills, cotton",
    sic := "2211",
    sic_division := "D",
    sic_group := "22",
    naics := "313210",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 23 - Apparel and Other Finished Products
insert taxonomy::Industry {
    name := "Men's and Boys' Clothing",
    description := "Men's and boys' suits, coats, and overcoats",
    sic := "2311",
    sic_division := "D",
    sic_group := "23",
    naics := "315222",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 24 - Lumber and Wood Products
insert taxonomy::Industry {
    name := "Logging",
    description := "Logging operations",
    sic := "2411",
    sic_division := "D",
    sic_group := "24",
    naics := "113310",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Sawmills and Planing Mills",
    description := "Sawmills and planing mills, general",
    sic := "2421",
    sic_division := "D",
    sic_group := "24",
    naics := "321113",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 26 - Paper and Allied Products
insert taxonomy::Industry {
    name := "Paper Mills",
    description := "Paper mills operations",
    sic := "2621",
    sic_division := "D",
    sic_group := "26",
    naics := "322121",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 28 - Chemicals and Allied Products
insert taxonomy::Industry {
    name := "Industrial Inorganic Chemicals",
    description := "Industrial inorganic chemicals manufacturing",
    sic := "2812",
    sic_division := "D",
    sic_group := "28",
    naics := "325180",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Pharmaceutical Preparations",
    description := "Pharmaceutical preparations manufacturing",
    sic := "2834",
    sic_division := "D",
    sic_group := "28",
    naics := "325412",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 30 - Rubber and Miscellaneous Plastics Products
insert taxonomy::Industry {
    name := "Tires and Inner Tubes",
    description := "Tires and inner tubes manufacturing",
    sic := "3011",
    sic_division := "D",
    sic_group := "30",
    naics := "326211",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 33 - Primary Metal Industries
insert taxonomy::Industry {
    name := "Steel Works and Blast Furnaces",
    description := "Blast furnaces and steel mills",
    sic := "3312",
    sic_division := "D",
    sic_group := "33",
    naics := "331111",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 34 - Fabricated Metal Products
insert taxonomy::Industry {
    name := "Metal Cans",
    description := "Metal cans manufacturing",
    sic := "3411",
    sic_division := "D",
    sic_group := "34",
    naics := "332431",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 35 - Industrial and Commercial Machinery
insert taxonomy::Industry {
    name := "Construction Machinery",
    description := "Construction machinery and equipment",
    sic := "3531",
    sic_division := "D",
    sic_group := "35",
    naics := "333120",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Computer and Office Equipment",
    description := "Electronic computers manufacturing",
    sic := "3571",
    sic_division := "D",
    sic_group := "35",
    naics := "334111",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 36 - Electronic Equipment
insert taxonomy::Industry {
    name := "Radio and Television Equipment",
    description := "Radio and television broadcasting and communications equipment",
    sic := "3663",
    sic_division := "D",
    sic_group := "36",
    naics := "334220",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Electronic Components",
    description := "Semiconductors and related devices",
    sic := "3674",
    sic_division := "D",
    sic_group := "36",
    naics := "334413",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 37 - Transportation Equipment
insert taxonomy::Industry {
    name := "Motor Vehicles and Car Bodies",
    description := "Motor vehicles and passenger car bodies",
    sic := "3711",
    sic_division := "D",
    sic_group := "37",
    naics := "336111",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Aircraft",
    description := "Aircraft manufacturing",
    sic := "3721",
    sic_division := "D",
    sic_group := "37",
    naics := "336411",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 38 - Measuring Instruments
insert taxonomy::Industry {
    name := "Laboratory Instruments",
    description := "Laboratory analytical instruments",
    sic := "3826",
    sic_division := "D",  
    sic_group := "38",
    naics := "334516",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 39 - Miscellaneous Manufacturing Industries
insert taxonomy::Industry {
    name := "Jewelry and Precious Metals",
    description := "Jewelry, precious metal manufacturing",
    sic := "3911",
    sic_division := "D",
    sic_group := "39",
    naics := "339910",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# DIVISION E - TRANSPORTATION, COMMUNICATIONS, ELECTRIC, GAS, SANITARY (40-49)
# =============================================================================

# Major Group 40 - Railroad Transportation
insert taxonomy::Industry {
    name := "Railroad Transportation",
    description := "Line-haul railroads",
    sic := "4011",
    sic_division := "E",
    sic_group := "40",
    naics := "482111",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 41 - Local and Suburban Transit
insert taxonomy::Industry {
    name := "Local Passenger Transportation",
    description := "Local and suburban passenger transportation",
    sic := "4119",
    sic_division := "E",
    sic_group := "41",
    naics := "485999",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 42 - Motor Freight Transportation
insert taxonomy::Industry {
    name := "Trucking and Courier Services",
    description := "Trucking, except local",
    sic := "4213",
    sic_division := "E",
    sic_group := "42",
    naics := "484121",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 44 - Water Transportation
insert taxonomy::Industry {
    name := "Water Transportation",
    description := "Deep sea foreign transportation of freight",
    sic := "4412",
    sic_division := "E",
    sic_group := "44",
    naics := "483111",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 45 - Transportation by Air
insert taxonomy::Industry {
    name := "Air Transportation",
    description := "Scheduled air transportation",
    sic := "4512",
    sic_division := "E",
    sic_group := "45",
    naics := "481111",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 46 - Pipelines, Except Natural Gas
insert taxonomy::Industry {
    name := "Pipeline Transportation",
    description := "Crude petroleum pipelines",
    sic := "4612",
    sic_division := "E",
    sic_group := "46",
    naics := "486110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 47 - Transportation Services
insert taxonomy::Industry {
    name := "Freight Transportation Arrangement",
    description := "Arrangement of transportation of freight and cargo",
    sic := "4731",
    sic_division := "E",
    sic_group := "47",
    naics := "488510",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 48 - Communications
insert taxonomy::Industry {
    name := "Telephone Communications",
    description := "Telephone communications, except radiotelephone",
    sic := "4813",
    sic_division := "E",
    sic_group := "48",
    naics := "517110",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Cable and Other Pay Television",
    description := "Cable and other pay television services",
    sic := "4841",
    sic_division := "E",
    sic_group := "48",
    naics := "515210",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 49 - Electric, Gas, and Sanitary Services
insert taxonomy::Industry {
    name := "Electric Services",
    description := "Electric services and power generation",
    sic := "4911",
    sic_division := "E",
    sic_group := "49",
    naics := "221122",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Natural Gas Distribution",
    description := "Natural gas distribution",
    sic := "4924",
    sic_division := "E",
    sic_group := "49",
    naics := "221210",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Water Supply",
    description := "Water supply systems",
    sic := "4941",
    sic_division := "E",
    sic_group := "49",
    naics := "221310",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Waste Management",
    description := "Refuse systems and sanitary services",
    sic := "4953",
    sic_division := "E",
    sic_group := "49",
    naics := "562111",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# DIVISION F - WHOLESALE TRADE (50-51)
# =============================================================================

# Major Group 50 - Wholesale Trade - Durable Goods
insert taxonomy::Industry {
    name := "Motor Vehicles and Parts",
    description := "Motor vehicles and motor vehicle parts and supplies",
    sic := "5012",
    sic_division := "F",
    sic_group := "50",
    naics := "423110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Computer and Software",
    description := "Computers and computer peripheral equipment and software",
    sic := "5045",
    sic_division := "F",
    sic_group := "50",
    naics := "423430",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 51 - Wholesale Trade - Nondurable Goods
insert taxonomy::Industry {
    name := "Drugs and Chemicals",
    description := "Drugs, drug proprietaries, and druggists' sundries",
    sic := "5122",
    sic_division := "F",
    sic_group := "51",
    naics := "424210",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Groceries and Food",
    description := "Groceries and related products",
    sic := "5141",
    sic_division := "F",
    sic_group := "51",
    naics := "424410",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# DIVISION G - RETAIL TRADE (52-59) 
# =============================================================================

# Major Group 52 - Building Materials, Hardware, Garden Supply
insert taxonomy::Industry {
    name := "Lumber and Building Materials",
    description := "Lumber and other building materials dealers",
    sic := "5211",
    sic_division := "G",
    sic_group := "52",
    naics := "444110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 53 - General Merchandise Stores
insert taxonomy::Industry {
    name := "Department Stores",
    description := "Department stores",
    sic := "5311",
    sic_division := "G",
    sic_group := "53",
    naics := "452111",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 54 - Food Stores
insert taxonomy::Industry {
    name := "Grocery Stores",
    description := "Grocery stores",
    sic := "5411",
    sic_division := "G",
    sic_group := "54",
    naics := "445110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 55 - Automotive Dealers and Gasoline Service Stations
insert taxonomy::Industry {
    name := "Motor Vehicle Dealers",
    description := "Motor vehicle dealers (new and used)",
    sic := "5511",
    sic_division := "G",
    sic_group := "55",
    naics := "441110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Gasoline Service Stations",
    description := "Gasoline service stations",
    sic := "5541",
    sic_division := "G",
    sic_group := "55",
    naics := "447110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 56 - Apparel and Accessory Stores
insert taxonomy::Industry {
    name := "Clothing Stores",
    description := "Men's and boys' clothing and accessory stores",
    sic := "5611",
    sic_division := "G",
    sic_group := "56",
    naics := "448110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 57 - Home Furniture and Equipment Stores
insert taxonomy::Industry {
    name := "Furniture Stores",
    description := "Furniture and home furnishing stores",
    sic := "5712",
    sic_division := "G",
    sic_group := "57",
    naics := "442110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 58 - Eating and Drinking Places
insert taxonomy::Industry {
    name := "Restaurants",
    description := "Eating places and restaurants",
    sic := "5812",
    sic_division := "G",
    sic_group := "58",
    naics := "722511",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 59 - Miscellaneous Retail
insert taxonomy::Industry {
    name := "Drug Stores",
    description := "Drug stores and proprietary stores",
    sic := "5912",
    sic_division := "G",
    sic_group := "59",
    naics := "446110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# DIVISION H - FINANCE, INSURANCE, AND REAL ESTATE (60-67)
# =============================================================================

# Major Group 60 - Depository Institutions
insert taxonomy::Industry {
    name := "Commercial Banks",
    description := "National commercial banks",
    sic := "6021",
    sic_division := "H",
    sic_group := "60",
    naics := "522110",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Savings Institutions",
    description := "Federal savings and loan associations",
    sic := "6035",
    sic_division := "H",
    sic_group := "60",
    naics := "522120",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 61 - Nondepository Credit Institutions
insert taxonomy::Industry {
    name := "Credit Institutions",
    description := "Personal credit institutions and microfinance",
    sic := "6141",
    sic_division := "H",
    sic_group := "61",
    naics := "522291",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Mortgage Bankers and Brokers",
    description := "Mortgage bankers and loan correspondents",
    sic := "6162",
    sic_division := "H",
    sic_group := "61",
    naics := "522310",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 62 - Security and Commodity Brokers
insert taxonomy::Industry {
    name := "Security Brokers and Dealers",
    description := "Security brokers, dealers, and flotation companies",
    sic := "6211",
    sic_division := "H",
    sic_group := "62",
    naics := "523120",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 63 - Insurance Carriers
insert taxonomy::Industry {
    name := "Life Insurance",
    description := "Life insurance companies",
    sic := "6311",
    sic_division := "H",
    sic_group := "63",
    naics := "524113",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Property and Casualty Insurance",
    description := "Accident and health insurance",
    sic := "6321",
    sic_division := "H",
    sic_group := "63",
    naics := "524114",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 64 - Insurance Agents and Brokers
insert taxonomy::Industry {
    name := "Insurance Agents and Brokers",
    description := "Insurance agents, brokers, and service",
    sic := "6411",
    sic_division := "H",
    sic_group := "64",
    naics := "524210",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 65 - Real Estate
insert taxonomy::Industry {
    name := "Real Estate Operators",
    description := "Real estate operators (except developers) and lessors",
    sic := "6512",
    sic_division := "H",
    sic_group := "65",
    naics := "531110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Real Estate Agents and Managers",
    description := "Real estate agents and managers",
    sic := "6531",
    sic_division := "H",
    sic_group := "65",
    naics := "531210",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 67 - Holding and Other Investment Offices
insert taxonomy::Industry {
    name := "Investment Offices",
    description := "Investment offices and holding companies",
    sic := "6719",
    sic_division := "H",
    sic_group := "67",
    naics := "523920",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# DIVISION I - SERVICES (70-89)
# =============================================================================

# Major Group 70 - Hotels and Other Lodging Places
insert taxonomy::Industry {
    name := "Hotels and Motels",
    description := "Hotels, rooming houses, camps, and other lodging places",
    sic := "7011",
    sic_division := "I",
    sic_group := "70",
    naics := "721110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 72 - Personal Services
insert taxonomy::Industry {
    name := "Laundry and Garment Services",
    description := "Laundry, cleaning, and garment services",
    sic := "7211",
    sic_division := "I",
    sic_group := "72",
    naics := "812320",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 73 - Business Services
insert taxonomy::Industry {
    name := "Advertising",
    description := "Advertising agencies and services",
    sic := "7311",
    sic_division := "I",
    sic_group := "73",
    naics := "541810",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Computer Programming Services",
    description := "Custom computer programming services",
    sic := "7371",
    sic_division := "I",
    sic_group := "73",
    naics := "541511",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Computer Integrated Systems Design",
    description := "Computer integrated systems design",
    sic := "7373",
    sic_division := "I",
    sic_group := "73",
    naics := "541512",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Computer Processing and Data Preparation",
    description := "Computer processing and data preparation services",
    sic := "7374",
    sic_division := "I",
    sic_group := "73",
    naics := "518210",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Management Consulting Services",
    description := "Management consulting services",
    sic := "7392",
    sic_division := "I",
    sic_group := "73",
    naics := "541611",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 75 - Automotive Repair Services
insert taxonomy::Industry {
    name := "Automotive Repair Shops",
    description := "Automotive repair shops and services",
    sic := "7538",
    sic_division := "I",
    sic_group := "75",
    naics := "811111",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 78 - Motion Pictures
insert taxonomy::Industry {
    name := "Motion Picture Production",
    description := "Motion picture and video tape production",
    sic := "7812",
    sic_division := "I",
    sic_group := "78",
    naics := "512110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 79 - Amusement and Recreation Services
insert taxonomy::Industry {
    name := "Amusement and Recreation",
    description := "Amusement and recreation services",
    sic := "7911",
    sic_division := "I",
    sic_group := "79",
    naics := "713110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 80 - Health Services
insert taxonomy::Industry {
    name := "Offices of Physicians",
    description := "Offices and clinics of doctors of medicine",
    sic := "8011",
    sic_division := "I",
    sic_group := "80",
    naics := "621111",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "General Medical and Surgical Hospitals",
    description := "General medical and surgical hospitals",
    sic := "8062",
    sic_division := "I",
    sic_group := "80",
    naics := "622110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Health and Allied Services",
    description := "Health and allied services, not elsewhere classified",
    sic := "8099",
    sic_division := "I",
    sic_group := "80",
    naics := "621999",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 82 - Educational Services
insert taxonomy::Industry {
    name := "Elementary and Secondary Schools",
    description := "Elementary and secondary schools",
    sic := "8211",
    sic_division := "I",
    sic_group := "82",
    naics := "611110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Colleges and Universities",
    description := "Colleges, universities, and professional schools",
    sic := "8221",
    sic_division := "I",
    sic_group := "82",
    naics := "611310",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Educational Services",
    description := "Schools and educational services, not elsewhere classified",
    sic := "8299",
    sic_division := "I",
    sic_group := "82",
    naics := "611699",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 83 - Social Services
insert taxonomy::Industry {
    name := "Individual and Family Social Services",
    description := "Individual and family social services",
    sic := "8322",
    sic_division := "I",
    sic_group := "83",
    naics := "624190",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 87 - Engineering and Management Services
insert taxonomy::Industry {
    name := "Engineering Services",
    description := "Engineering, architectural, and surveying services",
    sic := "8711",
    sic_division := "I",
    sic_group := "87",
    naics := "541330",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Accounting and Auditing Services",
    description := "Accounting, auditing, and bookkeeping services",
    sic := "8721",
    sic_division := "I",
    sic_group := "87",
    naics := "541211",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Research and Testing Services",
    description := "Research, development, and testing services",
    sic := "8731",
    sic_division := "I",
    sic_group := "87",
    naics := "541712",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 89 - Miscellaneous Services
insert taxonomy::Industry {
    name := "Services, Not Elsewhere Classified",
    description := "Services, not elsewhere classified",
    sic := "8999",
    sic_division := "I",
    sic_group := "89",
    naics := "561990",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# DIVISION J - PUBLIC ADMINISTRATION (91-97)
# =============================================================================

# Major Group 91 - Executive, Legislative, and General Government
insert taxonomy::Industry {
    name := "Executive and Legislative Offices",
    description := "Executive and legislative offices, combined",
    sic := "9111",
    sic_division := "J",
    sic_group := "91",
    naics := "921110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 92 - Justice, Public Order, and Safety
insert taxonomy::Industry {
    name := "Courts",
    description := "Courts of law",
    sic := "9211",
    sic_division := "J",
    sic_group := "92",
    naics := "922110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Police Protection",
    description := "Police protection services",
    sic := "9221",
    sic_division := "J",
    sic_group := "92",
    naics := "922120",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 94 - Administration of Human Resource Programs
insert taxonomy::Industry {
    name := "Administration of Social Programs",
    description := "Administration of social, human resource and income maintenance programs",
    sic := "9441",
    sic_division := "J",
    sic_group := "94",
    naics := "923110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 95 - Administration of Environmental Quality Programs
insert taxonomy::Industry {
    name := "Environmental Quality Programs",
    description := "Administration of environmental quality programs",
    sic := "9511",
    sic_division := "J",
    sic_group := "95",
    naics := "924110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 96 - Administration of Economic Programs
insert taxonomy::Industry {
    name := "Economic Development Programs",
    description := "Administration of economic development programs",
    sic := "9611",
    sic_division := "J",
    sic_group := "96",
    naics := "926110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# Major Group 97 - National Security and International Affairs
insert taxonomy::Industry {
    name := "National Security",
    description := "National security and international affairs",
    sic := "9711",
    sic_division := "J",
    sic_group := "97",
    naics := "928110",
    primary := false,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

# =============================================================================
# EMERGING TECHNOLOGY INDUSTRIES (Modern SIC Extensions)
# =============================================================================

# Technology-specific industries for impact investing
insert taxonomy::Industry {
    name := "Artificial Intelligence Services",
    description := "Artificial intelligence and machine learning services",  
    sic := "7379",
    sic_division := "I",
    sic_group := "73",
    naics := "541511",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Renewable Energy Technology",
    description := "Solar, wind, and renewable energy technology development",
    sic := "3699",
    sic_division := "D",
    sic_group := "36",
    naics := "333611",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Biotechnology Research",
    description := "Biotechnology research and development services",
    sic := "8731",
    sic_division := "I",
    sic_group := "87",
    naics := "541711",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Environmental Technology",
    description := "Environmental technology and sustainability services",
    sic := "8999",
    sic_division := "I",
    sic_group := "89",
    naics := "541620",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Digital Health Technology",
    description := "Digital health, telemedicine, and health technology services",
    sic := "8099",
    sic_division := "I",
    sic_group := "80",
    naics := "621999",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Financial Technology",
    description := "Financial technology, fintech, and digital payment services",
    sic := "6099",
    sic_division := "H",
    sic_group := "60",
    naics := "522320",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Educational Technology",
    description := "Educational technology and online learning platforms",
    sic := "8299",
    sic_division := "I",
    sic_group := "82",
    naics := "611420",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Clean Transportation Technology",
    description := "Electric vehicles, clean transportation, and mobility technology",
    sic := "3711",
    sic_division := "D",
    sic_group := "37",
    naics := "336111",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Social Impact Technology",
    description := "Technology platforms focused on social impact and community development",
    sic := "7379",
    sic_division := "I",
    sic_group := "73",
    naics := "541511",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};

insert taxonomy::Industry {
    name := "Cybersecurity Services",
    description := "Cybersecurity, information security, and privacy protection services",
    sic := "7379",
    sic_division := "I",
    sic_group := "73",
    naics := "541512",
    primary := true,
    created := std::datetime_of_statement(),
    updated := std::datetime_of_statement()
};