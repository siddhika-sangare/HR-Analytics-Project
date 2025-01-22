-- Step 2 : Analyzing factors affecting Employee Attrition

-- Total Attrtion rate 
SELECT 
	COUNT(*) AS Total_Employees, 
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 ELSE NULL END) AS Total_Attrition_Count,
    ROUND(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 ELSE NULL END)/COUNT(Employee_ID)*100,2) AS Attrition_in_percentage,
	COUNT(CASE WHEN Attrition = 'No' THEN 1 ELSE NULL END) AS Total_Active_Employees_Count,
    ROUND(COUNT(CASE WHEN Attrition = 'No' THEN 1 ELSE NULL END)/COUNT(Employee_ID)*100,2) AS Active_Employees_in_percentage
FROM hr_data
;

-- Gender wise Attrition rate 
SELECT 
	Gender,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage
FROM hr_data
GROUP BY Gender
;

-- Gender vs Employee satisfaction score wise Attrtion
select Gender,
COUNT(Employee_ID) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage,
round(avg(Employee_Satisfaction_Score),2)  as Satisfaction_score
from hr_data 
group by Gender 
order by Satisfaction_score desc;

-- Department wise Attrition rate
SELECT Department,
	COUNT(Employee_ID) AS Total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage
    FROM hr_data
GROUP BY
    Department
  ORDER BY
	Attrition_in_percentage desc
    ;
    
-- Position wise Attrition rate 
SELECT 
	Position,
    round(avg(Salary)) as AVG_Salary,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
	ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage,
    round(avg(Employee_Satisfaction_Score),2)  as Avg_Employee_Satisfaction_Score,
	(select avg(Employee_Satisfaction_Score) from hr_data) as Overall_Employee_Satisfaction_Score
FROM hr_data
GROUP BY Position
;

-- Age VS Years of Service Attrition rate 
select Age_Group,COUNT(Employee_ID) AS Total_Employees,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage,
round(avg(Years_of_Service),2)  as Avg_Years_of_Service,
round(avg(Employee_Satisfaction_Score),2)  as Avg_Employee_Satisfaction_Score
from hr_data 
group by Age_Group
order by Attrition_Count desc;

-- Work_hours vs Attrition rate
SELECT 
	Work_Hours,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage
FROM hr_data
GROUP BY Work_Hours
order by Attrition_in_percentage desc
;

-- Distance vs Attrition Rate
SELECT 
	Distance_from_Work_Category,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage
FROM hr_data
GROUP BY Distance_from_Work_Category
order by Attrition_in_percentage desc
;

-- Promotion vs Attrition Rate
SELECT 
	Promotion,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage
FROM hr_data
GROUP BY Promotion
order by Attrition_in_percentage
;

-- Salary wise Attrition rate 
SELECT 
	Income_Group,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage
FROM hr_data
GROUP BY Income_Group
order by Attrition_in_percentage
;

-- Years of service wise Attrition Rate
SELECT 
	Years_of_Service,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage
FROM hr_data
GROUP BY Years_of_Service
;

-- Performance wise Attrition Rate 
SELECT 
	Performance_Rating,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage
FROM hr_data
GROUP BY Performance_Rating
;

-- Performance_Rating vs Promotion wise Attrition Rate
SELECT 
	Performance_Rating,Promotion,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage
FROM hr_data
GROUP BY Performance_Rating,Promotion
;









