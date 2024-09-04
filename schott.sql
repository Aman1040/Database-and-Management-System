SQL> spooling
SP2-0042: unknown command "spooling" - rest of line ignored.
SQL> spooling ;
SP2-0042: unknown command "spooling " - rest of line ignored.
SQL> spool;
currently spooling to C:\Users\aman\Desktop\desktop\5sem\DBMS\schott.sql
SQL> @ "C:\Users\aman\Desktop\desktop\5sem\DBMS\scottschema.sql";
Building demonstration tables.  Please wait.
DROP TABLE EMP
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


DROP TABLE DEPT
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


DROP TABLE BONUS
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


DROP TABLE SALGRADE
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


DROP TABLE DUMMY
           *
ERROR at line 1:
ORA-00942: table or view does not exist 



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


Table created.


1 row created.


1 row created.


1 row created.


1 row created.


Table created.


Table created.


1 row created.


1 row created.


1 row created.


1 row created.


1 row created.


Table created.


1 row created.


Commit complete.

Demonstration table build is complete.
SQL> spool;
currently spooling to C:\Users\aman\Desktop\desktop\5sem\DBMS\schott.sql
SQL> CREATE SEQUENCE S1
  2  START WITH 50 INCREMENT BY 10;

Sequence created.

SQL>  SELECT S1.NEXTVAL, S1.CURRVAL FROM DUAL;

   NEXTVAL    CURRVAL                                                           
---------- ----------                                                           
        50         50                                                           

SQL>  SELECT S1.CURRVAL FROM DUAL;

   CURRVAL                                                                      
----------                                                                      
        50                                                                      

SQL> CREATE SEQUENCE S2
  2    2  START WITH 1
  3    3  INCREMENT BY 2
  4    4  MAXVALUE 20
  5    5  NOCYCLE
  6    6  NOCACHE;
  2  START WITH 1
  *
ERROR at line 2:
ORA-00933: SQL command not properly ended 


SQL> 
SQL> CREATE SEQUENCE S2
  2  START WITH 1
  3  INCREMENT BY 2
  4  MAXVALUE 20
  5  NOCYCLE
  6  NOCACHE;

Sequence created.

SQL> ALTER SEQUENCE S2
  2  MAXVALUE 30;

Sequence altered.

SQL>  SELECT * FROM USER_SEQUENCES;

SEQUENCE_NAME                   MIN_VALUE  MAX_VALUE INCREMENT_BY C O CACHE_SIZE
------------------------------ ---------- ---------- ------------ - - ----------
LAST_NUMBER                                                                     
-----------                                                                     
S1                                      1 1.0000E+28           10 N N         20
        250                                                                     
                                                                                
S2                                      1         30            2 N N          0
          1                                                                     
                                                                                

SQL> SET LINESIZE 100;
SQL> SELECT * FROM USER_SEQUENCES;

SEQUENCE_NAME                   MIN_VALUE  MAX_VALUE INCREMENT_BY C O CACHE_SIZE LAST_NUMBER        
------------------------------ ---------- ---------- ------------ - - ---------- -----------        
S1                                      1 1.0000E+28           10 N N         20         250        
S2                                      1         30            2 N N          0           1        

SQL> SELECT * FROM CAT;

TABLE_NAME                     TABLE_TYPE                                                           
------------------------------ -----------                                                          
BONUS                          TABLE                                                                
DEPT                           TABLE                                                                
DUMMY                          TABLE                                                                
EMP                            TABLE                                                                
S1                             SEQUENCE                                                             
S2                             SEQUENCE                                                             
SALGRADE                       TABLE                                                                

7 rows selected.

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
ORA-00001: unique constraint (SCHOTT.COURSE_PK_CID) violated 


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
ORA-02291: integrity constraint (SCHOTT.PARTICIPANT_FK_COURSE_CID) violated - parent key not found 


SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID                                                   
------------------------------ ------- ----------                                                   
BONUS                          TABLE                                                                
COURSE                         TABLE                                                                
DEPT                           TABLE                                                                
DUMMY                          TABLE                                                                
EMP                            TABLE                                                                
PARTICIPANT                    TABLE                                                                
SALGRADE                       TABLE                                                                

7 rows selected.

SQL> INSERT INTO COURSE
  2  VALUES(COURSE_SQ.NEXTVAL,'CLOUD COMPUTING',3);
