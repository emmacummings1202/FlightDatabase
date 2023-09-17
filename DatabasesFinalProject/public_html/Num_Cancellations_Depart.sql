DROP PROCEDURE IF EXISTS high_cancel_depart;

DELIMITER //


CREATE PROCEDURE high_cancel_depart(IN state VARCHAR(2), IN yr VARCHAR(4))
BEGIN
        SELECT P.stateName, SUM(D.departCancellations) as cancellations
FROM DepartureAirport AS D JOIN (SELECT I.stateName, I.airportName, I.airportCode
FROM Airport AS I NATURAL JOIN DepartureAirport AS D
WHERE I.stateName = state and D.airportCode = I.airportCode
GROUP BY I.airportCode ) AS P
WHERE D.year = yr and D.airportCode = P.airportCode;

END; //

DELIMITER ;

