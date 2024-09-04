SQL> CREATE TABLE COURSE (
  2  CID NUMBER(3) NOT NULL,
  3  CNAME VARCHAR2(30) NOT NULL,
  4  CREDIT NUMBER(1),
  5  CONSTRAINT COURSE_PK_CID PRIMARY KEY (CID),
  6  CONSTRAINT COURSE_CK_CID CHECK (CID BETWEEN 101 AND 149),
  7  CONSTRAINT COURSE_CK_CREDIT CHECK (CREDIT BETWEEN 1 AND 5),
  8  CONSTRAINT COURSE_UQ_CNAME UNIQUE (CNAME));

Table created.

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

SQL> DESCRIBE COURSE
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CID                                       NOT NULL NUMBER(3)
 CNAME                                     NOT NULL VARCHAR2(30)
 CREDIT                                             NUMBER(1)

SQL> DESC PARTICIPANT
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PID                                       NOT NULL NUMBER(4)
 PNAME                                     NOT NULL VARCHAR2(25)
 GENDER                                    NOT NULL CHAR(1)
 CID                                                NUMBER(3)

SQL> COMMIT;

Commit complete.

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
ORA-00001: unique constraint (AMAN.COURSE_PK_CID) violated 


SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            
       102 Object-Oriented Systems                 4                            

SQL> INSERT INTO COURSE (&CID, &CNAME, &CREDIT);
Enter value for cid: 103
Enter value for cname: computer network
Enter value for credit: 4
old   1: INSERT INTO COURSE (&CID, &CNAME, &CREDIT)
new   1: INSERT INTO COURSE (103, computer network, 4)
INSERT INTO COURSE (103, computer network, 4)
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> /
Enter value for cid: 104
Enter value for cname: computer network
Enter value for credit: 5
old   1: INSERT INTO COURSE (&CID, &CNAME, &CREDIT)
new   1: INSERT INTO COURSE (104, computer network, 5)
INSERT INTO COURSE (104, computer network, 5)
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> INSERT INTO COURSE value (&CID, &CNAME, &CREDIT);
Enter value for cid: 103 
Enter value for cname: computer network 
Enter value for credit: 5
old   1: INSERT INTO COURSE value (&CID, &CNAME, &CREDIT)
new   1: INSERT INTO COURSE value (103 , computer network , 5)
INSERT INTO COURSE value (103 , computer network , 5)
                          *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> INSERT INTO COURSE values (&CID, &CNAME, &CREDIT);
Enter value for cid: 103
Enter value for cname: computer Network 
Enter value for credit: 5
old   1: INSERT INTO COURSE values (&CID, &CNAME, &CREDIT)
new   1: INSERT INTO COURSE values (103, computer Network , 5)
INSERT INTO COURSE values (103, computer Network , 5)
                                         *
ERROR at line 1:
ORA-00917: missing comma 


SQL> /
Enter value for cid: 105
Enter value for cname: OS
Enter value for credit: 3
old   1: INSERT INTO COURSE values (&CID, &CNAME, &CREDIT)
new   1: INSERT INTO COURSE values (105, OS, 3)
INSERT INTO COURSE values (105, OS, 3)
                                *
ERROR at line 1:
ORA-00984: column not allowed here 


SQL> desc courses
ERROR:
ORA-04043: object courses does not exist 


SQL> select * from courses
  2  ;
select * from courses
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL>  SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            
       102 Object-Oriented Systems                 4                            

SQL> INSERT INTO COURSE (CID, CNAME, CREDIT)
  2  VALUES (103, 'Computer Network', 5);

1 row created.

SQL>  SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            
       102 Object-Oriented Systems                 4                            
       103 Computer Network                        5                            

SQL>  SELECT * FROM PARTICIPANT;

no rows selected

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

1 row created.

SQL>  SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 Foster Silva              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          
      1006 Martinez Wales            F        103                               

6 rows selected.

SQL> SELECT *
  2  FROM TAB;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
COURSE                         TABLE                                            
PARTICIPANT                    TABLE                                            

SQL> SELECT *
  2  FROM PARTICIPANT
  3  WHERE GENDER = 'F';

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1006 Martinez Wales            F        103                               

SQL> select *
  2  from practicipant
  3  where gender ='m';
from practicipant
     *
ERROR at line 2:
ORA-00942: table or view does not exist 


SQL> select *
  2  from PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 Foster Silva              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          
      1006 Martinez Wales            F        103                               

