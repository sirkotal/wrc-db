PRAGMA foreign_keys = on;
BEGIN TRANSACTION;

-- Table: Rally
DROP TABLE IF EXISTS Rally;

CREATE TABLE Rally (
    idRally      INTEGER,
    startDate    DATE CONSTRAINT unique_startDate UNIQUE CONSTRAINT startDate_nn NOT NULL,
    endDate      DATE CONSTRAINT unique_endDate UNIQUE CONSTRAINT endDate_nn NOT NULL,
    rallyName    VARCHAR(1000) CONSTRAINT unique_rallyName UNIQUE CONSTRAINT rallyName_nn NOT NULL,
    hq           VARCHAR(1000) CONSTRAINT unique_hq UNIQUE CONSTRAINT hq_nn NOT NULL,
    surface      VARCHAR(100) CONSTRAINT surface_nn NOT NULL,
    stages       INTEGER CONSTRAINT stages_nn NOT NULL,
    distance     FLOAT CONSTRAINT distance_nn NOT NULL,
    PRIMARY KEY(idRally, rallyName),
    CONSTRAINT date_match CHECK ( (startDate <= endDate))
);

-- Table: Stage
DROP TABLE IF EXISTS Stage;

CREATE TABLE Stage (
    idStage      INTEGER,
    stageRally   VARCHAR(1000) CONSTRAINT fk_stageRally REFERENCES Rally (rallyName) ON DELETE CASCADE 
                                                                                     ON UPDATE CASCADE,
    stageCode    VARCHAR(4) CONSTRAINT stageCode_nn NOT NULL,
    stageName    VARCHAR(1000) CONSTRAINT unique_stageName UNIQUE CONSTRAINT stageName_nn NOT NULL,
    rallyDay     INTEGER CONSTRAINT rallyDay_nn NOT NULL,
    PRIMARY KEY(idStage, stageName),
    CONSTRAINT check_day CHECK ( (rallyDay <= 4 AND rallyDay >= 1))
);



-- Table: Team
DROP TABLE IF EXISTS Team;

CREATE TABLE Team (
    idTeam INTEGER,
    manufacturer VARCHAR(1000) CONSTRAINT manufacturer_nn NOT NULL,
    teamName VARCHAR(1000),
    country VARCHAR(1000) CONSTRAINT country_nn NOT NULL,
    PRIMARY KEY(idTeam, teamName)
);

-- Table: Car
DROP TABLE IF EXISTS Car;

CREATE TABLE Car (
    idCar INTEGER,
    carName VARCHAR(1000),
    category VARCHAR(1000) CONSTRAINT category_nn NOT NULL,
    PRIMARY KEY(idCar, carName)
);

-- Table: Driver
DROP TABLE IF EXISTS Driver;

CREATE TABLE Driver (
    idDriver INTEGER,
    driverName VARCHAR(1000),
    country VARCHAR(1000) CONSTRAINT country_nn NOT NULL,
    number INTEGER CONSTRAINT unique_number UNIQUE CONSTRAINT number_nn NOT NULL,
    PRIMARY KEY(idDriver, driverName)
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;