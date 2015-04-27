CREATE DATABASE restaurant_db;
\c restaurant_db

CREATE TABLE foods (id SERIAL PRIMARY KEY, name VARCHAR(255), price INTEGER);

CREATE TABLE parties (id SERIAL PRIMARY KEY, name VARCHAR(255), size INTEGER, total INTEGER, payed BOOLEAN);

CREATE TABLE orders (id SERIAL PRIMARY KEY, party_id INTEGER REFERENCES parties(id), food_id INTEGER REFERENCES foods(id));

CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(255), password_hash VARCHAR(255));
