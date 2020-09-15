-- Creating database with my initials
DROP DATABASE IF EXISTS ajj;
CREATE DATABASE ajj;

--Connecting database 
\c ajj;

-- setting output file
--\o assignment2.txt

-- data1 dataset for for Assignment2
create table person (pid  integer,
                     name text,
                     city text,
                     birthYear integer,
                     primary key (pid));

insert into person values
  (1,'Nick','NewYork',1990),
  (2,'Deepa','Indianapolis',1985),
  (3,'Eric','NewYork',1990),
  (4,'Ryan','Indianapolis',1995),
  (5,'Hasan','Indianapolis',1990),
  (6,'Arif','Indianapolis',1980),
  (7,'Ryan','Chicago',1980),
  (8,'Jean','SanFransisco',2000),
  (9,'Aya','SanFransisco',1985),
  (10,'Lisa','NewYork',2000),
  (11,'Arif','Chicago',1990),
  (12,'Deepa','Bloomington',1990),
  (13,'Nick','SanFransisco',1980),
  (14,'Ryan','Indianapolis',1990),
  (15,'Nick','Indianapolis',1990),
  (16,'Anna','Chicago',1980),
  (17,'Lisa','Bloomington',1990),
  (18,'Ryan','Bloomington',1995),
  (19,'Lisa','Chicago',1980),
  (20,'Danielle','Indianapolis',1985),
  (21,'Eric','Chicago',1980),
  (22,'Anna','Indianapolis',1985),
  (23,'Chris','Bloomington',1990),
  (24,'Aya','NewYork',1995),
  (25,'Arif','SanFransisco',1990),
  (26,'Anna','Bloomington',2000),
  (27,'Latha','SanFransisco',2000),
  (28,'Eric','Bloomington',2000),
  (29,'Linda','Bloomington',1990),
  (30,'Aya','NewYork',1995),
-- The following two tuples were added:
  (31,'Aya','NewYork',1996),
  (32,'Anna','Bloomington',1985);


create table knows (pid1 integer,
                    pid2 integer,
                    primary key(pid1, pid2),
                    foreign key (pid1) references person(pid),
                    foreign key (pid2) references person(pid));

insert into knows values
  (5,22),
  (15,28),
  (10,27),
  (11,27),
  (13,14),
  (11,14),
  (5,28),
  (1,26),
  (18,24),
  (24,5),
  (6,26),
  (15,7),
  (15,25),
  (19,27),
  (10,5),
  (11,19),
  (20,22),
  (27,23),
  (24,29),
  (4,10),
  (26,12),
  (13,15),
  (19,4),
  (20,10),
  (10,6),
  (1,7),
  (17,23),
  (9,26),
  (3,10),
  (21,29),
  (27,15),
  (12,13),
  (16,3),
  (14,24),
  (14,28),
  (12,4),
  (15,8),
  (4,28),
  (18,11),
  (12,16),
  (30,12),
  (4,9),
  (4,8),
  (29,13),
  (29,20),
  (24,18),
  (16,13),
  (30,17),
  (23,22),
  (7,16),
  (29,22),
  (26,3),
  (28,30),
  (25,10),
  (3,22),
  (22,21),
  (30,3),
  (1,20),
  (19,11),
  (29,15),
  (13,30),
  (11,12),
  (1,5),
  (13,18),
  (24,19),
  (30,10),
  (4,12),
  (24,11),
  (18,22),
  (3,2),
  (4,3),
  (12,23),
  (25,24),
  (17,20),
  (28,10),
  (8,17),
  (15,13),
  (1,9),
  (6,18),
  (3,4),
  (4,19),
  (24,23),
  (27,3),
  (12,5),
  (12,2),
  (26,22),
  (30,15),
  (20,13),
  (28,14),
  (14,5),
  (1,10),
  (7,9),
  (27,22),
  (12,11),
  (16,20),
  (12,3),
  (17,7),
  (2,14),
  (18,25),
  (16,24),
