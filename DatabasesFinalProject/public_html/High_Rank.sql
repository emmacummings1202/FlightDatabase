DROP PROCEDURE IF EXISTS RankNumPass;

DELIMITER //


CREATE PROCEDURE RankNumPass()
BEGIN
	SELECT A.airportName, R.airportCode, R.airportRank, COUNT(*) AS NumTimesRanked
	FROM Airport AS A, AirportRanking AS R
	WHERE A.airportCode = R.airportCode AND R.airportRank != 0 AND R.airportRank = 1
	GROUP BY R.airportRank
	ORDER BY R.airportRank ASC;
END; //
