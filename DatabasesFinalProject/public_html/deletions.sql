DROP PROCEDURE IF EXISTS delete_airport_arrival;

DELIMITER //
CREATE PROCEDURE delete_airport_arrival( i_airportCode  VARCHAR(3))

BEGIN
    DELETE FROM ArrivalAirport    
    WHERE i_airportCode = airportCode;
END
//
DELIMITER ;
