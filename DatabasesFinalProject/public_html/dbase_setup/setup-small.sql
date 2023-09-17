-- setup-small.sql

-- In case we've run this script before, remove old tables before we re-create them
DROP TABLE IF EXISTS Airline;
DROP TABLE IF EXISTS Airport;
DROP TABLE IF EXISTS ArrivalsAirport;
DROP TABLE IF EXISTS ArrivalsAirline;
DROP TABLE IF EXISTS DeparturesAirline;
DROP TABLE IF EXISTS DeparturesAirport;
DROP TABLE IF EXISTS RevPassMiles;
DROP TABLE IF EXISTS OpRev;
DROP TABLE IF EXISTS NumPass;
DROP TABLE IF EXISTS TotEnplanedPass;
DROP TABLE IF EXISTS DomEnplanedPass;
DROP TABLE IF EXISTS IntEnplanedPass;

-- Describe schema for airline
CREATE TABLE Airline (
  airlineName    VARCHAR(40),
  airlineCode  VARCHAR(10),
  PRIMARY KEY(airlineCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/airline-small.txt'
INTO TABLE Airline
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Describe schema for airport
CREATE TABLE Airport (
  airportCode  VARCHAR(3),
  nearestCity   VARCHAR(50),
  stateName     VARCHAR(2),
  airportName    VARCHAR(100),
  PRIMARY KEY(airportCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/airport-small.txt'
INTO TABLE Airport
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Describe schema for ArrivalsAirport
CREATE TABLE ArrivalsAirport (
  airportCode  VARCHAR(3),
  cityName VARCHAR(50),
  stateName VARCHAR(2),
  airportName VARCHAR(100),
  numArrivals    INTEGER(10),
  arrivalsPerctOnTime   DECIMAL(4, 2),
  totMinDelay      INTEGER(40),
  arrivalCancellations     INTEGER(40),
  diverted      INTEGER(40),
  dated    VARCHAR(20), 
  PRIMARY KEY(airportCode, dated, numArrivals)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/arrivals_airport-small.txt'
INTO TABLE ArrivalsAirport
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Describe schema for ArrivalsAirline
CREATE TABLE ArrivalsAirline (
  airlineCode  VARCHAR(3),
  city  VARCHAR(50), 
  stateName     VARCHAR(2),
  airportName   VARCHAR(100),
  airlineName   VARCHAR(100),
  numArrivals    INTEGER(40),
  arrivalsPerctOnTime   DECIMAL(5, 2),
  arrivalNumDelays      INTEGER(40),
  arrivalCancellations     INTEGER(40),
  diverted      INTEGER(40), 
  dated    VARCHAR(20), 
  PRIMARY KEY(airlineCode, dated, numArrivals)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/arrivals_airline-small.txt'
INTO TABLE ArrivalsAirline
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Describe schema for DeparturesAirport
CREATE TABLE DeparturesAirport (
  airportCode  VARCHAR(3),
  city  VARCHAR(50),
  stateName     VARCHAR(2),
  airportName   VARCHAR(100),
  numDepartures    INTEGER(40),
  departPerctOnTime   DECIMAL(4, 2),
  departNumDelays      INTEGER(40),
  departCancellations     INTEGER(40),
  diverted      INTEGER(40),
  dated    VARCHAR(20),
  PRIMARY KEY(airportCode, dated, numDepartures)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/departures_airport-small.txt'
INTO TABLE DeparturesAirport
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Describe schema for DeparturesAirline
CREATE TABLE DeparturesAirline (
  airlineCode  VARCHAR(3),
  city  VARCHAR(50),
  stateName     VARCHAR(2),
  airportName   VARCHAR(100),
  airlineName   VARCHAR(40),
  numDepartures    INTEGER(40),
  departPerctOnTime   DECIMAL(5, 2),
  departNumDelays      INTEGER(40),
  departCancellations     INTEGER(40),
  dated    VARCHAR(20),
  PRIMARY KEY(airlineCode, dated, numDepartures)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/departures_airline-small.txt'
INTO TABLE DeparturesAirline
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Describe schema for RevPassMiles
CREATE TABLE RevPassMiles (
  rank     INTEGER(10),
  airlineName   VARCHAR(100), 
  airlineCode  VARCHAR(3),
  revMiles   INTEGER(50),
  perctTotal   DECIMAL(3, 1),
  yr    INTEGER(4),
  PRIMARY KEY(airlineCode, yr)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/rev_pass_miles-small.txt'
INTO TABLE RevPassMiles
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Describe schema for OpRev
CREATE TABLE OpRev (
  rank     INTEGER(10),
  airlineName   VARCHAR(100), 
  airlineCode  VARCHAR(3),
  totalOpRev  INTEGER(40),
  perctTotal   DECIMAL(3, 1),
  yr    INTEGER(4), 
  PRIMARY KEY(airlineCode, yr)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/op_rev-small.txt'
INTO TABLE OpRev
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Describe schema for NumPass
CREATE TABLE NumPass (
  rank     INTEGER(10),
  airlineName   VARCHAR(100), 
  airlineCode  VARCHAR(3),
  numPass  INTEGER(40),
  perctTotal   DECIMAL(3, 1),
  yr    INTEGER(4),
  PRIMARY KEY(airlineCode, yr)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/num_pass-small.txt'
INTO TABLE NumPass
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Describe schema for TotEnplanedPass
CREATE TABLE TotEnplanedPass (
  rank     INTEGER(10),
  airportCode  VARCHAR(3),
  city   VARCHAR(100),
  totEnplaned  DECIMAL(6, 3),
  rankPrev      INTEGER(40),
  totPrev       DECIMAL(6, 3),       
  changeFromPrev   DECIMAL(2, 1), 
  yr    INTEGER(4),
  PRIMARY KEY(airportCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/tot_enplaned_pass-small.txt'
INTO TABLE TotEnplanedPass
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Describe schema for DomEnplanedPass
CREATE TABLE DomEnplanedPass (
  rank     INTEGER(10),
  airportCode  VARCHAR(3),
  city   VARCHAR(100),
  domEnplaned  DECIMAL(6, 3),
  rankPrev      INTEGER(40),
  domPrev       DECIMAL(6, 3),       
  changeFromPrev   DECIMAL(2, 1), 
  yr    INTEGER(4),
  PRIMARY KEY(airportCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/dom_enplaned_pass-small.txt'
INTO TABLE DomEnplanedPass
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

-- Describe schema for IntEnplanedPass
CREATE TABLE IntEnplanedPass (
  rank     INTEGER(10),
  airportCode  VARCHAR(3),
  city   VARCHAR(100),
  intEnplaned  DECIMAL(6, 1),
  rankPrev      INTEGER(40),
  intPrev       DECIMAL(6, 1),       
  changeFromPrev   DECIMAL(2, 1), 
  yr    INTEGER(4),
  PRIMARY KEY(airportCode)
);

LOAD DATA LOCAL INFILE './public_html/dbase_setup/int_enplaned_pass-small.txt'
INTO TABLE IntEnplanedPass
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';





