truncate table md."Dim_County";
insert into md."Dim_County"
with cte as(
select 
LPAD(cast(county_fips as VARCHAR),5,'0') as county_fips,
state_fips,
county_name,
state_name,
Coalesce(latitude,0) as latitude,
Coalesce(longitude,0) as longitude
from technical."FF_CovidByCounty"
group by county_fips,state_fips,county_name,state_name,latitude,longitude)

select concat(coalesce(B.county_fips,'00000'),'-',LPAD(cast(A.state_fips as VARCHAR),2,'0')) as fips_code,
coalesce(B.county_fips,'00000') as county_fips,
LPAD(cast(A.state_fips as VARCHAR),2,'0') as state_fips,
coalesce(B.county_name, 'Statewide Unallocated') as county_name,
A.state_name,
coalesce(B.state_name,'-') as state_Abr,
coalesce(B.latitude,0) as latitude,
coalesce(B.longitude,0) as longitude
from technical."FF_CovidByState" A
left join cte B on A.state_fips=B.state_fips
group by fips_code,B.county_fips,A.state_fips,B.county_name,B.state_name,A.state_name,latitude,longitude;

