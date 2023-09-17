--INSERTIONS
-- FOREIGN KEY ArrivalAirport(airportCode) REFERENCES airport(airportCode)
DROP PROCEDURE IF EXISTS insert_airport;

DELIMITER //
CREATE PROCEDURE insert_airport(

nearestCity  varchar(50),  stateName varchar(2), airportCode varchar(3),  airportName varchar(100)
)  

BEGIN
    INSERT INTO Airport    VALUES(nearestCity, stateName, airportCode, airportName);
END;
//
DELIMITER ;
