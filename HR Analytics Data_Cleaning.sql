-- Step 1 : Cleaning and Preparation of Data 

-- Create a new table and categorise data into different groups based on range of data.
-- Categorise column : Age,Years_of_Service,Salary,Training_Hours,Absenteeism,Distance_from_Work
-- Create a new columns like Employee_Satisfaction_Score,Employee_Benefit_Score
SELECT 
    Employee_ID,
    Employee_Name,
    Age,
    CASE
        WHEN Age BETWEEN 20 AND 30 THEN '20-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Other'
    END AS Age_Group,
    Years_of_Service,
    CASE
        WHEN Years_of_Service BETWEEN 0 AND 2 THEN '0-2 Years'
        WHEN
            Years_of_Service > 2
                AND Years_of_Service <= 5
        THEN
            '2-5 Years'
        WHEN
            Years_of_Service > 5
                AND Years_of_Service <= 10
        THEN
            '5-10 Years'
        WHEN
            Years_of_Service > 10
                AND Years_of_Service <= 15
        THEN
            '10-15 Years'
        ELSE '15+ Years'
    END AS Experience_Category,
    CASE
        WHEN Position IN ('DataAnalyst' , 'Analyst') THEN 'Data Analyst'
        WHEN Position IN ('AccountExecutive' , 'AccountExec.', 'Account Exec.') THEN 'Account Executive'
        ELSE Position
    END AS Position,
    CASE
        WHEN Gender = 'Female' THEN 'F'
        WHEN Gender = 'Male' THEN 'M'
        ELSE Gender
    END AS Gender,
    Department,
    Salary,
    CASE
        WHEN Salary BETWEEN 0 AND 100000 THEN '0-1 Lac'
        WHEN Salary BETWEEN 100001 AND 1000000 THEN '1-10 Lacs'
        WHEN Salary BETWEEN 1000001 AND 2000000 THEN '10-20 Lacs'
        WHEN Salary BETWEEN 2000001 AND 3000000 THEN '20-30 Lacs'
        WHEN Salary BETWEEN 3000001 AND 4000000 THEN '30-40 Lacs'
        WHEN Salary BETWEEN 4000001 AND 5000000 THEN '40-50 Lacs'
        WHEN Salary BETWEEN 5000001 AND 6000000 THEN '50-60 Lacs'
        WHEN Salary BETWEEN 6000001 AND 7000000 THEN '60-70 Lacs'
        WHEN Salary BETWEEN 7000001 AND 8000000 THEN '70-80 Lacs'
        WHEN Salary BETWEEN 8000001 AND 9000000 THEN '80-90 Lacs'
        WHEN Salary >= 9000001 THEN '90 Lacs-1 Cr'
        ELSE 'Above 1 Cr'
    END AS Income_Group,
    Performance_Rating,
    Work_Hours,
    Attrition,
    Promotion,
    Training_Hours,
    CASE
        WHEN Training_Hours BETWEEN 0 AND 10 THEN '0-10 Hours'
        WHEN Training_Hours BETWEEN 11 AND 20 THEN '11-20 Hours'
        WHEN Training_Hours BETWEEN 21 AND 30 THEN '21-30 Hours'
        WHEN Training_Hours BETWEEN 31 AND 40 THEN '31-40 Hours'
        ELSE '40+ Hours'
    END AS Training_Hours_Category,
    Satisfaction_Score AS Employer_Satisfaction_Score,
    Education_Level,
    Employee_Engagement_Score,
    Absenteeism,
    CASE
        WHEN Absenteeism BETWEEN 0 AND 5 THEN '0-5 Days'
        WHEN Absenteeism BETWEEN 6 AND 10 THEN '6-10 Days'
        WHEN Absenteeism BETWEEN 11 AND 15 THEN '11-15 Days'
        ELSE '15+ Days'
    END AS Absenteeism_Category,
    Distance_from_Work,
    CASE
        WHEN Distance_from_Work BETWEEN 0 AND 10 THEN '0-10 kms'
        WHEN Distance_from_Work BETWEEN 11 AND 20 THEN '11-20 kms'
        WHEN Distance_from_Work BETWEEN 21 AND 30 THEN '21-30 kms'
        WHEN Distance_from_Work BETWEEN 31 AND 40 THEN '31-40 kms'
        ELSE '40+ kms'
    END AS Distance_from_Work_Category,
    JobSatisfaction_PeerRelationship,
    JobSatisfaction_WorkLifeBalance,
    JobSatisfaction_Compensation,
    JobSatisfaction_Management,
    JobSatisfaction_JobSecurity,
    (JobSatisfaction_PeerRelationship + JobSatisfaction_WorkLifeBalance + JobSatisfaction_Compensation + JobSatisfaction_Management + JobSatisfaction_JobSecurity) / 5 * 100 AS Employee_Satisfaction_Score,
    EmployeeBenefit_HealthInsurance,
    EmployeeBenefit_PaidLeave,
    EmployeeBenefit_RetirementPlan,
    EmployeeBenefit_GymMembership,
    EmployeeBenefit_ChildCare,
    (EmployeeBenefit_HealthInsurance + EmployeeBenefit_PaidLeave + EmployeeBenefit_RetirementPlan + EmployeeBenefit_GymMembership + EmployeeBenefit_ChildCare) / 5 * 100 AS Employee_Benefit_Score
FROM
    hr_analytics_dataset_adviti
;
-- Retrieve data from new table.
SELECT * FROM hr_analytics_dataset_adviti order by Employee_ID;