VALUES(COURSE_SQ.NEXTVAL,'CLOUD COMPUTING',3)
       *
ERROR at line 2:
ORA-02289: sequence does not exist 


SQL> CREATE SEQUENCE COURSE_SQ
  2  INCREMENT BY 1
  3  START WITH 101
  4  MINVALUE 101
  5  MAXVALUE 107;

Sequence created.

SQL> select * from cat;

TABLE_NAME                     TABLE_TYPE                                                           
------------------------------ -----------                                                          
BONUS                          TABLE                                                                
COURSE                         TABLE                                                                
COURSE_SQ                      SEQUENCE                                                             
DEPT                           TABLE                                                                
DUMMY                          TABLE                                                                
EMP                            TABLE                                                                
PARTICIPANT                    TABLE                                                                
S1                             SEQUENCE                                                             
S2                             SEQUENCE                                                             
SALGRADE                       TABLE                                                                

10 rows selected.

SQL> create sequence s1;
create sequence s1
                *
ERROR at line 1:
ORA-00955: name is already used by an existing object 


SQL> select * from user_sequences;

SEQUENCE_NAME                   MIN_VALUE  MAX_VALUE INCREMENT_BY C O CACHE_SIZE LAST_NUMBER        
------------------------------ ---------- ---------- ------------ - - ---------- -----------        
COURSE_SQ                             101        107            1 N N         20         101        
S1                                      1 1.0000E+28           10 N N         20         250        
S2                                      1         30            2 N N          0           1        

SQL> select s1.currval , s1.nextval from dual;

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       250        250                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       260        260                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       270        270                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       280        280                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       290        290                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       300        300                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       310        310                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       320        320                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       330        330                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       340        340                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       350        350                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       360        360                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       370        370                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       380        380                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       390        390                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       400        400                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       410        410                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       420        420                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       430        430                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       440        440                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       450        450                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       460        460                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       470        470                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       480        480                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       490        490                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       500        500                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       510        510                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       520        520                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       530        530                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       540        540                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       550        550                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       560        560                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       570        570                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       580        580                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       590        590                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       600        600                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       610        610                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       620        620                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       630        630                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       640        640                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       650        650                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       660        660                                                                               

SQL> //

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       670        670                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       680        680                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       690        690                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       700        700                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       710        710                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       720        720                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       730        730                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       740        740                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       750        750                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       760        760                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       770        770                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       780        780                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       790        790                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
       800        800                                                                               

SQL> create sequence rev
  2   increment by -1
  3  start with 10
  4  minvalue -1
  5  maxvalue 10;

Sequence created.

SQL> select rev.currval , rev.nextval from dual;

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
        10         10                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
         9          9                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
         8          8                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
         7          7                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
         6          6                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
         5          5                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
         4          4                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
         3          3                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
         2          2                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
         1          1                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
         0          0                                                                               

SQL> /

   CURRVAL    NEXTVAL                                                                               
---------- ----------                                                                               
        -1         -1                                                                               

SQL> /
select rev.currval , rev.nextval from dual
*
ERROR at line 1:
ORA-08004: sequence REV.NEXTVAL goes below MINVALUE and cannot be instantiated 


SQL> show user;
USER is "SCHOTT"
SQL> select * from emp;

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20               
      7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300         30               
      7521 WARD       SALESMAN        7698 22-FEB-81       1250        500         30               
      7566 JONES      MANAGER         7839 02-APR-81       2975                    20               
      7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400         30               
      7698 BLAKE      MANAGER         7839 01-MAY-81       2850                    30               
      7782 CLARK      MANAGER         7839 09-JUN-81       2450                    10               
      7788 SCOTT      ANALYST         7566 09-DEC-82       3000                    20               
      7839 KING       PRESIDENT            17-NOV-81       5000                    10               
      7844 TURNER     SALESMAN        7698 08-SEP-81       1500          0         30               
      7876 ADAMS      CLERK           7788 12-JAN-83       1100                    20               

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO               
---------- ---------- --------- ---------- --------- ---------- ---------- ----------               
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30               
      7902 FORD       ANALYST         7566 03-DEC-81       3000                    20               
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10               

14 rows selected.

SQL> select * from dept;

    DEPTNO DNAME          LOC                                                                       
---------- -------------- -------------                                                             
        10 ACCOUNTING     NEW YORK                                                                  
        20 RESEARCH       DALLAS                                                                    
        30 SALES          CHICAGO                                                                   
        40 OPERATIONS     BOSTON                                                                    

