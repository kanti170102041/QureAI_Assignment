create table Technical."FF_CovidByCounty"(
id INT,
county_fips INT,
county_name VARCHAR(80),
state_name VARCHAR(50),
state_fips INT,
On_Date DATE,
deaths INT,
Latitude DECIMAL(12,9),
Longitude DECIMAL(12,9),
Geometry VARCHAR(100)
);
