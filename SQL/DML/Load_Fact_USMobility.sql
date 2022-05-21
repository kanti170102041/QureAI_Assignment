truncate table Survey."Fact_USMobility";
insert into Survey."Fact_USMobility"
select 
to_char(on_date,'YYYYMMDD') as DayID,
coalesce(D.fips_code,'00000-00') as fips_code,
coalesce(county_fips,'00000') as county_fips,
coalesce(state_fips,'00') as state_fips,
coalesce(retail,0) as retail,
coalesce(grocery_and_pharmacy,0) as grocery_and_pharmacy,
coalesce(parks,0) as parks,
coalesce(transit_stations,0) as transit_stations,		 
coalesce(workplaces,0) as workplaces,
coalesce(residential,0) as residential,
coalesce(retail,0)+coalesce(grocery_and_pharmacy,0)+coalesce(parks,0)
+coalesce(transit_stations,0)+coalesce(workplaces,0)+coalesce(residential,0) as total_mobolity
from technical."FF_USMobility" as M
left join md."Dim_County" D
 on D.county_name=M.county_name
 and D.state_name=M.state_name
 where D.fips_code is not null
 order by fips_code,DayID
 ;		 