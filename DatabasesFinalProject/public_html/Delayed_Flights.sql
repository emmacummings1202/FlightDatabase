DROP PROCEDURE IF EXISTS departDelay;

DELIMITER //


CREATE PROCEDURE departDelay(IN airport VARCHAR(4))
BEGIN
Select year, month, depart15MinDelay, airportCode
	From DepartureAirport
	where airportCode = airport
	Order By depart15MinDelay DESC
	LIMIT 10;
END; //

DELIMITER ;

