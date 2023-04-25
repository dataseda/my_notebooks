/* Problem 1:Find the total number of crimes recorded in the CRIME table */
SELECT COUNT('ID') FROM CRIME_DATA;



/* Problem 2: List community areas with per capita income less than 11000 */

SELECT  COMMUNITY_AREA_NAME FROM CENSUS_DATA
WHERE PER_CAPITA_INCOME < 11000



/* Problem 3: List all case numbers for crimes involving minors?
 First i will check crime types with distinct command, to ensure that if there is any non-crime data*/

SELECT DISTINCT (PRIMARY_TYPE) FROM CRIME_DATA;

/* There are 3 rows for non criminal cases, i will exclude those */

SELECT CASE_NUMBER, DESCRIPTION FROM CRIME_DATA
WHERE PRIMARY_TYPE NOT LIKE 'NON%'
GROUP BY CASE_NUMBER, DESCRIPTION;


/* Problem 4: List all kidnapping crimes involving a child?(children are not considered minors for the purposes of crime analysis) */

SELECT DESCRIPTION, PRIMARY_TYPE FROM CRIME_DATA
WHERE PRIMARY_TYPE LIKE 'KID%'
GROUP BY DESCRIPTION, PRIMARY_TYPE;



/*Problem 5: What kind of crimes were recorded at schools?*/

SELECT LOCATION_DESCRIPTION, PRIMARY_TYPE FROM CRIME_DATA
WHERE LOCATION_DESCRIPTION LIKE 'SCH%'
GROUP BY LOCATION_DESCRIPTION, PRIMARY_TYPE;



/* Problem 6: List the average safety score for all types of schools */


SELECT ELEMENTARY__MIDDLE__OR_HIGH_SCHOOL, AVG(SAFETY_SCORE) AS AVG_SAFETY_SCORE
FROM SCHOOL_DATA
GROUP BY ELEMENTARY__MIDDLE__OR_HIGH_SCHOOL
ORDER BY ELEMENTARY__MIDDLE__OR_HIGH_SCHOOL ASC, AVG_SAFETY_SCORE;


/*Problem 7: List 5 community areas with highest % of households below poverty line*/

SELECT COMMUNITY_AREA_NAME, PERCENT_HOUSEHOLDS_BELOW_POVERTY FROM CENSUS_DATA
ORDER BY PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC; 



/*Problem 8: Which community area(number) is most crime prone?*/

SELECT COMMUNITY_AREA_NUMBER, COUNT(*) AS CRIME_COUNT
FROM CRIME_DATA
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY CRIME_COUNT DESC;

/*Problem 9: Use a sub-query to find the name of the community area with highest hardship index*/

SELECT COMMUNITY_AREA_NAME
FROM CENSUS_DATA
WHERE HARDSHIP_INDEX =
       (SELECT MAX(HARDSHIP_INDEX) FROM CENSUS_DATA);
       
       
/*Problem 10: Use a sub-query to determine the Community Area Name with most number of crimes?*/



SELECT COMMUNITY_AREA_NUMBER, COUNT(*) AS CRIME_COUNT
FROM CRIME_DATA
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY CRIME_COUNT DESC;

SELECT COMMUNITY_AREA_NAME FROM CENSUS_DATA
WHERE COMMUNITY_AREA_NUMBER = 25

/*Problem 10: Use a sub-query to determine the Community Area Name with most number of crimes?*/
SELECT COMMUNITY_AREA_NAME
FROM CENSUS_DATA
WHERE COMMUNITY_AREA_NUMBER = 
    (SELECT COMMUNITY_AREA_NUMBER
     FROM CRIME_DATA
     GROUP BY COMMUNITY_AREA_NUMBER
     ORDER BY COUNT(*) DESC
     LIMIT 1);







