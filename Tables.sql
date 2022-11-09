dbo=# select * from student;

 std_id | phone_num  | std_track | gender | birth_date | first_name | last_name |       contact
--------+------------+-----------+--------+------------+------------+-----------+----------------------
      2 | 0112243424 |        10 | male   | 2001-11-25 | samir      | ali       | (asd@sd.com,mans)
      1 | 0152420252 |        11 | male   | 2000-01-01 | ahmed      | radwan    | (a@a.com,mans)
      3 | 0102345745 |        10 | female | 2000-03-26 | esraa      | mahmoud   | (asdg@sfsd.com,mans)
      4 | 0105452518 |        11 | female | 2000-07-15 | logein     | maher     | (jkaf@sfjh.com,mans)
(4 rows)

--------------------------------------------------------------------------------------------------------------

dbo=# select * from track;
 track_id | track_name
----------+------------            
       11 | python
       10 | php
(2 rows)

-------------------------------------


dbo=# select * from subject;
 sub_id | sub_name |         sub_desc          | max_score
--------+----------+---------------------------+-----------
      1 | html     | structure web page        |        50
      2 | css      | style web page            |        50
      3 | js       | functionality of web page |       100
      4 | py       | full stack web app        |       100
      5 | php      | backend web app           |       100
(5 rows)

-------------------------------------------------------------------------------

dbo=# select * from study;
 std_id | sub_id | std_score | exam_date  | track_id
--------+--------+-----------+------------+----------
      1 |      1 |        49 | 2021-08-27 |       11
      1 |      2 |        49 | 2021-08-27 |       11
      1 |      3 |        98 | 2021-08-27 |       11
(3 rows)




















---------------------------------------------------------------------------------------------------------

