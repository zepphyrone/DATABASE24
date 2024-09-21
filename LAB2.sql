CREATE DATABASE lab2;

CREATE TABLE countries(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255),
    region_id   INTEGER,
    population INTEGER
);

INSERT INTO countries(country_name, region_id, population)
VALUES('Mongolia', '1', '5000000');

INSERT INTO countries(country_name)
VALUES('Uzbekistan');

INSERT INTO countries(country_name, region_id, population)
VALUES('South Korea', NULL, '30000');

INSERT INTO countries DEFAULT VALUES;
INSERT INTO countries DEFAULT VALUES;
INSERT INTO countries DEFAULT VALUES;

ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries
VALUES(DEFAULT)

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new (LIKE countries INCLUDING ALL);
INSERT INTO countries_new SELECT * FROM countries;

UPDATE countries_new
SET region_id = 1 WHERE region_id IS NULL;

SELECT country_name, population * 1.1 AS "New Population"
FROM countries_new;

DELETE FROM countries_new
WHERE population < 100000 OR population IS NULL;

DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

DELETE FROM countries
RETURNING *;




