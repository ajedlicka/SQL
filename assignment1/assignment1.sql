-- Creating database with my initials
CREATE DATABASE ajj;

--Connecting database 
\c ajj; 

--Table Creation Statements
create table company(
   cname text, 
   city text, 
   PRIMARY KEY (cname, city));

create table employee(
   id integer, 
   ename text,
   city text,
   cname text,
   salary integer,
   PRIMARY KEY (id),
   FOREIGN KEY (cname, city) REFERENCES company (cname, city));

create table jobskill(
   id integer, 
   skill text, 
   PRIMARY KEY (id, kill),
   FOREIGN KEY (id) REFERENCES employee (id));

create table manages(
   mid integer, 
   eid integer, 
   PRIMARY KEY (mid, eid),
   FOREIGN KEY (mid) REFERENCES employee (id),
   FOREIGN KEY (eid) REFERENCES employee (id));

-- Populating Tables
INSERT INTO company VALUES
   ('Apple', 'Bloomington'),
   ('Apple', 'Indianapolis'),
   ('Amazon', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Google', 'Chicago'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington');

INSERT INTO employee VALUES
   (1001,'Jean','Bloomington','Apple',60000),
   (1002,'Vidya', 'Indianapolis', 'Apple', 45000),
   (1003,'Anna', 'Chicago', 'Amazon', 55000),
   (1004,'Qin', 'Denver', 'Amazon', 55000),
   (1005,'Aya', 'Chicago', 'Google', 60000),
   (1006,'Ryan', 'Chicago', 'Amazon', 55000),
   (1007,'Danielle','Indianapolis', 'Netflix', 50000),
   (1008,'Emma', 'Bloomington', 'Amazon', 50000),
   (1009,'Hasan', 'Bloomington','Apple',60000),
   (1010,'Linda', 'Chicago', 'Amazon', 55000),
   (1011,'Nick', 'NewYork', 'Google', 55000), 
   (1012,'Eric', 'Indianapolis', 'Apple', 50000),
   (1013,'Lisa', 'Indianapolis', 'Netflix', 55000),
   (1014,'Deepa', 'Bloomington', 'Apple', 50000), 
   (1015,'Chris', 'Denver', 'Amazon', 60000),
   (1016,'YinYue', 'Chicago', 'Amazon', 55000),
   (1017,'Latha', 'Indianapolis', 'Netflix', 60000),
   (1018,'Arif', 'Bloomington', 'Apple', 50000);

INSERT INTO jobskill VALUES
   (1001,'Programming'),
   (1001,'AI'),
   (1002,'Programming'),
   (1002,'AI'),
   (1004,'AI'),
   (1004,'Programming'),
   (1005,'AI'),
   (1005,'Programming'),
   (1005,'Networks'),
   (1006,'Programming'),
   (1006,'OperatingSystems'),
   (1007,'OperatingSystems'),
   (1007,'Programming'),
   (1008,'Programming'),
   (1009,'OperatingSystems'),
   (1009,'Networks'),
   (1010,'Networks'),
   (1011,'Networks'),
   (1011,'OperatingSystems'),
   (1011,'AI'),
   (1011,'Programming'),
   (1012,'AI'),
   (1012,'OperatingSystems'),
   (1012,'Programming'),
   (1013,'Programming'),
   (1013,'AI'),
   (1013,'OperatingSystems'),
   (1013,'Networks'),
   (1014,'OperatingSystems'),
   (1014,'AI'),
   (1014,'Programming'),
   (1014,'Networks'),
   (1015,'Programming'),
   (1015,'AI'),
   (1016,'Programming'),
   (1016,'OperatingSystems'),
   (1016,'AI'),
   (1017,'Networks'),
   (1017,'Programming'),
   (1018,'AI');

INSERT INTO manages VALUES
   (1001, 1002),
   (1001, 1009),
   (1001, 1012),
   (1009, 1018),
   (1009, 1014),
   (1012, 1014),
   (1003, 1004),
   (1003, 1006),   
   (1003, 1015),
   (1015, 1016),
   (1006, 1008),
   (1006, 1016),
   (1016, 1010),
   (1005, 1011),
   (1013, 1007),
   (1013, 1017);

