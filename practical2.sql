SQL> SHOW USER
USER is "TIGER"
SQL> GRANT CONNECT, RESOURCE TO tiger;
GRANT CONNECT, RESOURCE TO tiger
*
ERROR at line 1:
ORA-01031: insufficient privileges 


SQL> GRANT CONNECT, RESOURCE TO TIGER;
GRANT CONNECT, RESOURCE TO TIGER
*
ERROR at line 1:
ORA-01031: insufficient privileges 


SQL> CREATE TABLE COURSE (
  2  CID NUMBER(3) NOT NULL,
  3  CNAME VARCHAR2(30) NOT NULL,
  4  CREDIT NUMBER(1),
  5  CONSTRAINT COURSE_PK_CID PRIMARY KEY (CID),
  6  CONSTRAINT COURSE_CK_CID CHECK (CID BETWEEN 101 AND 149),
  7  CONSTRAINT COURSE_CK_CREDIT CHECK (CREDIT BETWEEN 1 AND 5),
  8  CONSTRAINT COURSE_UQ_CNAME UNIQUE (CNAME)
  9  );

Table created.

SQL> select * from course;

no rows selected

SQL> desc course
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CID                                       NOT NULL NUMBER(3)
 CNAME                                     NOT NULL VARCHAR2(30)
 CREDIT                                             NUMBER(1)

SQL> CREATE TABLE PARTICIPANT (
  2  PID NUMBER(4) NOT NULL,
  3  PNAME VARCHAR2(25) NOT NULL,
  4  GENDER CHAR(1) NOT NULL,
  5  CID NUMBER(3),
  6  CONSTRAINT PARTICIPANT_PK_PID PRIMARY KEY (PID),
  7  CONSTRAINT PARTICIPANT_CK_PID CHECK (PID BETWEEN 1001 AND 9999),
  8  CONSTRAINT PARTICIPANT_CK_GENDER CHECK (GENDER IN ( 'M', 'F' )),
  9  CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY
 10  (CID) REFERENCES COURSE(CID)
 11  
SQL> );
SP2-0042: unknown command ")" - rest of line ignored.
SQL> CREATE TABLE PARTICIPANT (
  2  PID NUMBER(4) NOT NULL,
  3  PNAME VARCHAR2(25) NOT NULL,
  4  GENDER CHAR(1) NOT NULL,
  5  CID NUMBER(3),
  6  CONSTRAINT PARTICIPANT_PK_PID PRIMARY KEY (PID),
  7  CONSTRAINT PARTICIPANT_CK_PID CHECK (PID BETWEEN 1001 AND 9999),
  8  CONSTRAINT PARTICIPANT_CK_GENDER CHECK (GENDER IN ( 'M', 'F' )),
  9  CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY
 10  (CID) REFERENCES COURSE(CID));

Table created.

SQL> desc participant
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PID                                       NOT NULL NUMBER(4)
 PNAME                                     NOT NULL VARCHAR2(25)
 GENDER                                    NOT NULL CHAR(1)
 CID                                                NUMBER(3)

SQL> INSERT INTO COURSE (CID, CNAME, CREDIT)
  2  VALUES (101, 'Database Management Systems', 5);

1 row created.

SQL> INSERT INTO COURSE (CNAME, CID, CREDIT)
  2  VALUES ('Object-Oriented Systems', 102, 4);

1 row created.

SQL> INSERT INTO COURSE (CREDIT, CNAME, CID)
  2  VALUES (3, 'Basic Operating System', 101);
INSERT INTO COURSE (CREDIT, CNAME, CID)
*
ERROR at line 1:
ORA-00001: unique constraint (TIGER.COURSE_PK_CID) violated 


SQL> INSERT INTO COURSE (CREDIT, CNAME, CID)
  2  VALUES (3, 'Basic Operating System', 101);
INSERT INTO COURSE (CREDIT, CNAME, CID)
*
ERROR at line 1:
ORA-00001: unique constraint (TIGER.COURSE_PK_CID) violated 


SQL> INSERT INTO PARTICIPANT VALUES (1001, 'Albert DCosta', 'M', 101);

1 row created.

SQL> INSERT INTO PARTICIPANT VALUES (1002, 'Foster Silva', 'M', 102);

1 row created.

SQL> INSERT INTO PARTICIPANT VALUES (1003, 'Maria Anderson', 'F', 102);

1 row created.

SQL> INSERT INTO PARTICIPANT VALUES (1004, 'Pamela Smith', 'F', 101);

1 row created.

