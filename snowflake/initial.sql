-- ================================================================
-- WEATHER DATA DEMO
-- ================================================================

-- Create demo database and schema
CREATE OR REPLACE DATABASE DEMO;
CREATE OR REPLACE SCHEMA DEMO.SCHEMA_DEMO;

-- Create large warehouse for data operations
CREATE OR REPLACE WAREHOUSE my_large_wh
WAREHOUSE_SIZE = 'LARGE';

-- Create stage pointing to S3 bucket with weather data
CREATE OR REPLACE STAGE DEMO.DEMO_SCHEMA.weather_stage
URL = 's3://snowflake-workshop-lab/weather-nyc'
FILE_FORMAT = (TYPE = 'json');

-- List files in the weather stage to verify data source
LIST @DEMO.DEMO_SCHEMA.weather_stage;

-- Create weather table with relevant columns
CREATE OR REPLACE TABLE DEMO.DEMO_SCHEMA.WEATHER (
    CITYNAME STRING,
    LAT FLOAT,
    LON FLOAT,
    CLOUDS INTEGER,
    HUMIDITY INTEGER,
    PRESSURE FLOAT,
    TEMP FLOAT,
    TIME TIMESTAMP,
    WEATHER STRING
);

-- Copy data from stage to weather table, extracting JSON fields
COPY INTO DEMO.DEMO_SCHEMA.WEATHER
FROM (
    SELECT
        t.$1:city:findname,
        t.$1:city:coord:lat,
        t.$1:city:coord:lon,
        t.$1:clouds:all,
        t.$1:main:humidity,
        t.$1:main:pressure,
        t.$1:main:temp,
        t.$1:time,
        t.$1:weather[0]:main
    FROM @DEMO.DEMO_SCHEMA.weather_stage t
);

-- Verify data loaded successfully
SELECT * FROM DEMO.DEMO_SCHEMA.WEATHER;


-- ================================================================
-- PET DATA EXERCISE
-- ================================================================

-- Create pet database and schema
CREATE OR REPLACE DATABASE PET;
CREATE OR REPLACE SCHEMA PET.PET_SCHEMA;

-- Create stage pointing to S3 bucket with pet data
CREATE OR REPLACE STAGE PET.PET_SCHEMA.PETS_STAGE
URL = 's3://snowflake-dbt-hands-on/'
FILE_FORMAT = (TYPE = 'json');

-- List files in the pet stage to verify data source
LIST @PET.PET_SCHEMA.PETS_STAGE;

-- Create pets table to store pet information
CREATE OR REPLACE TABLE PET.PET_SCHEMA.PETS (
    LASTNAME STRING,
    AGE INT,
    HOBBIE STRING,
    PET_NAME STRING,
    PET_TYPE STRING
);

-- Preview data by selecting and extracting JSON fields
SELECT
    t.$1:name:last,
    t.$1:age,
    t.$1:hobbies[0],
    t.$1:pet:name,
    t.$1:pet:type
FROM @PET.PET_SCHEMA.PETS_STAGE t;

-- Copy pet data from stage to pets table, extracting JSON fields
COPY INTO PET.PET_SCHEMA.PETS
FROM (
    SELECT
        t.$1:name:last,
        t.$1:age,
        t.$1:hobbies[0],
        t.$1:pet:name,
        t.$1:pet:type
    FROM @PET.PET_SCHEMA.PETS_STAGE t
);

------------------------- BIKE -----------------------
CREATE OR REPLACE STAGE DEMO.DEMO_SCHEMA.BIKE_STAGE;

SELECT
	t.$1,
	t.$2,
	t.$3,
	t.$4,
	t.$5,
	t.$6,
	t.$7,
	t.$8,
	t.$9,
	t.$10,
	t.$11,
	t.$12,
	t.$13,
	t.$14
	FROM
@DEMO_DEMO_SCHEMA.BIKE_STAGE t;