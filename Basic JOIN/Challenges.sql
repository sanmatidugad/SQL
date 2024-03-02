-- Julia asked her students to create some coding challenges. 
-- Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
-- Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. 
-- If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

WITH new_table AS (
    SELECT Hackers.hacker_id, name, COUNT(challenge_id) AS counts
    FROM Hackers
    JOIN Challenges ON Hackers.hacker_id = Challenges.hacker_id
    GROUP BY Hackers.hacker_id, name
),
new_table1 AS (
SELECT counts, count(counts) as c
FROM new_table
GROUP BY counts
HAVING count(counts) = 1 OR counts = (SELECT MAX(counts) FROM new_table)
ORDER BY counts DESC
)
SELECT new_table.hacker_id, new_table.name, new_table.counts 
FROM new_table /* JOIN new_table1 ON new_table.counts = new_table1.counts */
WHERE new_table.counts IN (SELECT new_table1.counts FROM new_table1)
/* WHERE new_table.counts = new_table1.counts */
/* (SELECT new_table1.counts FROM new_table1) */
ORDER BY new_table.counts DESC, new_table.hacker_id ASC;
