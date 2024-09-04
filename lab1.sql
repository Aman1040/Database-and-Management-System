SQL> dec courses
SP2-0734: unknown command beginning "dec course..." - rest of line ignored.
SQL> select * from courses
  2  select * from courses;
select * from courses
*
ERROR at line 2:
ORA-00933: SQL command not properly ended 


SQL> select * from courses;
select * from courses
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       102 Object-Oriented Systems                 4                            
       103 COMPUTER NETWORK                        5                            

SQL> set linesize 250;
SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                                                                                                                                                                                                      
---------- ------------------------------ ----------                                                                                                                                                                                                      
       102 Object-Oriented Systems                 4                                                                                                                                                                                                      
       103 COMPUTER NETWORK                        5                                                                                                                                                                                                      

SQL> SELECT *
  2  FROM TAB;

TNAME                          TABTYPE  CLUSTERID                                                                                                                                                                                                         
------------------------------ ------- ----------                                                                                                                                                                                                         
COURSE                         TABLE                                                                                                                                                                                                                      
PARTICIPANT                    TABLE                                                                                                                                                                                                                      

SQL> SELECT *
  2  FROM PARTICIPANT;

       PID PNAME                     G        CID                                                                                                                                                                                                         
---------- ------------------------- - ----------                                                                                                                                                                                                         
      1005 Indiana Jones             M                                                                                                                                                                                                                    
      1002 Foster Silva              M        102                                                                                                                                                                                                         
      1003 Maria Anderson            F        102                                                                                                                                                                                                         

SQL> INSERT INTO PARTICIPANT VALUES (1001, 'Albert DCosta', 'M', 101);
INSERT INTO PARTICIPANT VALUES (1001, 'Albert DCosta', 'M', 101)
*
ERROR at line 1:
ORA-02291: integrity constraint (AMAN.PARTICIPANT_FK_COURSE_CID) violated - parent key not found 


SQL> INSERT INTO PARTICIPANT VALUES (1002, 'Foster Silva', 'M', 102);
INSERT INTO PARTICIPANT VALUES (1002, 'Foster Silva', 'M', 102)
*
ERROR at line 1:
ORA-00001: unique constraint (AMAN.PARTICIPANT_PK_PID) violated 


SQL> INSERT INTO PARTICIPANT VALUES (1003, 'Maria Anderson', 'F', 102);
INSERT INTO PARTICIPANT VALUES (1003, 'Maria Anderson', 'F', 102)
*
ERROR at line 1:
ORA-00001: unique constraint (AMAN.PARTICIPANT_PK_PID) violated 


SQL> INSERT INTO COURSE (&CID, &CNAME, &CREDIT);
Enter value for cid: 104
Enter value for cname: dbms
Enter value for credit: 3
old   1: INSERT INTO COURSE (&CID, &CNAME, &CREDIT)
new   1: INSERT INTO COURSE (104, dbms, 3)
INSERT INTO COURSE (104, dbms, 3)
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> \
SP2-0042: unknown command "\" - rest of line ignored.
SQL> INSERT INTO COURSE (&CID, '&CNAME', &CREDIT);
Enter value for cid: 104
Enter value for cname: DBMS
Enter value for credit: 
old   1: INSERT INTO COURSE (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE (104, 'DBMS', )
INSERT INTO COURSE (104, 'DBMS', )
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT);
Enter value for cid: 104
Enter value for cname: DBMS
Enter value for credit: 3
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (104, 'DBMS', 3)

1 row created.

SQL> \
SP2-0042: unknown command "\" - rest of line ignored.
SQL> /
Enter value for cid: 105
Enter value for cname: OS
Enter value for credit: 4
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (105, 'OS', 4)

1 row created.

SQL> /
Enter value for cid: 106
Enter value for cname: ETHICAL HACKING
Enter value for credit: 5
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (106, 'ETHICAL HACKING', 5)

1 row created.

SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                                                                                                                                                                                                      
---------- ------------------------------ ----------                                                                                                                                                                                                      
       104 DBMS                                    3                                                                                                                                                                                                      
       105 OS                                      4                                                                                                                                                                                                      
       106 ETHICAL HACKING                         5                                                                                                                                                                                                      
       102 Object-Oriented Systems                 4                                                                                                                                                                                                      
       103 COMPUTER NETWORK                        5                                                                                                                                                                                                      

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                                                                                                                                                                                                         
---------- ------------------------- - ----------                                                                                                                                                                                                         
      1005 Indiana Jones             M                                                                                                                                                                                                                    
      1002 Foster Silva              M        102                                                                                                                                                                                                         
      1003 Maria Anderson            F        102                                                                                                                                                                                                         

