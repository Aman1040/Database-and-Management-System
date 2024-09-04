SQL> spool
currently spooling to C:\Users\aman\Desktop\desktop\5sem\DBMS\sailors.sql
SQL> @"C:\Users\aman\Desktop\desktop\5sem\DBMS\sailors1.sql"
drop table Reserves
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


drop table Sailors
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


drop table Boats
           *
ERROR at line 1:
ORA-00942: table or view does not exist 



Table created.


Table created.


Table created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
BIN$4rVtfXuxTG+4kuDwbqcsWA==$0 TABLE                                            
BOATS                          TABLE                                            
COURSE                         TABLE                                            
PARTICIPANT                    TABLE                                            
RESERVES                       TABLE                                            
SAILORS                        TABLE                                            

6 rows selected.

SQL> commit;

Commit complete.

SQL> select * from sailors;

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        22 Dustin                        7         45                           
        29 Brutus                        1         33                           
        31 Lubber                        8       55.5                           
        32 Andy                          8       25.5                           
        58 Rusty                        10         35                           
        64 Horataio                      7         35                           
        71 Zorba                        10         16                           
        74 Horataio                      9         35                           
        85 Art                           3       25.5                           
        95 Bob                           3       63.5                           

10 rows selected.

SQL> select * from reserves;

       SID        BID DAY                                                       
---------- ---------- ---------                                                 
        22        101 10-OCT-98                                                 
        22        102 10-OCT-98                                                 
        22        103 08-OCT-98                                                 
        22        104 07-OCT-98                                                 
        31        102 10-NOV-98                                                 
        31        103 06-NOV-98                                                 
        31        104 12-NOV-98                                                 
        64        101 05-SEP-98                                                 
        64        102 08-SEP-98                                                 
        74        103 08-SEP-98                                                 

10 rows selected.

SQL> select * from boats;

       BID BNAME                COLOR                                           
---------- -------------------- --------------------                            
       101 Interlake            blue                                            
       102 Interlake            red                                             
       103 Clipper              green                                           
       104 Marine               red                                             

SQL> select sname,age
  2  from sailors
  3  where age>40;

SNAME                       AGE                                                 
-------------------- ----------                                                 
Dustin                       45                                                 
Lubber                     55.5                                                 
Bob                        63.5                                                 

SQL> select sname,age
  2  from sailors
  3  where age=(select max(age)
  4  			from sailors);

SNAME                       AGE                                                 
-------------------- ----------                                                 
Bob                        63.5                                                 

SQL> select sname
  2  from sailors
  3  where sid=(select sid from reserves
  4  		where bid =103);
where sid=(select sid from reserves
           *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row 


SQL> select sname
  2  from sailors
  3  where sid in (select sid from reserves
  4  		where bid =103);

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Lubber                                                                          
Horataio                                                                        

SQL> select sid
  2  from reserves
  3  where bid in (select bid
  4  	     from boats
  5  	     where color=red);
	     where color=red)
	                 *
ERROR at line 5:
ORA-00904: "RED": invalid identifier 


SQL> select sid
  2  from reserves
  3  where bid in (select bid
  4  	     from boats
  5  	     where color="red");
	     where color="red")
	                 *
ERROR at line 5:
ORA-00904: "red": invalid identifier 


SQL> select sid
  2  from reserves
  3  where bid in (select bid
  4  	     from boats
  5  	     having color="red");
	     having color="red")
	                  *
ERROR at line 5:
ORA-00904: "red": invalid identifier 


SQL> select sid
  2  from reserves
  3  where bid in (select bid
  4  	     from boats
  5  	     having color='red');

       SID                                                                      
----------                                                                      
        22                                                                      
        22                                                                      
        22                                                                      
        22                                                                      
        31                                                                      
        31                                                                      
        31                                                                      
        64                                                                      
        64                                                                      
        74                                                                      

10 rows selected.

SQL> commit;

Commit complete.

SQL> select sname
  2  from reserves join sailors
  3  where bid in (select bid
  4  	     from boats
  5  	     having color='red');
where bid in (select bid
*
ERROR at line 3:
ORA-00905: missing keyword 


SQL> select sname
  2  from  sailors
  3  where sid in ( select sid
  4  		from reserves
  5  		where bid in (select bid
  6  	     			from boats
  7  	    			 having color='red');
	    			 having color='red')
	    			                   *
ERROR at line 7:
ORA-00907: missing right parenthesis 


SQL> select sname
  2  from  sailors
  3  where sid in ( select sid
  4  		from reserves
  5  		where bid in (select bid
  6  	     			from boats
  7  	    			 having color='red'));

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Lubber                                                                          
Horataio                                                                        
Horataio                                                                        

SQL> select color
  2  from boats b join reserves r
  3  where b.bid=r.bid and bid in( select bid
  4  				from sailors s join reserves r
  5  				where s.sid=r.sid and sname="Lubber");
where b.bid=r.bid and bid in( select bid
*
ERROR at line 3:
ORA-00905: missing keyword 


SQL> select color
  2  from boats b JOIN reserves r
  3  ON b.bid=r.bid WHERE bid in( select bid
  4  				from sailors s JOIN reserves r
  5  				ON s.sid=r.sid WHERE sname="Lubber");
ON b.bid=r.bid WHERE bid in( select bid
                     *
ERROR at line 3:
ORA-00918: column ambiguously defined 


SQL> select color
  2  from boats b JOIN reserves r
  3  ON b.bid=r.bid WHERE r.bid in( select bid
  4  				from sailors s JOIN reserves r
  5  				ON s.sid=r.sid WHERE s.sname="Lubber");
				ON s.sid=r.sid WHERE s.sname="Lubber")
				                             *
ERROR at line 5:
ORA-00904: "Lubber": invalid identifier 


SQL> select color
  2  from boats b JOIN reserves r
  3  ON b.bid=r.bid WHERE b.bid in( select s.bid
  4  				from sailors s JOIN reserves r
  5  				ON s.sid=r.sid WHERE s.sname="Lubber");
				ON s.sid=r.sid WHERE s.sname="Lubber")
				                             *
ERROR at line 5:
ORA-00904: "Lubber": invalid identifier 


SQL> select color
  2  from boats b JOIN reserves r
  3  ON b.bid=r.bid WHERE b.bid in( select r.bid
  4  				from sailors s JOIN reserves r
  5  				ON s.sid=r.sid WHERE s.sname="Lubber");
				ON s.sid=r.sid WHERE s.sname="Lubber")
				                             *
ERROR at line 5:
ORA-00904: "Lubber": invalid identifier 


SQL> select color
  2  from boats b JOIN reserves r
  3  ON b.bid=r.bid WHERE b.bid in( select r.bid
  4  				from sailors s JOIN reserves a
  5  				ON s.sid=a.sid WHERE s.sname="Lubber");
				ON s.sid=a.sid WHERE s.sname="Lubber")
				                             *
ERROR at line 5:
ORA-00904: "Lubber": invalid identifier 


SQL> commit;

Commit complete.

SQL> select color
  2  from boats b JOIN reserves r
  3  ON b.bid=r.bid WHERE b.bid in( select r.bid
  4  				from sailors s JOIN reserves a
  5  				ON s.sid=a.sid WHERE s.sname="Lubber");
				ON s.sid=a.sid WHERE s.sname="Lubber")
				                             *
ERROR at line 5:
ORA-00904: "Lubber": invalid identifier 


SQL> select color
  2  from boats b,reserves r,sailors s
  3  where b.bid=r.bid and s.sid=r.bid and sname="Lubber";
where b.bid=r.bid and s.sid=r.bid and sname="Lubber"
                                            *
ERROR at line 3:
ORA-00904: "Lubber": invalid identifier 


SQL> select color
  2  from boats b,reserves r,sailors s
  3  where b.bid=r.bid and s.sid=r.bid and sname='Lubber';

no rows selected

SQL> select color
  2  from boats b JOIN reserves r
  3  ON b.bid=r.bid WHERE b.bid in( select r.bid
  4  				from sailors s JOIN reserves a
  5  				ON s.sid=a.sid WHERE s.sname='Lubber');

COLOR                                                                           
--------------------                                                            
blue                                                                            
red                                                                             
green                                                                           
red                                                                             
red                                                                             
green                                                                           
red                                                                             
blue                                                                            
red                                                                             
green                                                                           

10 rows selected.

SQL> select sname
  2  from sailors s JOIN reserves r
  3  ON s.sid=r.sid;

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Lubber                                                                          
Lubber                                                                          
Lubber                                                                          
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        

10 rows selected.

SQL> commit;

Commit complete.

SQL> select sname
  2  from sailors s JOIN reserves r
  3  On s.sid=r.sid where r.bid in ( select r.bid
  4  				from boats b JOIN reserves a
  5  				ON b.bid=a.bid WHERE b.color in ('red','green');
				ON b.bid=a.bid WHERE b.color in ('red','green')
				                                              *
ERROR at line 5:
ORA-00907: missing right parenthesis 


SQL> select sname
  2  from sailors s JOIN reserves r
  3  On s.sid=r.sid where r.bid in ( select r.bid
  4  				from boats b JOIN reserves a
  5  				ON b.bid=a.bid WHERE b.color in ('red','green'));

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Lubber                                                                          
Lubber                                                                          
Lubber                                                                          
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        

10 rows selected.

SQL> select sname
  2  from sailors s JOIN reserves r
  3  On s.sid=r.sid where r.bid in ( select r.bid
  4  				from boats b JOIN reserves a
  5  				ON b.bid=a.bid WHERE b.color ='red' and 'green');
				ON b.bid=a.bid WHERE b.color ='red' and 'green')
				                                               *
ERROR at line 5:
ORA-00920: invalid relational operator 


SQL> select sname
  2  from sailors s JOIN reserves r
  3  On s.sid=r.sid where r.bid in ( select r.bid
  4  				from boats b JOIN reserves a
  5  				ON b.bid=a.bid WHERE b.color ='red' and b.color= 'green');

no rows selected

SQL> select sname
  2  from sailors s JOIN reserves r
  3  On s.sid=r.sid where r.bid in ( select r.bid
  4  				from boats b JOIN reserves a
  5  				ON b.bid=a.bid
  6  				WHERE b.color ='red' or b.color= 'green');

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Lubber                                                                          
Lubber                                                                          
Lubber                                                                          
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        

10 rows selected.

SQL> commit;

Commit complete.

SQL> select sname
  2  from sailors s JOIN reserves r
  3  On s.sid=r.sid where r.bid in ( select r.bid
  4  				from boats b JOIN reserves a
  5  				ON b.bid=a.bid
  6  				WHERE b.color ='red' MINUS b.color= 'green');
				WHERE b.color ='red' MINUS b.color= 'green')
				                           *
ERROR at line 6:
ORA-00928: missing SELECT keyword 


SQL> SELECT sname
  2  FROM sailors s JOIN reserves r
  3  ON s.sid = r.sid
  4  WHERE r.bid IN (
  5      SELECT a.bid
  6      FROM boats b
  7      JOIN reserves a ON b.bid = a.bid
  8      WHERE b.color = 'red'
  9      MINUS
 10      SELECT a.bid
 11      FROM boats b
 12      JOIN reserves a ON b.bid = a.bid
 13      WHERE b.color = 'green'
 14  );

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Dustin                                                                          
Lubber                                                                          
Lubber                                                                          
Horataio                                                                        

SQL> select * from sailors;

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        22 Dustin                        7         45                           
        29 Brutus                        1         33                           
        31 Lubber                        8       55.5                           
        32 Andy                          8       25.5                           
        58 Rusty                        10         35                           
        64 Horataio                      7         35                           
        71 Zorba                        10         16                           
        74 Horataio                      9         35                           
        85 Art                           3       25.5                           
        95 Bob                           3       63.5                           

10 rows selected.

SQL> select * from reserves;

       SID        BID DAY                                                       
---------- ---------- ---------                                                 
        22        101 10-OCT-98                                                 
        22        102 10-OCT-98                                                 
        22        103 08-OCT-98                                                 
        22        104 07-OCT-98                                                 
        31        102 10-NOV-98                                                 
        31        103 06-NOV-98                                                 
        31        104 12-NOV-98                                                 
        64        101 05-SEP-98                                                 
        64        102 08-SEP-98                                                 
        74        103 08-SEP-98                                                 

10 rows selected.

SQL> select * from boats;

       BID BNAME                COLOR                                           
---------- -------------------- --------------------                            
       101 Interlake            blue                                            
       102 Interlake            red                                             
       103 Clipper              green                                           
       104 Marine               red                                             

SQL> select sid
  2  from sailors s,reserves r
  3  where s.rating=10 OR r.bid=104;
select sid
       *
ERROR at line 1:
ORA-00918: column ambiguously defined 


SQL> select sid
  2  from sailors s,reserves r
  3  ON s.sid=r.sid;
ON s.sid=r.sid
*
ERROR at line 3:
ORA-00933: SQL command not properly ended 


SQL> select sid
  2  from sailors s,reserves r
  3  ON s.sid=r.sid;
ON s.sid=r.sid
*
ERROR at line 3:
ORA-00933: SQL command not properly ended 


SQL> where s.rating=10 OR r.bid=104;
SP2-0734: unknown command beginning "where s.ra..." - rest of line ignored.
SQL> commit;

Commit complete.

SQL> select sid
  2  from sailors s JOIN reserves r
  3  ON s.sid=r.sid;
select sid
       *
ERROR at line 1:
ORA-00918: column ambiguously defined 


SQL> select sid
  2  from sailors s JOIN reserves r
  3  ON s.sid=r.sid
  4  where s.rating=10 OR r.bid=104;
select sid
       *
ERROR at line 1:
ORA-00918: column ambiguously defined 


SQL> select * from sailors;

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        22 Dustin                        7         45                           
        29 Brutus                        1         33                           
        31 Lubber                        8       55.5                           
        32 Andy                          8       25.5                           
        58 Rusty                        10         35                           
        64 Horataio                      7         35                           
        71 Zorba                        10         16                           
        74 Horataio                      9         35                           
        85 Art                           3       25.5                           
        95 Bob                           3       63.5                           

10 rows selected.

SQL> SELECT sid
  2  from sailors s JOIN reserves r
  3  ON s.sid=r.sid
  4  where s.rating=10 OR r.bid=104;
SELECT sid
       *
ERROR at line 1:
ORA-00918: column ambiguously defined 


SQL> SELECT s.sid
  2  from sailors s JOIN reserves r
  3  ON s.sid=r.sid
  4  where s.rating=10 OR r.bid=104;

       SID                                                                      
----------                                                                      
        22                                                                      
        31                                                                      

SQL> commit;

Commit complete.

SQL> SELECT s.sname
  2  from sailors s JOIN reserves r
  3  ON s.sid=r.sid
  4  where  r.bid=103;

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Lubber                                                                          
Horataio                                                                        

SQL> commit;

Commit complete.

SQL> spool off;
SQL> spool
currently spooling to C:\Users\aman\Desktop\desktop\5sem\DBMS\sailors.sql
SQL> commit;

Commit complete.

SQL> SELECT s.sname
  2  from sailors s JOIN reserves r
  3  ON s.sid=r.sid
  4  where  r.bid=103;

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Lubber                                                                          
Horataio                                                                        

SQL> select * from sailors;

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        22 Dustin                        7         45                           
        29 Brutus                        1         33                           
        31 Lubber                        8       55.5                           
        32 Andy                          8       25.5                           
        58 Rusty                        10         35                           
        64 Horataio                      7         35                           
        71 Zorba                        10         16                           
        74 Horataio                      9         35                           
        85 Art                           3       25.5                           
        95 Bob                           3       63.5                           

10 rows selected.

SQL> select * from reserves;

       SID        BID DAY                                                       
---------- ---------- ---------                                                 
        22        101 10-OCT-98                                                 
        22        102 10-OCT-98                                                 
        22        103 08-OCT-98                                                 
        22        104 07-OCT-98                                                 
        31        102 10-NOV-98                                                 
        31        103 06-NOV-98                                                 
        31        104 12-NOV-98                                                 
        64        101 05-SEP-98                                                 
        64        102 08-SEP-98                                                 
        74        103 08-SEP-98                                                 

10 rows selected.

SQL> select * from boat;
select * from boat
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> select * from boats;

       BID BNAME                COLOR                                           
---------- -------------------- --------------------                            
       101 Interlake            blue                                            
       102 Interlake            red                                             
       103 Clipper              green                                           
       104 Marine               red                                             

SQL> select sname from sailors
  2  where sid in (select sid from reserves
  3  	      where bid =103);

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Lubber                                                                          
Horataio                                                                        

SQL> select sname
  2  from sailors
  3  where sid in (select sid
  4                from reserves
  5                where bid=103 and count(bid)=1);
              where bid=103 and count(bid)=1)
                                *
ERROR at line 5:
ORA-00934: group function is not allowed here 


SQL> SELECT sname
  2  FROM sailors
  3  WHERE sid IN (
  4      SELECT sid
  5      FROM reserves
  6      WHERE bid = 103
  7      GROUP BY sid
  8      HAVING COUNT(bid) = 1
  9  );

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Lubber                                                                          
Horataio                                                                        

SQL> select sname
  2  from sailors
  3  where rating > (select max(rating)
  4  		from sailors
  5                  where sname ='Horatio');

no rows selected

SQL> select * from sailors;

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        22 Dustin                        7         45                           
        29 Brutus                        1         33                           
        31 Lubber                        8       55.5                           
        32 Andy                          8       25.5                           
        58 Rusty                        10         35                           
        64 Horataio                      7         35                           
        71 Zorba                        10         16                           
        74 Horataio                      9         35                           
        85 Art                           3       25.5                           
        95 Bob                           3       63.5                           

10 rows selected.

SQL> select sname
  2  from sailors
  3  where rating > (select rating
  4  		from sailors
  5                  where sname ='Horatio');

no rows selected

SQL> commit;

Commit complete.

SQL> select sname
  2  from sailors
  3  where sid in (select sid
  4  	      from sailors
  5  	      group by sid
  6  	      having max(rating));
	      having max(rating))
	                        *
ERROR at line 6:
ORA-00920: invalid relational operator 


SQL> select sname
  2  from sailors
  3  where rating =(select max(rating) from sailors);

SNAME                                                                           
--------------------                                                            
Rusty                                                                           
Zorba                                                                           

SQL> select sname
  2  from sailors
  3  where rating >(select rating from sailors
  4  	       where sname='Horatio');

no rows selected

SQL> select * from reserves;

       SID        BID DAY                                                       
---------- ---------- ---------                                                 
        22        101 10-OCT-98                                                 
        22        102 10-OCT-98                                                 
        22        103 08-OCT-98                                                 
        22        104 07-OCT-98                                                 
        31        102 10-NOV-98                                                 
        31        103 06-NOV-98                                                 
        31        104 12-NOV-98                                                 
        64        101 05-SEP-98                                                 
        64        102 08-SEP-98                                                 
        74        103 08-SEP-98                                                 

10 rows selected.

SQL> select bid,count(bid) from reserves group by bid;

       BID COUNT(BID)                                                           
---------- ----------                                                           
       102          3                                                           
       101          2                                                           
       104          2                                                           
       103          3                                                           

SQL> select sid,count(bid) from reserves group by sid;

       SID COUNT(BID)                                                           
---------- ----------                                                           
        22          4                                                           
        31          3                                                           
        64          2                                                           
        74          1                                                           

SQL> commit;

Commit complete.

SQL> commit;

Commit complete.

SQL> spool off;
SQL> spool
currently spooling to C:\Users\aman\Desktop\desktop\5sem\DBMS\sailors.sql
SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
BOATS                          TABLE                                            
RESERVES                       TABLE                                            
SAILORS                        TABLE                                            

SQL> select * from boats;

       BID BNAME                COLOR                                           
---------- -------------------- --------------------                            
       101 Interlake            blue                                            
       102 Interlake            red                                             
       103 Clipper              green                                           
       104 Marine               red                                             

SQL> select * from reserves;

       SID        BID DAY                                                       
---------- ---------- ---------                                                 
        22        101 10-OCT-98                                                 
        22        102 10-OCT-98                                                 
        22        103 08-OCT-98                                                 
        22        104 07-OCT-98                                                 
        31        102 10-NOV-98                                                 
        31        103 06-NOV-98                                                 
        31        104 12-NOV-98                                                 
        64        101 05-SEP-98                                                 
        64        102 08-SEP-98                                                 
        74        103 08-SEP-98                                                 

10 rows selected.

SQL> select * from sailors;

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        22 Dustin                        7         45                           
        29 Brutus                        1         33                           
        31 Lubber                        8       55.5                           
        32 Andy                          8       25.5                           
        58 Rusty                        10         35                           
        64 Horataio                      7         35                           
        71 Zorba                        10         16                           
        74 Horataio                      9         35                           
        85 Art                           3       25.5                           
        95 Bob                           3       63.5                           

10 rows selected.

SQL> select bid,count(bid)
  2  from reserves
  3  group by bid;

       BID COUNT(BID)                                                           
---------- ----------                                                           
       102          3                                                           
       101          2                                                           
       104          2                                                           
       103          3                                                           

SQL> select bid,count(bid)
  2  from reserves
  3  group by bid;

       BID COUNT(BID)                                                           
---------- ----------                                                           
       102          3                                                           
       101          2                                                           
       104          2                                                           
       103          3                                                           

SQL> order by desc;
SP2-0734: unknown command beginning "order by d..." - rest of line ignored.
SQL> select sname
  2  from sailors
  3  where sid in (
  4  	      select sid
  5  	      from reserves
  6                where bid=101 and bid=102 and bid=103 and bid=104);

no rows selected

SQL> select sname
  2  from sailors
  3  where sid in (
  4  	      select sid
  5  	      from reserves
  6                where bid=101
  7  		union
  8  		select sid
  9  	      from reserves
 10                where bid=102
 11  		union
 12  		select sid
 13  	      from reserves
 14                where bid=103
 15                union
 16                select sid
 17  	      from reserves
 18                where bid=104);

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Lubber                                                                          
Horataio                                                                        
Horataio                                                                        

SQL> select sname
  2  from sailors
  3  where sid in (
  4  	      select sid
  5  	      from reserves
  6                where bid=101
  7  		intersect
  8  		select sid
  9  	      from reserves
 10                where bid=102
 11  		intersect
 12  		select sid
 13  	      from reserves
 14                where bid=103
 15                intersect
 16                select sid
 17  	      from reserves
 18                where bid=104);

SNAME                                                                           
--------------------                                                            
Dustin                                                                          

SQL> select sname
  2  from sailors
  3  where sid in (
  4  	      select sid
  5  	      from reserves
  6                where bid=101 and bid=102 and bid=103 and bid=104);

no rows selected

SQL> select cid,count(bid)
  2  from reserves
  3  group by cid;
group by cid
         *
ERROR at line 3:
ORA-00904: "CID": invalid identifier 


SQL> select sid,count(bid)
  2  from reserves
  3  group by sid;

       SID COUNT(BID)                                                           
---------- ----------                                                           
        22          4                                                           
        31          3                                                           
        64          2                                                           
        74          1                                                           

SQL> select sname
  2  from sailors
  3  where sid in (select sid
  4  	      from reserves
  5                group by sid
  6                where count(bid)=4);
              where count(bid)=4)
              *
ERROR at line 6:
ORA-00907: missing right parenthesis 


SQL> select sname
  2  from sailors
  3  where sid in (select sid
  4  	      from reserves
  5                group by sid
  6                having count(bid)=4);

SNAME                                                                           
--------------------                                                            
Dustin                                                                          

SQL> select count(sid)
  2  form sailors;
form sailors
     *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> select count(sid)
  2  from sailors;

COUNT(SID)                                                                      
----------                                                                      
        10                                                                      

SQL> select count(sid)
  2  from sailors
  3  group by sname;

COUNT(SID)                                                                      
----------                                                                      
         1                                                                      
         1                                                                      
         1                                                                      
         1                                                                      
         1                                                                      
         1                                                                      
         1                                                                      
         2                                                                      
         1                                                                      

9 rows selected.

SQL> select count(sname)
  2  from sailors
  3  group by sname;

COUNT(SNAME)                                                                    
------------                                                                    
           1                                                                    
           1                                                                    
           1                                                                    
           1                                                                    
           1                                                                    
           1                                                                    
           1                                                                    
           2                                                                    
           1                                                                    

9 rows selected.

SQL> commmit;
SP2-0042: unknown command "commmit" - rest of line ignored.
SQL> commit
  2  
SQL> ;
  1* commit
SQL> commet;
SP2-0042: unknown command "commet" - rest of line ignored.
SQL> commit;

Commit complete.

SQL> select * from sailors;

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        22 Dustin                        7         45                           
        29 Brutus                        1         33                           
        31 Lubber                        8       55.5                           
        32 Andy                          8       25.5                           
        58 Rusty                        10         35                           
        64 Horataio                      7         35                           
        71 Zorba                        10         16                           
        74 Horataio                      9         35                           
        85 Art                           3       25.5                           
        95 Bob                           3       63.5                           

10 rows selected.

SQL> select distinct count(sname)
  2  from sailors;

COUNT(SNAME)                                                                    
------------                                                                    
          10                                                                    

SQL> spool off;
SQL> select s.sname ,count(r.bid)
  2  from sailors s join reserves r
  3  on s.sid=r.sid;
select s.sname ,count(r.bid)
       *
ERROR at line 1:
ORA-00937: not a single-group group function 


SQL> select sname ,count(bid)
  2  from sailors s join reserves r
  3  on s.sid=r.sid;
select sname ,count(bid)
       *
ERROR at line 1:
ORA-00937: not a single-group group function 


SQL> 
SQL> select sname ,count(bid)
  2  from sailors s join reserves r
  3  on s.sid=r.sid;
select sname ,count(bid)
       *
ERROR at line 1:
ORA-00937: not a single-group group function 


SQL> commit;

Commit complete.

SQL> select sname ,count(bid)
  2  from sailors s join reserves r
  3  on s.sid=r.sid;
select sname ,count(bid)
       *
ERROR at line 1:
ORA-00937: not a single-group group function 


SQL> select sname
  2  from sailors
  3  where sname like 'a%';

no rows selected

SQL> select sname
  2  from sailors
  3  where sname like 'A%';

SNAME                                                                           
--------------------                                                            
Andy                                                                            
Art                                                                             

SQL> select sname,count(bid)
  2  from sailors s JOIN reserves r
  3  on s.sid=r.sid;
select sname,count(bid)
       *
ERROR at line 1:
ORA-00937: not a single-group group function 


SQL> select s.sname,count(bid)
  2  from sailors s JOIN reserves r
  3  on s.sid=r.sid;
select s.sname,count(bid)
       *
ERROR at line 1:
ORA-00937: not a single-group group function 


SQL> select *
  2  from sailors s JOIN reserves r
  3  on s.sid=r.sid;

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        22 Dustin                        7         45         22        101     
10-OCT-98                                                                       
                                                                                
        22 Dustin                        7         45         22        102     
10-OCT-98                                                                       
                                                                                
        22 Dustin                        7         45         22        103     
08-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        22 Dustin                        7         45         22        104     
07-OCT-98                                                                       
                                                                                
        31 Lubber                        8       55.5         31        102     
10-NOV-98                                                                       
                                                                                
        31 Lubber                        8       55.5         31        104     
12-NOV-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        31 Lubber                        8       55.5         31        103     
06-NOV-98                                                                       
                                                                                
        64 Horataio                      7         35         64        102     
08-SEP-98                                                                       
                                                                                
        64 Horataio                      7         35         64        101     
05-SEP-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        74 Horataio                      9         35         74        103     
08-SEP-98                                                                       
                                                                                

10 rows selected.

SQL> select count(bid)
  2  from sailors s JOIN reserves r
  3  on s.sid=r.sid;

COUNT(BID)                                                                      
----------                                                                      
        10                                                                      

SQL> 
SQL> select sname
  2  from sailors s JOIN reserves r
  3  on s.sid=r.sid;

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Lubber                                                                          
Lubber                                                                          
Lubber                                                                          
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        

10 rows selected.

SQL> select sname
  2  from sailors s CROSS JOIN reserves r
  3  on s.sid=r.sid;
on s.sid=r.sid
*
ERROR at line 3:
ORA-00933: SQL command not properly ended 


SQL> select sname
  2  from sailors s CROSS JOIN reserves r;

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Dustin                                                                          
Brutus                                                                          

SNAME                                                                           
--------------------                                                            
Brutus                                                                          
Brutus                                                                          
Brutus                                                                          
Brutus                                                                          
Brutus                                                                          
Brutus                                                                          
Brutus                                                                          
Brutus                                                                          
Brutus                                                                          
Lubber                                                                          
Lubber                                                                          

SNAME                                                                           
--------------------                                                            
Lubber                                                                          
Lubber                                                                          
Lubber                                                                          
Lubber                                                                          
Lubber                                                                          
Lubber                                                                          
Lubber                                                                          
Lubber                                                                          
Andy                                                                            
Andy                                                                            
Andy                                                                            

SNAME                                                                           
--------------------                                                            
Andy                                                                            
Andy                                                                            
Andy                                                                            
Andy                                                                            
Andy                                                                            
Andy                                                                            
Andy                                                                            
Rusty                                                                           
Rusty                                                                           
Rusty                                                                           
Rusty                                                                           

SNAME                                                                           
--------------------                                                            
Rusty                                                                           
Rusty                                                                           
Rusty                                                                           
Rusty                                                                           
Rusty                                                                           
Rusty                                                                           
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        

SNAME                                                                           
--------------------                                                            
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        
Zorba                                                                           
Zorba                                                                           
Zorba                                                                           
Zorba                                                                           
Zorba                                                                           
Zorba                                                                           

SNAME                                                                           
--------------------                                                            
Zorba                                                                           
Zorba                                                                           
Zorba                                                                           
Zorba                                                                           
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        

SNAME                                                                           
--------------------                                                            
Horataio                                                                        
Horataio                                                                        
Horataio                                                                        
Art                                                                             
Art                                                                             
Art                                                                             
Art                                                                             
Art                                                                             
Art                                                                             
Art                                                                             
Art                                                                             

SNAME                                                                           
--------------------                                                            
Art                                                                             
Art                                                                             
Bob                                                                             
Bob                                                                             
Bob                                                                             
Bob                                                                             
Bob                                                                             
Bob                                                                             
Bob                                                                             
Bob                                                                             
Bob                                                                             

SNAME                                                                           
--------------------                                                            
Bob                                                                             

100 rows selected.

SQL> select sname,count(bid)
  2  from sailors s CROSS JOIN reserves r;
select sname,count(bid)
       *
ERROR at line 1:
ORA-00937: not a single-group group function 


SQL> select sname,count(bid)
  2  from sailors s CROSS JOIN reserves r
  3  group by sname;

SNAME                COUNT(BID)                                                 
-------------------- ----------                                                 
Rusty                        10                                                 
Lubber                       10                                                 
Brutus                       10                                                 
Andy                         10                                                 
Art                          10                                                 
Bob                          10                                                 
Dustin                       10                                                 
Horataio                     20                                                 
Zorba                        10                                                 

9 rows selected.

SQL> select *
  2  from sailors cross join reserves;

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        22 Dustin                        7         45         22        101     
10-OCT-98                                                                       
                                                                                
        22 Dustin                        7         45         22        102     
10-OCT-98                                                                       
                                                                                
        22 Dustin                        7         45         22        103     
08-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        22 Dustin                        7         45         22        104     
07-OCT-98                                                                       
                                                                                
        22 Dustin                        7         45         31        102     
10-NOV-98                                                                       
                                                                                
        22 Dustin                        7         45         31        103     
06-NOV-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        22 Dustin                        7         45         31        104     
12-NOV-98                                                                       
                                                                                
        22 Dustin                        7         45         64        101     
05-SEP-98                                                                       
                                                                                
        22 Dustin                        7         45         64        102     
08-SEP-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        22 Dustin                        7         45         74        103     
08-SEP-98                                                                       
                                                                                
        29 Brutus                        1         33         22        101     
10-OCT-98                                                                       
                                                                                
        29 Brutus                        1         33         22        102     
10-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        29 Brutus                        1         33         22        103     
08-OCT-98                                                                       
                                                                                
        29 Brutus                        1         33         22        104     
07-OCT-98                                                                       
                                                                                
        29 Brutus                        1         33         31        102     
10-NOV-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        29 Brutus                        1         33         31        103     
06-NOV-98                                                                       
                                                                                
        29 Brutus                        1         33         31        104     
12-NOV-98                                                                       
                                                                                
        29 Brutus                        1         33         64        101     
05-SEP-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        29 Brutus                        1         33         64        102     
08-SEP-98                                                                       
                                                                                
        29 Brutus                        1         33         74        103     
08-SEP-98                                                                       
                                                                                
        31 Lubber                        8       55.5         22        101     
10-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        31 Lubber                        8       55.5         22        102     
10-OCT-98                                                                       
                                                                                
        31 Lubber                        8       55.5         22        103     
08-OCT-98                                                                       
                                                                                
        31 Lubber                        8       55.5         22        104     
07-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        31 Lubber                        8       55.5         31        102     
10-NOV-98                                                                       
                                                                                
        31 Lubber                        8       55.5         31        103     
06-NOV-98                                                                       
                                                                                
        31 Lubber                        8       55.5         31        104     
12-NOV-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        31 Lubber                        8       55.5         64        101     
05-SEP-98                                                                       
                                                                                
        31 Lubber                        8       55.5         64        102     
08-SEP-98                                                                       
                                                                                
        31 Lubber                        8       55.5         74        103     
08-SEP-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        32 Andy                          8       25.5         22        101     
10-OCT-98                                                                       
                                                                                
        32 Andy                          8       25.5         22        102     
10-OCT-98                                                                       
                                                                                
        32 Andy                          8       25.5         22        103     
08-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        32 Andy                          8       25.5         22        104     
07-OCT-98                                                                       
                                                                                
        32 Andy                          8       25.5         31        102     
10-NOV-98                                                                       
                                                                                
        32 Andy                          8       25.5         31        103     
06-NOV-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        32 Andy                          8       25.5         31        104     
12-NOV-98                                                                       
                                                                                
        32 Andy                          8       25.5         64        101     
05-SEP-98                                                                       
                                                                                
        32 Andy                          8       25.5         64        102     
08-SEP-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        32 Andy                          8       25.5         74        103     
08-SEP-98                                                                       
                                                                                
        58 Rusty                        10         35         22        101     
10-OCT-98                                                                       
                                                                                
        58 Rusty                        10         35         22        102     
10-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        58 Rusty                        10         35         22        103     
08-OCT-98                                                                       
                                                                                
        58 Rusty                        10         35         22        104     
07-OCT-98                                                                       
                                                                                
        58 Rusty                        10         35         31        102     
10-NOV-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        58 Rusty                        10         35         31        103     
06-NOV-98                                                                       
                                                                                
        58 Rusty                        10         35         31        104     
12-NOV-98                                                                       
                                                                                
        58 Rusty                        10         35         64        101     
05-SEP-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        58 Rusty                        10         35         64        102     
08-SEP-98                                                                       
                                                                                
        58 Rusty                        10         35         74        103     
08-SEP-98                                                                       
                                                                                
        64 Horataio                      7         35         22        101     
10-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        64 Horataio                      7         35         22        102     
10-OCT-98                                                                       
                                                                                
        64 Horataio                      7         35         22        103     
08-OCT-98                                                                       
                                                                                
        64 Horataio                      7         35         22        104     
07-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        64 Horataio                      7         35         31        102     
10-NOV-98                                                                       
                                                                                
        64 Horataio                      7         35         31        103     
06-NOV-98                                                                       
                                                                                
        64 Horataio                      7         35         31        104     
12-NOV-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        64 Horataio                      7         35         64        101     
05-SEP-98                                                                       
                                                                                
        64 Horataio                      7         35         64        102     
08-SEP-98                                                                       
                                                                                
        64 Horataio                      7         35         74        103     
08-SEP-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        71 Zorba                        10         16         22        101     
10-OCT-98                                                                       
                                                                                
        71 Zorba                        10         16         22        102     
10-OCT-98                                                                       
                                                                                
        71 Zorba                        10         16         22        103     
08-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        71 Zorba                        10         16         22        104     
07-OCT-98                                                                       
                                                                                
        71 Zorba                        10         16         31        102     
10-NOV-98                                                                       
                                                                                
        71 Zorba                        10         16         31        103     
06-NOV-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        71 Zorba                        10         16         31        104     
12-NOV-98                                                                       
                                                                                
        71 Zorba                        10         16         64        101     
05-SEP-98                                                                       
                                                                                
        71 Zorba                        10         16         64        102     
08-SEP-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        71 Zorba                        10         16         74        103     
08-SEP-98                                                                       
                                                                                
        74 Horataio                      9         35         22        101     
10-OCT-98                                                                       
                                                                                
        74 Horataio                      9         35         22        102     
10-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        74 Horataio                      9         35         22        103     
08-OCT-98                                                                       
                                                                                
        74 Horataio                      9         35         22        104     
07-OCT-98                                                                       
                                                                                
        74 Horataio                      9         35         31        102     
10-NOV-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        74 Horataio                      9         35         31        103     
06-NOV-98                                                                       
                                                                                
        74 Horataio                      9         35         31        104     
12-NOV-98                                                                       
                                                                                
        74 Horataio                      9         35         64        101     
05-SEP-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        74 Horataio                      9         35         64        102     
08-SEP-98                                                                       
                                                                                
        74 Horataio                      9         35         74        103     
08-SEP-98                                                                       
                                                                                
        85 Art                           3       25.5         22        101     
10-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        85 Art                           3       25.5         22        102     
10-OCT-98                                                                       
                                                                                
        85 Art                           3       25.5         22        103     
08-OCT-98                                                                       
                                                                                
        85 Art                           3       25.5         22        104     
07-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        85 Art                           3       25.5         31        102     
10-NOV-98                                                                       
                                                                                
        85 Art                           3       25.5         31        103     
06-NOV-98                                                                       
                                                                                
        85 Art                           3       25.5         31        104     
12-NOV-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        85 Art                           3       25.5         64        101     
05-SEP-98                                                                       
                                                                                
        85 Art                           3       25.5         64        102     
08-SEP-98                                                                       
                                                                                
        85 Art                           3       25.5         74        103     
08-SEP-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        95 Bob                           3       63.5         22        101     
10-OCT-98                                                                       
                                                                                
        95 Bob                           3       63.5         22        102     
10-OCT-98                                                                       
                                                                                
        95 Bob                           3       63.5         22        103     
08-OCT-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        95 Bob                           3       63.5         22        104     
07-OCT-98                                                                       
                                                                                
        95 Bob                           3       63.5         31        102     
10-NOV-98                                                                       
                                                                                
        95 Bob                           3       63.5         31        103     
06-NOV-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        95 Bob                           3       63.5         31        104     
12-NOV-98                                                                       
                                                                                
        95 Bob                           3       63.5         64        101     
05-SEP-98                                                                       
                                                                                
        95 Bob                           3       63.5         64        102     
08-SEP-98                                                                       
                                                                                

       SID SNAME                    RATING        AGE        SID        BID     
---------- -------------------- ---------- ---------- ---------- ----------     
DAY                                                                             
---------                                                                       
        95 Bob                           3       63.5         74        103     
08-SEP-98                                                                       
                                                                                

100 rows selected.

SQL> select *
  2  from sailors s cross join reserves r
  3  on s.sid=r.sid;
on s.sid=r.sid
*
ERROR at line 3:
ORA-00933: SQL command not properly ended 


SQL> select sname
  2  from sailors s join reserves r
  3  on s.sid=r.sid
  4  group by s.sid,s,sname
  5  having count(r.bid)>2;
group by s.sid,s,sname
               *
ERROR at line 4:
ORA-00904: "S": invalid identifier 


SQL> select sname
  2  from sailors s join reserves r
  3  on s.sid=r.sid
  4  group by s.sid,s.sname
  5  having count(r.bid)>2;

SNAME                                                                           
--------------------                                                            
Dustin                                                                          
Lubber                                                                          

SQL> select * from sailors;

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        22 Dustin                        7         45                           
        29 Brutus                        1         33                           
        31 Lubber                        8       55.5                           
        32 Andy                          8       25.5                           
        58 Rusty                        10         35                           
        64 Horataio                      7         35                           
        71 Zorba                        10         16                           
        74 Horataio                      9         35                           
        85 Art                           3       25.5                           
        95 Bob                           3       63.5                           

10 rows selected.

SQL> select sname
  2  from sailors
  3  where rating > (select rating
  4  		from sailors
  5                  where sname='Horatio');

no rows selected

SQL> select rating
  2  		from sailors
  3                  where sname='Horatio';

no rows selected

SQL> select rating
  2                  where sname='Horatio');
                where sname='Horatio')
                *
ERROR at line 2:
ORA-00923: FROM keyword not found where expected 


SQL> select sname
  2  
SQL> select rating
  2  		from sailors
  3                  where sname="Horatio";
                where sname="Horatio"
                            *
ERROR at line 3:
ORA-00904: "Horatio": invalid identifier 


SQL> select rating
  2  from sailors;

    RATING                                                                      
----------                                                                      
         7                                                                      
         1                                                                      
         8                                                                      
         8                                                                      
        10                                                                      
         7                                                                      
        10                                                                      
         9                                                                      
         3                                                                      
         3                                                                      

10 rows selected.

SQL> select rating
  2  from sailors
  3  where sname='Horatio'';
ERROR:
ORA-01756: quoted string not properly terminated 


SQL> select rating
  2  from sailors
  3  where sname='Horatio';

no rows selected

SQL> select rating
  2  from sailors
  3  where sname=Horatio;
where sname=Horatio
            *
ERROR at line 3:
ORA-00904: "HORATIO": invalid identifier 


SQL> spool
currently spooling to C:\Users\aman\Desktop\desktop\5sem\DBMS\sailors.sql
SQL> select sname
  2  from sailors
  3  where rating = (select rating
  4  		from sailors
  5                  where sname='Horatio');

no rows selected

SQL> commit;

Commit complete.

SQL> select * from sailors;

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        22 Dustin                        7         45                           
        29 Brutus                        1         33                           
        31 Lubber                        8       55.5                           
        32 Andy                          8       25.5                           
        58 Rusty                        10         35                           
        64 Horataio                      7         35                           
        71 Zorba                        10         16                           
        74 Horataio                      9         35                           
        85 Art                           3       25.5                           
        95 Bob                           3       63.5                           

10 rows selected.

SQL> select rating
  2  from sailors
  3  where sid=22;

    RATING                                                                      
----------                                                                      
         7                                                                      

SQL> select rating
  2  from sailors
  3  where sid=22 and sname='Dustin';

    RATING                                                                      
----------                                                                      
         7                                                                      

SQL> select rating
  2  from sailors
  3  where sname='Dustin';

    RATING                                                                      
----------                                                                      
         7                                                                      

SQL> select rating
  2  from sailors
  3  where sname='Horataio';

    RATING                                                                      
----------                                                                      
         7                                                                      
         9                                                                      

SQL> select sname
  2  from sailors
  3  where rating > (select rating
  4  		from sailors
  5                  where sname='Horataio');
where rating > (select rating
                *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row 


SQL> select sname
  2  from sailors
  3  where rating not in (select rating
  4  		from sailors
  5                  where sname='Horataio');

SNAME                                                                           
--------------------                                                            
Andy                                                                            
Lubber                                                                          
Bob                                                                             
Art                                                                             
Brutus                                                                          
Zorba                                                                           
Rusty                                                                           

7 rows selected.

SQL> select sname
  2  from sailors
  3  where rating greater (select rating
  4  		from sailors
  5                  where sname='Horataio');
where rating greater (select rating
             *
ERROR at line 3:
ORA-00920: invalid relational operator 


SQL> select s.sname
  2  from sailors s
  3  where s.rating > (select rating
  4  		from sailors
  5                  where sname='Horataio');
where s.rating > (select rating
                  *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row 


SQL> SELECT s.sname
  2  FROM sailors s
  3  WHERE s.rating > (SELECT rating
  4                   FROM sailors
  5                   WHERE sname = 'Horataio');
WHERE s.rating > (SELECT rating
                  *
ERROR at line 3:
ORA-01427: single-row subquery returns more than one row 


SQL> select s.sname
  2  from sailors s
  3  where s.rating > (select max(rating)
  4  		from sailors
  5                  where sname='Horataio');

SNAME                                                                           
--------------------                                                            
Rusty                                                                           
Zorba                                                                           

SQL> select *
  2  from sailors s
  3  where s.rating > (select max(rating)
  4  		from sailors
  5                  where sname='Horataio');

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        58 Rusty                        10         35                           
        71 Zorba                        10         16                           

SQL> select *
  2  from sailors
  3  where rating = (select max(rating)
  4                  from sailors );

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        58 Rusty                        10         35                           
        71 Zorba                        10         16                           

SQL> select * from boats;

       BID BNAME                COLOR                                           
---------- -------------------- --------------------                            
       101 Interlake            blue                                            
       102 Interlake            red                                             
       103 Clipper              green                                           
       104 Marine               red                                             

SQL> select * from reserves;

       SID        BID DAY                                                       
---------- ---------- ---------                                                 
        22        101 10-OCT-98                                                 
        22        102 10-OCT-98                                                 
        22        103 08-OCT-98                                                 
        22        104 07-OCT-98                                                 
        31        102 10-NOV-98                                                 
        31        103 06-NOV-98                                                 
        31        104 12-NOV-98                                                 
        64        101 05-SEP-98                                                 
        64        102 08-SEP-98                                                 
        74        103 08-SEP-98                                                 

10 rows selected.

SQL> select bid
  2  from boats
  3  where color='red';

       BID                                                                      
----------                                                                      
       102                                                                      
       104                                                                      

SQL> select sid,bid,count(bid)
  2  from reserves
  3  group by sid
  4  having bid in (
  5                select bid
  6                from boats
  7                 where color='red');
having bid in (
       *
ERROR at line 4:
ORA-00979: not a GROUP BY expression 


SQL> select bid,count(bid)
  2  from reserves
  3  group by bid
  4  having bid in (
  5                select bid
  6                from boats
  7                 where color='red');

       BID COUNT(BID)                                                           
---------- ----------                                                           
       102          3                                                           
       104          2                                                           

SQL> select sid,count(bid)
  2  from reserves
  3  group by sid
  4  having bid in (
  5                select bid
  6                from boats
  7                 where color='red');
having bid in (
       *
ERROR at line 4:
ORA-00979: not a GROUP BY expression 


SQL> select bid,count(bid)
  2  from reserves
  3  group by bid
  4  having bid in (
  5                select bid
  6                from boats
  7                 where color='red');

       BID COUNT(BID)                                                           
---------- ----------                                                           
       102          3                                                           
       104          2                                                           

SQL> select * from raitng;
select * from raitng
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> select * from sailors;

       SID SNAME                    RATING        AGE                           
---------- -------------------- ---------- ----------                           
        22 Dustin                        7         45                           
        29 Brutus                        1         33                           
        31 Lubber                        8       55.5                           
        32 Andy                          8       25.5                           
        58 Rusty                        10         35                           
        64 Horataio                      7         35                           
        71 Zorba                        10         16                           
        74 Horataio                      9         35                           
        85 Art                           3       25.5                           
        95 Bob                           3       63.5                           

10 rows selected.

SQL> select avg(age)
  2  from sailors
  3  group by rating
  4  having count(sid)>=2 ;

  AVG(AGE)                                                                      
----------                                                                      
      40.5                                                                      
        40                                                                      
      44.5                                                                      
      25.5                                                                      

SQL> SELECT rating, AVG(age) AS avg_age
  2  FROM sailors
  3  WHERE rating IN (
  4      SELECT rating
  5      FROM sailors
  6      GROUP BY rating
  7      HAVING COUNT(*) >= 2
  8  )
  9  GROUP BY rating;

    RATING    AVG_AGE                                                           
---------- ----------                                                           
         8       40.5                                                           
         7         40                                                           
         3       44.5                                                           
        10       25.5                                                           

SQL> select rating,avg(age)
  2  from sailors
  3  group by rating
  4  having count(sid)>=2 ;

    RATING   AVG(AGE)                                                           
---------- ----------                                                           
         8       40.5                                                           
         7         40                                                           
         3       44.5                                                           
        10       25.5                                                           

SQL> commit;

Commit complete.

SQL> spool off;
