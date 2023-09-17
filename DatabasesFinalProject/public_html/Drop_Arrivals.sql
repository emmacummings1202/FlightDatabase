DROP PROCEDURE IF EXISTS dropArrivals;

DELIMITER //


CREATE PROCEDURE dropArrivals(IN sYear VARCHAR(4), IN eYear VARCHAR(4))
BEGIN
        SELECT Airport.airportName, A.airportCode, SUM(N.totalArrivals - A.numArrivals) AS dropInTotalArrivals
	FROM Airport JOIN
	     ArrivalAirport AS A ON (Airport.airportCode = A.airportCode)
	     JOIN (SELECT A.airportCode, SUM(A.numArrivals) AS totalArrivals
		FROM ArrivalAirport AS A
		WHERE A.year = eYear
		GROUP BY A.airportCode) AS N ON (A.airportCode = N.airportCode)
	WHERE A.year = sYear AND Airport.airportCode = A.airportCode
	GROUP BY A.airportCode
	ORDER BY dropInTotalArrivals DESC
	LIMIT 5;
END; //

DELIMITER ; 
