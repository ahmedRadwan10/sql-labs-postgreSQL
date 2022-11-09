                                              
                                                                     => Lab solution <=        
-------------------------------------------------------------------------------------------------------------------
1-
	create type gndr as enum ( 'male' , 'female' ) ;
	alter table student add column gender gndr ;
------------------------------------------------------------------------------------
2-
	alter table student add column birth_date date ;
------------------------------------------------------------------------------------
3-
	alter table student drop column name ;
	alter table student add column first_name text ;
	alter table student add column last_name text ;
------------------------------------------------------------------------------------
4-
	alter table student drop column email ;
	alter table student drop column address ;
	create type contact_info as ( email text , address text ) ;
	alter table student add column contact contact_info ;
-------------------------------------------------------------------------------------
5- 	
	alter table student alter std_id set data type smallInt ;
-------------------------------------------------------------------------------------
6-
	alter table study add constraint track_id_fk foreign key(track_id) references 	 	
	track(track_id) on delete cascade;
-------------------------------------------------------------------------------------

7-
																	insert into student ( std_id , phone_num , std_track , gender , birth_date , first_name , last_name , contact )
values ( 3 , '0102345745' , 10 , 'female' , '2000-03-26' , 'esraa' , 'mahmoud' ,( 'asdg@sfsd.com' , 'mans' ) ) ;

insert into track ( track_id , track_name )
values ( 11 , 'python' );

insert into subject ( sub_id , sub_name , sub_desc , max_score ) 
values ( 1 , 'html' , 'structure web page', 50 );

insert into study( std_id , sub_id , std_score , exam_date , track_id )
values ( 1 , 1 , 49 , now() , 11 );

-------------------------------------------------------------------------------------------------------------------
8-

 dbo=# select * from student;

 std_id | phone_num  | std_track | gender | birth_date | first_name | last_name |       contact
--------+------------+-----------+--------+------------+------------+-----------+----------------------
      2 | 0112243424 |        10 | male   | 2001-11-25 | samir      | ali       | (asd@sd.com,mans)
      1 | 0152420252 |        11 | male   | 2000-01-01 | ahmed      | radwan    | (a@a.com,mans)
      3 | 0102345745 |        10 | female | 2000-03-26 | esraa      | mahmoud   | (asdg@sfsd.com,mans)
      4 | 0105452518 |        11 | female | 2000-07-15 | logein     | maher     | (jkaf@sfjh.com,mans)
(4 rows)

---------------------------------------------------------------------------------------------------------------------
9-

dbo=# select * from student where gender = 'male' ;

 std_id | phone_num  | std_track | gender | birth_date | first_name | last_name |      contact
--------+------------+-----------+--------+------------+------------+-----------+-------------------
      2 | 0112243424 |        10 | male   | 2001-11-25 | samir      | ali       | (asd@sd.com,mans)
      1 | 0152420252 |        11 | male   | 2000-01-01 | ahmed      | radwan    | (a@a.com,mans)
(2 rows)

----------------------------------------------------------------------------------------------------------------------
10-

dbo=# select count(case when gender='female' then 1 end) as female_count from student;

 female_count
--------------
            2
(1 row)


----------------------------------------------------------------------------------------------------------------------
11- 

dbo=# select * from student where birth_date < '1992-10-01' ;

 std_id | phone_num | std_track | gender | birth_date | first_name | last_name | contact
--------+-----------+-----------+--------+------------+------------+-----------+---------
(0 rows)

----------------------------------------------------------------------------------------------------------------------

12-

dbo=# select * from student where gender = 'male' and birth_date < '1991-10-01';
 std_id | phone_num | std_track | gender | birth_date | first_name | last_name | contact
--------+-----------+-----------+--------+------------+------------+-----------+---------
(0 rows)

-----------------------------------------------------------------------------------------------------------------------

13-

dbo=# select * from subject order by max_score desc;

 sub_id | sub_name |         sub_desc          | max_score
--------+----------+---------------------------+-----------
      3 | js       | functionality of web page |       100
      4 | py       | full stack web app        |       100
      5 | php      | backend web app           |       100
      1 | html     | structure web page        |        50
      2 | css      | style web page            |        50
(5 rows)

-----------------------------------------------------------------------------------------------------------------------

14-

dbo=# select max(max_score) from subject ;

 max
-----
 100
(1 row)

----------------------------------------------------------------------------------------------------------------------

15-

dbo=# select first_name from student where first_name like 'a%' ;

 first_name
------------
 ahmed
(1 row)

----------------------------------------------------------------------------------------------------------------------

16-

dbo=# select * from student where first_name = 'mahamed';

 std_id | phone_num | std_track | gender | birth_date | first_name | last_name | contact
--------+-----------+-----------+--------+------------+------------+-----------+---------
(0 rows)


dbo=#

-----------------------------------------------------------------------------------------------------------------------

17-

dbo=# select count(case when gender ='male' then 1 end) as male_count,
count(case when gender='female' then 1 end) as female_count from student;

 male_count | female_count
------------+--------------
          2 |            2
(1 row)

-----------------------------------------------------------------------------------------------------------------------	

18-

dbo=# select * from student where first_name in ( select first_name from student group by first_name having count(*) > 2 );

 std_id | phone_num | std_track | gender | birth_date | first_name | last_name | contact
--------+-----------+-----------+--------+------------+------------+-----------+---------
(0 rows)


dbo=# insert into student ( std_id , phone_num , std_track , gender , birth_date , first_name , last_name , contact )
dbo-# values ( 5 , '0102345745' , 10 , 'female' , '2000-03-26' , 'esraa' , 'mahmoud' ,( 'asdg@sfsd.com' , 'mans' ) ) ;

INSERT 0 1

dbo=# insert into student ( std_id , phone_num , std_track , gender , birth_date , first_name , last_name , contact )
dbo-# values ( 6 , '0102345745' , 10 , 'female' , '2000-03-26' , 'esraa' , 'mahmoud' ,( 'asdg@sfsd.com' , 'mans' ) ) ;

INSERT 0 1

dbo=# select * from student where first_name in ( select first_name from student group by first_name having count(*) > 2 );

 std_id | phone_num  | std_track | gender | birth_date | first_name | last_name |       contact
--------+------------+-----------+--------+------------+------------+-----------+----------------------
      3 | 0102345745 |        10 | female | 2000-03-26 | esraa      | mahmoud   | (asdg@sfsd.com,mans)
      5 | 0102345745 |        10 | female | 2000-03-26 | esraa      | mahmoud   | (asdg@sfsd.com,mans)
      6 | 0102345745 |        10 | female | 2000-03-26 | esraa      | mahmoud   | (asdg@sfsd.com,mans)
(3 rows)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 ( 19 ) 


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




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


 ( 20 ) 



  dbo=# 
create view myview2 as select student.first_name , student.last_name , subject.sub_name , subject.max_score from student join subject on subject.std_id = student.std
_id;
CREATE VIEW

dbo=# select * from myview2 ;

 first_name | last_name | sub_name | max_score
------------+-----------+----------+-----------
(0 rows)