SQL> select * from salgrade;

     GRADE      LOSAL      HISAL                                                                    
---------- ---------- ----------                                                                    
         1        700       1200                                                                    
         2       1201       1400                                                                    
         3       1401       2000                                                                    
         4       2001       3000                                                                    
         5       3001       9999                                                                    

SQL>  select * from cat;

TABLE_NAME                     TABLE_TYPE                                                           
------------------------------ -----------                                                          
BONUS                          TABLE                                                                
COURSE                         TABLE                                                                
COURSE_SQ                      SEQUENCE                                                             
DEPT                           TABLE                                                                
DUMMY                          TABLE                                                                
EMP                            TABLE                                                                
PARTICIPANT                    TABLE                                                                
REV                            SEQUENCE                                                             
S1                             SEQUENCE                                                             
S2                             SEQUENCE                                                             
SALGRADE                       TABLE                                                                

11 rows selected.

SQL> grant create view to schott;
grant create view to schott
*
ERROR at line 1:
ORA-01031: insufficient privileges 


SQL> connect;
Enter user-name: system
Connected.
SQL> grant create view to schott;

Grant succeeded.

SQL> show userl
SP2-0158: unknown SHOW option "userl"
SQL> show user;
USER is "SYSTEM"
SQL> connect;
Enter user-name: schott
Connected.
SQL> show user;
USER is "SCHOTT"
SQL> select * from cat;

TABLE_NAME                     TABLE_TYPE                                                           
------------------------------ -----------                                                          
BONUS                          TABLE                                                                
COURSE                         TABLE                                                                
COURSE_SQ                      SEQUENCE                                                             
DEPT                           TABLE                                                                
DUMMY                          TABLE                                                                
EMP                            TABLE                                                                
PARTICIPANT                    TABLE                                                                
REV                            SEQUENCE                                                             
S1                             SEQUENCE                                                             
S2                             SEQUENCE                                                             
SALGRADE                       TABLE                                                                

11 rows selected.

SQL> select * from salgrade;

     GRADE      LOSAL      HISAL                                                                    
---------- ---------- ----------                                                                    
         1        700       1200                                                                    
         2       1201       1400                                                                    
         3       1401       2000                                                                    
         4       2001       3000                                                                    
         5       3001       9999                                                                    

SQL> CREATE VIEW EMP_SAL
  2  AS SELECT EMPNO, ENAME, SAL
  3  FROM EMP;

View created.

SQL> SELECT * FROM EMP_SAL;

     EMPNO ENAME             SAL                                                                    
---------- ---------- ----------                                                                    
      7369 SMITH             800                                                                    
      7499 ALLEN            1600                                                                    
      7521 WARD             1250                                                                    
      7566 JONES            2975                                                                    
      7654 MARTIN           1250                                                                    
      7698 BLAKE            2850                                                                    
      7782 CLARK            2450                                                                    
      7788 SCOTT            3000                                                                    
      7839 KING             5000                                                                    
      7844 TURNER           1500                                                                    
      7876 ADAMS            1100                                                                    

     EMPNO ENAME             SAL                                                                    
---------- ---------- ----------                                                                    
      7900 JAMES             950                                                                    
      7902 FORD             3000                                                                    
      7934 MILLER           1300                                                                    

14 rows selected.

SQL>  CREATE VIEW v1 AS
  2  SELECT *
  3  FROM dept
  4  WITH CHECK OPTION;

View created.

SQL> SELECT * FROM V1;

    DEPTNO DNAME          LOC                                                                       
---------- -------------- -------------                                                             
        10 ACCOUNTING     NEW YORK                                                                  
        20 RESEARCH       DALLAS                                                                    
        30 SALES          CHICAGO                                                                   
        40 OPERATIONS     BOSTON                                                                    

SQL> DESC USER_VIEWS;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 VIEW_NAME                                             NOT NULL VARCHAR2(30)
 TEXT_LENGTH                                                    NUMBER
 TEXT                                                           LONG
 TYPE_TEXT_LENGTH                                               NUMBER
 TYPE_TEXT                                                      VARCHAR2(4000)
 OID_TEXT_LENGTH                                                NUMBER
 OID_TEXT                                                       VARCHAR2(4000)
 VIEW_TYPE_OWNER                                                VARCHAR2(30)
 VIEW_TYPE                                                      VARCHAR2(30)
 SUPERVIEW_NAME                                                 VARCHAR2(30)
 EDITIONING_VIEW                                                VARCHAR2(1)
 READ_ONLY                                                      VARCHAR2(1)

