drop table Survey."Fact_Covid19";
create table Survey."Fact_Covid19"(
DayID VARCHAR(8),
fips_code VARCHAR(8),
county_fips VARCHAR(5),
state_fips VARCHAR(2),
deaths INT,
total_DeathsInState INT,
total_CasesInState INT,
primary key(DayID,fips_code)
);