SQL> INSERT INTO PARTICIPANT VALUES (&PID, '&PNAME', '&G',&CID);
Enter value for pid: 1004
Enter value for pname: ABHASH GOVAL
Enter value for g: M
Enter value for cid: 103
old   1: INSERT INTO PARTICIPANT VALUES (&PID, '&PNAME', '&G',&CID)
new   1: INSERT INTO PARTICIPANT VALUES (1004, 'ABHASH GOVAL', 'M',103)

1 row created.

SQL> /
Enter value for pid: ARYAN
Enter value for pname: 
Enter value for g: 
Enter value for cid: 
old   1: INSERT INTO PARTICIPANT VALUES (&PID, '&PNAME', '&G',&CID)
new   1: INSERT INTO PARTICIPANT VALUES (ARYAN, '', '',)
INSERT INTO PARTICIPANT VALUES (ARYAN, '', '',)
                                              *
ERROR at line 1:
ORA-00936: missing expression 


SQL> /
Enter value for pid: 1006
Enter value for pname: ARYAN KHOKLE
Enter value for g: M
Enter value for cid: 104
old   1: INSERT INTO PARTICIPANT VALUES (&PID, '&PNAME', '&G',&CID)
new   1: INSERT INTO PARTICIPANT VALUES (1006, 'ARYAN KHOKLE', 'M',104)

1 row created.

SQL> /
Enter value for pid: 1007
Enter value for pname: TANISHA 
Enter value for g: F
Enter value for cid: 105
old   1: INSERT INTO PARTICIPANT VALUES (&PID, '&PNAME', '&G',&CID)
new   1: INSERT INTO PARTICIPANT VALUES (1007, 'TANISHA ', 'F',105)

1 row created.

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                                                                                                                                                                                                         
---------- ------------------------- - ----------                                                                                                                                                                                                         
      1004 ABHASH GOVAL              M        103                                                                                                                                                                                                         
      1006 ARYAN KHOKLE              M        104                                                                                                                                                                                                         
      1007 TANISHA                   F        105                                                                                                                                                                                                         
      1005 Indiana Jones             M                                                                                                                                                                                                                    
      1002 Foster Silva              M        102                                                                                                                                                                                                         
      1003 Maria Anderson            F        102                                                                                                                                                                                                         

6 rows selected.

SQL> COMMET;
SP2-0042: unknown command "COMMET" - rest of line ignored.
SQL> COMMIT;

Commit complete.

SQL> SELECT * FROM PARTICIPANT
  2  DELETE FROM COURSE
  3  
SQL> select * from participant;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1004 ABHASH GOVAL              M        103                               
      1006 ARYAN KHOKLE              M        104                               
      1007 TANISHA                   F        105                               
      1005 Indiana Jones             M                                          
      1002 Foster Silva              M        102                               
      1003 Maria Anderson            F        102                               

6 rows selected.

SQL> delete form participant
  2  where pid = 1003;
delete form participant
       *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> delete from participant
  2  where pid = 1003;

1 row deleted.

SQL> select * from participant;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1004 ABHASH GOVAL              M        103                               
      1006 ARYAN KHOKLE              M        104                               
      1007 TANISHA                   F        105                               
      1005 Indiana Jones             M                                          
      1002 Foster Silva              M        102                               

SQL> commit;

Commit complete.

SQL> CREATE TABLE PARTICIPANT_1
  2  AS SELECT * FROM PARTICIPANT
  3  WHERE PID IN (1004, 1006, 1007);

Table created.

SQL> select * from participant_1;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1004 ABHASH GOVAL              M        103                               
      1006 ARYAN KHOKLE              M        104                               
      1007 TANISHA                   F        105                               

SQL> commit;

Commit complete.

SQL> CREATE TABLE PARTICIPANT_2
  2  AS SELECT * FROM PARTICIPANT
  3  WHERE PID IN (1002, 1005, 1004, 1007);

Table created.

SQL> commit;

Commit complete.

SQL> select * from participant_2;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1002 Foster Silva              M        102                               
      1004 ABHASH GOVAL              M        103                               
      1005 Indiana Jones             M                                          
      1007 TANISHA                   F        105                               

SQL> SELECT *
  2  FROM PARTICIPANT_1 CROSS JOIN PARTICIPANT_2;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1004 ABHASH GOVAL              M        103       1002                    
Foster Silva              M        102                                          
                                                                                
      1004 ABHASH GOVAL              M        103       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
      1004 ABHASH GOVAL              M        103       1005                    
Indiana Jones             M                                                     
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1004 ABHASH GOVAL              M        103       1007                    
TANISHA                   F        105                                          
                                                                                
      1006 ARYAN KHOKLE              M        104       1002                    
