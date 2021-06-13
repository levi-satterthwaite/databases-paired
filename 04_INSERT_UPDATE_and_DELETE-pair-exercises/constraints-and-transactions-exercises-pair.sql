-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)
insert into city (name, district, countrycode, population)
values ('Smallville', 'Kansas', 'USA', 45001);

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.
insert into countrylanguage (countrycode, language, percentage, isofficial)
values ('USA', 'Kryptonese', 0.0001, false);


-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.
update countrylanguage
set language = 'Krypto-babble'
where language = 'Kryptonese';

-- 4. Set the US captial to Smallville, Kansas in the country table.
update country
set capital = 4080
where code = 'USA';

-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
delete
from city
where name = 'Smallville';
--Because Smallville is being used as the foriegn key in the country table

-- 6. Return the US captial to Washington.
update country
set capital = 3813
where code = 'USA';

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)
delete
from city
where name = 'Smallville';
--Smallville is no longer being used as the foriegn key in the country table

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)
update countrylanguage
set isofficial =  not isofficial 
where countrycode in ((select code
from country
where indepyear > 1800 and indepyear < 1972))
and isofficial is not null;




-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4079 rows affected)
update city
set population = population / 1000
where population > 0;
select population
from city;

-- 10. Assuming a country's surfacearea is expressed in square miles, convert it to 
-- square meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)
update country
set surfacearea = surfacearea * 2.59e+6
where code in ((select countrycode from countrylanguage where language = 'French' and percentage > 20));
select surfacearea from country where code in ((select countrycode from countrylanguage where language = 'French' and percentage > 20));
