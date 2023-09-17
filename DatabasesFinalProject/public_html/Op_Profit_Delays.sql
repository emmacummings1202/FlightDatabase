DROP PROCEDURE IF EXISTS highDelay;

DELIMITER //


CREATE PROCEDURE highDelay(IN year VARCHAR(4))
BEGIN
	SELECT R.year, R.airlineName, R.opRev, H.TotalDelay
	FROM AirlineRanking AS R, (SELECT A.airlineName, A.airlineCode, SUM((A.arrivalWeatherDelay + A.arrivalSecurityDelay) + (D.departWeatherDelay + D.departSecurityDelay)) AS TotalDelay
		FROM ArrivalAirline AS A, DeparturesAirline AS D
		WHERE A.year = D.year
		GROUP BY A.airlineCode
		ORDER BY TotalDelay DESC) AS H
	WHERE R.airlineCode = H.airlineCode AND R.opRev != 0 AND R.year = year
	GROUP BY R.airlineName
	ORDER BY R.opRev DESC;
END; //
