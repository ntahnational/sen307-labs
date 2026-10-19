-- VUA-SEN307 Database Systems
-- Week 3 Practical: MySQL Setup
-- vug_sen_24_11663

CREATE DATABASE demo_test;
DROP DATABASE demo_test;

SHOW DATABASES;

CREATE DATABASE vug_sen_24_11663;
USE vug_sen_24_11663;

-- Confirm the selected database
SELECT DATABASE();

-- List databases again
SHOW DATABASES;

-- Explore the MySQL environment
SELECT VERSION();
SELECT CURRENT_USER();
SELECT NOW();
STATUS;
SHOW VARIABLES LIKE 'port';
SHOW TABLES;
