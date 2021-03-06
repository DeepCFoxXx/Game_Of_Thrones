DROP TABLE members;
DROP TABLE houses;

CREATE TABLE houses (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE members (
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house_id INT8 REFERENCES houses(id),
  age INT4
);

--  createdb maester
--  psql -d maester -f db/maester.sql
--  ruby db/console.rb
