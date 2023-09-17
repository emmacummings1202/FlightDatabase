DROP PROCEDURE IF EXISTS percentOnTime;

DELIMITER //


CREATE PROCEDURE percentOnTime(IN yr VARCHAR(4))
BEGIN
	Select A.airportCode, A.arrivalsPerctOnTime, A.year, R.airportRank
	From ArrivalAirport AS A, (
            Select *
            From AirportRanking
            Where year = yr AND (airportrank = 1 OR airportRank = 2 OR airportRank =3)) AS R
    Where A.airportCode = R.airportCode   AND R.year = A.year
    Group by A.airportCode;
END; //
