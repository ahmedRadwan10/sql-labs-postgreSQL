                                              
                                                                         ( 1 )
             - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

   dbo=# select * from study;

  std_id | sub_id | std_score | exam_date | track_id
  --------+--------+-----------+-----------+----------
  (0 rows)


  dbo=# begin transaction
  dbo-# ;
  BEGIN

  dbo=*# insert into study (std_id,sub_id,std_score,exam_date,track_id) valu
  es (1,1,45,now(),11);

  INSERT 0 1
  dbo=*# insert into study (std_id,sub_id,std_score,exam_date,track_id) valu
  es (1,2,45,now(),11);

  INSERT 0 1
  dbo=*# insert into study (std_id,sub_id,std_score,exam_date,track_id) valu
  es (1,3,99,now(),11);

  INSERT 0 1
  dbo=*# commit;
 COMMIT

 dbo=# select * from study;

 std_id | sub_id | std_score | exam_date  | track_id
 -------+--------+-----------+------------+----------
      1 |      1 |        45 | 2021-08-29 |       11
      1 |      2 |        45 | 2021-08-29 |       11
      1 |      3 |        99 | 2021-08-29 |       11
(3 rows)


                              -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    ( 2 )
   

  dbo=# begin transaction;
  BEGIN

  dbo=*# savepoint a1;
  SAVEPOINT

  dbo=*# insert into study (std_id,sub_id,std_score,exam_date,track_id) valu
  es (2,1,45,now(),10);
  INSERT 0 1

  dbo=*# insert into study (std_id,sub_id,std_score,exam_date,track_id) valu
  es (2,2,45,now(),10);
  INSERT 0 1

  dbo=*# insert into study (std_id,sub_id,std_score,exam_date,track_id) valu
  es (2,3,95,now(),10);
  INSERT 0 1

  dbo=*# rollback to savepoint a1;
  ROLLBACK

  dbo=*# commit;
  COMMIT

  dbo=# select * from study;

   std_id | sub_id | std_score | exam_date  | track_id
   -------+--------+-----------+------------+----------
      1 |      1 |        45 | 2021-08-29 |       11
      1 |      2 |        45 | 2021-08-29 |       11
      1 |      3 |        99 | 2021-08-29 |       11
  (3 rows)

-------------------------------------------------------------------------------------------------------------------	
	

	( 3 )

    dbo=# create view student_view as select student.first_name ,student.last_name ,track.track_name from student join track on std_track = track_id;
CREATE VIEW

dbo=# select * from student_view ;

 first_name | last_name | track_name
------------+-----------+------------
 samir      | ali       | php
 ahmed      | radwan    | python
 esraa      | mahmoud   | php
 logein     | maher     | python
 esraa      | mahmoud   | php
 esraa      | mahmoud   | php
(6 rows)


  ----------------------------------------------------------------------------------------------------------------------------------

 ( 4 )
  
 

  dbo=# create view track_view as select track.track_name , study.sub_id from track join study on study.track_id = track.track_id;
CREATE VIEW

dbo=# select * from track_view;
dbo=# select * from track_view ;

 track_name | sub_id
------------+--------
 python     |      1
 python     |      2
 python     |      3
(3 rows)

------------------------------------------------------------------------------------------------------------------------------------------------

 ( 5 ) 




  dbo=# create view myview as select student.first_name , student.last_name , subject.sub_name from student join subject on subject.std_id = student.std_id;
CREATE VIEW

dbo=# select * from myview ;

 first_name | last_name | sub_name
------------+-----------+----------
(0 rows)



--------------------------------------------------------------------------------------------------------------------------

 ( 6 )

  

  
dbo=# create view std_v as select student.first_name , student.last_name , study.std_score , study.exam_date from student join study on student.std_id = study.std_id ;
CREATE VIEW

dbo=# select * from std_v ;

 first_name | last_name | std_score | exam_date
------------+-----------+-----------+------------
 ahmed      | radwan    |        45 | 2021-08-29
 ahmed      | radwan    |        45 | 2021-08-29
 ahmed      | radwan    |        99 | 2021-08-29




------------------------------------------------------------------------------------------------------------------------

 ( 7 )


  dbo=# create temporary view sdj_v as select sub_name,max_score from subject ;
CREATE VIEW


                    
dbo=# select * from sdj_v ;

 sub_name | max_score
----------+-----------
 html     |        50
 css      |        50
 js       |       100
 py       |       100
 php      |       100
(5 rows)


---------------------------------------------------------------------------------------------



  ( 8 ) 





  dbo=# create user radwan;
CREATE ROLE

dbo=# create database dtbs;
CREATE DATABASE

dbo=# grant all privileges on database dtbs to radwan ;
GRANT


-------------------------------------------------------------------------------------------------

  ( 9 )



  dbo=# create database iti ;
CREATE DATABASE

dbo=# create schema itischema ;
CREATE SCHEMA


dbo=# create table itischema.tracks(id int primary key , name text , description text );
CREATE TABLE


dbo=# create table itischema.students(id int primary key , full_name text , email text , phone_number text );
CREATE TABLE


  
    
