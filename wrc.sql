PRAGMA foreign_keys = on;
BEGIN TRANSACTION;

-- Table: Rally
DROP TABLE IF EXISTS Rally;

CREATE TABLE Rally (
    idRally      INTEGER,
    startDate    DATE CONSTRAINT unique_startDate UNIQUE CONSTRAINT startDate_nn NOT NULL,
    endDate      DATE CONSTRAINT unique_endDate UNIQUE CONSTRAINT endDate_nn NOT NULL,
    rallyName    VARCHAR(1000),
    hq           VARCHAR(1000) CONSTRAINT unique_hq UNIQUE CONSTRAINT hq_nn NOT NULL,
    surface      VARCHAR(100) CONSTRAINT surface_nn NOT NULL,
    stages       INTEGER CONSTRAINT stages_nn NOT NULL,
    distance     FLOAT CONSTRAINT distance_nn NOT NULL,
    PRIMARY KEY(idRally, rallyName),
    CONSTRAINT date_match CHECK ( (startDate <= endDate))
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;