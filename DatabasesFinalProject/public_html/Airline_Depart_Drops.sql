DROP PROCEDURE IF EXISTS airlineDropDepartures;

DELIMITER //


CREATE PROCEDURE airlineDropDepartures(IN sYear VARCHAR(4), IN eYear VARCHAR(4))
BEGIN
SELECT Airline.airlineName, D.airlineCode, SUM(N.totalDepartures - D.numDepartures) AS dropInTotalDepartures
       FROM Airline, DeparturesAirline AS D join (SELECT D.airlineCode, SUM(D.numDepartures) AS totalDepartures
               FROM DeparturesAirline AS D
               WHERE D.year = eYear
               GROUP BY D.airlineCode) AS N ON (D.airlineCode = N.airlineCode)
       WHERE D.year = sYear AND Airline.airlineCode = D.airlineCode
       GROUP BY D.airlineCode
       ORDER BY dropInTotalDepartures DESC
       LIMIT 5;
END; //

DELIMITER ;

