-- You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. 
-- Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend).
-- Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
-- Write a query to output the names of those students whose best friends got offered a higher salary than them. 
-- Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

-- Here I first Join All three tables (table1), Then I self join this table (T1, T2) to perform row wise comparision. 
WITH table1 AS (SELECT Students.ID, Name, Friend_ID, Salary
FROM Students JOIN Friends ON Students.ID = Friends.ID
JOIN Packages ON Packages.ID = Friends.ID)
SELECT T1.Name
FROM table1 T1 JOIN table1 T2 ON T1.Friend_ID = T2.ID
WHERE T2.Salary > T1.Salary
ORDER BY T2.Salary