6 rows selected.

SQL> select *
  2  from practicipant
  3  WHERE GENDER = 'F';
from practicipant
     *
ERROR at line 2:
ORA-00942: table or view does not exist 


SQL> SELECT *
  2   FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 Foster Silva              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          
      1006 Martinez Wales            F        103                               

6 rows selected.

SQL> WHERE GENDER = 'F';
SP2-0734: unknown command beginning "WHERE GEND..." - rest of line ignored.
SQL> SELECT *
  2  FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 Foster Silva              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          
      1006 Martinez Wales            F        103                               

6 rows selected.

SQL> SELECT * FROM PARTICIPANT WHERE GENDER ='M';

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 Foster Silva              M        102                               
      1005 Indiana Jones             M                                          

SQL> 
SQL> SELECT * FROM PARTICIPANT WHERE GENDER ='M' ORDER BY CID;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 Foster Silva              M        102                               
      1005 Indiana Jones             M                                          

SQL> SELECT * FROM PARTICIPANT WHERE GENDER ='F' ORDER BY CID;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1004 Pamela Smith              F        101                               
      1003 Maria Anderson            F        102                               
      1006 Martinez Wales            F        103                               

SQL> DESC USER_CONSTRAINTS;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 OWNER                                              VARCHAR2(30)
 CONSTRAINT_NAME                           NOT NULL VARCHAR2(30)
 CONSTRAINT_TYPE                                    VARCHAR2(1)
 TABLE_NAME                                NOT NULL VARCHAR2(30)
 SEARCH_CONDITION                                   LONG
 R_OWNER                                            VARCHAR2(30)
 R_CONSTRAINT_NAME                                  VARCHAR2(30)
 DELETE_RULE                                        VARCHAR2(9)
 STATUS                                             VARCHAR2(8)
 DEFERRABLE                                         VARCHAR2(14)
 DEFERRED                                           VARCHAR2(9)
 VALIDATED                                          VARCHAR2(13)
 GENERATED                                          VARCHAR2(14)
 BAD                                                VARCHAR2(3)
 RELY                                               VARCHAR2(4)
 LAST_CHANGE                                        DATE
 INDEX_OWNER                                        VARCHAR2(30)
 INDEX_NAME                                         VARCHAR2(30)
 INVALID                                            VARCHAR2(7)
 VIEW_RELATED                                       VARCHAR2(14)

SQL> SELECT PNAME AS PARTICIPANT_NAME, GENDER AS SEX
  2  FROM PARTICIPANT;

PARTICIPANT_NAME          S                                                     
------------------------- -                                                     
Albert DCosta             M                                                     
Foster Silva              M                                                     
Maria Anderson            F                                                     
Pamela Smith              F                                                     
Indiana Jones             M                                                     
Martinez Wales            F                                                     

6 rows selected.

SQL> UPDATE PARTICIPANT
  2  SET PNAME = 'HITMAN ROHIT'
  3  FROM PARTICIPANT;
FROM PARTICIPANT
*
ERROR at line 3:
ORA-00933: SQL command not properly ended 


SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 Foster Silva              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          
      1006 Martinez Wales            F        103                               

6 rows selected.

SQL> UPDATE PARTICIPANT SET PNAME = 'RAO YADAV' WHERE PID = 1002;

1 row updated.

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 Albert DCosta             M        101                               
      1002 RAO YADAV                 M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               
      1005 Indiana Jones             M                                          
      1006 Martinez Wales            F        103                               

6 rows selected.

SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            
       102 Object-Oriented Systems                 4                            
       103 Computer Network                        5                            

SQL> DELETE FROM COURSE WHERE CID=101;
DELETE FROM COURSE WHERE CID=101
*
ERROR at line 1:
ORA-02292: integrity constraint (AMAN.PARTICIPANT_FK_COURSE_CID) violated - 
child record found 


SQL> DELETE FROM PARTICIPANT WHERE CID = 101;

2 rows deleted.

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1002 RAO YADAV                 M        102                               
      1003 Maria Anderson            F        102                               
      1005 Indiana Jones             M                                          
      1006 Martinez Wales            F        103                               

SQL> ROLLBACK;

Rollback complete.

SQL> SELECT * FROM PARTICIPANT;

no rows selected

SQL> SELECT * FROM PARTICIPANT;

no rows selected

SQL> SELECT * FROM PARTICIPANT;

no rows selected

