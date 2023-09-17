DROP PROCEDURE IF EXISTS finalRatio;

DELIMITER //


CREATE PROCEDURE finalRatio(IN fCode VARCHAR(4), IN sCode VARCHAR(4), IN yr VARCHAR(4))
BEGIN
	SELECT E.year, E.month, E.airportCode AS FirstAirport, E.Eratio AS FirstAirportRatio, L.airportCode AS SecondAirport, L.Lratio AS SecondAirportRatio
	FROM (SELECT A.year, A.month, A.airportCode, A.arrivalCancellations,D.departCancellations, (A.arrivalCancellations/D.departCancellations) AS Eratio
       FROM ArrivalAirport AS A, (
           SELECT D.departCancellations, D.airportCode, D.year
           FROM DepartureAirport AS D
           WHERE  D.year = yr AND (D.airportCode = fCode)) AS D
       WHERE A.airportCode = D.airportCode AND A.year = D.year
       GROUP BY A.month) AS E JOIN (SELECT A.year, A.month, A.airportCode, A.arrivalCancellations,D.departCancellations, (A.arrivalCancellations/D.departCancellations) AS Lratio
       FROM ArrivalAirport AS A, (
           SELECT D.departCancellations, D.airportCode, D.year
           FROM DepartureAirport AS D
           WHERE  D.year = yr AND (D.airportCode = sCode)) AS D
       WHERE A.airportCode = D.airportCode AND A.year = D.year
       GROUP BY A.month) AS L
WHERE E.month = L.month;


END; //

DELIMITER ;


