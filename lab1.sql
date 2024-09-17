CREATE DATABASE lab1;
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50)
);

ALTER TABLE users
ADD COLUMN isadmin INTEGER;

ALTER TABLE users
ALTER COLUMN isadmin TYPE boolean
USING isadmin::boolean;

ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT FALSE;

CREATE TABLE tasks(
    id INT NOT NULL,
    name VARCHAR(50),
    user_id INTEGER
);

DROP TABLE tasks;

DROP DATABASE lab1;