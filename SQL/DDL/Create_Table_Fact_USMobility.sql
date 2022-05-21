create table Survey."Fact_USMobility"(
DayID VARCHAR(8),
fips_code VARCHAR(8),
county_fips VARCHAR(5),
state_fips VARCHAR(2),
retail INT,
grocery_and_pharmacy INT,
parks INT,
transit_stations INT,
workplaces INT,
residential INT,
total_mobolity INT,
primary key(DayID,fips_code)
);