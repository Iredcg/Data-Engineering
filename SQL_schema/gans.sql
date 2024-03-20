CREATE DATABASE gans;
USE gans;

CREATE TABLE city_table(
    city_id INT AUTO_INCREMENT,
    city VARCHAR(255),
    country VARCHAR(50),
    latitude DECIMAL(9,6),  -- 9 digits with 6 after the decimal
    longitude DECIMAL(9,6), -- 9 digits with 6 after the decimal
    elevation VARCHAR(50),
    PRIMARY KEY (city_id)
);


INSERT INTO city_table (city, country, latitude, longitude, elevation)
VALUES ('Berlin', 'Germany', 52.5200, 13.405, '34');

INSERT INTO city_table (city, country, latitude, longitude, elevation)
VALUES ('Hamburg', 'Germany', NULL, NULL, NULL);

INSERT INTO city_table (city, country, latitude, longitude, elevation)
VALUES ('Munich', 'Germany', 48.1375, 11.575, '520');

SELECT * FROM city_table;
CREATE TABLE airport_table (
    airport_id INT AUTO_INCREMENT,
    icao VARCHAR(255),
    city_id INT,
    PRIMARY KEY (airport_id),
    FOREIGN KEY (city_id) REFERENCES city_table(city_id)
);
-- Replace the X in city_id with the actual city_id for each city
INSERT INTO airport_table (icao, city_id) VALUES ('EDDM', 3); -- X is the city_id for Munich
INSERT INTO airport_table (icao, city_id) VALUES ('EDDH', 2); -- X is the city_id for Hamburg
INSERT INTO airport_table (icao, city_id) VALUES ('EDDB', 1); -- X is the city_id for Berlin

SELECT * FROM airport_table;

-- DROP TABLE weather;
CREATE TABLE weather (
    weather_id INT AUTO_INCREMENT,
    city_id INT,
    datetime DATETIME,
    temp FLOAT(5,2),
    weather_main VARCHAR(50),
    weather_description VARCHAR(50),
    rain_in_last_3h FLOAT(5,2),
    clouds_all INT,
    wind_speed FLOAT(5,2),
    wind_deg FLOAT(5,2),
    PRIMARY KEY (weather_id),
    FOREIGN KEY (city_id) REFERENCES city_table(city_id)
);
CREATE INDEX idx_icao ON airport_table(icao);
    -- DROP TABLE flights_arrivals;
CREATE TABLE flights_arrivals (
    arrival_airport_icao VARCHAR(50),
    departure_airport_icao VARCHAR(50),
    scheduled_arrival_time DATETIME,
    flight_number VARCHAR(50),
    date_retrieved_at DATETIME,
    FOREIGN KEY (arrival_airport_icao) REFERENCES airport_table(icao)
);