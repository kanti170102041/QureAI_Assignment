truncate table survey."Fact_Slack_bot";
insert into survey."Fact_Slack_bot"
with cte as(
	select C.state_fips,
	sum(deaths) as deaths,
	DD.monthID
	from survey."Fact_Covid19" C
	join md."Dim_Day" DD
	on C.dayid=DD.Dayid
	group by C.state_fips,DD.monthID
)
,cte2 as(
	select
	state_fips,
	deaths,
	Monthid,
	rank() over(partition by monthid order by deaths desc,state_fips) as rnk
	from cte
)
,cte3 as(
	select state_fips,
	deaths as deaths_by_state,
	Monthid,
	rnk
	from cte2 where rnk in(1,2,3) --and Monthid in ('202003','202004','202005','202006')
)
,cte4 as(
	select C.county_fips,M.state_fips,
	rnk,
	sum(C.deaths) as deaths_by_county,
	DD.monthID,deaths_by_state
	from survey."Fact_Covid19" C
	join md."Dim_Day" DD
	on C.dayid=DD.Dayid
	join cte3 as M 
	on DD.monthID=M.monthID
	and C.state_fips=M.state_fips
	where C.county_fips<>'00000'
	group by C.county_fips,M.state_fips,DD.monthID,rnk,deaths_by_state
	order by DD.monthID,M.state_fips,deaths_by_county desc
)
,cte5 as(
	select county_fips,state_fips,
 	deaths_by_state,
	deaths_by_county,
	monthID,
	rnk as rnk_by_State,
	rank() over(partition by monthID,state_fips order by deaths_by_county desc,county_fips) as rnk_by_county
	from cte4
)
select 
	S.county_fips,
	county_name,
	S.state_fips,
	state_name,
 	deaths_by_state,
	deaths_by_county,
	S.monthID,
	DD.monthname_long,
	rnk_by_State,
	rnk_by_county
	from cte5 as S
	join md."Dim_County" DC 
	on DC.county_fips=S.county_fips and
	DC.state_fips=S.state_fips
 	join (select distinct monthID,monthname_long from md."Dim_Day") DD
 	on DD.Monthid=S.monthID
	where rnk_by_county in (1,2,3) --and S.monthID='202003'
	order by rnk_by_State,rnk_by_county,monthID