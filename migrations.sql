CREATE DATABASE restaurant_db;
\c restaurant_db

CREATE TABLE foods (id SERIAL PRIMARY KEY, name VARCHAR(255), price INTEGER);

CREATE TABLE orders (id SERIAL PRIMARY KEY, total INTEGER, payed BOOLEAN, party_id INTEGER REFERENCES parties(id), food_id REFERENCES foods(id));

CREATE TABLE parties (id SERIAL PRIMARY KEY, name VARCHAR(255), size INTEGER);
