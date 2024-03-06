-- Samantha interviews many candidates from different colleges using coding challenges and contests. 
-- Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. 
-- Exclude the contest from the result if all four sums are .
-- Note: A specific contest can be used to screen candidates at more than one college, but each college only holds  screening contest.

WITH S_Stats AS (
    SELECT challenge_id, 
           SUM(total_submissions) AS total_submissions,
           SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM Submission_Stats 
    GROUP BY challenge_id 
), 
V_Stats AS (
    SELECT challenge_id, 
           SUM(total_views) AS total_views,
           SUM(total_unique_views) AS total_unique_views
    FROM View_Stats 
    GROUP BY challenge_id 
)

SELECT Contests.contest_id, Contests.hacker_id, Contests.name, 
       SUM(total_submissions),
       SUM(total_accepted_submissions),
       SUM(total_views),
       SUM(total_unique_views)
FROM Contests
INNER JOIN Colleges ON Contests.contest_id = Colleges.contest_id
INNER JOIN Challenges ON Colleges.college_id = Challenges.college_id
LEFT JOIN S_Stats ON Challenges.challenge_id = S_Stats.challenge_id 
LEFT JOIN V_Stats ON Challenges.challenge_id = V_Stats.challenge_id
GROUP BY Contests.contest_id, Contests.hacker_id, Contests.name
HAVING SUM(total_submissions) > 0
    OR SUM(total_accepted_submissions) > 0
    OR SUM(total_views) > 0
    OR SUM(total_unique_views) > 0
ORDER BY Contests.contest_id;
