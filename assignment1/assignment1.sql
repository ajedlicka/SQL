-- Creating database with my initials
CREATE DATABASE ajj;

--Connecting database
\c ajj;

--Table Creaation Statements
CREATE TABLE Employee (
    id:     INTEGER PRIMARY KEY,
    ename:  VARCHAR(15),
    city:   VARCHAR(15),
    cname:  VARCHAR(15),
    salary: INTEGER
)

CREATE TABLE Company (
    cname:  VARCHAR(15),
    city:   VARCHAR
)

CREATE TABLE JobSkill (
    id:     INTEGER,
    skill:  VARCHAR (15)
)

CREATE TABLE Manages (
    mid:    INTEGER,
    eid:    INTEGER
)