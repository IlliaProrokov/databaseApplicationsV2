-- =====================================================================
-- Unit 2d — Counting and Summarizing
-- Database Applications Development · MCCC
--
-- Database: nba_5seasons.db · Tables: teams, players, team_game_stats
--
-- Rename this file with your last name before you start.
--
-- Read unit2d_Walkthrough.md first. Stuck on syntax? See unit2_StudyGuide.md.
-- =====================================================================


-- 1. How many teams are in the database?
SELECT COUNT(*) AS team_count 
FROM teams

-- 2. How many players?
SELECT COUNT (*) players
FROM players

-- 3. What is the earliest founding year of any team?
SELECT MIN(year_founded) AS oldest_team 
FROM teams

-- 4. What is the most recent?
SELECT MAX(year_founded) AS newest_team
FROM teams

-- 5. What is the average founding year, rounded to a whole number?
SELECT round(AVG(year_founded))
FROM teams
-- 6. What is the total number of points scored across every game in
--    the database?
SELECT SUM(pts) 
FROM team_game_stats;
-- =====================================================================
-- CHECK YOUR WORK
-- =====================================================================

-- Query 6 reads 10,842 rows and gives you one number. What is it? 1,215,920


-- COUNT(*) counts rows. What does COUNT(birth_year) count instead? It counts the number of non-NULL values in the birth_year column 


-- =====================================================================
-- VOCABULARY — your words, not the reference sheet's 
-- =====================================================================

-- Aggregate function:  that takes multiple rows of data and compresses them into a single summary value.

