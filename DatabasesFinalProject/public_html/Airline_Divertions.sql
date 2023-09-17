DROP PROCEDURE IF EXISTS airlineCancels;

DELIMITER //


CREATE PROCEDURE airlineCancels(IN code VARCHAR(2))
BEGIN

Select airlineName, airlineCode, year, month, arrivalCancellations  
	From ArrivalAirline  
	Where airlineCode LIKE code  
	Order By arrivalCancellations DESC 
	LIMIT 5;

END; //

DELIMITER ;