--  The following 5 tuples were added:
  (16,15),
  (31,14),
  (32,14),
  (32,7),
  (31,7);


create table company(cname text,
                     city  text,
                     primary key (cname, city));

insert into company values
  ('Amazon','NewYork'),
  ('IBM','NewYork'),
  ('Amazon','Indianapolis'),
  ('Amazon','Bloomington'),
  ('Intel','NewYork'),
  ('Netflix','Indianapolis'),
  ('Yahoo','Indianapolis'),
  ('Google','Bloomington'),
  ('Apple','Indianapolis'),
  ('Hulu','Chicago'),
  ('Hulu','NewYork'),
  ('Yahoo','Chicago'),
  ('Intel','Bloomington'),
  ('Google','Chicago'),
  ('Zoom','Chicago'),
  ('Yahoo','NewYork'),
  ('Yahoo','Bloomington'),
  ('Netflix','Bloomington'),
  ('Microsoft','Chicago'),
  ('Netflix','NewYork'),
  ('Microsoft','Indianapolis'),
  ('Zoom','SanFransisco'),
  ('Netflix','SanFrancisco'),
  ('Yahoo','SanFrancisco'),
  ('IBM','SanFrancisco'),
-- The following tuple was added:
  ('Uber','Bloomington');




create table worksfor(pid    integer,
                      cname  text,
                      salary integer,
                      primary key(pid),
                      foreign key (pid) references person(pid));

insert into worksfor values
  (1,'IBM',60000),
  (2,'Hulu',50000),
  (3,'Amazon',45000),
  (4,'Microsoft',60000),
  (5,'Amazon',40000),
  (6,'IBM',50000),
  (7,'IBM',50000),
  (8,'Netflix',45000),
  (9,'Yahoo',50000),
  (10,'Hulu',40000),
  (11,'Apple',40000),
  (12,'Netflix',55000),
  (13,'Apple',40000),
  (14,'IBM',50000),
  (15,'IBM',40000),
  (16,'Apple',55000),
  (17,'Google',45000),
  (18,'Amazon',45000),
  (19,'Zoom',45000),
  (20,'Microsoft',55000),
  (21,'Intel',55000),
  (22,'IBM',40000),
  (23,'Apple',40000),
  (24,'Google',45000),
  (25,'Hulu',50000),
  (26,'Intel',55000),
  (27,'Intel',50000),
  (28,'Intel',50000),
  (29,'Google',60000),
  (30,'Intel',60000),
-- The following two tuples were added:
  (31,'Uber',50000),
  (32,'Uber',60000);


create table jobskill(skill text,
                      primary key(skill));
insert into jobskill values 
  ('Programming'), 
  ('Databases'), 
  ('AI'), 
  ('Networks'), 
  ('Mathematics'),
-- The following tuple was added:
  ('Accounting');

create table personskill(pid integer,
                         skill text,
                         primary key(pid,skill),
                         foreign key (pid) references person(pid),
                         foreign key (skill) references jobskill(skill));

insert into personskill values
  (27,'Programming'),
  (18,'Mathematics'),
  (10,'AI'),
  (29,'Networks'),
  (23,'AI'),
  (4,'AI'),
  (1,'Databases'),
  (10,'Networks'),
  (9,'Programming'),
  (13,'Networks'),
  (9,'AI'),
  (27,'Mathematics'),
  (20,'AI'),
  (29,'Databases'),
  (5,'Programming'),
  (26,'Databases'),
  (1,'Networks'),
  (28,'AI'),
  (15,'Programming'),
  (16,'Mathematics'),
  (12,'Databases'),
  (15,'Databases'),
  (24,'Programming'),
  (14,'AI'),
  (25,'Networks'),
  (13,'AI'),
  (12,'Programming'),
  (22,'Programming'),
  (7,'Mathematics'),
  (10,'Programming'),
  (16,'Databases'),
  (19,'Programming'),
  (7,'Programming'),
  (22,'AI'),
  (5,'Databases'),
  (2,'Mathematics'),
  (14,'Programming'),
  (26,'Networks'),
  (19,'Networks'),
  (21,'Programming'),
  (14,'Mathematics'),
  (19,'AI'),
  (2,'Networks'),
  (8,'Databases'),
  (13,'Mathematics'),
  (29,'Programming'),
  (3,'AI'),
  (16,'Networks'),
  (5,'Networks'),
  (17,'AI'),
  (24,'Databases'),
  (2,'Databases'),
  (27,'Networks'),
  (28,'Databases'),
  (30,'Databases'),
  (4,'Networks'),
  (6,'Networks'),
  (17,'Networks'),
  (23,'Programming'),
  (20,'Programming'),
