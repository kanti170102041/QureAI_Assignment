truncate table md."Dim_Day";
insert into md."Dim_Day"
with recursive cte as(
	select cast('2020-01-01' as TIMESTAMP) as DayDate, 1 as cnt
	union all
	select DayDate + INTERVAL '1 day', cnt+1
 	from cte 
 	where cast(DayDate as DATE)<CURRENT_DATE
)
,cte1 as(
	select
	to_char(cast(DayDate as DATE),'YYYYMMDD') as DayID,
	cast(DayDate as DATE) as DayDate,
	extract(doy from DayDate) as DayOfYear,
	Cast(DayDate + INTERVAL '1 day' as Date) as NextDayDate,
	to_char(Cast(DayDate + INTERVAL '1 day' as Date),'YYYYMMDD') NextDayID,
	Cast(DayDate - INTERVAL '1 day' as Date) as PrevDayDate,
	to_char(Cast(DayDate - INTERVAL '1 day' as Date),'YYYYMMDD') PrevDayID,
	SUBSTRING(TO_CHAR(DayDate,'Day'),1,3) as DOWName,
	TO_CHAR(DayDate,'Day') as DOWName_long,
	extract(dow from DayDate)+1 as DOW_Sun,
	extract('week' from DayDate + INTERVAL '1 day') as WOY_Sun,
	to_char(date_trunc('week', DayDate) + INTERVAL '-1 day','YYYYMMDD') as WeekStart_Sun,
	to_char(date_trunc('week', DayDate) + INTERVAL '1 week - 2 day','YYYYMMDD') as WeekEnd_Sun,
	CASE WHEN extract(dow from DayDate)=0
		THEN 7
		ELSE extract(dow from DayDate)
	end as DOW_ISO,
	extract('week' from DayDate) as WOY_ISO,
	to_char(date_trunc('week', DayDate),'YYYYMMDD') as WeekStart_ISO,
	to_char(date_trunc('week', DayDate) + INTERVAL '1 week - 1 day','YYYYMMDD') as WeekEnd_ISO,
	to_char(cast(DayDate as DATE),'MM') as MOY,
	to_char(cast(DayDate as DATE),'YYYYMM') as MonthID,
	substring(TO_CHAR(DayDate,'Month'),1,3) as MonthName,
	to_char(date_trunc('month', DayDate),'YYYYMMDD') as FirstDayOfMonth,
	to_char(date_trunc('month', DayDate) + interval '1 month - 1 day','YYYYMMDD') LastDayOfMonth,
	TO_CHAR(DayDate,'Month') as MonthName_Long,
	extract(days FROM date_trunc('month', DayDate) + interval '1 month - 1 day') as DaysInMonth,
	extract(quarter from DayDate) as Quater,
	to_char(cast(DayDate as DATE),'YYYY') as YearID,
	extract(doy from date_trunc('year', DayDate)+interval '1 year - 1 day') as DaysInYear
	from cte
	order by DayID
 )
 select 
DayID,
DayDate,
concat(to_char(DayDate,'DD'),'-',monthname,' (',downame,')') as DayDesc,
DayOfYear,
NextDayID,
NextDayDate,
PrevDayID,
PrevDayDate,
DOWName,
DOWName_long,
DOW_Sun,
concat(YearID,'W',lpad(cast(WOY_Sun as VARCHAR),2,'0')) as WeekID_Sun,
WOY_Sun,
WeekStart_Sun,
WeekEnd_Sun,
case when DayID=WeekStart_Sun then 1 else 0 end as IsFirstDayOfWeek_Sun,
case when DayID=WeekEnd_Sun then 1 else 0 end as IsLatDayOfWeek_Sun,
DOW_ISO,
concat(YearID,'W',lpad(cast(WOY_ISO as VARCHAR),2,'0')) as WeekID_ISO,
WOY_ISO,
WeekStart_ISO,
WeekEnd_ISO,
case when DayID=WeekStart_ISO then 1 else 0 end as IsFirstDayOfWeek_ISO,
case when DayID=WeekEnd_ISO then 1 else 0 end as IsLatDayOfWeek_ISO,
MOY,
MonthID,
MonthName,
MonthName_Long,
DaysInMonth,
FirstDayOfMonth,
LastDayOfMonth ,
case when DayID=FirstDayOfMonth then 1 else 0 end as IsFirstDayOfMonth,
case when DayID=LastDayOfMonth then 1 else 0 end as IsLatDayOfMonth,
Quater,
concat(YearID,'Q',cast(Quater as VARCHAR)) as QuaterID,
YearID,
DaysInYear,
DaysInYear-DayOfYear as DaysLeftInyear
from cte1;