-- Hypothesis: Whether an Intern was hired or not
SELECT Employee_Name, Age, COUNT(*) AS Total
FROM hr_analytics_dataset_adviti
GROUP BY Employee_Name, Age
HAVING COUNT(*) > 1;
-- Conclusion: We can remove the interns data. 

-- Drop existing table to create a new table without Interns data.
DROP TABLE IF EXISTS hr_data;

-- Create a table where position is not Intern.
CREATE TABLE hr_data AS
SELECT
	Employee_ID,
    Employee_Name,
    Age,
    CASE 
        WHEN Age BETWEEN 20 AND 30 THEN '20-30'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE 'Other'
    END AS Age_Group,
    Years_of_Service,
    CASE 
        WHEN Years_of_Service BETWEEN 0 AND 2 THEN '0-2 Years'
        WHEN Years_of_Service > 2 AND Years_of_Service <= 5 THEN '2-5 Years'
        WHEN Years_of_Service > 5 AND Years_of_Service <= 10 THEN '5-10 Years'
        WHEN Years_of_Service > 10 AND Years_of_Service <= 15 THEN '10-15 Years'
        ELSE '15+ Years'
    END AS Experience_Category,
    CASE 
        WHEN Position IN ('DataAnalyst', 'Analyst') THEN 'Data Analyst'
        WHEN Position IN ('Creator') THEN 'Content Creator'
        WHEN Position IN ('AccountExecutive', 'AccountExec.', 'Account Exec.') THEN 'Account Executive'
        ELSE Position 
    END AS Position,
    CASE 
        WHEN Gender = 'Female' THEN 'F'
        WHEN Gender = 'Male' THEN 'M'
        ELSE Gender 
    END AS Gender,
    Department,	
    Salary,	
    CASE 
        WHEN Salary BETWEEN 0 AND 100000 THEN '0-1 Lac'
        WHEN Salary BETWEEN 100001 AND 1000000 THEN '1-10 Lacs'
        WHEN Salary BETWEEN 1000001 AND 2000000 THEN '10-20 Lacs'
        WHEN Salary BETWEEN 2000001 AND 3000000 THEN '20-30 Lacs'
        WHEN Salary BETWEEN 3000001 AND 4000000 THEN '30-40 Lacs'
        WHEN Salary BETWEEN 4000001 AND 5000000 THEN '40-50 Lacs'
        WHEN Salary BETWEEN 5000001 AND 6000000 THEN '50-60 Lacs'
        WHEN Salary BETWEEN 6000001 AND 7000000 THEN '60-70 Lacs'
        WHEN Salary BETWEEN 7000001 AND 8000000 THEN '70-80 Lacs'
        WHEN Salary BETWEEN 8000001 AND 9000000 THEN '80-90 Lacs'
        WHEN Salary >= 9000001 THEN '90 Lacs-1 Cr'
        ELSE 'Above 1 Cr'
    END AS Income_Group,
    Performance_Rating,
    Work_Hours,
	Attrition,
	Promotion,
	Training_Hours,
    CASE 
        WHEN Training_Hours BETWEEN 0 AND 10 THEN '0-10 Hours'
        WHEN Training_Hours BETWEEN 11 AND 20 THEN '11-20 Hours'
        WHEN Training_Hours BETWEEN 21 AND 30 THEN '21-30 Hours'
        WHEN Training_Hours BETWEEN 31 AND 40 THEN '31-40 Hours'
        ELSE '40+ Hours'
    END AS Training_Hours_Category,
	Satisfaction_Score AS Employer_Satisfaction_Score,
	Education_Level,
	Employee_Engagement_Score,
	Absenteeism,
    CASE 
        WHEN Absenteeism BETWEEN 0 AND 5 THEN '0-5 Days'
        WHEN Absenteeism BETWEEN 6 AND 10 THEN '6-10 Days'
        WHEN Absenteeism BETWEEN 11 AND 15 THEN '11-15 Days'
        ELSE '15+ Days'
    END AS Absenteeism_Category,
	Distance_from_Work,
    CASE 
        WHEN Distance_from_Work BETWEEN 0 AND 10 THEN '0-10 kms'
        WHEN Distance_from_Work BETWEEN 11 AND 20 THEN '11-20 kms'
        WHEN Distance_from_Work BETWEEN 21 AND 30 THEN '21-30 kms'
        WHEN Distance_from_Work BETWEEN 31 AND 40 THEN '31-40 kms'
        ELSE '40+ kms'
    END AS Distance_from_Work_Category,
	JobSatisfaction_PeerRelationship,
	JobSatisfaction_WorkLifeBalance,
	JobSatisfaction_Compensation,
	JobSatisfaction_Management,
	JobSatisfaction_JobSecurity,
    (JobSatisfaction_PeerRelationship + 
	JobSatisfaction_WorkLifeBalance +
	JobSatisfaction_Compensation +
	JobSatisfaction_Management + 
	JobSatisfaction_JobSecurity) /5*100 AS Employee_Satisfaction_Score,
	EmployeeBenefit_HealthInsurance,
	EmployeeBenefit_PaidLeave,
	EmployeeBenefit_RetirementPlan,
	EmployeeBenefit_GymMembership,
	EmployeeBenefit_ChildCare,
    (EmployeeBenefit_HealthInsurance +
	EmployeeBenefit_PaidLeave +
	EmployeeBenefit_RetirementPlan +
	EmployeeBenefit_GymMembership +
	EmployeeBenefit_ChildCare)/5*100 AS Employee_Benefit_Score
FROM hr_analytics_dataset_adviti
WHERE Position != 'Intern'
;
 
SELECT * FROM hr_data order by Employee_ID ;

