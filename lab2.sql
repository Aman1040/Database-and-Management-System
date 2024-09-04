SQL> show user;
USER is "AMAN"
SQL> CREATE TABLE COURSE(
  2  CNAME VARCHAR(20) PRIMARY_KEY,
  3  CID NUMBER(3) NOT NULL,
  4  CREDIT NUMBER(1) NOT NULL,
  5  CONSTRAINT COURSE_PK_CID PRIMARY KEY (CID),
  6  );
CNAME VARCHAR(20) PRIMARY_KEY,
                  *
ERROR at line 2:
ORA-00907: missing right parenthesis 


SQL> CREATE TABLE COURSE(
  2  CNAME VARCHAR(20) NOT NULL,
  3  CID NUMBER(3) NOT NULL,
  4  CREDIT NUMBER(1) NOT NULL,
  5  CONSTRAINT COURSE_PK_CID PRIMARY KEY (CID),
  6  );
)
*
ERROR at line 6:
ORA-00904: : invalid identifier 


SQL> CREATE TABLE COURSE(
  2  CNAME VARCHAR2(20) NOT NULL,
  3  CID NUMBER(3) NOT NULL,
  4  CREDIT NUMBER(1) NOT NULL,
  5  CONSTRAINT COURSE_PK_CID PRIMARY KEY (CID),
  6  );
)
*
ERROR at line 6:
ORA-00904: : invalid identifier 


SQL> CREATE TABLE COURSE(
  2  CNAME VARCHAR2(20) NOT NULL,
  3  CID NUMBER(3) NOT NULL,
  4  CREDIT NUMBER(1) NOT NULL,
  5  CONSTRAINT COURSE_PK_CID PRIMARY KEY (CID)
  6  );

Table created.

SQL> SELECT * FROM TAB;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
COURSE                         TABLE                                            

SQL> SELECT * FROM COURSE;

no rows selected

SQL> INSERT INTO COURSE (CID, CNAME, CREDIT) VALUES;
INSERT INTO COURSE (CID, CNAME, CREDIT) VALUES
                                             *
ERROR at line 1:
ORA-00936: missing expression 


SQL> INSERT INTO COURSE (&CID, &CNAME, &CREDIT) VALUES;
Enter value for cid: 101
Enter value for cname: DBMS
Enter value for credit: 3
old   1: INSERT INTO COURSE (&CID, &CNAME, &CREDIT) VALUES
new   1: INSERT INTO COURSE (101, DBMS, 3) VALUES
INSERT INTO COURSE (101, DBMS, 3) VALUES
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> /
Enter value for cid: 102
Enter value for cname: COMPUTER NETWORK
Enter value for credit: 3
old   1: INSERT INTO COURSE (&CID, &CNAME, &CREDIT) VALUES
new   1: INSERT INTO COURSE (102, COMPUTER NETWORK, 3) VALUES
INSERT INTO COURSE (102, COMPUTER NETWORK, 3) VALUES
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> INSERT INTO COURSE VALUES(&CID,
  2  &CNAME, &CREDIT) ;
Enter value for cid: 101
old   1: INSERT INTO COURSE VALUES(&CID,
new   1: INSERT INTO COURSE VALUES(101,
Enter value for cname: COMPUTER NETWORK
Enter value for credit: 3
old   2: &CNAME, &CREDIT) 
new   2: COMPUTER NETWORK, 3) 
COMPUTER NETWORK, 3) 
         *
ERROR at line 2:
ORA-00917: missing comma 


SQL> /
Enter value for cid: 102
old   1: INSERT INTO COURSE VALUES(&CID,
new   1: INSERT INTO COURSE VALUES(102,
Enter value for cname: "dbms"
Enter value for credit: 3
old   2: &CNAME, &CREDIT) 
new   2: "dbms", 3) 
"dbms", 3) 
*
ERROR at line 2:
ORA-00984: column not allowed here 