--  The following four tuples were added:
  (31,'Programming'),
  (32,'Databases'),
  (32,'Accounting'),
  (6, 'Databases');


\qecho Problem 1

\qecho Problem 1.1

\qecho Problem 1.1.a

SELECT DISTINCT p.pid, p.name
FROM person p, knows k, worksfor wf, company c, person p1
WHERE p.pid = k.pid1 AND p1.pid = k.pid2 AND wf.pid = p.pid AND wf.cname = c.cname AND c.city = 'Bloomington' AND p1.city = 'Chicago'
ORDER BY p.pid;

\qecho Problem 1.1.b

SELECT DISTINCT p.pid, p.name
FROM person p
WHERE p.pid IN (SELECT wf.pid
                FROM worksfor wf
                WHERE wf.cname IN (SELECT c.cname
                                   FROM company c
                                   WHERE c.city = 'Bloomington'))
AND p.pid IN (SELECT k.pid1
              FROM knows k
              WHERE k.pid2 IN (SELECT p1.pid
                               FROM person p1
                               WHERE p1.city = 'Chicago'))
ORDER BY p.pid;

\qecho Problem 1.1.c

SELECT DISTINCT p.pid, p.name
FROM person p
WHERE p.pid = SOME (SELECT wf.pid
                    FROM worksfor wf
                    WHERE wf.cname = SOME (SELECT c.cname
                                            FROM company c
                                            WHERE c.city = 'Bloomington'))
AND p.pid = SOME (SELECT k.pid1
                   FROM knows k
                   WHERE k.pid2 = SOME (SELECT p1.pid
                                         FROM person p1
                                         WHERE p1.city = 'Chicago'))
ORDER BY p.pid;

\qecho Problem 1.1.d

SELECT DISTINCT p.pid, p.name
FROM person p
WHERE EXISTS (SELECT c.cname
              FROM company c
              WHERE c.city = 'Bloomington' AND EXISTS (SELECT wf.pid
                                                       FROM worksfor wf
                                                       WHERE wf.pid = p.pid AND wf.cname = c.cname))
AND EXISTS (SELECT p1.pid
            FROM person p1
            WHERE p1.city = 'Chicago' AND EXISTS (SELECT k.pid1
                                                  FROM knows k
                                                  WHERE k.pid1 = p.pid AND k.pid2 = p1.pid))
ORDER BY p.pid;

\qecho Problem 1.2

\qecho Problem 1.2.a

SELECT DISTINCT p.pid, p.name
FROM person p, knows k, person p1, worksfor wf
WHERE p.pid = k.pid1 AND p1.pid = k.pid2 AND p1.pid = wf.pid AND wf.cname = 'Google'
EXCEPT (SELECT DISTINCT p.pid, p.name
        FROM person p, knows k, person p1, worksfor wf, personskill ps
        WHERE p.pid = k.pid1 AND p1.pid = k.pid2 AND p1.pid = wf.pid AND wf.cname = 'Amazon' AND ps.pid = p1.pid AND ps.skill = 'Programming')
ORDER BY pid;

\qecho Problem 1.2.b

SELECT DISTINCT p.pid, p.name
FROM person p
WHERE p.pid IN (SELECT k.pid1
                FROM knows k
                WHERE k.pid2 IN (SELECT wf.pid
                                 FROM worksfor wf
                                 WHERE wf.cname = 'Google'))
