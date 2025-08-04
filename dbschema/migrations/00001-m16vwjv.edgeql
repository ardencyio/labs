CREATE MIGRATION m16vwjvr6zzzgoj4gk4tiub5fg7hdr7sw677lqp2xn7lvrblku6nba
    ONTO initial
{
  CREATE EXTENSION pgvector VERSION '0.7';
  CREATE EXTENSION pgcrypto VERSION '1.3';
  CREATE EXTENSION auth VERSION '1.0';
  CREATE EXTENSION ai VERSION '1.0';
  CREATE MODULE access IF NOT EXISTS;
  CREATE MODULE companies IF NOT EXISTS;
  CREATE MODULE content IF NOT EXISTS;
  CREATE MODULE funding IF NOT EXISTS;
  CREATE MODULE ownership IF NOT EXISTS;
  CREATE MODULE people IF NOT EXISTS;
  CREATE MODULE taxonomy IF NOT EXISTS;
  CREATE SCALAR TYPE access::Permission EXTENDING enum<Admin, Basic, Investor, Investments, Company, Profile, Documents, Financials, Personnel, View, Download, Upload, Deals, Impact, Messages, Connections>;
  CREATE SCALAR TYPE default::Activation EXTENDING enum<Active, Inactive>;
  CREATE SCALAR TYPE default::Stage EXTENDING enum<Draft, Active, Closed, Extended, Canceled>;
  CREATE SCALAR TYPE funding::Round EXTENDING enum<Pre, Seed, A, B, C, D, E, F, G, H, Growth, Mezzanine, IPO, Secondary, Debt, Strategic, Acquisition, Convertible, SAFE, Other>;
  CREATE SCALAR TYPE ownership::Party EXTENDING enum<Founder, Angel, Venture, Private, Corporate, Impact, Stock, Employee, Government, Other>;
  CREATE SCALAR TYPE people::Role EXTENDING enum<Founder, Ceo, Cto, Cfo, Coo, Investor, Board, Advisor, Employee, Other>;
  CREATE FUTURE simple_scoping;
  CREATE ABSTRACT TYPE default::Timestamp {
      CREATE REQUIRED PROPERTY created: std::datetime {
          CREATE REWRITE
              INSERT 
              USING (std::datetime_of_statement());
      };
      CREATE REQUIRED PROPERTY updated: std::datetime {
          CREATE REWRITE
              UPDATE 
              USING (std::datetime_of_statement());
      };
  };
  CREATE TYPE access::Policy EXTENDING default::Timestamp {
      CREATE PROPERTY description: std::str;
      CREATE REQUIRED PROPERTY name: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE MULTI PROPERTY permissions: access::Permission;
  };
  CREATE TYPE people::Person EXTENDING default::Timestamp {
      CREATE LINK identity: ext::auth::Identity;
      CREATE MULTI LINK policies: access::Policy;
      CREATE REQUIRED PROPERTY email: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE REQUIRED PROPERTY firstname: std::str;
      CREATE REQUIRED PROPERTY lastname: std::str;
      CREATE PROPERTY fullname := (((.firstname ++ ' ') ++ .lastname));
      CREATE PROPERTY is_key_executive: std::bool {
          SET default := false;
      };
      CREATE PROPERTY job_title: std::str;
      CREATE PROPERTY joined_date: std::datetime;
      CREATE PROPERTY linkedin_url: std::str;
      CREATE PROPERTY photo_url: std::str;
      CREATE PROPERTY profile: std::str;
      CREATE PROPERTY role: people::Role;
  };
  CREATE GLOBAL default::current_user := (std::assert_single((SELECT
      people::Person
  FILTER
      (.identity = GLOBAL ext::auth::ClientTokenIdentity)
  )));
  CREATE TYPE taxonomy::Goal EXTENDING default::Timestamp {
      CREATE PROPERTY description: std::str;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  CREATE TYPE people::Criteria EXTENDING default::Timestamp {
      CREATE REQUIRED LINK person: people::Person;
      CREATE ACCESS POLICY owner
          ALLOW ALL USING ((EXISTS (GLOBAL default::current_user) AND ((GLOBAL default::current_user).id ?= .person.id))) {
              SET errmessage := 'Only the person can modify their investment criteria';
          };
      CREATE MULTI LINK preferred_goals: taxonomy::Goal;
      CREATE PROPERTY investment_stage: std::str;
      CREATE PROPERTY max_investment: std::float64;
      CREATE PROPERTY min_investment: std::float64;
      CREATE PROPERTY preferred_industries: array<std::str>;
  };
  ALTER TYPE people::Person {
      CREATE ACCESS POLICY owner
          ALLOW ALL USING ((EXISTS (GLOBAL default::current_user) AND ((GLOBAL default::current_user).id ?= .id))) {
              SET errmessage := 'Only the person can modify their own profile';
          };
  };
  CREATE TYPE taxonomy::Industry EXTENDING default::Timestamp {
      CREATE PROPERTY description: std::str;
      CREATE PROPERTY naics: std::str;
      CREATE REQUIRED PROPERTY name: std::str;
      CREATE PROPERTY primary: std::bool {
          SET default := true;
      };
      CREATE REQUIRED PROPERTY sic: std::str;
      CREATE PROPERTY sic_division: std::str;
      CREATE PROPERTY sic_group: std::str;
  };
  CREATE TYPE taxonomy::Tag EXTENDING default::Timestamp {
      CREATE PROPERTY color: std::str;
      CREATE PROPERTY description: std::str;
      CREATE REQUIRED PROPERTY name: std::str;
  };
  CREATE TYPE companies::Company EXTENDING default::Timestamp {
      CREATE MULTI LINK goals: taxonomy::Goal;
      CREATE MULTI LINK industries: taxonomy::Industry;
      CREATE MULTI LINK people: people::Person;
      CREATE MULTI LINK tags: taxonomy::Tag;
      CREATE PROPERTY description: std::str;
      CREATE PROPERTY founded: std::datetime;
      CREATE PROPERTY headquarters: std::str;
      CREATE PROPERTY logo_url: std::str;
      CREATE PROPERTY mission: std::str;
      CREATE REQUIRED PROPERTY name: std::str;
      CREATE MULTI PROPERTY operations: std::str;
      CREATE REQUIRED PROPERTY public: std::bool {
          SET default := false;
      };
      CREATE PROPERTY status: default::Activation;
      CREATE PROPERTY tagline: std::str;
      CREATE PROPERTY team_size: std::int32;
      CREATE PROPERTY technical_staff: std::int32;
      CREATE PROPERTY website: std::str;
  };
  CREATE TYPE content::Article EXTENDING default::Timestamp {
      CREATE REQUIRED LINK company: companies::Company;
      CREATE LINK author: people::Person;
      CREATE PROPERTY content: std::str;
      CREATE PROPERTY date: std::datetime;
      CREATE PROPERTY published: std::bool {
          SET default := false;
      };
      CREATE PROPERTY source_type: std::str;
      CREATE PROPERTY title: std::str;
      CREATE PROPERTY url: std::str;
  };
  ALTER TYPE companies::Company {
      CREATE MULTI LINK articles: content::Article;
  };
  CREATE TYPE funding::Capital EXTENDING default::Timestamp {
      CREATE REQUIRED LINK company: companies::Company;
      CREATE MULTI LINK leads: (people::Person | companies::Company);
      CREATE MULTI LINK goals: taxonomy::Goal;
      CREATE PROPERTY closes: std::datetime;
      CREATE PROPERTY minimum: std::decimal;
      CREATE PROPERTY opens: std::datetime;
      CREATE MULTI PROPERTY outcomes: std::str;
      CREATE PROPERTY post: std::decimal;
      CREATE PROPERTY pre: std::decimal;
      CREATE PROPERTY raised: std::decimal;
      CREATE PROPERTY round: funding::Round;
      CREATE PROPERTY stage: default::Stage;
      CREATE PROPERTY target: std::decimal;
  };
  ALTER TYPE companies::Company {
      CREATE MULTI LINK funding := (.<company[IS funding::Capital]);
  };
  CREATE TYPE funding::Investment EXTENDING default::Timestamp {
      CREATE REQUIRED LINK company: companies::Company;
      CREATE REQUIRED LINK investor: (people::Person | companies::Company);
      CREATE REQUIRED LINK capital: funding::Capital;
      CREATE REQUIRED PROPERTY amount: std::decimal;
      CREATE PROPERTY exit: std::bool {
          SET default := false;
      };
      CREATE PROPERTY exits: std::datetime;
      CREATE PROPERTY price: std::decimal;
      CREATE PROPERTY return: std::decimal;
      CREATE PROPERTY shares: std::int64;
  };
  ALTER TYPE companies::Company {
      CREATE MULTI LINK investments := (.<company[IS funding::Investment]);
      CREATE MULTI LINK investors := (.<company[IS funding::Investment].investor);
  };
  CREATE TYPE ownership::Table EXTENDING default::Timestamp {
      CREATE REQUIRED LINK company: companies::Company;
      CREATE LINK funding: funding::Capital;
      CREATE PROPERTY date: std::datetime;
      CREATE PROPERTY notes: std::str;
      CREATE PROPERTY total: std::int64;
  };
  ALTER TYPE companies::Company {
      CREATE MULTI LINK ownership: ownership::Table;
  };
  CREATE TYPE content::Recognition EXTENDING default::Timestamp {
      CREATE REQUIRED LINK company: companies::Company;
      CREATE LINK added_by: people::Person;
      CREATE PROPERTY description: std::str;
      CREATE PROPERTY organization: std::str;
      CREATE PROPERTY recognition_type: std::str;
      CREATE PROPERTY title: std::str;
      CREATE PROPERTY verified: std::bool {
          SET default := false;
      };
      CREATE PROPERTY year: std::int16;
  };
  ALTER TYPE companies::Company {
      CREATE MULTI LINK recognitions: content::Recognition;
  };
  CREATE TYPE companies::KeyMetrics EXTENDING default::Timestamp {
      CREATE REQUIRED LINK company: companies::Company;
      CREATE PROPERTY growth_rate: std::float32;
      CREATE PROPERTY metric_name: std::str;
      CREATE PROPERTY metric_value: std::str;
      CREATE PROPERTY runway: std::int16;
  };
  ALTER TYPE people::Person {
      CREATE LINK employer: companies::Company;
      CREATE LINK criteria: people::Criteria;
      CREATE MULTI LINK portfolio: funding::Investment;
  };
  CREATE TYPE funding::Allocation EXTENDING default::Timestamp {
      CREATE REQUIRED LINK capital: funding::Capital;
      CREATE REQUIRED PROPERTY percent: std::int16;
      CREATE PROPERTY purpose: std::str;
  };
  CREATE TYPE ownership::Stake EXTENDING default::Timestamp {
      CREATE REQUIRED LINK holder: (people::Person | companies::Company);
      CREATE LINK table: ownership::Table;
      CREATE PROPERTY class: ownership::Party;
      CREATE PROPERTY color: std::str;
      CREATE PROPERTY percent: std::float32;
      CREATE PROPERTY shares: std::int64;
  };
  ALTER TYPE funding::Capital {
      CREATE MULTI LINK uses: funding::Allocation;
      CREATE MULTI LINK investments := (.<capital[IS funding::Investment]);
  };
  ALTER TYPE ownership::Table {
      CREATE MULTI LINK stakes := (.<table[IS ownership::Stake]);
  };
};
