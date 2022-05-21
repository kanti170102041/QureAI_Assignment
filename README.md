# QureAI_Assignment
### Covid-19 Data for is US is located in DATA folder, contains covid-19 deaths by county, covid-19 deaths and cases by state and mobility by county

### 1. Data Modelling: 
Dimensional model used is defines follows: </br>
Data is stagged into technical."FF_CovidByCounty", technical."FF_CovidByState" & technical."FF_USMobility" from the files<\br> 
  a. Dimension Tables: </br>
    ->md."Dim_Day": Each row stores information about a perticular calender date (for definition go to SQL/DDL & SQL|DML folder)</br>
    ->md."Dim_County": Each row contains information about a perticular county in a state</br>
  b. Fact Tables:</br>
    ->survey."Fact_Covid19": A row represents, deaths and cases for a county in a state on a perticular date</br>
    ->survey."Fact_USMobility": A row represents mobility of different places in a county on a perticular date</br>
  c. Fact_Tables for reporting:</br>
    ->survey."Fact_Covid_report": Each row has deaths cases and mobility in a perticular date for a perticular county
    ->survey."Fact_Slack_bot": Has the top 3 state and top 3 county wrt to covid deaths
    
### 2. Data Loading:
  Please find DDL and DML scripts in the SQL folder.
  running DML scripts in correct order(FF->Dim->Fact->Reporting Fact) will ensure data loads properly.
  
### 3. Visualization:
  Grafana Plots: Total Deaths , Total Cases , Deaths in Alabam, Deaths in Arkansas, cases in Alabam, Cases in Arkansas with respect to time<br />
  ![Alt text](https://github.com/kanti170102041/QureAI_Assignment/blob/master/Data_Visualization/Deaths_vs_cases.png)
  Grafana Plots: Deaths and Transit Mobility with respect to time<br />
  ![Alt text](https://github.com/kanti170102041/QureAI_Assignment/blob/master/Data_Visualization/Deaths_vs_Mobility_Grafana.png)
  Python Plots: Deaths vs Mobility <br />
  ![Alt text](https://github.com/kanti170102041/QureAI_Assignment/blob/master/Data_Visualization/Deaths_vs_Mobility_python.png)
  
### 4. Automated script to send Data to slack:
  find the script in QureAI_Assignment\Slack_Integration for test perposes the schedule time is set to 5 minites.
  The scripts sends monthly data in an interval of 5 minutes.<br />
![Alt text](https://github.com/kanti170102041/QureAI_Assignment/blob/master/Slack_Integration/Slack_data_screenshot.png)