SQL> INSERT INTO PARTICIPANT VALUES (1001, 'Albert DCosta', 'M', 101);
INSERT INTO PARTICIPANT VALUES (1001, 'Albert DCosta', 'M', 101)
*
ERROR at line 1:
ORA-02291: integrity constraint (AMAN.PARTICIPANT_FK_COURSE_CID) violated - 
parent key not found 


SQL> INSERT INTO PARTICIPANT VALUES (1002, 'Foster Silva', 'M', 102);
INSERT INTO PARTICIPANT VALUES (1002, 'Foster Silva', 'M', 102)
*
ERROR at line 1:
ORA-02291: integrity constraint (AMAN.PARTICIPANT_FK_COURSE_CID) violated - 
parent key not found 


SQL> INSERT INTO PARTICIPANT VALUES (1003, 'Maria Anderson', 'F', 102);
INSERT INTO PARTICIPANT VALUES (1003, 'Maria Anderson', 'F', 102)
*
ERROR at line 1:
ORA-02291: integrity constraint (AMAN.PARTICIPANT_FK_COURSE_CID) violated - 
parent key not found 


SQL> INSERT INTO PARTICIPANT VALUES (1004, 'Pamela Smith', 'F', 101);
INSERT INTO PARTICIPANT VALUES (1004, 'Pamela Smith', 'F', 101)
*
ERROR at line 1:
ORA-02291: integrity constraint (AMAN.PARTICIPANT_FK_COURSE_CID) violated - 
parent key not found 


SQL> INSERT INTO PARTICIPANT VALUES (1005, 'Indiana Jones', 'M', NULL);

1 row created.

SQL> INSERT INTO PARTICIPANT VALUES (1006, 'Martinez Wales', 'F', 103);
INSERT INTO PARTICIPANT VALUES (1006, 'Martinez Wales', 'F', 103)
*
ERROR at line 1:
ORA-02291: integrity constraint (AMAN.PARTICIPANT_FK_COURSE_CID) violated - 
parent key not found 


SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1005 Indiana Jones             M                                          

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1005 Indiana Jones             M                                          

SQL> INSERT INTO PARTICIPANT VALUES (1001, 'Albert DCosta', 'M', 101);
INSERT INTO PARTICIPANT VALUES (1001, 'Albert DCosta', 'M', 101)
*
ERROR at line 1:
ORA-02291: integrity constraint (AMAN.PARTICIPANT_FK_COURSE_CID) violated - 
parent key not found 


SQL> INSERT INTO PARTICIPANT VALUES (1001, 'Albert DCosta', 'M', 101);
INSERT INTO PARTICIPANT VALUES (1001, 'Albert DCosta', 'M', 101)
*
ERROR at line 1:
ORA-02291: integrity constraint (AMAN.PARTICIPANT_FK_COURSE_CID) violated - 
parent key not found 


SQL> SELECT * FROM TAB;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
COURSE                         TABLE                                            
PARTICIPANT                    TABLE                                            

SQL> SELECT * FROM PRATICIPANT;
SELECT * FROM PRATICIPANT
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1005 Indiana Jones             M                                          

SQL> INSERT INTO PARTICIPANT VALUES (1006, 'Martinez Wales', 'F', 106);
INSERT INTO PARTICIPANT VALUES (1006, 'Martinez Wales', 'F', 106)
*
ERROR at line 1:
ORA-02291: integrity constraint (AMAN.PARTICIPANT_FK_COURSE_CID) violated - 
parent key not found 


SQL> SELECT * FROM COURSE;

no rows selected

SQL> INSERT INTO COURSE (CID, CNAME, CREDIT)
  2  VALUES (101, 'Database Management Systems', 5);

1 row created.

SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            

SQL> INSERT INTO COURSE (CNAME, CID, CREDIT)
  2  VALUES ('Object-Oriented Systems', 102, 4);

1 row created.

SQL> INSERT INTO COURSE (CREDIT, CNAME, CID)
  2  VALUES (3, 'Basic Operating System', 101);
INSERT INTO COURSE (CREDIT, CNAME, CID)
*
ERROR at line 1:
ORA-00001: unique constraint (AMAN.COURSE_PK_CID) violated 


SQL> INSERT INTO COURSE (CREDIT, CNAME, CID)
  2  VALUES (3, 'Basic Operating System', 101);
INSERT INTO COURSE (CREDIT, CNAME, CID)
*
ERROR at line 1:
ORA-00001: unique constraint (AMAN.COURSE_PK_CID) violated 