AND p.pid NOT IN (SELECT k.pid1
                  FROM knows k
                  WHERE k.pid2 IN (SELECT wf.pid
                                   FROM worksfor wf
                                   WHERE wf.cname = 'Amazon')
                  AND k.pid2 IN (SELECT ps.pid
                                 FROM personskill ps
                                 WHERE ps.skill = 'Programming'))
ORDER BY p.pid;

\qecho Problem 1.2.c

SELECT DISTINCT p.pid, p.name
FROM person p
WHERE p.pid = SOME (SELECT k.pid1
                    FROM knows k
                    WHERE k.pid2 = SOME (SELECT wf.pid
                                         FROM worksfor wf
                                         WHERE wf.cname = 'Google'))
AND p.pid != ALL (SELECT k.pid1
                  FROM knows k
                  WHERE k.pid2 = SOME (SELECT wf.pid
                                       FROM worksfor wf
                                       WHERE wf.cname = 'Amazon')
                  AND k.pid2 = SOME (SELECT ps.pid
                                     FROM personskill ps
                                     WHERE ps.skill = 'Programming'))
ORDER BY p.pid;

\qecho Problem 1.2.d

SELECT DISTINCT p.pid, p.name
FROM person p
WHERE EXISTS (SELECT p1.pid
              FROM person p1
              WHERE EXISTS (SELECT k.pid1
                            FROM knows k
                            WHERE p.pid = k.pid1 AND p1.pid = k.pid2)
              AND EXISTS (SELECT wf.pid
                          FROM worksfor wf
                          WHERE wf.pid = p1.pid AND wf.cname = 'Google'))
AND NOT EXISTS (SELECT p2.pid
                FROM person p2
                WHERE EXISTS (SELECT k.pid1
                              FROM knows k
                              WHERE p.pid = k.pid1 AND p2.pid = k.pid2)
                AND EXISTS (SELECT wf.pid
                            FROM worksfor wf
                            WHERE wf.pid = p2.pid AND wf.cname = 'Amazon')
                AND EXISTS (SELECT ps.pid
                            FROM personskill ps
                            WHERE ps.pid = p2.pid AND ps.skill = 'Programming'))
ORDER BY p.pid;

\qecho Problem 1.3

\qecho Problem 1.3.a

SELECT DISTINCT wf1.cname
FROM personskill ps1, personskill ps2, worksfor wf1, worksfor wf2
WHERE wf1.pid = ps1.pid AND wf2.pid = ps2.pid AND ps1.skill = ps2.skill AND wf1.cname = wf2.cname AND wf1.pid != wf2.pid
ORDER BY wf1.cname;

\qecho Problem 1.3.b

SELECT DISTINCT wf1.cname
FROM worksfor wf1
WHERE wf1.cname IN (SELECT wf2.cname
                    FROM worksfor wf2, personskill ps1
                    WHERE ps1.pid = wf1.pid AND wf1.pid != wf2.pid AND ps1.skill IN (SELECT ps2.skill
                                                                                     FROM personskill ps2
                                                                                     WHERE ps2.pid = wf2.pid))
ORDER BY wf1.cname;

\qecho Problem 1.3.c

SELECT DISTINCT wf1.cname
FROM worksfor wf1
WHERE EXISTS (SELECT wf2.pid
              FROM worksfor wf2
              WHERE wf1.cname = wf2.cname AND wf1.pid != wf2.pid AND EXISTS (SELECT ps1.skill
                                                                             FROM personskill ps1, personskill ps2
                                                                             WHERE ps1.skill = ps2.skill AND wf1.pid = ps1.pid AND wf2.pid = ps2.pid))
ORDER BY wf1.cname;

\qecho Problem 1.4

\qecho Problem 1.4.a

CREATE VIEW IBMDatabasesEmployee AS
       SELECT p.pid, p.name, wf.salary
       FROM person p, worksfor wf, personskill ps
       WHERE wf.cname = 'IBM' AND p.pid = wf.pid AND ps.pid = p.pid AND ps.skill = 'Databases'
       ORDER BY p.pid;

