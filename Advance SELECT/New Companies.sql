-- Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 
-- Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. 
-- Order your output by ascending company_code.
-- Note:
-- The tables may contain duplicate records.
-- The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

SELECT Company.company_code, founder, 
    COUNT(DISTINCT Lead_Manager.lead_manager_code), 
    COUNT(DISTINCT Senior_Manager.senior_manager_code),
    COUNT(DISTINCT Manager.manager_code),
    COUNT(DISTINCT Employee.employee_code)
FROM Company 
    JOIN Lead_Manager ON Company.company_code = Lead_Manager.company_code
    JOIN Senior_Manager ON Senior_Manager.lead_manager_code = Lead_Manager.lead_manager_code
    JOIN Manager ON Senior_Manager.senior_manager_code = Manager.senior_manager_code
    JOIN Employee ON Employee.manager_code = Manager.manager_code
GROUP BY Company.company_code, founder
ORDER BY Company.company_code