SQL> INSERT INTO PARTICIPANT VALUES (1001, 'Albert DCosta', 'M', 101);

1 row created.

SQL> INSERT INTO PARTICIPANT VALUES (1002, 'Foster Silva', 'M', 102);

1 row created.

SQL> INSERT INTO PARTICIPANT VALUES (1003, 'Maria Anderson', 'F', 102);

1 row created.

SQL> INSERT INTO PARTICIPANT VALUES (1004, 'Pamela Smith', 'F', 101);

1 row created.

SQL> INSERT INTO PARTICIPANT VALUES (1005, 'Indiana Jones', 'M', NULL);
INSERT INTO PARTICIPANT VALUES (1005, 'Indiana Jones', 'M', NULL)
*
ERROR at line 1:
ORA-00001: unique constraint (AMAN.PARTICIPANT_PK_PID) violated 


SQL> INSERT INTO PARTICIPANT VALUES (1006, 'Martinez Wales', 'F', 103);
INSERT INTO PARTICIPANT VALUES (1006, 'Martinez Wales', 'F', 103)
*
ERROR at line 1:
ORA-02291: integrity constraint (AMAN.PARTICIPANT_FK_COURSE_CID) violated - 
parent key not found 


SQL> INSERT INTO COURSE (CID, CNAME, CREDIT)
  2  VALUES (103, 'COMPUTER NETWORK', 5);

1 row created.

SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            
       102 Object-Oriented Systems                 4                            
       103 COMPUTER NETWORK                        5                            

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1005 Indiana Jones             M                                          
      1001 Albert DCosta             M        101                               
      1002 Foster Silva              M        102                               
      1003 Maria Anderson            F        102                               
      1004 Pamela Smith              F        101                               

SQL> COMMIT;

Commit complete.

SQL> SELECT TABLE_NAME, CONSTRAINT_NAME,
  2  CONSTRAINT_TYPE, DELETE_RULE
  3  
SQL> FROM USER_CONSTRAINTS
SP2-0734: unknown command beginning "FROM USER_..." - rest of line ignored.
SQL> WHERE TABLE_NAME IN ('COURSE','PARTICIPANT');
SP2-0734: unknown command beginning "WHERE TABL..." - rest of line ignored.
SQL> SELECT TABLE_NAME, CONSTRAINT_NAME,CONSTRAINT_TYPE, DELETE_RULE FROM USER_CONSTRAINTS WHERE TABLE_NAME IN ('COURSE','PARTICIPANT');

TABLE_NAME                     CONSTRAINT_NAME                C DELETE_RU       
------------------------------ ------------------------------ - ---------       
COURSE                         COURSE_UQ_CNAME                U                 
COURSE                         SYS_C0011162                   C                 
COURSE                         SYS_C0011163                   C                 
COURSE                         COURSE_CK_CID                  C                 
COURSE                         COURSE_CK_CREDIT               C                 
COURSE                         COURSE_PK_CID                  P                 
PARTICIPANT                    SYS_C0011168                   C                 
PARTICIPANT                    SYS_C0011169                   C                 
PARTICIPANT                    SYS_C0011170                   C                 
PARTICIPANT                    PARTICIPANT_CK_PID             C                 
PARTICIPANT                    PARTICIPANT_CK_GENDER          C                 

TABLE_NAME                     CONSTRAINT_NAME                C DELETE_RU       
------------------------------ ------------------------------ - ---------       
PARTICIPANT                    PARTICIPANT_PK_PID             P                 
PARTICIPANT                    PARTICIPANT_FK_COURSE_CID      R NO ACTION       

13 rows selected.

SQL> COMMIT;

Commit complete.

SQL> 
SQL> ALTER TABLE PARTICIPANT DROP CONSTRAINT PARTICIPANT_FK_COURSE_CID;

Table altered.

SQL> COMMIT;

Commit complete.

SQL> ALTER TABLE PARTICIPANT ADD CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY (CID) REFERENCES COURSE(CID) ON DELETE CASCADE;

Table altered.

SQL> DELETE FROM COURSE WHERE CID = 101;

1 row deleted.

SQL> SELECT * FROM COURSE
  2  ;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       102 Object-Oriented Systems                 4                            
       103 COMPUTER NETWORK                        5                            

SQL> COMMIT;

Commit complete.

SQL> SPOOL OFF;