SELECT DISTINCT e.pid, e.name, e.salary
FROM IBMDatabasesEmployee e
EXCEPT 
SELECT DISTINCT e.pid, e.name, e.salary
FROM IBMDatabasesEmployee e, IBMDatabasesEmployee e1
WHERE e.salary < e1.salary;

DROP VIEW IBMDatabasesEmployee;


\qecho Problem 1.4.b

SELECT DISTINCT p.pid, p.name
FROM person p, worksfor wf, personskill ps
WHERE wf.cname = 'IBM' AND p.pid = wf.pid AND ps.pid = p.pid AND ps.skill = 'Databases' AND wf.salary >= ALL(SELECT wf1.salary
                                                                                                             FROM person p1, worksfor wf1, personskill ps1
                                                                                                             WHERE wf1.cname = 'IBM' AND p1.pid = wf1.pid AND ps1.pid = p1.pid AND ps1.skill = 'Databases')
ORDER BY p.pid;

\qecho Problem 1.5

SELECT DISTINCT wf2.cname, wf2.pid, p1.name
FROM worksfor wf2, person p1, worksfor wf3
WHERE (wf2.cname, wf2.pid, p1.name, wf2.salary) IN (SELECT wf.cname, wf.pid, p.name, wf.salary
                                                    FROM worksfor wf, person p
                                                    WHERE wf.pid = p.pid AND wf.salary > SOME (SELECT wf1.salary
                                                                                               FROM worksfor wf1
                                                                                               WHERE wf1.cname = wf.cname))
AND wf2.salary <= ALL (SELECT wf.salary
                       FROM worksfor wf, person p
                       WHERE wf.pid = p.pid AND wf.salary > SOME (SELECT wf1.salary
                                                                  FROM worksfor wf1
                                                                  WHERE wf1.cname = wf.cname AND wf.cname = wf2.cname))
ORDER BY cname, pid;

\qecho Problem 1.6

SELECT DISTINCT p.pid, p.name
FROM person p, knows k, person p1, personskill ps1, personskill ps2
WHERE p.pid = k.pid1 AND p1.pid = k.pid2 AND p1.pid = ps1.pid AND p1.pid = ps2.pid AND ps2.skill != ps1.skill AND NOT EXISTS (SELECT p2.pid
                                                                                                              FROM person p2, knows k1
                                                                                                              WHERE p2.pid = p.pid AND k1.pid1 = p2.pid AND k1.pid2 != p1.pid)
ORDER BY p.pid;

\qecho Problem 1.7

SELECT DISTINCT ps.skill
FROM personskill ps
EXCEPT
SELECT DISTINCT ps1.skill
FROM worksfor wf, personskill ps1
WHERE wf.pid = ps1.pid AND (wf.cname = 'Yahoo' OR wf.cname = 'Netflix')
ORDER BY skill;

\qecho Problem 1.8

SELECT DISTINCT ps.skill, ps1.skill
FROM personskill ps, personskill ps1
WHERE NOT EXISTS (SELECT ps2.pid
                  FROM personskill ps2
                  WHERE ps.skill = ps2.skill AND NOT EXISTS (SELECT ps3.pid
                                                             FROM (SELECT *
                                                                   FROM personskill psSub
                                                                   WHERE psSub.pid = ps2.pid) ps3
                                                             WHERE ps3.skill = ps1.skill))
ORDER BY ps.skill;

\qecho Problem 2

\qecho Problem 2.1

\qecho Problem 2.1.a

CREATE VIEW SalaryAbove50000 AS
       SELECT p.pid, p.name, p.city, p.birthYear
       FROM person p, worksfor wf
       WHERE wf.salary > 50000 AND p.pid = wf.pid
       ORDER BY p.pid;
SELECT * FROM SalaryAbove50000;

\qecho Problem 2.1.b