SQL> SELECT VIEW_NAME,READ_ONLY FROM USER_VIEWS;

VIEW_NAME                      R                                                                    
------------------------------ -                                                                    
EMP_SAL                        N                                                                    
V1                             N                                                                    

SQL> DROP VIEW V1;

View dropped.

SQL> CREATE VIEW v1 AS;
CREATE VIEW v1 AS
                *
ERROR at line 1:
ORA-00928: missing SELECT keyword 


SQL>  CREATE VIEW v1 AS
  2  SELECT *
  3  FROM dept
  4  WITH CHECK OPTION;

View created.

SQL> SELECT * FROM DEPT;

    DEPTNO DNAME          LOC                                                                       
---------- -------------- -------------                                                             
        10 ACCOUNTING     NEW YORK                                                                  
        20 RESEARCH       DALLAS                                                                    
        30 SALES          CHICAGO                                                                   
        40 OPERATIONS     BOSTON                                                                    

SQL> DESC VIEWS;
ERROR:
ORA-04043: object VIEWS does not exist 


SQL>  DESC USER_VIEWS;
 Name                                                  Null?    Type
 ----------------------------------------------------- -------- ------------------------------------
 VIEW_NAME                                             NOT NULL VARCHAR2(30)
 TEXT_LENGTH                                                    NUMBER
 TEXT                                                           LONG
 TYPE_TEXT_LENGTH                                               NUMBER
 TYPE_TEXT                                                      VARCHAR2(4000)
 OID_TEXT_LENGTH                                                NUMBER
 OID_TEXT                                                       VARCHAR2(4000)
 VIEW_TYPE_OWNER                                                VARCHAR2(30)
 VIEW_TYPE                                                      VARCHAR2(30)
 SUPERVIEW_NAME                                                 VARCHAR2(30)
 EDITIONING_VIEW                                                VARCHAR2(1)
 READ_ONLY                                                      VARCHAR2(1)

SQL> SELECT VIEW_NAME, READ_ONLY FROM USER_VIEWS;

VIEW_NAME                      R                                                                    
------------------------------ -                                                                    
EMP_SAL                        N                                                                    
V1                             N                                                                    

SQL> INSERT INTO V1
  2   VALUES(50,'CSE','NAGPUR');

1 row created.

SQL> SELECT * FROM V1;

    DEPTNO DNAME          LOC                                                                       
---------- -------------- -------------                                                             
        10 ACCOUNTING     NEW YORK                                                                  
        20 RESEARCH       DALLAS                                                                    
        30 SALES          CHICAGO                                                                   
        40 OPERATIONS     BOSTON                                                                    
        50 CSE            NAGPUR                                                                    

SQL>  CREATE VIEW v1 AS
  2  AS SELECT EMPNO, ENAME, SAL
  3  FROM dept
  4  WITH CHECK READ ONLY;
AS SELECT EMPNO, ENAME, SAL
*
ERROR at line 2:
ORA-00928: missing SELECT keyword 


SQL> DROP VIEW V1;

View dropped.

SQL> CREATE VIEW V1
  2   AS SELECT *
  3   FROM DEPT
  4   WITH READ ONLY;

View created.

SQL> SELECT * FROM V1;

    DEPTNO DNAME          LOC                                                                       
---------- -------------- -------------                                                             
        10 ACCOUNTING     NEW YORK                                                                  
        20 RESEARCH       DALLAS                                                                    
        30 SALES          CHICAGO                                                                   
        40 OPERATIONS     BOSTON                                                                    
        50 CSE            NAGPUR                                                                    

SQL> DROP VIEW V1;

View dropped.

SQL> CREATE VIEW DEPT_VIEW
  2     AS SELECT * FROM EMP;

View created.

SQL>  DROP VIEW DEPT_VIEW;

View dropped.

SQL> CREATE VIEW DEPT_VIEW
  2     AS SELECT EMPNO,ENAME,SAL
  3     FROM EMP
  4     WITH READ ONLY;

View created.

SQL> SELECT * FROM DEPT_VIEW;

     EMPNO ENAME             SAL                                                                    
