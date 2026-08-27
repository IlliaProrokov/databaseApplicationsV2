SELECT full_name
FROM teams;

SELECT full_name, city, state
FROM teams;   

SELECT full_name, city 
FROM teams 
WHERE state = 'Ohio';SELECT full_name, year_founded
FROM teams
WHERE year_founded < 1950

SELECT full_name, year_founded
FROM teams
WHERE year_founded  
ORDER BY year_founded; 

SELECT full_name, year_founded
FROM teams
WHERE  year_founded
ORDER BY year_founded DECS
LIMIT 5;