CREATE VIEW IBMEmployee AS
       SELECT p.pid
       FROM person p, worksfor wf
       WHERE wf.cname = 'IBM' AND p.pid = wf.pid
       ORDER BY p.pid;
SELECT * FROM IBMEmployee;

\qecho Problem 2.1.c

SELECT DISTINCT p.pid, p.name
FROM person p, worksfor wf, knows k, SalaryAbove50000 sal
WHERE p.pid = wf.pid AND sal.pid = p.pid AND wf.cname = 'Apple' AND k.pid1 = p.pid AND k.pid2 NOT IN (SELECT ibm.pid
                                                                                                      FROM IBMEmployee ibm, SalaryAbove50000 sal1
                                                                                                      WHERE ibm.pid = sal1.pid)
ORDER BY p.pid;

\qecho Problem 2.2

\qecho Problem 2.2.a

CREATE FUNCTION SalaryAbove(amount integer)
          RETURNS TABLE(pid  integer, 
                        name text,
                        city text,
                        birthYear integer) AS
          $$
              SELECT p.pid, p.name, p.city, p.birthYear
              FROM person p, worksfor wf
              WHERE wf.pid = p.pid AND wf.salary > amount;
          $$  LANGUAGE SQL;

\qecho Salary above 30000
SELECT * FROM SalaryAbove(30000);

\qecho Salary above 50000
SELECT * FROM SalaryAbove(50000);

\qecho Salary above 70000
SELECT * FROM SalaryAbove(70000);

\qecho Problem 2.2.b

CREATE FUNCTION KnowsEmployeeAtCompany(companyname text)
          RETURNS TABLE(pid integer) AS
          $$
              SELECT DISTINCT p.pid
              FROM person p, knows k, person p1, worksfor wf
              WHERE p.pid = k.pid1 AND p1.pid = k.pid2 AND wf.pid = p1.pid AND wf.cname = companyname;
          $$  LANGUAGE SQL;

\qecho Person who knows employee at Yahoo
SELECT * FROM KnowsEmployeeAtCompany('Yahoo');

\qecho Person who knows employee at Google
SELECT * FROM KnowsEmployeeAtCompany('Google');

\qecho Person who knows employee at Amazon
SELECT * FROM KnowsEmployeeAtCompany('Amazon');

\qecho Problem 2.2.c

SELECT DISTINCT s.salary, c.cname, p.pid
FROM worksfor s, company c, person p, worksfor wf, company c1
WHERE p.pid = wf.pid AND wf.cname = c.cname AND wf.pid IN (SELECT func.pid
                                                           FROM SalaryAbove(s.salary) func)
AND wf.pid IN (SELECT func.pid
               FROM KnowsEmployeeAtCompany(c1.cname) func, knows k, worksfor wf1
               WHERE func.pid = k.pid1 AND c1.cname != c.cname AND k.pid2 = wf1.pid AND wf1.cname = c1.cname AND k.pid2 NOT IN (SELECT func.pid
                                                                                                                                FROM SalaryAbove(s.salary) func))
ORDER BY s.salary, c.cname, p.pid;

\qecho Problem 3

\qecho Problem 3.1

CREATE TABLE A (x integer);
INSERT INTO A VALUES (1), (2), (3), (4), (5);
SELECT x, 
       sqrt(x) AS square_root_x, 
       x*x AS x_squared,
       power(2, x) AS two_to_the_power_x,
       x! AS x_factorial,
       ln(x) AS logarithm_x
FROM A
ORDER BY x;
DROP TABLE A;

\qecho Problem 3.2

\qecho Problem 3.2.a

CREATE TABLE A (x integer);
CREATE TABLE B (x integer);
CREATE TABLE C (x integer);
insert into A values (1),(2);
insert into B values (1),(3),(5);
\qecho insert into A values (1),(2);
\qecho insert into B values (1),(3),(5);
SELECT EXISTS (SELECT x 
               FROM A
               INTERSECT
               SELECT x
               FROM B) AS answer;
