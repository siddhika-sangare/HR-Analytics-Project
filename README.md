# HR Analytics Project - Adviti Pvt. Ltd.
SQL Project- Analyzing HR Data for Attrition 

## Introduction

This repository contains an HR Analytics project focused on **Adviti Pvt. Ltd.**. The project involves analyzing the key factors influencing employee attrition and evaluating the effectiveness of the company's training program. The dataset includes various employee attributes such as age, salary, promotion status, years of service, training hours, and more.

The goal of this project is to provide actionable insights that can help the company make data-driven decisions to improve employee retention and enhance the training programs.

## Objectives

The key objectives of this analysis are:

1. **Identify and examine the factors influencing employee attrition**: Understanding why employees leave the company, based on various employee attributes.
2. **Evaluate the effectiveness of the current training program**: Assess how well the training program impacts employee performance and satisfaction, and how it relates to attrition rates.

## Steps and Methodology

### 1. Data Cleaning and Preparation

Data cleaning was performed to handle inconsistencies, missing values, and formatting issues in the dataset. Here’s an overview of the data preparation steps:

- **Standardization of Gender and Position**:
  - Replaced gender entries ('Female' → 'F', 'Male' → 'M').
  - Grouped similar positions (e.g., ‘AccountExecutive’, ‘Account Exec.’ → ‘Account Executive’).
  
- **Categorization of Continuous Variables**:
  - The **Age** column was categorized into **Age Groups** (e.g., '20-30', '31-40', '41-50').
  - The **Years_of_Service** column was categorized into **Experience Categories** (e.g., '0-2 Years', '2-5 Years', '5-10 Years').

- **Creation of Satisfaction and Benefit Scores**:
  - **Employee_Satisfaction_Score** was calculated based on job satisfaction-related columns (e.g., JobSatisfaction_PeerRelationship, JobSatisfaction_WorkLifeBalance).
  - **Employee_Benefit_Score** was computed from various employee benefits like HealthInsurance, PaidLeave, GymMembership, etc.

### 2. Data Manipulation

In this phase, new insights were derived by creating calculated columns and performing group-wise analyses:

- **Satisfaction and Benefit Scores**:
  - Average scores were computed from multiple columns to create aggregate satisfaction and benefit metrics for each employee.
  
- **Filtering and Grouping**:
  - Grouped data by **Age**, **Years_of_Service**, **Gender**, **Department**, etc., to analyze patterns related to employee attrition and performance.

### 3. Data Visualization

Various visualizations were created to explore and understand the relationships between different variables:

- **Attrition Rate Analysis**: 
  - A variety of bar and pie charts were created to visualize attrition rates across different factors such as gender, department, position, salary, and training hours.

- **Heatmaps and Correlation Matrices**: 
  - Heatmaps were generated to visualize correlations between different employee attributes and their influence on employee satisfaction and attrition.

- **Distribution Plots**: 
  - Distribution of **Salary**, **Performance Rating**, and **Training Hours** was visualized to understand the spread and its relation to attrition.

### 4. Final Recommendations

Based on the analysis, several recommendations were made to help improve employee retention and optimize the training program:

- **Address Gender-Specific Attrition**: 
  - The higher attrition rate among male employees can be addressed by improving factors like job satisfaction, work-life balance, and compensation.

- **Focus on the Sales Department**: 
  - The sales department exhibits the highest attrition. The company should conduct employee surveys to gather insights on job satisfaction and identify areas for improvement.

- **Retention Strategies for Senior Employees**: 
  - Senior employees (with 15+ years of service) show a high attrition rate. The company should offer attractive retirement benefits, healthcare, and other retention strategies.

- **Improve Promotion and Career Growth Opportunities**: 
  - Employees with high performance ratings but no promotions are likely to leave. The company should ensure that high performers receive timely promotions.

- **Reevaluate Training Hours**: 
  - Long training hours seem to correlate with higher attrition rates. The company should focus on the quality and relevance of training programs rather than just the duration.

- **Travel Benefits for Remote Employees**: 
  - Employees who live far from the office show higher attrition rates. Offering travel facilities or compensation may reduce attrition.

## Conclusion

The **HR Analytics Project** offers valuable insights into employee attrition and the effectiveness of training programs at Adviti Pvt. Ltd. By addressing the identified issues, the company can improve employee retention, performance, and overall satisfaction. The project demonstrates how data-driven decision-making can lead to more effective human resource strategies.
