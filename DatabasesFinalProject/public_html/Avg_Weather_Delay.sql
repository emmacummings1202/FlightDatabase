DROP PROCEDURE IF EXISTS AvgWeatherDelay;

DELIMITER //


CREATE PROCEDURE AvgWeatherDelay(IN sYear VARCHAR(4), IN eYear VARCHAR(4))
BEGIN
	SELECT AVG(D.departWeatherDelay + A.arrivalWeatherDelay) AS AverageWeatherDelay
        FROM ArrivalAirline AS A JOIN DeparturesAirline AS D
        WHERE A.year = D.year AND A.year BETWEEN sYear AND eYear;
END; //