SELECT EXISTS (SELECT a.x, b.x
               FROM A a, B b
               WHERE a = b);
DELETE FROM A *;
DELETE FROM B *;
insert into A values (1),(2);
insert into B values (3),(5);
\qecho insert into A values (1),(2);
\qecho insert into B values (3),(5);
SELECT EXISTS (SELECT x 
               FROM A
               INTERSECT
               SELECT x
               FROM B) AS answer;
SELECT EXISTS (SELECT a.x, b.x
               FROM A a, B b
               WHERE a = b) AS answer;
DELETE FROM A *;
DELETE FROM B *;

\qecho Problem 3.2.b

insert into A values (1),(2);
insert into B values (1),(2),(3);
\qecho insert into A values (1),(2);
\qecho insert into B values (1),(2),(3);
SELECT NOT EXISTS (SELECT x
                   FROM A
                   WHERE x NOT IN (SELECT x
                                   FROM A
                                   INTERSECT
                                   SELECT x
                                   FROM B)) AS answer;
SELECT NOT EXISTS (SELECT a.x
                   FROM A a
                   WHERE a.x NOT IN (SELECT b.x
                                     FROM B b)) AS answer;
DELETE FROM A *;
DELETE FROM B *;
insert into A values (1),(2);
insert into B values (2),(3);
\qecho insert into A values (1),(2);
\qecho insert into B values (2),(3);
SELECT NOT EXISTS (SELECT x
                   FROM A
                   WHERE x NOT IN (SELECT x
                                   FROM A
                                   INTERSECT
                                   SELECT x
                                   FROM B)) AS answer;
SELECT NOT EXISTS (SELECT a.x
                   FROM A a
                   WHERE a.x NOT IN (SELECT b.x
                                     FROM B b)) AS answer;
DELETE FROM A *;
DELETE FROM B *;

\qecho Problem 3.2.c

insert into A values (1),(2);
insert into B values (2),(3);
insert into C values (1),(2),(3);
\qecho insert into A values (1),(2);
\qecho insert into B values (2),(3);
\qecho insert into C values (1),(2),(3);
SELECT NOT EXISTS ((SELECT a.x
                    FROM A a)
                    UNION
                    (SELECT b.x
                     FROM B b)
                     EXCEPT
                     (SELECT c.x
                      FROM C c)) AS answer;
SELECT NOT EXISTS ((SELECT a.x
                    FROM A a)
                    UNION
                    (SELECT b.x
                     FROM B b)
                     EXCEPT
                     (SELECT c.x
                      FROM C c)) AS answer;
DELETE FROM A *;
DELETE FROM B *;
DELETE FROM C *;
insert into A values (1),(2);
insert into B values (2),(3);
insert into C values (1),(2),(4);
\qecho insert into A values (1),(2);
\qecho insert into B values (2),(3);
\qecho insert into C values (1),(2),(4);
SELECT NOT EXISTS ((SELECT a.x
                    FROM A a)
                   UNION
                   (SELECT b.x
                    FROM B b)
                   EXCEPT
                   (SELECT c.x
                    FROM C c)) AS answer;
-- this is the same as above query because I don't use the INTERSECT or EXCEPT, as noted in the assignment
SELECT NOT EXISTS ((SELECT a.x
                    FROM A a)
                    UNION
                    (SELECT b.x
                     FROM B b)
                     EXCEPT
                     (SELECT c.x
                      FROM C c)) AS answer;

\qecho Problem 3.3

\qecho Problem 3.3.a

SELECT NOT EXISTS (SELECT p.pid
                   FROM person p, personskill ps1, personskill ps2
                   WHERE p.pid = ps1.pid AND p.pid = ps2.pid AND ps1.skill != ps2.skill) AS answer;

\qecho Problem 3.3.b

SELECT NOT EXISTS (SELECT wf.cname
                   FROM worksfor wf
                   WHERE wf.salary <= 55000) AS answer;

--Connect to default database
\c postgres;

--Dropping created database
DROP DATABASE ajj;