Foster Silva              M        102                                          
                                                                                
      1006 ARYAN KHOKLE              M        104       1004                    
ABHASH GOVAL              M        103                                          
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1006 ARYAN KHOKLE              M        104       1005                    
Indiana Jones             M                                                     
                                                                                
      1006 ARYAN KHOKLE              M        104       1007                    
TANISHA                   F        105                                          
                                                                                
      1007 TANISHA                   F        105       1002                    
Foster Silva              M        102                                          
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1007 TANISHA                   F        105       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
      1007 TANISHA                   F        105       1005                    
Indiana Jones             M                                                     
                                                                                
      1007 TANISHA                   F        105       1007                    
TANISHA                   F        105                                          
                                                                                

12 rows selected.

SQL> SELECT *
  2  FROM PARTICIPANT_1, PARTICIPANT_2;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1004 ABHASH GOVAL              M        103       1002                    
Foster Silva              M        102                                          
                                                                                
      1004 ABHASH GOVAL              M        103       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
      1004 ABHASH GOVAL              M        103       1005                    
Indiana Jones             M                                                     
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1004 ABHASH GOVAL              M        103       1007                    
TANISHA                   F        105                                          
                                                                                
      1006 ARYAN KHOKLE              M        104       1002                    
Foster Silva              M        102                                          
                                                                                
      1006 ARYAN KHOKLE              M        104       1004                    
ABHASH GOVAL              M        103                                          
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1006 ARYAN KHOKLE              M        104       1005                    
Indiana Jones             M                                                     
                                                                                
      1006 ARYAN KHOKLE              M        104       1007                    
TANISHA                   F        105                                          
                                                                                
      1007 TANISHA                   F        105       1002                    
Foster Silva              M        102                                          
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1007 TANISHA                   F        105       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
      1007 TANISHA                   F        105       1005                    
Indiana Jones             M                                                     
                                                                                
      1007 TANISHA                   F        105       1007                    
TANISHA                   F        105                                          
                                                                                

12 rows selected.

SQL> SELECT *
  2  FROM PARTICIPANT_1 P1 JOIN PARTICIPANT_2 P2
  3  ON P1.PID = P2.PID;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1004 ABHASH GOVAL              M        103       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
      1007 TANISHA                   F        105       1007                    
TANISHA                   F        105                                          
                                                                                

SQL> select *
  2  from participant_1 p1 JOIN participant_2 p2
  3  on p1.pid=p2.pid;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1004 ABHASH GOVAL              M        103       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
      1007 TANISHA                   F        105       1007                    
TANISHA                   F        105                                          
                                                                                

SQL> SELECT *
  2  FROM PARTICIPANT_1 NATURAL JOIN PARTICIPANT_2;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1004 ABHASH GOVAL              M        103                               
      1007 TANISHA                   F        105                               

SQL> SELECT *
  2  FROM PARTICIPANT_1 CROSS JOIN PARTICIPANT_2;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1004 ABHASH GOVAL              M        103       1002                    
Foster Silva              M        102                                          
                                                                                
      1004 ABHASH GOVAL              M        103       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
      1004 ABHASH GOVAL              M        103       1005                    
Indiana Jones             M                                                     
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1004 ABHASH GOVAL              M        103       1007                    
TANISHA                   F        105                                          
                                                                                
      1006 ARYAN KHOKLE              M        104       1002                    
Foster Silva              M        102                                          
                                                                                
      1006 ARYAN KHOKLE              M        104       1004                    
ABHASH GOVAL              M        103                                          
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1006 ARYAN KHOKLE              M        104       1005                    
Indiana Jones             M                                                     
                                                                                
      1006 ARYAN KHOKLE              M        104       1007                    
TANISHA                   F        105                                          
                                                                                
      1007 TANISHA                   F        105       1002                    
Foster Silva              M        102                                          
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1007 TANISHA                   F        105       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
      1007 TANISHA                   F        105       1005                    
Indiana Jones             M                                                     
                                                                                
      1007 TANISHA                   F        105       1007                    
TANISHA                   F        105                                          
                                                                                

12 rows selected.

SQL> SELECT *
  2  FROM PARTICIPANT_1 P1 LEFT OUTER JOIN PARTICIPANT_2 P2
  3  ON P1.PID = P2.PID;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1004 ABHASH GOVAL              M        103       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
      1007 TANISHA                   F        105       1007                    
TANISHA                   F        105                                          
                                                                                
      1006 ARYAN KHOKLE              M        104                               
                                                                                
                                                                                

SQL> SELECT *
  2  FROM PARTICIPANT_1 P1 RIGHT OUTER JOIN PARTICIPANT_2 P2
  3  ON P1.PID = P2.PID;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1004 ABHASH GOVAL              M        103       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
      1007 TANISHA                   F        105       1007                    
