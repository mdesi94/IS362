#How many planes have listed speeds? 1. 23
SELECT COUNT(speed) FROM planes WHERE speed is not NULL;

#what is the minimun/maximum listed speed? min=90, max=432
SELECT MIN(speed) FROM planes;
SELECT MAX(speed) FROM planes;

#what is the total distance flown by all planes in jan 2013? 2. 27188805
SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance' FROM flights
WHERE year = 2013 AND month = 1;

#total distance flown by all planes in jan 2013 where tailnum is missing: 	NULL			
SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance' FROM flights
WHERE (year = 2013 AND month = 1)
AND tailnum IS NULL;

#what is the total distance flown for all planes on July 5, 2013 grouped by aircraft mfr? (first using INNER JOIN):755,337
SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance', manufacturer AS 'Manufacturer'
FROM flights
INNER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
GROUP BY manufacturer;

#what is the total distance flown for all planes on July 5, 2013 grouped by aircraft mfr? (using LEFT JOIN):883,008 
#(left join accounted for all the manufacturers with NULL values, so there is higher distance.)
SELECT COUNT(*) AS 'Number of Flights', SUM(distance) AS 'Total Distance', manufacturer AS 'Manufacturer'
FROM flights
LEFT OUTER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE (flights.year = 2013 AND flights.month = 7 AND flights.day = 5)
GROUP BY manufacturer;

#write your own question that joins info from at least 3 tables:
