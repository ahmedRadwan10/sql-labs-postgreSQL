                                              
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


  
    
