DROP PROCEDURE IF EXISTS high_cancel;

DELIMITER //


CREATE PROCEDURE high_cancel(IN state VARCHAR(2), IN yr VARCHAR(4))
BEGIN
	SELECT P.stateName, SUM(A.arrivalCancellations) as cancellations
FROM ArrivalAirport AS A JOIN (SELECT I.stateName, I.airportName, I.airportCode
FROM Airport AS I NATURAL JOIN ArrivalAirport AS A
WHERE I.stateName = state and A.airportCode = I.airportCode
GROUP BY I.airportCode ) AS P
WHERE A.year = yr and A.airportCode = P.airportCode;

END; //

DELIMITER ;
