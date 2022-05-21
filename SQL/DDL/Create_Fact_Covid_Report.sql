--DROP TABLE IF EXISTS survey."Fact_Covid_report";
CREATE TABLE survey."Fact_Covid_report"
(
    county_name VARCHAR(100),
    state_name VARCHAR(100),
    latitude numeric(12,9),
    longitude numeric(12,9),
    state_abr VARCHAR(2),
    deaths INT,
    total_deathsinstate INT,
    total_casesinstate INT,
    daydate date,
    daydatetime timestamp,
	retail_mobility INT,
	grocery_and_pharmacy_mobility INT,
	parks_mobility INT,
	transit_stations_mobility INT,
	workplaces_mobility INT,
	residential_mobility INT,
	total_mobolity INT
);