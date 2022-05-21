
truncate table Survey."Fact_Covid19";

insert into Survey."Fact_Covid19"
with CovidByCounty as(
	select 
		LPAD(cast(county_fips as VARCHAR),5,'0') as county_fips,
		LPAD(cast(state_fips as VARCHAR),2,'0') as state_fips,
		to_char(on_date,'YYYYMMDD') as DayID,
		deaths
	from technical."FF_CovidByCounty"
	)
	, CovidByState as(
	select 
		LPAD(cast(state_fips as VARCHAR),2,'0') as state_fips,
		to_char(on_date,'YYYYMMDD') as DayID,
		cases,
		deaths
	from technical."FF_CovidByState"
	)

		select
			coalesce(B.DayID,A.DayID) as DayID,
			concat(coalesce(B.county_fips,'00000'),'-',coalesce(A.state_fips,B.state_fips,'00')) as fips_code,
			coalesce(B.county_fips,'00000') as county_fips,
			coalesce(A.state_fips,B.state_fips,'00') as state_fips,
			coalesce(B.Deaths,A.Deaths,0) as Deaths,
			coalesce(A.Deaths,0) as total_DeathsInState,
			coalesce(A.Cases,0) as total_CasesInState
		from CovidByState A
		full outer join CovidByCounty B on A.state_fips=B.state_fips and A.DayID=B.DayID;
	