SQL> INSERT INTO PARTICIPANT VALUES (1005, 'Indiana Jones', 'M', NULL);

1 row created.

SQL> INSERT INTO PARTICIPANT VALUES (1006, 'Martinez Wales', 'F', 103);
INSERT INTO PARTICIPANT VALUES (1006, 'Martinez Wales', 'F', 103)
*
ERROR at line 1:
ORA-02291: integrity constraint (TIGER.PARTICIPANT_FK_COURSE_CID) violated - 
parent key not found 


SQL> select * from course;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            
       102 Object-Oriented Systems                 4                            

SQL> commit;

Commit complete.

SQL> SELECT *
  2  FROM TAB;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
COURSE                         TABLE                                            
PARTICIPANT                    TABLE                                            

SQL> select * from participant;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 Foster Silva              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          

SQL> INSERT INTO COURSE (&CID, '&CNAME', &CREDIT);
Enter value for cid: 103
Enter value for cname: Computer Network
Enter value for credit: 3
old   1: INSERT INTO COURSE (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE (103, 'Computer Network', 3)
INSERT INTO COURSE (103, 'Computer Network', 3)
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> INSERT INTO COURSE VALUE (&CID, '&CNAME', &CREDIT);
Enter value for cid: 103
Enter value for cname: Computer Network
Enter value for credit: 3
old   1: INSERT INTO COURSE VALUE (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUE (103, 'Computer Network', 3)
INSERT INTO COURSE VALUE (103, 'Computer Network', 3)
                          *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT);
Enter value for cid: 103
Enter value for cname: COMPUTER NETWORK
Enter value for credit: 3
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (103, 'COMPUTER NETWORK', 3)

1 row created.

SQL> /
Enter value for cid: 104
Enter value for cname: DATA BASE MANGEMENT
Enter value for credit: 4
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (104, 'DATA BASE MANGEMENT', 4)

1 row created.

SQL> /
Enter value for cid: OPERATING SYSTEM
Enter value for cname: 
Enter value for credit: 
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (OPERATING SYSTEM, '', )
INSERT INTO COURSE VALUES (OPERATING SYSTEM, '', )
                                     *
ERROR at line 1:
ORA-00917: missing comma 


SQL> /
Enter value for cid: 105
Enter value for cname: OPERATING SYSTEM
Enter value for credit: 5
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (105, 'OPERATING SYSTEM', 5)

1 row created.

SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            
       102 Object-Oriented Systems                 4                            
       103 COMPUTER NETWORK                        3                            
       104 DATA BASE MANGEMENT                     4                            
       105 OPERATING SYSTEM                        5                            

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 Foster Silva              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          

SQL> DELETE FROM PARTICIPANT
  2  WHERE CID = 101;

2 rows deleted.

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1002 Foster Silva              M        102                               
      1003 Maria Anderson            F        102                               
      1005 Indiana Jones             M                                          

SQL> ROLLBACK;

Rollback complete.

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 Foster Silva              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          

SQL> UPDATE PARTICIPANT
  2  SET PNAME = 'HITMAN ROHIT'
  3  WHERE PID = 1002;

1 row updated.

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 HITMAN ROHIT              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          

SQL> UPDATE PARTICIPANT
  2  SET PNAME = 'VIRAT KOHLI'
  3  WHERE PID =1001
  4  ;

1 row updated.

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 VIRAT KOHLI               M        101                               
      1002 HITMAN ROHIT              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          

SQL> COMMIT;

Commit complete.

SQL> CREATE TABLE PARTICIPANT_1
  2  AS SELECT * FROM PARTICIPANT
  3  WHERE PID IN (1001, 1002, 1003);

Table created.

SQL> CREATE TABLE PARTICIPANT_2
  2  AS SELECT * FROM PARTICIPANT
  3  WHERE PID IN (1004, 1005, 1003);

Table created.

SQL> SELECT * FROM PARTICIPANT_1;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 VIRAT KOHLI               M        101                               
      1002 HITMAN ROHIT              M        102                               
      1003 Maria Anderson            F        102                               

SQL> SELECT * FROM PARTICIPANT_2;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          

SQL> SELECT *
  2  FROM PARTICIPANT_1 CROSS JOIN PARTICIPANT_2;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1001 VIRAT KOHLI               M        101       1003                    
Maria Anderson            F        102                                          
                                                                                
      1001 VIRAT KOHLI               M        101       1004                    
Pamela Smith              F        101                                          
                                                                                
      1001 VIRAT KOHLI               M        101       1005                    
Indiana Jones             M                                                     
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1002 HITMAN ROHIT              M        102       1003                    
Maria Anderson            F        102                                          
                                                                                
      1002 HITMAN ROHIT              M        102       1004                    
Pamela Smith              F        101                                          
                                                                                
      1002 HITMAN ROHIT              M        102       1005                    
Indiana Jones             M                                                     
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1003 Maria Anderson            F        102       1003                    
Maria Anderson            F        102                                          
                                                                                
      1003 Maria Anderson            F        102       1004                    
Pamela Smith              F        101                                          
                                                                                
      1003 Maria Anderson            F        102       1005                    
Indiana Jones             M                                                     
                                                                                

9 rows selected.

SQL> SELECT *
  2  FROM PARTICIPANT_1 P1 JOIN PARTICIPANT_2 P2
  3  ON P1.PID = P2.PID;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1003 Maria Anderson            F        102       1003                    
Maria Anderson            F        102                                          
                                                                                

SQL> SELECT *
  2  FROM PARTICIPANT_1 NATURAL JOIN PARTICIPANT_2;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1003 Maria Anderson            F        102                               

SQL> SELECT *
  2  FROM PARTICIPANT_1 P1 LEFT OUTER JOIN PARTICIPANT_2 P2
  3  ON P1.PID = P2.PID;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1003 Maria Anderson            F        102       1003                    
Maria Anderson            F        102                                          
                                                                                
      1002 HITMAN ROHIT              M        102                               
                                                                                
                                                                                
      1001 VIRAT KOHLI               M        101                               
                                                                                
                                                                                

SQL> SELECT *
  2  FROM PARTICIPANT_1 P1 RIGHT OUTER JOIN PARTICIPANT_2 P2
  3  ON P1.PID = P2.PID;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1003 Maria Anderson            F        102       1003                    
Maria Anderson            F        102                                          
                                                                                
                                                        1004                    
Pamela Smith              F        101                                          
                                                                                
                                                        1005                    
Indiana Jones             M                                                     
                                                                                

SQL> SELECT *
  2  FROM PARTICIPANT_1 P1 FULL OUTER JOIN PARTICIPANT_2 P2
  3  ON P1.PID = P2.PID;

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1003 Maria Anderson            F        102       1003                    
Maria Anderson            F        102                                          
                                                                                
                                                        1004                    
Pamela Smith              F        101                                          
                                                                                
                                                        1005                    
Indiana Jones             M                                                     
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1002 HITMAN ROHIT              M        102                               
                                                                                
                                                                                
      1001 VIRAT KOHLI               M        101                               
                                                                                
                                                                                

SQL> SELECT * FROM PARTICIPANT_1
  2  UNION
  3  SELECT * FROM PARTICIPANT_2;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 VIRAT KOHLI               M        101                               
      1002 HITMAN ROHIT              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          

SQL> SELECT * FROM PARTICIPANT_1
  2  MINUS
  3  SELECT * FROM PARTICIPANT_2;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 VIRAT KOHLI               M        101                               
      1002 HITMAN ROHIT              M        102                               

SQL> SELECT * FROM PARTICIPANT_1
  2  INTERSECT
  3  SELECT * FROM PARTICIPANT_2;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1003 Maria Anderson            F        102                               

SQL> SELECT * FROM PARTICIPANT_1
  2  MINUS (
  3  SELECT * FROM PARTICIPANT_1
  4  MINUS
  5  SELECT * FROM PARTICIPANT_2
  6  );

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1003 Maria Anderson            F        102                               

SQL> SELECT *
  2  FROM PARTICIPANT_1 P1, PARTICIPANT_2 P2
  3  WHERE P1.PID (+) = P2.PID
  4  UNION
  5  SELECT *
  6  FROM PARTICIPANT_1 P1, PARTICIPANT_2 P2
  7  WHERE P1.PID = P2.PID (+);

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
      1001 VIRAT KOHLI               M        101                               
                                                                                
                                                                                
      1002 HITMAN ROHIT              M        102                               
                                                                                
                                                                                
      1003 Maria Anderson            F        102       1003                    
Maria Anderson            F        102                                          
                                                                                

       PID PNAME                     G        CID        PID                    
---------- ------------------------- - ---------- ----------                    
PNAME                     G        CID                                          
------------------------- - ----------                                          
                                                        1004                    
Pamela Smith              F        101                                          
                                                                                
                                                        1005                    
Indiana Jones             M                                                     
                                                                                

SQL> SPOOL OFF;
