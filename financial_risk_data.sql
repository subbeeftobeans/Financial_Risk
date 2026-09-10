-- Averages and data Summaries
SELECT "Income", "Risk Rating" 
FROM financial_risk_assessment
WHERE "Income" IS NOT NULL 
ORDER BY "Income" DESC; 

-- number of children/dependants is exaclty 4
SELECT "Number of Dependents" 
FROM financial_risk_assessment
WHERE "Number of Dependents" = 4;

-- Debt to income ration ordered by Avg Debt ration
SELECT "Education Level", 
ROUND(AVG("Debt-to-Income Ratio")::numeric,4) AS "Avg Debt Ratio"  
FROM financial_risk_assessment
GROUP BY "Education Level"
ORDER BY "Avg Debt Ratio" DESC;

-- loan purposes and the amount given
SELECT "Loan Purpose", 
ROUND(AVG("Loan Amount")::numeric, 4) as "AVG Loan Amt"
FROM financial_risk_assessment
GROUP BY "Loan Purpose"
ORDER BY "AVG Loan Amt" DESC;

-- selecting specific columns to then filter by
SELECT "Employment Status", "Previous Defaults", "Risk Rating" 
FROM financial_risk_assessment
WHERE "Employment Status" = 'Unemployed'
	AND "Payment History" = 'Excellent'
	AND "Previous Defaults" = '0';

-- filtering Education level and Risk Rating by Payment History and Previous defaults
SELECT "Education Level", "Risk Rating" 
FROM financial_risk_assessment
WHERE "Employment Status" = 'Unemployed'
	AND "Payment History" = 'Excellent'
	AND "Previous Defaults" = '0';

-- filtering the entire set where Employment Status is 'Unemployed' and Risk Rating is 'Low'
SELECT *  
FROM financial_risk_assessment
WHERE "Employment Status" = 'Unemployed'
	AND "Payment History" = 'Poor'
	AND "Risk Rating" = 'Low';

-- filtering each column by each risk rating and education level 
SELECT 
    "Education Level", 
    "Risk Rating", 
    COUNT(*) AS "Total Applicants"
FROM financial_risk_assessment
GROUP BY "Education Level", "Risk Rating"
ORDER BY "Education Level", "Risk Rating";

-- finding those who are above average income and their stats
SELECT "Age", "Education Level", "Income", "Risk Rating", "Loan Purpose" 
FROM financial_risk_assessment
WHERE "Income" > ( 
    SELECT AVG("Income") 
    FROM financial_risk_assessment
)
ORDER BY "Income" DESC
LIMIT 15;


