-- You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

-- The total score of a hacker is the sum of their maximum scores for all of the challenges.
-- Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. 
-- If more than one hacker achieved the same total score, then sort the result by ascending hacker_id.
-- Exclude all hackers with a total score of  from your result.

SELECT max_table.hacker_id, max_table.name, SUM(max_table.max_score)
FROM 
    (SELECT Hackers.hacker_id,
     Hackers.name, Submissions.challenge_id,
     MAX(SUBMISSIONS.score) AS max_score
     FROM Hackers JOIN Submissions ON Hackers.hacker_id = Submissions.hacker_id
     GROUP BY Hackers.hacker_id, Hackers.name, Submissions.challenge_id) AS max_table
GROUP BY max_table.hacker_id, max_table.name
HAVING SUM(max_table.max_score) > 0
ORDER BY SUM(max_table.max_score) DESC, max_table.hacker_id
