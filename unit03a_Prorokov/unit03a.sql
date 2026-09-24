SELECT count (*)
FROM games_flat;


SELECT COUNT(*) FROM games_flat WHERE home_city = 'Chicago';
SELECT COUNT(*) FROM games_flat WHERE away_city = 'Chicago';

SELECT game_id, home_team, away_team, home_city, away_city, home_state, away_state
FROM games_flat
WHERE home_team = 'WRONG_VALUE' 
   OR away_team = 'WRONG_VALUE'
   OR home_city = 'WRONG_VALUE'
   OR away_city = 'WRONG_VALUE'
   OR home_state = 'WRONG_VALUE'
   OR away_state = 'WRONG_VALUE';
   
SELECT DISTINCT home_team 
FROM games_flat
ORDER BY home_team;

SELECT game_id, game_date, home_team, away_team
FROM games_flat
WHERE home_team = 'Clevland Cavaliers';