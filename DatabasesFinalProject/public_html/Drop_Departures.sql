DROP PROCEDURE IF EXISTS dropDepartures;

DELIMITER //


CREATE PROCEDURE dropDepartures(IN sYear VARCHAR(4), IN eYear VARCHAR(4))
BEGIN
        SELECT Airport.airportName, D.airportCode, SUM(N.totalDepartures - D.numDepartures) AS dropInTotalDepartures, D.numDepartures, N.totalDepartures
        FROM Airport, DepartureAirport AS D JOIN (SELECT D.airportCode, SUM(D.numDepartures) AS totalDepartures
                FROM DepartureAirport AS D
                WHERE D.year = eYear
                GROUP BY D.airportCode) AS N ON (D.airportCode = N.airportCode)
        WHERE D.year = sYear AND Airport.airportCode = D.airportCode
        GROUP BY D.airportCode
        ORDER BY dropInTotalDepartures DESC
        LIMIT 5;
END; //

DELIMITER ;
