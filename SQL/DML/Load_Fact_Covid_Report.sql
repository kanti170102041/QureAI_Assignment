insert into survey."Fact_Covid_report"
select county_name,
state_name,
latitude,
longitude,
state_abr,
deaths,
total_deathsinstate,
total_casesinstate,
daydate,
cast(daydate as TIMESTAMP) as daydatetime,
retail as retail_mobility,
grocery_and_pharmacy as grocery_and_pharmacy_mobility,
parks as parks_mobility,
transit_stations as transit_stations_mobility,
workplaces as workplaces_mobility,
residential as residential_mobility,
total_mobolity
from survey."Fact_Covid19" C join 
survey."Fact_USMobility" M 
on C.fips_code=M.fips_code
and C.DayID=M.DayID
left join md."Dim_Day" DD
on DD.DayID=C.DayID
left join md."Dim_County" DC
on DC.fips_code=C.fips_code;