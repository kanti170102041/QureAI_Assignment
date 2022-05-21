copy Technical."FF_CovidByCounty" 
FROM 'D:\QureAI_Assignment\Data\confirmed-covid-19-deaths-in-us-by-state-and-county.csv' DELIMITER ',' CSV HEADER;


copy Technical."FF_CovidByState" 
FROM 'D:\QureAI_Assignment\Data\covid-19-state-level-data.csv' DELIMITER ',' CSV HEADER;


copy TECHNICAL."FF_USMobility"
FROM 'D:\QureAI_Assignment\Data\us-mobility.csv' DELIMITER ',' CSV HEADER;
