DROP PROCEDURE IF EXISTS dropArrivalsAirlines;

DELIMITER //


CREATE PROCEDURE dropArrivalsAirlines(IN sYear VARCHAR(4), IN eYear VARCHAR(4))
BEGIN
        
SELECT Airline.airlineName, A.airlineCode, N.totalArrivals, A.numArrivals, SUM(N.totalArrivals - A.numArrivals) AS dropInTotalArrivals
       FROM Airline, ArrivalAirline AS A JOIN (SELECT A.airlineCode, SUM(A.numArrivals) AS totalArrivals
               FROM ArrivalAirline AS A
               WHERE A.year = eYear
               GROUP BY A.airlineCode) AS N  ON (A.airlineCode = N.airlineCode)
       WHERE A.year = sYear AND Airline.airlineCode = A.airlineCode
         GROUP BY A.airlineCode
       ORDER BY dropInTotalArrivals DESC
       LIMIT 5;


END; //

DELIMITER ;