TANISHA                   F        105                                          
                                                                                
                                                        1005                    
Indiana Jones             M                                                     
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
                                                        1002                    
Foster Silva              M        102                                          
                                                                                

SQL> SELECT *
  2  FROM PARTICIPANT_1 P1 RIGHT OUTER JOIN PARTICIPANT_2 P2
  3  ON P1.PID = P2.PID;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1004 ABHASH GOVAL              M        103       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
      1007 TANISHA                   F        105       1007                    
TANISHA                   F        105                                          
                                                                                
                                                        1005                    
Indiana Jones             M                                                     
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
                                                        1002                    
Foster Silva              M        102                                          
                                                                                

SQL> SELECT *
  2  FROM PARTICIPANT_1 P1 FULL OUTER JOIN PARTICIPANT_2 P2
  3  ON P1.PID = P2.PID;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
                                                        1002                    
Foster Silva              M        102                                          
                                                                                
      1004 ABHASH GOVAL              M        103       1004                    
ABHASH GOVAL              M        103                                          
                                                                                
                                                        1005                    
Indiana Jones             M                                                     
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1007 TANISHA                   F        105       1007                    
TANISHA                   F        105                                          
                                                                                
      1006 ARYAN KHOKLE              M        104                               
                                                                                
                                                                                

SQL> SELECT *
  2  FROM PARTICIPANT_1 P1, PARTICIPANT_2 P2
  3  WHERE P1.PID (+) = P2.PID (+);
WHERE P1.PID (+) = P2.PID (+)
                 *
ERROR at line 3:
ORA-01468: a predicate may reference only one outer-joined table 


SQL> SELECT * FROM PARTICIPANT_1
  2  UNION
  3  SELECT * FROM PARTICIPANT_2;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1002 Foster Silva              M        102                               
      1004 ABHASH GOVAL              M        103                               
      1005 Indiana Jones             M                                          
      1006 ARYAN KHOKLE              M        104                               
      1007 TANISHA                   F        105                               

SQL> SELECT * FROM PARTICIPANT_1
  2  MINUS
  3  SELECT * FROM PARTICIPANT_2;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1006 ARYAN KHOKLE              M        104                               

SQL> SELECT * FROM PARTICIPANT_1
  2  ;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1004 ABHASH GOVAL              M        103                               
      1006 ARYAN KHOKLE              M        104                               
      1007 TANISHA                   F        105                               

SQL> SELECT * FROM PARTICIPANT_2;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1002 Foster Silva              M        102                               
      1004 ABHASH GOVAL              M        103                               
      1005 Indiana Jones             M                                          
      1007 TANISHA                   F        105                               

SQL> SELECT * FROM PARTICIPANT_1
  2  INTERSECT
  3  SELECT * FROM PARTICIPANT_2;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1004 ABHASH GOVAL              M        103                               
      1007 TANISHA                   F        105                               

SQL> SELECT * FROM PARTICIPANT_1
  2  MINUS (
  3  SELECT * FROM PARTICIPANT_1
  4  MINUS
  5  SELECT * FROM PARTICIPANT_2
  6  );

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1004 ABHASH GOVAL              M        103                               
      1007 TANISHA                   F        105                               

SQL> commit;

Commit complete.

SQL> commit;

Commit complete.

SQL> spool off;
SQL> select * from tab;

no rows selected

SQL> spooling
SP2-0042: unknown command "spooling" - rest of line ignored.
SQL> spool
currently spooling to C:\Users\aman\Desktop\desktop\5sem\DBMS\lab1.sql
SQL> spool off;
SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
APEX$_ACL                      TABLE                                            
APEX$_WS_FILES                 TABLE                                            
APEX$_WS_HISTORY               TABLE                                            
APEX$_WS_LINKS                 TABLE                                            
APEX$_WS_NOTES                 TABLE                                            
APEX$_WS_ROWS                  TABLE                                            
APEX$_WS_TAGS                  TABLE                                            
APEX$_WS_WEBPG_SECTIONS        TABLE                                            
APEX$_WS_WEBPG_SECTION_HISTORY TABLE                                            
DEMO_CUSTOMERS                 TABLE                                            
DEMO_ORDERS                    TABLE                                            

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
DEMO_ORDER_ITEMS               TABLE                                            
DEMO_PRODUCT_INFO              TABLE                                            
DEMO_STATES                    TABLE                                            
DEMO_USERS                     TABLE                                            
DEPT                           TABLE                                            
EMP                            TABLE                                            

17 rows selected.

SQL> select * from course;
select * from course
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> select * from courses;
select * from courses
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> spool C:\Users\aman\Desktop\desktop\5sem\DBMS\practical3.sql append;
