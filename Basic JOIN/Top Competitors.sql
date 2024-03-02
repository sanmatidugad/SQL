-- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
-- Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
-- Order your output in descending order by the total number of challenges in which the hacker earned a full score.
-- If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.


SELECT Submissions.hacker_id, Hackers.name from Hackers, Submissions, Challenges, Difficulty
WHERE Submissions.score = Difficulty.score
AND Hackers.hacker_id = Submissions.hacker_id
AND Submissions.challenge_id = Challenges.challenge_id
AND Challenges.difficulty_level = Difficulty.difficulty_level
GROUP BY Submissions.hacker_id, Hackers.name
HAVING count(*) > 1
ORDER BY count(*) DESC, Submissions.hacker_id ASC