SQL> INSERT INTO COURSE VALUES(&CID, &CNAME, &CREDIT) ;
Enter value for cid: 101
Enter value for cname: COMPUTER NETWORK
Enter value for credit: 3
old   1: INSERT INTO COURSE VALUES(&CID, &CNAME, &CREDIT) 
new   1: INSERT INTO COURSE VALUES(101, COMPUTER NETWORK, 3) 
INSERT INTO COURSE VALUES(101, COMPUTER NETWORK, 3) 
                                        *
ERROR at line 1:
ORA-00917: missing comma 


SQL> INSERT INTO COURSE VALUES(&CID, '&CNAME', &CREDIT) ;
Enter value for cid: 101
Enter value for cname: COMPUTER NETWORK
Enter value for credit: 3
old   1: INSERT INTO COURSE VALUES(&CID, '&CNAME', &CREDIT) 
new   1: INSERT INTO COURSE VALUES(101, 'COMPUTER NETWORK', 3) 
INSERT INTO COURSE VALUES(101, 'COMPUTER NETWORK', 3) 
                               *
ERROR at line 1:
ORA-01722: invalid number 


SQL> INSERT INTO COURSE VALUES(&CID, '&CNAME', &CREDIT);
Enter value for cid: 101
Enter value for cname: CN
Enter value for credit: 3
old   1: INSERT INTO COURSE VALUES(&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES(101, 'CN', 3)
INSERT INTO COURSE VALUES(101, 'CN', 3)
                               *
ERROR at line 1:
ORA-01722: invalid number 


SQL> INSERT INTO COURSE (&CREDIT,'&CNAME',CID) VALUES;
Enter value for credit: 3
Enter value for cname: CN
old   1: INSERT INTO COURSE (&CREDIT,'&CNAME',CID) VALUES
new   1: INSERT INTO COURSE (3,'CN',CID) VALUES
INSERT INTO COURSE (3,'CN',CID) VALUES
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> INSERT INTO COURSE (&CREDIT,'&CNAME',&CID) VALUES ;
Enter value for credit: 3
Enter value for cname: CN
Enter value for cid: 101
old   1: INSERT INTO COURSE (&CREDIT,'&CNAME',&CID) VALUES 
new   1: INSERT INTO COURSE (3,'CN',101) VALUES 
INSERT INTO COURSE (3,'CN',101) VALUES 
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> /
Enter value for credit: 4
Enter value for cname: 102
Enter value for cid: F
old   1: INSERT INTO COURSE (&CREDIT,'&CNAME',&CID) VALUES 
new   1: INSERT INTO COURSE (4,'102',F) VALUES 
INSERT INTO COURSE (4,'102',F) VALUES 
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT);
Enter value for cid: 101
Enter value for cname: CN
Enter value for credit: 3
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (101, 'CN', 3)
INSERT INTO COURSE VALUES (101, 'CN', 3)
                                *
ERROR at line 1:
ORA-01722: invalid number 


SQL> DROP TABLE COURSE;

Table dropped.

SQL> SELECT * FROM TABL
  2  SELECT * FROM TAB;
SELECT * FROM TAB
*
ERROR at line 2:
ORA-00933: SQL command not properly ended 


SQL> SELECT * FROM TAB;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
BIN$4rVtfXuxTG+4kuDwbqcsWA==$0 TABLE                                            

SQL> DROP TABLE BIN$4rVtfXuxTG+4kuDwbqcsWA==$0;
DROP TABLE BIN$4rVtfXuxTG+4kuDwbqcsWA==$0
                         *
ERROR at line 1:
ORA-00933: SQL command not properly ended 


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

SQL> SELECT * FROM TAB;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
BIN$4rVtfXuxTG+4kuDwbqcsWA==$0 TABLE                                            
COURSE                         TABLE                                            

SQL> DROP TABLE BIN;
DROP TABLE BIN
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT);
Enter value for cid: 101
Enter value for cname: COMPUTER NETWORK
Enter value for credit: 3
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (101, 'COMPUTER NETWORK', 3)

1 row created.

