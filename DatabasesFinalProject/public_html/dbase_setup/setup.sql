-- setup-small.sql

-- In case we've run this script before, remove old tables before we re-create them
DROP TABLE IF EXISTS ArrivalAirport;
DROP TABLE IF EXISTS ArrivalAirline;
DROP TABLE IF EXISTS DeparturesAirline;
DROP TABLE IF EXISTS DepartureAirport;
DROP TABLE IF EXISTS AirlineRanking;
DROP TABLE IF EXISTS AirportRanking;
DROP TABLE IF EXISTS Airline;
DROP TABLE IF EXISTS Airport;


-- Describe schema for airline
CREATE TABLE Airline (
  airlineName    VARCHAR(100),
  airlineCode  VARCHAR(3),
  PRIMARY KEY(airlineCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/airline.txt'
INTO TABLE Airline
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

-- Describe schema for airport
CREATE TABLE Airport (
  nearestCity   VARCHAR(50),
  stateName     VARCHAR(2),
  airportCode  VARCHAR(3),
  airportName    VARCHAR(100),
  PRIMARY KEY(airportCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/airport.txt'
INTO TABLE Airport
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

-- Describe schema for ArrivalAirport
CREATE TABLE ArrivalAirport (
  year      INTEGER(4),
  month     INTEGER(2),
  airportCode  VARCHAR(3),
  diverted      INTEGER(40),
  arrivalCancellations     INTEGER(40),
  arrivalWeatherDelay   INTEGER(40),
  arrivalSecurityDelay   INTEGER(40),
  numArrivals    INTEGER(10),
  arrivalsPerctOnTime   DECIMAL(5, 2),
  PRIMARY KEY(airportCode, year, month),
  FOREIGN KEY (airportCode) REFERENCES Airport(airportCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/Airport_Arrival.txt'
INTO TABLE ArrivalAirport
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

-- Describe schema for ArrivalsAirline
CREATE TABLE ArrivalAirline (
  year INTEGER(4),
  month INTEGER(2), 
  airlineName   VARCHAR(100),
  airlineCode  VARCHAR(3),
  diverted      INTEGER(40), 
  arrivalWeatherDelay   INTEGER(40),
  arrivalCancellations     INTEGER(40),
  arrivalSecurityDelay   INTEGER(40),
  numArrivals    INTEGER(40),
  PRIMARY KEY(airlineCode, year, month),
  FOREIGN KEY (airlineCode) REFERENCES Airline(airlineCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/Arrival_Airline.txt'
INTO TABLE ArrivalAirline
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

-- Describe schema for DeparturesAirport
CREATE TABLE DepartureAirport (
  year INTEGER(4),
  month INTEGER(2), 
  airportCode  VARCHAR(3),
  numDepartures    INTEGER(40),
  departCancellations     INTEGER(40),
  departWeatherDelay   INTEGER(40),
  departSecurityDelay   INTEGER(40),
  departPerctOnTime   DECIMAL(4, 4),
  depart15MinDelay  INTEGER(40),
  PRIMARY KEY(airportCode, year, month),
  FOREIGN KEY (airportCode) REFERENCES Airport(airportCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/Depart_Airport.txt'
INTO TABLE DepartureAirport
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

-- Describe schema for DeparturesAirline
CREATE TABLE DeparturesAirline (
  year INTEGER(4),
  month INTEGER(2), 
  airlineName   VARCHAR(40),
  airlineCode  VARCHAR(3),
  departPerctOnTime   DECIMAL(5, 2),
  departWeatherDelay   INTEGER(40),
  departSecurityDelay   INTEGER(40),
  departCancellations     INTEGER(40),
  numDepartures    INTEGER(40),
  depart15MinDelay  INTEGER(40),
  PRIMARY KEY(airlineCode, year, month),
  FOREIGN KEY (airlineCOde) REFERENCES Airline(airlineCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/Depart_Airline.txt'
INTO TABLE DeparturesAirline
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

-- Describe schema for AirlineRankings
CREATE TABLE AirlineRanking(
    airlineName VARCHAR(40),
    airlineCode VARCHAR(3),
    rpmRank INTEGER(3),
    RevPassMiles   INTEGER(40),
    passRank    INTEGER(3),
    numPass INTEGER(40),
    opRevRank   INTEGER(3),
    opRev   INTEGER(40),
    year   INTEGER(4),
    PRIMARY KEY(year, airlineCode),
    FOREIGN KEY (airlineCOde) REFERENCES Airline(airlineCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/airline_ranking.txt'
INTO TABLE AirlineRanking
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';

--Describe schema for AirportRankins
CREATE TABLE AirportRanking(
    airportCode VARCHAR(3),
    airportRank INTEGER(40),
    numPass DECIMAL(5, 3),
    year    INTEGER(40),
    PRIMARY KEY(year, airportCode),
    FOREIGN KEY (airportCode) REFERENCES Airport(airportCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/airport_ranking.txt'
INTO TABLE AirportRanking
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n';





