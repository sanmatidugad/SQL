-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT DISTINCT CITY.Name FROM COUNTRY, CITY WHERE CITY.CountryCode = COUNTRY.Code AND COUNTRY.Continent = 'Africa'