---------- ---------- ----------                                                                    
      7369 SMITH             800                                                                    
      7499 ALLEN            1600                                                                    
      7521 WARD             1250                                                                    
      7566 JONES            2975                                                                    
      7654 MARTIN           1250                                                                    
      7698 BLAKE            2850                                                                    
      7782 CLARK            2450                                                                    
      7788 SCOTT            3000                                                                    
      7839 KING             5000                                                                    
      7844 TURNER           1500                                                                    
      7876 ADAMS            1100                                                                    

     EMPNO ENAME             SAL                                                                    
---------- ---------- ----------                                                                    
      7900 JAMES             950                                                                    
      7902 FORD             3000                                                                    
      7934 MILLER           1300                                                                    

14 rows selected.

SQL> commit;

Commit complete.

SQL> DROP VIEW DEPT_VIEW;

View dropped.

SQL> CREATE VIEW DEPT_VIEW
  2     AS SELECT EMPNO,ENAME,SAL
  3     FROM EMP
  4     WITH READ ONLY;

View created.

SQL> SELECT * FROM DEPT_VIEW;

     EMPNO ENAME             SAL                                                                    
---------- ---------- ----------                                                                    
      7369 SMITH             800                                                                    
      7499 ALLEN            1600                                                                    
      7521 WARD             1250                                                                    
      7566 JONES            2975                                                                    
      7654 MARTIN           1250                                                                    
      7698 BLAKE            2850                                                                    
      7782 CLARK            2450                                                                    
      7788 SCOTT            3000                                                                    
      7839 KING             5000                                                                    
      7844 TURNER           1500                                                                    
      7876 ADAMS            1100                                                                    

     EMPNO ENAME             SAL                                                                    
---------- ---------- ----------                                                                    
      7900 JAMES             950                                                                    
      7902 FORD             3000                                                                    
      7934 MILLER           1300                                                                    

14 rows selected.

SQL> SELECT * FROM USER_VIEWS;

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
DEPT_VIEW                               52                                                          

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
SELECT EMPNO,ENAME,SAL                                                                              

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
   FROM EMP                                                                                         

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
   WITH READ ONLY                                                                                   

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                             N Y    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
EMP_SAL                                 33                                                          

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
SELECT EMPNO, ENAME, SAL                                                                            

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
FROM EMP                                                                                            

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                             N N    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

SQL> SET LINESIZE 100
SQL> SELECT * FROM USER_VIEWS;

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
DEPT_VIEW                               52                                                          

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
SELECT EMPNO,ENAME,SAL                                                                              

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
   FROM EMP                                                                                         

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
   WITH READ ONLY                                                                                   

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                             N Y    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
EMP_SAL                                 33                                                          

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
SELECT EMPNO, ENAME, SAL                                                                            

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
FROM EMP                                                                                            

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                             N N    

VIEW_NAME                      TEXT_LENGTH                                                          
------------------------------ -----------                                                          
TEXT                                                                             TYPE_TEXT_LENGTH   
-------------------------------------------------------------------------------- ----------------   
TYPE_TEXT                                                                                           
----------------------------------------------------------------------------------------------------
OID_TEXT_LENGTH                                                                                     
---------------                                                                                     
OID_TEXT                                                                                            
----------------------------------------------------------------------------------------------------
VIEW_TYPE_OWNER                VIEW_TYPE                      SUPERVIEW_NAME                 E R    
------------------------------ ------------------------------ ------------------------------ - -    
                                                                                                    

SQL> SET LINESIZE 50
SQL>  SELECT * FROM USER_VIEWS;

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
DEPT_VIEW                               52        

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
SELECT EMPNO,ENAME,SAL                            

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
   FROM EMP                                       

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
   WITH READ ONLY                                 

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                               N Y                

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
EMP_SAL                                 33        

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
SELECT EMPNO, ENAME, SAL                          

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
FROM EMP                                          

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                               N N                

VIEW_NAME                      TEXT_LENGTH        
------------------------------ -----------        
TEXT                                              
--------------------------------------------------
TYPE_TEXT_LENGTH                                  
----------------                                  
TYPE_TEXT                                         
--------------------------------------------------
OID_TEXT_LENGTH                                   
---------------                                   
OID_TEXT                                          
--------------------------------------------------
VIEW_TYPE_OWNER                                   
------------------------------                    
VIEW_TYPE                                         
------------------------------                    
SUPERVIEW_NAME                 E R                
------------------------------ - -                
                                                  

SQL> spool off;
