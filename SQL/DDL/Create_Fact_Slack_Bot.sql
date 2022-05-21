create table Survey."Fact_Slack_bot"(
	county_fips VARCHAR(5),
	county_name VARCHAR(100),
	state_fips VARCHAR(2),
	state_name VARCHAR(100),
    deaths_by_state INT,
	deaths_by_county INT,
	monthID VARCHAR(6),
	month_Name VARCHAR(10),
	rnk_by_State INT,
	rnk_by_county INT
)