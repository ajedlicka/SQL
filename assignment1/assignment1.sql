-- Creating database with my initials
CREATE DATABASE ajj;

--Connecting database
\c ajj;

--Table Creaation Statements
CREATE TABLE Employee (
    id:     INTEGER,
    ename:  VARCHAR,
    city:   VARCHAR,
    cname:  VARCHAR,
    salary: VARCHAR
)

CREATE TABLE Company (
    cname:  VARCHAR,
    city:   VARCHAR
)

CREATE TABLE JobSkill (
    id:     INTEGER,
    skill:  VARCHAR
)

CREATE TABLE Manages (
    mid:    INTEGER,
    eid:    INTEGER
)