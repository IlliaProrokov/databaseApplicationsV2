-- =====================================================================
-- Unit 2b — Filtering with Logic
-- Database Applications Development · MCCC
--
-- Database: nba_5seasons.db · Tables: teams, players
--
-- Rename this file with your last name before you start.
--
-- Read unit2b_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. Show every team in Ohio or California, with its state.
SELECT full_name, state 
FROM teams
WHERE NOT (state = 'California');
-- 2. Show teams founded c 1960 and 1980, with their founding
--    years. Use BETWEEN.
SELECT full_name,state
FROM teams
WHERE NOT (year_founded BETWEEN 1960 AND 1980);

-- 3. Show teams in Texas, Florida, or New York, with their states.
--    Use IN.
SELECT full_name, state 
FROM teams
WHERE NOT (state = 'california' OR state = 'Texas');

-- 4. Show teams whose nickname starts with the letter C.
SELECT full_name, state 
FROM teams 
WHERE nickname LIKE 'C%';

-- 5. Find every player whose name contains "James".
SELECT full_name
FROM players
WHERE full_name LIKE '%James%';

-- 6. List each state that has at least one team — each state only
--    once, sorted alphabetically.
SELECT DISTINCT state 
FROM teams 
ORDER BY state ASC;
-- 7. Show every team that is NOT in California. Use NOT.
-- Query 5 returns more than just LeBron. Who else shows up, and why?
SELECT full_name
FROM teams
WHERE NOT (state = 'california');

-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Query 5 returns more than just LeBron. Who else shows up, and why?

-- Becuase I am querying for any name that is like "JAMES" and there is more than one player with that name. 

-- Query 6 returns fewer rows than there are teams. Why?

-- DISTINCT removes duplicates.

-- Query 7 could also be written with <> instead of NOT. Why do they
-- give the same result?
--Both check for inequality. NOT state = 'CA' takes the TRUE/FALSE result of state = 'CA' and flips it while state <> 'CA' tests directly that the state is "not equal to" California.

-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's
-- =====================================================================

-- Boolean logic: The system withch is say "TRUE or "FALSE"


-- Wildcard: looks for a nickname


-- : It is no empty string 