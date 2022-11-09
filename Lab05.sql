

( 1 )

postgres=# create or replace function multiply(x int , y int ) returns int as $$
postgres$# begin
postgres$# return x * y ;
postgres$# end;
postgres$# $$ language plpgsql;
CREATE FUNCTION

postgres=# select * from multiply(10,5) ;

 multiply
----------
       50
(1 row)

*********************************************************************

( 2 ) 


postgres=# create or replace function number_check(x int) returns text as $$
postgres$# begin
postgres$# if x%2 != 0 then
postgres$# return 'odd';
postgres$# else
postgres$# return 'even';
postgres$# end if;
postgres$# end;
postgres$# $$ language plpgsql;
CREATE FUNCTION
postgres=# select * from number_check(5) ;
 number_check
--------------
 odd
(1 row)

*************************************************************************

( 3 )


dbo=# create or replace function new_student(firstName text , lastName text) returns void as $$
dbo$# begin
dbo$# insert into student(std_id,first_name,last_name) values (10,firstName,lastName);
dbo$# end;
dbo$# $$ language plpgsql;
CREATE FUNCTION

dbo=# select * from new_student('ahmed' , 'mohamed');
 new_student
-------------

(1 row)


dbo=# select * from student;

 std_id | phone_num  | std_track | gender | birth_date | first_name | last_name |       contact
--------+------------+-----------+--------+------------+------------+-----------+----------------------
      2 | 0112243424 |        10 | male   | 2001-11-25 | samir      | ali       | (asd@sd.com,mans)
      1 | 0152420252 |        11 | male   | 2000-01-01 | ahmed      | radwan    | (a@a.com,mans)
      3 | 0102345745 |        10 | female | 2000-03-26 | esraa      | mahmoud   | (asdg@sfsd.com,mans)
      4 | 0105452518 |        11 | female | 2000-07-15 | logein     | maher     | (jkaf@sfjh.com,mans)
      5 | 0102345745 |        10 | female | 2000-03-26 | esraa      | mahmoud   | (asdg@sfsd.com,mans)
      6 | 0102345745 |        10 | female | 2000-03-26 | esraa      | mahmoud   | (asdg@sfsd.com,mans)
     10 |            |           |        | 2021-09-01 | ahmed      | mohamed   |
(7 rows)

************************************************************************

( 4 )



dbo=# create or replace function student_score(id int , subid int) returns int as $
$
dbo$# declare
dbo$#  student_score int ;
dbo$# begin
dbo$# select std_score into student_score from study where id = std_id and subid =
sub_id;
dbo$# return student_score;
dbo$# end;
dbo$# $$ language plpgsql;
CREATE FUNCTION

dbo=# select * from student_score(1,2);

 student_score
---------------
            45
(1 row)

************************************************************************

( 5 )

dbo=# create or replace function failed_students(id int) returns int as $$
dbo$# declare
dbo$# failed__students int;
dbo$# begin
dbo$#  select count(*) into failed__students from study where std_score < 50 and su
b_id = id ;
dbo$# return failed__students;
dbo$# end;
dbo$# $$ language plpgsql;
CREATE FUNCTION



dbo=# select * from failed_students(1);

 failed_students
-----------------
               1
(1 row)


*************************************************************************

( 6 )

dbo=# create or replace function avg_grds(name text) returns int as $$
dbo$# declare
dbo$# avg_grades int ;
dbo$# id int;
dbo$# begin
dbo$# select sub_id into id from subject where sub_name = name ;
dbo$# select avg(std_score) into avg_grades from study where sub_id = id ;
dbo$# return avg_grades ;
dbo$# end;
dbo$# $$ language plpgsql;
CREATE FUNCTION

dbo=# select * from avg_grds(1) ;

 avg_grds
----------
       45
(1 row)

************************************************************************

( 7 ) && ( 8 ) 

dbo=# create table persons(id int , name text , gender text);
CREATE TABLE

dbo=# create table staff_members(dept_name text , course_name text) inherits(person
s);

CREATE TABLE
dbo=# \d persons;

              Table "public.persons"
 Column |  Type   | Collation | Nullable | Default
--------+---------+-----------+----------+---------
 id     | integer |           |          |
 name   | text    |           |          |
 gender | text    |           |          |
Number of child tables: 1 (Use \d+ to list them.)


dbo=# \d staff_members;

              Table "public.staff_members"
   Column    |  Type   | Collation | Nullable | Default
-------------+---------+-----------+----------+---------
 id          | integer |           |          |
 name        | text    |           |          |
 gender      | text    |           |          |
 dept_name   | text    |           |          |
 course_name | text    |           |          |
Inherits: persons





