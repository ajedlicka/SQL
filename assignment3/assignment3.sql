-- Creating database with my initials
\c postgres;
DROP DATABASE IF EXISTS ajj;
CREATE DATABASE ajj;

--Connecting database 
\c ajj;

-- setting output file
--\o assignment3.txt


-- data for Assignment3
drop table if exists person;
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
  (30,'Aya','NewYork',1995);



drop table if exists knows;
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
  (16,24);


drop table if exists company;
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
  ('IBM','SanFrancisco');



drop table if exists worksfor;
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
  (30,'Intel',60000);


drop table if exists jobskill;
create table jobskill(skill text,
                      primary key(skill));
insert into jobskill values 
  ('Programming'), 
  ('Databases'), 
  ('AI'), 
  ('Networks'), 
  ('Mathematics');

drop table if exists personskill;
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
  (20,'Programming');


\qecho Problem 1
create table polynomial_p(coefficient integer,
                          degree integer);
insert into polynomial_p values
  (2,2),
  (-5,1),
  (5,0);

create table polynomial_q(coefficient integer,
                          degree integer);
insert into polynomial_q values
  (4,4),
  (3,3),
  (1,2),
  (-1,1),
  (0,0);

\qecho Polynomial P
select * from polynomial_p;

\qecho Polynomial Q
select * from polynomial_q;

create or replace function multiplicationPandQ()
returns table(p_times_q_coefficient bigint, p_times_q_degree integer) as
$$
        select cast(sum(m.c) as bigint), m.d
        from (select cast(p.coefficient as bigint) * cast(q.coefficient as bigint) as c, p.degree + q.degree as d
              from polynomial_p p, polynomial_q q) m
        group by(m.d)
        order by m.d desc;
$$ language sql;

\qecho Multiplication of P and Q
select * from multiplicationPandQ();

drop table if exists polynomial_p;
drop table if exists polynomial_q;

\qecho Problem 2
create table vector_x(index integer,
                      value integer);
insert into vector_x values
  (1,7),
  (2,-1),
  (3,2);

\qecho Vector X
select * from vector_x;

create table vector_y(index integer,
                      value integer);
insert into vector_y values
  (1,1),
  (2,1),
  (3,-10);

\qecho Vector Y
select * from vector_y;

create or replace function dotProductXandY() returns bigint as
$$
        select cast(sum(prod.mid) as bigint) as dotproductxandy
        from (select sum(x.value * y.value) as mid
              from vector_x x, vector_y y
              where x.index = y.index
              group by (x.index)) prod;
$$ language sql;

\qecho Dot product of X and Y
select * from dotProductXandY();

drop table if exists vector_x;
drop table if exists vector_y;

\qecho Problem 3
select distinct p.pid, p.name
from Person p
where p.city = 'Bloomington' and 0 < (select count(ps.pid)
                                      from personskill ps
                                      where ps.pid = p.pid and ps.skill != 'Programming' and
                                            0 < (select count(ps1.pid)
                                                 from worksFor w1, personSkill ps1
                                                 where w1.cname = 'Netflix' and
                                                 ps1.skill != 'AI' and
                                                 w1.pid = p.pid))
order by p.pid;

\qecho Problem 4
select distinct w.pid, w.cname, w.salary
from worksFor w
where 0 < (select count(w1.pid)
           from worksFor w1, Company c
           where w.salary > w1.salary and w.pid != w1.pid and w.cname = w1.cname and
                 0 = (select count(p.pid)
                      from Person p
                      where p.birthyear != 1990 and c.city = p.city))
order by w.pid;

\qecho Problem 5
select distinct p.pid, p.name
from person p
where p.city = 'Bloomington' and 1 >= (select count(k.pid1)
                                       from knows k
                                       where k.pid1 = p.pid and 3 <= (select count(ps.pid)
                                                                      from personskill ps
                                                                      where ps.pid = k.pid2
                                                                      group by ps.pid))
order by p.pid;
      
\qecho Problem 6
select distinct p.pid, p.name
from person p,
     (select count(aas) num
      from (select distinct ps.skill
            from personskill ps) aas) aascount 
where aascount.num - 3 = (select count(ps1.pid)
                          from personskill ps1
                          where ps1.pid = p.pid)
order by p.pid;

\qecho Problem 7
create or replace function KnowsTwoFromSameCompany(c text) returns bigint as
$$
      select count(countOfTwo) as num
      from (select count(k.pid2)
            from knows k, knows k1, worksfor wf, worksfor wf1, worksfor wf2
            where wf.cname = c and k.pid1 = wf.pid and k.pid2 = wf1.pid and c = wf1.cname and k1.pid1 = wf.pid and k1.pid2 = wf2.pid and c = wf2.cname and k.pid2 != k1.pid2
            group by (k.pid1)
            order by (k.pid1)) countOfTwo;
$$ language sql;

select distinct c.cname, KnowsTwoFromSameCompany(c.cname) as count
from company c
order by c.cname;

