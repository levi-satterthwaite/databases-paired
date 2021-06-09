-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
-- (36 rows)
SELECT city.name, cr.name, city.population 
FROM city 
JOIN country cr ON cr.code = city.countrycode
WHERE city.population > 1000000
AND cr.continent = 'Europe';

-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
-- (2 rows)
SELECT city.name, cr.name, city.population 
FROM city 
JOIN country cr ON cr.code = city.countrycode
JOIN countrylanguage cl ON cl.countrycode = cr.code
WHERE city.population > 1000000
AND cl.language = 'French'
AND cl.isofficial = 'TRUE';

-- 3. The name of the countries and continents where the language Javanese is spoken
-- (1 row)
SELECT cr.name, cr.continent
FROM country cr
JOIN countrylanguage cl ON cl.countrycode = cr.code 
WHERE cl.language = 'Javanese';

-- 4. The names of all of the countries in Africa that speak French as an official language
-- (5 row)
SELECT cr.name
FROM country cr
JOIN countrylanguage cl ON cl.countrycode = cr.code
WHERE cl.language = 'French'
AND cl.isofficial = 'TRUE'
AND cr.continent = 'Africa';

-- 5. The average city population of cities in Europe
-- (average city population in Europe: 287,684)
SELECT AVG(city.population)
FROM city 
JOIN country cr ON cr.code = city.countrycode
WHERE cr.continent = 'Europe';

-- 6. The average city population of cities in Asia
-- (average city population in Asia: 395,019)
SELECT AVG(city.population)
FROM city 
JOIN country cr ON cr.code = city.countrycode
WHERE cr.continent = 'Asia';

-- 7. The number of cities in countries where English is an official language
-- (number of cities where English is official language: 523)
SELECT COUNT(*)
FROM city
JOIN country cr ON cr.code = city.countrycode
JOIN countrylanguage cl ON cl.countrycode = cr.code
WHERE cl.language = 'English'
AND cl.isofficial = 'TRUE';

-- 8. The average population of cities in countries where the official language is English
-- (average population of cities where English is official language: 285,809)
SELECT AVG(city.population)
FROM city
JOIN country cr ON cr.code = city.countrycode
JOIN countrylanguage cl ON cl.countrycode = cr.code
WHERE cl.language = 'English'
AND cl.isofficial = 'TRUE';

-- 9. The names of all of the continents and the population of the continent’s largest city
-- (6 rows, largest population for North America: 8,591,309)
SELECT MAX(city.population), cr.continent
FROM city
JOIN country cr ON cr.code = city.countrycode
GROUP BY cr.continent
ORDER BY cr.continent;

-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
-- (29 rows)
SELECT city.name, cl.language
FROM city
JOIN country cr ON cr.code = city.countrycode
JOIN countrylanguage cl ON cl.countrycode = cr.code
WHERE city.population > 1000000
AND cr.continent = 'South America'
AND cl.isofficial = 'TRUE';
