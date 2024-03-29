/* Recyclable and Low Fat Products */
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y'
ORDER BY product_id

/* Find Customer Referee  */
SELECT name 
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL   -- != . NULL values will not print unless asked for

/* Big Countries */
SELECT name, population, area
FROM World
WHERE area >= 3000000 OR population >= 25000000    -- operators.

/* Article Views I */
SELECT DISTINCT author_id AS id     -- DISTINCT rows throughout
FROM Views
WHERE author_id = viewer_id
ORDER BY id

/* Invalid Tweets */
SELECT tweet_id 
FROM Tweets
WHERE LENGTH(content) > 15    -- LENGTH will give length of a string. is similar to len() function in python. 

/* Replace Employee ID with the Unique Identifier */
SELECT  EmployeeUNI.unique_id, Employees.name
FROM Employees LEFT JOIN EmployeeUNI ON Employees.id = EmployeeUNI.id    -- LEFT JOIN will give all values in the first table

/* Product Sales Analysis I */
SELECT product_name, Sales.year, price
FROM Sales INNER JOIN Product ON Sales.product_id = Product.product_id    -- INNER JOIN will give common values from both tables

/* Customer who visited but did not make any transactions */
 
SELECT Visits.customer_id, COUNT(Visits.customer_id) AS count_no_trans     -- GROUP Wise COUNT the values. 
FROM Visits LEFT JOIN Transactions ON Visits.visit_id = Transactions.visit_id
WHERE Transactions.transaction_id IS NULL
GROUP BY Visits.customer_id

/* 197. Rising Temperature */
-- MYSQL
SELECT W1.id
FROM Weather W1 
 JOIN Weather W2 ON DATEDIFF(W1.recordDate, W2.recordDate) = 1     -- DATEDIFF will a join where the difference in dates is 1.
 AND W1.temperature > W2.temperature

-- MYSQL Server
SELECT w2.id AS Id
FROM Weather w1
JOIN Weather w2 ON DATEDIFF(day, w1.recordDate, w2.recordDate) = 1  -- DATEDIFF will a join where the  DAY difference in dates is 1, we also have MONTH, YEAR options
AND w2.temperature > w1.temperature

/* 1661. Average Time of Process per Machine */
SELECT  A1.machine_id,
        ROUND(AVG((A2.timestamp - A1.timestamp)),3) AS processing_time    -- AVG will give AVERAGE, ROUND will ROUND OFF
FROM ACTIVITY AS A1 JOIN ACTIVITY AS A2 ON A1.machine_id = A2.machine_id AND A1.process_id = A2.process_id    -- provide conditions columns to join 
WHERE A1.activity_type = 'start' AND A2.activity_type = 'end'
GROUP BY A1.machine_id

/* 577. Employee Bonus */
SELECT name, bonus
FROM Employee LEFT JOIN Bonus ON Employee.empId = Bonus.empId
WHERE bonus < 1000 OR bonus IS NULL

/* 1280. Students and Examinations */
SELECT DISTINCT Students.student_id, Students.student_name, Subjects.subject_name,
 COUNT(Examinations.student_id) AS attended_exams

FROM Students CROSS JOIN Subjects
 LEFT JOIN Examinations ON Examinations.student_id = Students.student_id 
 AND Examinations.subject_name = Subjects.subject_name

GROUP BY Students.student_id, Students.student_name, Subjects.subject_name
ORDER BY Students.student_id