SQL> /
Enter value for cid: 102
Enter value for cname: DBMS
Enter value for credit: 4
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (102, 'DBMS', 4)

1 row created.

SQL> 103
SP2-0226: Invalid line number 
SQL> /
Enter value for cid: 103
Enter value for cname: DATA SCIENCE
Enter value for credit: 5
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (103, 'DATA SCIENCE', 5)

1 row created.

SQL> SELECT * FROM TAB;

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
BIN$4rVtfXuxTG+4kuDwbqcsWA==$0 TABLE                                            
COURSE                         TABLE                                            

SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 COMPUTER NETWORK                        3                            
       102 DBMS                                    4                            
       103 DATA SCIENCE                            5                            

SQL> SELECT CID FROM COURSE;

       CID                                                                      
----------                                                                      
       101                                                                      
       102                                                                      
       103                                                                      

SQL> SELECT CID FROM COURSE
  2  WHERE CREDIT = 3;

       CID                                                                      
----------                                                                      
       101                                                                      

SQL> SELECT CNAME FROM COURSE
  2  WHER CREDIT > 3;
WHER CREDIT > 3
     *
ERROR at line 2:
ORA-00933: SQL command not properly ended 


SQL> SELECT CNAME FROM COURSE
  2  WHERE CREDIT > 3;

CNAME                                                                           
------------------------------                                                  
DBMS                                                                            
DATA SCIENCE                                                                    

SQL> CREATE TABLE PARTICIPANT(
  2  PID NUMBER(4) NOT NULL,
  3  PNAME VARCHAR2(25) NOT NULL,
  4  GENDER CHAR(1) NOT NULL,
  5  CID NUMBER(3),
  6  CONSTRAINT PARTICIPANT_PK_PID PRIMARY KEY (PID),
  7  CONSTRAINT PARTICIPANT_CK_PID CHECK (PID BETWEEN 1001 AND 9999),
  8  CONSTRAINT PARTICIPANT_CK_GENDER CHECK (GENDER IN ( 'M', 'F' )),
  9  CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY
 10  (CID) REFERENCES COURSE(CID)
 11  );

Table created.

SQL> INSERT INTO PARTICIPANT VALUES (&PID,'&PNAME','&GENDER',&CID);
Enter value for pid: 1001
Enter value for pname: AMAN
Enter value for gender: M
Enter value for cid: 101
old   1: INSERT INTO PARTICIPANT VALUES (&PID,'&PNAME','&GENDER',&CID)
new   1: INSERT INTO PARTICIPANT VALUES (1001,'AMAN','M',101)

1 row created.

SQL> /
Enter value for pid: 1002
Enter value for pname: SAHIL
Enter value for gender: M
Enter value for cid: 101
old   1: INSERT INTO PARTICIPANT VALUES (&PID,'&PNAME','&GENDER',&CID)
new   1: INSERT INTO PARTICIPANT VALUES (1002,'SAHIL','M',101)

1 row created.

SQL> /
Enter value for pid: 1003
Enter value for pname: ISHA
Enter value for gender: F
Enter value for cid: 102
old   1: INSERT INTO PARTICIPANT VALUES (&PID,'&PNAME','&GENDER',&CID)
new   1: INSERT INTO PARTICIPANT VALUES (1003,'ISHA','F',102)

1 row created.

SQL> 1004
SP2-0226: Invalid line number 
SQL> /
Enter value for pid: 1004
Enter value for pname: PRATIK
Enter value for gender: M
Enter value for cid: 103
old   1: INSERT INTO PARTICIPANT VALUES (&PID,'&PNAME','&GENDER',&CID)
new   1: INSERT INTO PARTICIPANT VALUES (1004,'PRATIK','M',103)

1 row created.

SQL> SELECT * FROM PARTICIPANT;

       PID PNAME                     G        CID                               
---------- ------------------------- - ----------                               
      1001 AMAN                      M        101                               
      1002 SAHIL                     M        101                               
      1003 ISHA                      F        102                               
      1004 PRATIK                    M        103                               

SQL> SPOOL OFF;
