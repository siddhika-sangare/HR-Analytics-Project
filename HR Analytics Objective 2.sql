-- Step 2 : Optimizing Employee Training Program 

-- Attrition Rate Vs Training hours 
select Attrition ,
avg(Training_Hours) as Average_Training_Hours
from hr_data
group by Attrition 
;

-- Training Hours Vs Performance Rating
select Training_Hours_Category,
count(*) as Total_Employee,
round(avg(Performance_Rating),2) as Performance_Rating 
from hr_data
group by Training_Hours_Category
order by Performance_Rating;

-- Employer Satisfaction Score Attrition Rate Vs Training hours 
select Employer_Satisfaction_Score,
ROUND((SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*))*100) AS Attrition_in_percentage,
avg(Training_Hours) as Average_Training_Hours
from hr_data 
group by Employer_Satisfaction_Score
order by Employer_Satisfaction_Score
;