\qecho Problem 8
create function theyKnow(pid integer) returns table(pid integer) as
$$
      select k.pid2
      from knows k
      where k.pid1 = pid;
$$ language sql;

create view strictlyAboveFiftyFive as (select wf.pid
                                       from worksfor wf
                                       where wf.salary > 55000);

select distinct p.pid, p.name
from person p
where not exists (select pid
                  from theyKnow(p.pid)
                      intersect
                  select pid 
                  from strictlyAboveFiftyFive)
order by (p.pid);

\qecho Problem 9
create function theyKnowAtNetflixEightyFive(enteredPid integer) returns table(pid integer) as
$$
      select k.pid2
      from knows k, worksfor wf, person p
      where k.pid1 = enteredPid and k.pid2 = p.pid and wf.pid = p.pid and wf.cname = 'Netflix' and wf.salary >= 55000 and p.birthYear > 1985;
$$ language sql;

create view workAtNetflixEightyFive as (select p.pid
                                        from person p, worksfor wf
                                        where wf.pid = p.pid and wf.cname = 'Netflix' and wf.salary >= 55000 and p.birthYear > 1985);

select distinct p.pid, p.name
from person p
where not exists (select pid
                  from workAtNetflixEightyFive
                      except
                  select pid
                  from theyKnowAtNetflixEightyFive(p.pid))
order by p.pid;

\qecho Problem 10
create function employ(enteredCname text) returns table(pid integer) as
$$
      select wf.pid
      from worksfor wf
      where wf.cname = enteredCname;
$$ language sql;

create view lessThanFiftyFive as (select wf.pid
                                  from worksfor wf
                                  where wf.salary < 55000);

select distinct c.cname
from company c
where not exists (select pid
                  from employ(c.cname)
                      except
                  select pid
                  from lessThanFiftyFive)
order by c.cname;

\qecho Problem 11
create function jobSkills(enteredPid integer) returns table(skill text) as
$$
      select ps.skill
      from personskill ps
      where ps.pid = enteredPid;
$$ language sql;

create view ibmSkills as (select ps.skill
                          from personskill ps, worksfor wf
                          where ps.pid = wf.pid and wf.cname = 'IBM');

select distinct p.pid, p.name
from person p
where (select count(1)
       from (select skill
             from jobSkills(p.pid)
                intersect
             select skill
             from ibmSkills) q) > 2
order by (p.pid);

\qecho Problem 12
create function companyEmploys(enteredCname text) returns table(pid integer) as
$$
      select wf.pid
      from worksfor wf
      where wf.cname = enteredCname;
$$ language sql;

create view atLeastFifty as (select wf.pid
                             from worksfor wf
                             where wf.salary >= 50000);

select distinct c.cname
from company c
where (select mod(count(1), 2)
       from (select pid
             from companyEmploys(c.cname)
                intersect
             select pid
             from atLeastFifty) q) = 1
order by (c.cname);

\qecho Problem 13
create function allWhoKnows(pid integer) returns table(pid integer) as
$$
      select k.pid2
      from knows k
      where k.pid1 = pid;
$$ language sql;

create view atLeastThreeSkills as (select ps.pid
                                   from personskill ps, personskill ps1, personskill ps2
                                   where ps.pid = ps1.pid and ps.pid = ps2.pid and ps.skill != ps1.skill and ps1.skill != ps2.skill and ps.skill != ps2.skill);

select distinct p.pid, p.name
from person p
where (select count(1)
       from (select pid
             from allWhoKnows(p.pid)
                intersect
             select pid
             from atLeastThreeSkills) q) >= 2;

\qecho Problem 14
create function allTheyWhoKnow(pid integer) returns table(pid integer) as
$$
      select k.pid2
      from knows k
      where k.pid1 = pid;
$$ language sql;

select p1.pid, p2.pid
from person p1, person p2
where p1.pid != p2.pid and (select count(1)
                            from (select pid
                                  from allTheyWhoKnow(p1.pid)
                                      except
                                  select pid
                                  from allTheyWhoKnow(p2.pid)) q) = 0
                                and
                            (select count(1)
                             from (select pid
                                   from allTheyWhoKnow(p2.pid)
                                      except
                                   select pid
                                   from allTheyWhoKnow(p1.pid)) p) = 0
order by (p1.pid, p2.pid);

\qecho Problem 15
create function allTheyWhomKnowestCount(pid integer) returns table(pid integer) as
$$
      select k.pid2
      from knows k
      where k.pid1 = pid;
$$ language sql;

select p1.pid, p2.pid
from person p1, person p2
where p1.pid != p2.pid and (select count(1)
                            from (select count(alwkc.pid)
                                  from allTheyWhomKnowestCount(p1.pid) alwkc
                                    except
                                  select count(alwkc.pid)
                                  from allTheyWhomKnowestCount(p2.pid) alwkc) q) = 0
order by (p1.pid, p2.pid);

--Connect to default database
\c postgres;

--Dropping created database
DROP DATABASE ajj;