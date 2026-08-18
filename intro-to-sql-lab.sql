-- THE MOONLIT PEARL CASE ♠️

-- Kaito Kid has stolen the Moonlit Pearl. Detective Conan believes every clue
-- can be solved with the conan_case database. Write one query beneath each clue.
-- Each Clue will help you in solving the next Clue
SELECT * FROM cities;
SELECT * FROM countries;
SELECT * FROM countrylanguages;


-- Clue #1
-- Airport cameras first spotted Kid in the middle east region
-- He is rumored to be staying in the least populated country in the middle east
-- Sort the matching countries by population and return only the first result.
SELECT * FROM countries
WHERE region ILIKE 'middle east'
ORDER BY population LIMIT 1;


-- Clue #2
-- Kaito kid is has been spotted in the capital of the country from Clue #1
-- The countries table contains a "capital" column and this column corresponds with the id in the cities table
-- find the capital of the country based on the country you got from the last clue
SELECT * FROM countries
JOIN cities ON countries.capital = cities.id
WHERE capital = 2973;


-- Clue #3
-- The message says: "My next stop is another GCC country. Arabic is official
-- there, and its government form is a Emirate Federation. Join countries with
-- countrylanguages to identify the country.
SELECT * FROM countrylanguages
JOIN countries ON countrylanguages.countrycode = countries.code
WHERE region ILIKE 'middle east' AND governmentform ILIKE 'Emirate Federation' AND language ILIKE 'Arabic';


-- Clue #4
-- There are 5 cities from the country in Clue #3 appear in the case database.
-- We recieve an anonymous message in our agency that he is staying in a city that starts with the letters "Aj"
-- Find the city that matches this description
SELECT * FROM cities
JOIN countries ON countries.code = cities.countrycode
WHERE governmentform ILIKE 'Emirate Federation' AND cities.name ILIKE 'Aj%';
 

-- Clue #5
-- The city from Clue #4 was a decoy. A damaged luggage tag begins with "Sh",
-- and the arrival country was in the Middle East. Join countries and cities,
-- then use ILIKE to find the matching city and its country.
SELECT * FROM cities
JOIN countries ON countries.code = cities.countrycode
WHERE governmentform ILIKE 'Emirate Federation' AND cities.name ILIKE 'Sh%';


-- Clue #6
-- A taxi driver in the country from Clue #5 says Kid is heading to the capital.
-- Find the capital of this country.
SELECT * FROM countries
JOIN cities ON countries.capital = cities.id
WHERE region ILIKE 'middle east' AND governmentform ILIKE 'Emirate Federation';


-- Clue #7
-- At the capital, Conan finds one final note:
--
--   "Your database counted 148005 people before my arrival.
--    Add one phantom passenger and search the new total.
--    Reach that city before midnight, and the pearl is yours."
--
-- Find the city with this population and you will find the Kid
SELECT * FROM cities
WHERE population = 148005 + 1;


-- FINAL QUESTION
-- In which city should Conan wait for Kaito Kid?
-- Hitachinaka - Japan 🎌:jp: 
-- Conan says: (he never left 🕵🏻‍♂️)