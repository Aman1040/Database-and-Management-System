SQL> CREATE TABLE PARTICIPANT (PID NUMBER(4) NOT NULL,PNAME VARCHAR2(25) NOT NULL,GENDER CHAR (1, NOTNULL ,CIDNUMBER(3),CONSTRAINTPARTICIPANT_PK_PID PRIMARY KEY (PID),CONSTRAINT PARTICIPANT_CK_PID CHECK (PID BETWEEN 1001  AND 9999),CONSTRAINT PARTICIPANT_CK_GENDER CHECK (GENDER IN ( 'M', 'F' )),CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY(CID) REFERENCES COURSE(CID));
CREATE TABLE PARTICIPANT (PID NUMBER(4) NOT NULL,PNAME VARCHAR2(25) NOT NULL,GENDER CHAR (1, NOTNULL ,CIDNUMBER(3),CONSTRAINTPARTICIPANT_PK_PID PRIMARY KEY (PID),CONSTRAINT PARTICIPANT_CK_PID CHECK (PID BETWEEN 1001  AND 9999),CONSTRAINT PARTICIPANT_CK_GENDER CHECK (GENDER IN ( 'M', 'F' )),CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY(CID) REFERENCES COURSE(CID))
                                                                                           *
ERROR at line 1:
ORA-00907: missing right parenthesis 


SQL> CREATE TABLE COURSE ( CID NUMBER(3) NOT NULL,CNAME VARCHAR2(30) NOT NULL,CREDIT NUMBER(1),	CONSTRAINT COURSE_PK_CID PRIMARY KEY (CID),CONSTRAINT COURSE_CK_CID CHECK (CID BETWEEN 101 AND 149),CONSTRAINT COURSE_CK_CREDIT CHECK (CREDIT BETWEEN 1 AND 5),CONSTRAINT COURSE_UQ_CNAME UNIQUE (CNAME));

Table created.

SQL> desc course
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CID                                       NOT NULL NUMBER(3)
 CNAME                                     NOT NULL VARCHAR2(30)
 CREDIT                                             NUMBER(1)

SQL> CREATE TABLE PARTICIPANT (PID NUMBER(4) NOT NULL,PNAME VARCHAR2(25) NOT NULL,GENDER CHAR(1) NOT NULL,CID NUMBER(3),CONSTRAINT PARTICIPANT_PK_PID PRIMARY KEY (PID),CONSTRAINT PARTICIPANT_CK_PID CHECK (PID BETWEEN 1001 AND 9999),CONSTRAINT PARTICIPANT_CK_GENDER CHECK (GENDER IN ( 'M', 'F' )),CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY (CID) REFERENCES COURSE(CID) );

Table created.

SQL> desc practicipant
ERROR:
ORA-04043: object practicipant does not exist 


SQL> desc PARTICIPANT
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PID                                       NOT NULL NUMBER(4)
 PNAME                                     NOT NULL VARCHAR2(25)
 GENDER                                    NOT NULL CHAR(1)
 CID                                                NUMBER(3)

SQL> INSERT INTO COURSE (CID, CNAME, CREDIT)VALUES (101, 'Database Management Systems', 5);

1 row created.

SQL> desc course
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CID                                       NOT NULL NUMBER(3)
 CNAME                                     NOT NULL VARCHAR2(30)
 CREDIT                                             NUMBER(1)

SQL> SELECT * FROM COURSE
  2  .
SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            

SQL> INSERT INTO COURSE (&CID, &CNAME, &CREDIT);
Enter value for cid: AMAN
Enter value for cname: CSE
Enter value for credit: 10
old   1: INSERT INTO COURSE (&CID, &CNAME, &CREDIT)
new   1: INSERT INTO COURSE (AMAN, CSE, 10)
INSERT INTO COURSE (AMAN, CSE, 10)
                               *
ERROR at line 1:
ORA-01747: invalid user.table.column, table.column, or column specification 


SQL> INSERT INTO COURSE (&CID, &CNAME, &CREDIT);
Enter value for cid: 102
Enter value for cname: DAA
Enter value for credit: 8
old   1: INSERT INTO COURSE (&CID, &CNAME, &CREDIT)
new   1: INSERT INTO COURSE (102, DAA, 8)
INSERT INTO COURSE (102, DAA, 8)
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> INSERT INTO COURSE (&CID, '&CNAME', &CREDIT);
Enter value for cid: 102
Enter value for cname: DAA
Enter value for credit: 6
old   1: INSERT INTO COURSE (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE (102, 'DAA', 6)
INSERT INTO COURSE (102, 'DAA', 6)
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> /
Enter value for cid: 103
Enter value for cname: CN
Enter value for credit: 8
old   1: INSERT INTO COURSE (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE (103, 'CN', 8)
INSERT INTO COURSE (103, 'CN', 8)
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            

SQL> INSERT INTO COURSE (&CID, '&CNAME', &CREDIT);
Enter value for cid: 130
Enter value for cname: DAA
Enter value for credit: 4
old   1: INSERT INTO COURSE (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE (130, 'DAA', 4)
INSERT INTO COURSE (130, 'DAA', 4)
                    *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL> INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT);
Enter value for cid: 103
Enter value for cname: DAA
Enter value for credit: 4
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (103, 'DAA', 4)

1 row created.

SQL> /
Enter value for cid: 104
Enter value for cname: CN
Enter value for credit: 5
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (104, 'CN', 5)

1 row created.

SQL> /
Enter value for cid: 104
Enter value for cname: CN
Enter value for credit: 5
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (104, 'CN', 5)
INSERT INTO COURSE VALUES (104, 'CN', 5)
*
ERROR at line 1:
ORA-00001: unique constraint (SYSTEM.COURSE_PK_CID) violated 


SQL> /
Enter value for cid: 106
Enter value for cname: CAO
Enter value for credit: 6
old   1: INSERT INTO COURSE VALUES (&CID, '&CNAME', &CREDIT)
new   1: INSERT INTO COURSE VALUES (106, 'CAO', 6)
INSERT INTO COURSE VALUES (106, 'CAO', 6)
*
ERROR at line 1:
ORA-02290: check constraint (SYSTEM.COURSE_CK_CREDIT) violated 


SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            
       103 DAA                                     4                            
       104 CN                                      5                            

SQL> desc user.constaints;
ERROR:
ORA-00931: missing identifier 


SQL> desc user.constraints;
ERROR:
ORA-00931: missing identifier 


SQL> SELECT * FROM practicipant;
SELECT * FROM practicipant
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> SELECT * FROM COURSE;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            
       103 DAA                                     4                            
       104 CN                                      5                            

SQL> spool off
SQL> select * from tab;

no rows selected

SQL> SELECT *
  2  FROM PARTICIPANT;
FROM PARTICIPANT
     *
ERROR at line 2:
ORA-00942: table or view does not exist 


SQL> desc coursed
ERROR:
ORA-04043: object coursed does not exist 


SQL> desc courses
ERROR:
ORA-04043: object courses does not exist 


SQL> SELECT * FROM COURSE;
SELECT * FROM COURSE
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> CREATE TABLE PARTICIPANT (PID NUMBER(4) NOT NULL,PNAME VARCHAR2(25) NOT NULL,GENDER CHAR (1, NOTNULL ,CIDNUMBER(3),CONSTRAINTPARTICIPANT_PK_PID PRIMARY KEY (PID),CONSTRAINT PARTICIPANT_CK_PID CHECK (PID BETWEEN 1001  AND 9999),CONSTRAINT PARTICIPANT_CK_GENDER CHECK (GENDER IN ( 'M', 'F' )),CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY(CID) REFERENCES COURSE(CID));
CREATE TABLE PARTICIPANT (PID NUMBER(4) NOT NULL,PNAME VARCHAR2(25) NOT NULL,GENDER CHAR (1, NOTNULL ,CIDNUMBER(3),CONSTRAINTPARTICIPANT_PK_PID PRIMARY KEY (PID),CONSTRAINT PARTICIPANT_CK_PID CHECK (PID BETWEEN 1001  AND 9999),CONSTRAINT PARTICIPANT_CK_GENDER CHECK (GENDER IN ( 'M', 'F' )),CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY(CID) REFERENCES COURSE(CID))
                                                                                           *
ERROR at line 1:
ORA-00907: missing right parenthesis 


SQL> CREATE TABLE PARTICIPANT (PID NUMBER(4) NOT NULL,PNAME VARCHAR2(25) NOT NULL,GENDER CHAR (1, NOTNULL ,CIDNUMBER(3),CONSTRAINTPARTICIPANT_PK_PID PRIMARY KEY (PID),CONSTRAINT PARTICIPANT_CK_PID CHECK (PID BETWEEN 1001  AND 9999),CONSTRAINT PARTICIPANT_CK_GENDER CHECK (GENDER IN ( 'M', 'F' )),CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY(CID) REFERENCES COURSE(CID));
CREATE TABLE PARTICIPANT (PID NUMBER(4) NOT NULL,PNAME VARCHAR2(25) NOT NULL,GENDER CHAR (1, NOTNULL ,CIDNUMBER(3),CONSTRAINTPARTICIPANT_PK_PID PRIMARY KEY (PID),CONSTRAINT PARTICIPANT_CK_PID CHECK (PID BETWEEN 1001  AND 9999),CONSTRAINT PARTICIPANT_CK_GENDER CHECK (GENDER IN ( 'M', 'F' )),CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY(CID) REFERENCES COURSE(CID))
                                                                                           *
ERROR at line 1:
ORA-00907: missing right parenthesis 


SQL> spool off
