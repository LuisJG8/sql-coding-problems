-- Question 1
-- Find the repos that were created between January, 1st 2017 and February, 2nd 2018.

-- answer
SELECT name, 
       created_at, 
       topics,
       stars,
       language
FROM github_repos
WHERE created_at >= '2017-01-01' 
    AND created_at <= '2018-02-01'
ORDER BY created_at DESC;

-- Question 2
-- Find all the programming languages that have the letter c in their name.

-- answer
SELECT language
FROM github_repos
WHERE language LIKE '%c%';


-- Question 3 
-- Find the programming languages with the most amount of repos.

-- answer
SELECT COUNT(*) AS count_repos, language
FROM github_repos
GROUP BY language
ORDER BY count_repos DESC;


-- Question 4
-- What is the difference between the following queries. What do they each do.

-- query 1
SELECT language, COUNT(*) AS count_of_repos
FROM github_repos
WHERE created_at < '2019-01-01'
GROUP BY language

-- query 2
SELECT language, COUNT(*) AS count_of_repos
FROM github_repos
GROUP BY language
HAVING MAX(created_at) < '2019-01-01'


-- Question 5
-- Return the programming languages with the most amount of stars on Github between Octover 1st, 2015 and November 20th, 2016.
-- Order the output by number of stars from the most amount to the least amount

-- answer
SELECT language, COUNT(stars) AS star_count
FROM github_repos 
WHERE created_at >= '2015-10-01' 
    AND created_at <= '2016-11-30'
GROUP BY language
ORDER BY star_count DESC


-- Question 6
-- Return the top 3 programming languages with the least amount of stars between February 2, 2015 and March 2, 2015.

-- answer
SELECT language, COUNT(stars) AS star_count
FROM github_repos 
WHERE created_at >= '2015-10-01' 
    AND created_at <= '2016-11-30'
GROUP BY language
ORDER BY star_count ASC
LIMIT 3


-- Question 7
-- Calculate row numbers for the oldest-to-newest Python repos.

-- answer
SELECT name, language, created_at,
    ROW_NUMBER() OVER (PARTITION BY language ORDER BY created_at) AS history_repo
FROM github_repos 
WHERE language = 'Python'
LIMIT 100


-- Question 8

-- answer 
SELECT CASE 
          WHEN language = 'Python' THEN 'Data/Backend'
          WHEN language = 'JavaScript' THEN 'Frontend/Backend'
          WHEN language = 'C' THEN 'Systems'
          WHEN language = 'Go' THEN 'Backend'
          WHEN language = 'Java' THEN 'Backend'
       END AS languages_use_cases
FROM github_repos 


--question 9
  
-- answer
SELECT *
FROM github_repos 
ORDER BY 
    CASE WHEN homepage IS NULL THEN 0 ELSE 1 END, created_at;
