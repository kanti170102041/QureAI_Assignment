create table md."Dim_County"(
	fips_code VARCHAR(8),--01123-01
	county_fips VARCHAR(5),
	state_fips VARCHAR(2),
	county_name VARCHAR(100),
	state_name VARCHAR(100),
	state_Abr VARCHAR(2),
 	latitude DECIMAL(12,9),
 	longitude DECIMAL(12,9)
);