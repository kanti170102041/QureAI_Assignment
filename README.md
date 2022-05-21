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
  ![Alt text](relative/path/to/img.jpg?raw=true "Title")

### 4. Automated script to send Data to slack:
  