-- Queries

\qecho Problem 1.1

SELECT * FROM employee;
\qecho Added 3 entries to company to reconcile employee records 1002, 1005, 1008
SELECT * FROM company;
SELECT * FROM jobskill;
SELECT * FROM manages;

\qecho Problem 2.1

SELECT DISTINCT e.id, e.ename, e.salary 
FROM employee e 
WHERE e.city = 'Indianapolis' AND e.salary BETWEEN 30000 AND 50000
ORDER BY e.id;

\qecho Problem 2.2

SELECT DISTINCT e1.id, e1.ename
FROM employee e1, manages m, (SELECT e.id, e.city 
                              FROM employee e 
                              WHERE e.city = 'Bloomington') e2, 
                             (SELECT c.cname 
                              FROM company c 
                              WHERE c.city = 'Chicago') c
WHERE e1.id = m.eid AND e2.id = m.mid AND e1.cname = c.cname
ORDER BY e1.id;

\qecho Problem 2.3

SELECT DISTINCT e1.id, e1.ename
FROM employee e1, employee e2, manages m
WHERE e1.id = m.eid AND e2.id = m.mid AND e1.city = e2.city
ORDER BY e1.id;

\qecho Problem 2.4

SELECT DISTINCT e.id, e.ename
FROM employee e, jobskill j1, jobskill j2, jobskill j3
WHERE e.id = j1.id AND e.id = j2.id AND e.id = j3.id AND j1.skill <> j2.skill AND j2.skill <> j3.skill AND j3.skill <> j1.skill
ORDER BY e.id;

\qecho Problem 2.5

SELECT DISTINCT e1.id, e1.ename, e1.salary
FROM manages m, employee e1, (SELECT e1.id 
                              FROM employee e1, employee e2, jobskill j, manages m 
                              WHERE e1.id = m.mid AND e2.id = m.eid AND e2.id = j.id AND j.skill = 'Programming') e2
WHERE e1.id = m.mid AND e2.id = m.eid
ORDER BY e1.id;

\qecho Problem 2.6

SELECT DISTINCT e1.id, e2.id
FROM employee e1, employee e2, employee e3, manages m1
WHERE e1.id = m1.eid AND e3.id = m1.mid AND e2.id IN (SELECT e4.id 
                                                      FROM employee e4, manages m2 
                                                      WHERE e4.id = m2.eid AND e3.id = m2.mid AND m1.mid = m2.mid AND NOT e4.id = e1.id)
ORDER BY e1.id;

\qecho Problem 2.7

SELECT DISTINCT c.cname
FROM company c
WHERE c.cname NOT IN (SELECT e.cname 
                      FROM employee e 
                      WHERE e.city = 'Bloomington')
ORDER BY c.cname;

\qecho Problem 2.8

SELECT DISTINCT e.cname, e.id
FROM employee e
WHERE e.salary >= ALL(SELECT e1.salary 
                      FROM employee e1)
ORDER BY e.cname;

\qecho Problem 2.9

SELECT DISTINCT e.id, e.ename
FROM employee e
WHERE e.salary >= ALL(SELECT e1.salary 
                      FROM employee e1, manages m 
                      WHERE e.id = m.eid AND e1.id = m.mid)
ORDER BY e.id;

\qecho Problem 2.10

SELECT DISTINCT manager.id, manager.ename 
FROM (SELECT e.id, e.ename 
      FROM employee e, manages m 
      WHERE e.id = m.mid) manager
WHERE NOT EXISTS (SELECT worker.id 
                  FROM jobskill managerSkill, jobskill workerSkill, (SELECT e.id, e.ename 
                                                                     FROM employee e, manages m 
                                                                     WHERE m.mid = manager.id AND e.id = m.eid) worker
                  WHERE managerSkill.id = manager.id AND workerSkill.id = worker.id AND workerSkill.skill = managerSkill.skill)
ORDER BY manager.id;

--Connect to default database
\c postgres;

--Dropping created database
DROP DATABASE ajj;

