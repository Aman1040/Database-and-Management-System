SQL> COMMIT;

Commit complete.

SQL> SPOOL OFF;
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
COURSE                         TABLE                                            
DEMO_CUSTOMERS                 TABLE                                            

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
DEMO_ORDERS                    TABLE                                            
DEMO_ORDER_ITEMS               TABLE                                            
DEMO_PRODUCT_INFO              TABLE                                            
DEMO_STATES                    TABLE                                            
DEMO_USERS                     TABLE                                            
DEPT                           TABLE                                            
EMP                            TABLE                                            

18 rows selected.

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
ORA-00001: unique constraint (ADMIN.COURSE_PK_CID) violated 


SQL> INSERT INTO COURSE (CREDIT, CNAME, CID)
  2  VALUES (3, 'Basic Operating System', 101);
INSERT INTO COURSE (CREDIT, CNAME, CID)
*
ERROR at line 1:
ORA-00001: unique constraint (ADMIN.COURSE_PK_CID) violated 


SQL> commit;

Commit complete.

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
ORA-02291: integrity constraint (ADMIN.PARTICIPANT_FK_COURSE_CID) violated - 
parent key not found 


SQL> CREATE SEQUENCE COURSE_SQ1
  2  INCREMENT BY 1
  3  START WITH 106
  4  MINVALUE 101
  5  MAXVALUE 10;
CREATE SEQUENCE COURSE_SQ1
*
ERROR at line 1:
ORA-04004: MINVALUE must be less than MAXVALUE 


SQL> 
SQL> CREATE SEQUENCE SQ1
  2  INCREMENT BY 1
  3  START WITH 106
  4  MINVALUE 101
  5  MAXVALUE 10;
CREATE SEQUENCE SQ1
*
ERROR at line 1:
ORA-04004: MINVALUE must be less than MAXVALUE 


SQL> CREATE SEQUENCE SQ1
  2  INCREMENT BY 1
  3  START WITH 106
  4  MINVALUE 1
  5  MAXVALUE 10;
CREATE SEQUENCE SQ1
*
ERROR at line 1:
ORA-04008: START WITH cannot be more than MAXVALUE 


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
COURSE                         TABLE                                            
DEMO_CUSTOMERS                 TABLE                                            

TNAME                          TABTYPE  CLUSTERID                               
------------------------------ ------- ----------                               
DEMO_ORDERS                    TABLE                                            
DEMO_ORDER_ITEMS               TABLE                                            
DEMO_PRODUCT_INFO              TABLE                                            
DEMO_STATES                    TABLE                                            
DEMO_USERS                     TABLE                                            
DEPT                           TABLE                                            
EMP                            TABLE                                            
PARTICIPANT                    TABLE                                            

19 rows selected.

SQL> select * from course;

       CID CNAME                              CREDIT                            
---------- ------------------------------ ----------                            
       101 Database Management Systems             5                            
       102 Object-Oriented Systems                 4                            

SQL> CREATE SEQUENCE SQ1
  2  INCREMENT BY 1
  3  START WITH 1
  4  MINVALUE 1
  5  MAXVALUE 10;

Sequence created.

SQL> select sq1.nextval from dual;

   NEXTVAL                                                                      
----------                                                                      
         1                                                                      

SQL> /

   NEXTVAL                                                                      
----------                                                                      
         2                                                                      

SQL> /

   NEXTVAL                                                                      
----------                                                                      
         3                                                                      

SQL> /

   NEXTVAL                                                                      
----------                                                                      
         4                                                                      

SQL> /

   NEXTVAL                                                                      
----------                                                                      
         5                                                                      

SQL> /

   NEXTVAL                                                                      
----------                                                                      
         6                                                                      

SQL> /

   NEXTVAL                                                                      
----------                                                                      
         7                                                                      

SQL> /

   NEXTVAL                                                                      
----------                                                                      
         8                                                                      

SQL> /

   NEXTVAL                                                                      
----------                                                                      
         9                                                                      

SQL> /

   NEXTVAL                                                                      
----------                                                                      
        10                                                                      

SQL> /
select sq1.nextval from dual
*
ERROR at line 1:
ORA-08004: sequence SQ1.NEXTVAL exceeds MAXVALUE and cannot be instantiated 


SQL> SELECT * FROM USER_SEQUENCES;

SEQUENCE_NAME                   MIN_VALUE  MAX_VALUE INCREMENT_BY C O CACHE_SIZE
------------------------------ ---------- ---------- ------------ - - ----------
LAST_NUMBER                                                                     
-----------                                                                     
DEMO_CUST_SEQ                           1 1.0000E+28            1 N N         20
         21                                                                     
                                                                                
DEMO_ORDER_ITEMS_SEQ                    1 1.0000E+28            1 N N         20
         61                                                                     
                                                                                
DEMO_ORD_SEQ                            1 1.0000E+28            1 N N         20
         11                                                                     
                                                                                

SEQUENCE_NAME                   MIN_VALUE  MAX_VALUE INCREMENT_BY C O CACHE_SIZE
------------------------------ ---------- ---------- ------------ - - ----------
LAST_NUMBER                                                                     
-----------                                                                     
DEMO_PROD_SEQ                           1 1.0000E+28            1 N N         20
         21                                                                     
                                                                                
DEMO_USERS_SEQ                          1 1.0000E+28            1 N N         20
         21                                                                     
                                                                                
SQ1                                     1         10            1 N N         20
         11                                                                     
                                                                                

6 rows selected.

SQL> SELECT * FROM CAT;

TABLE_NAME                     TABLE_TYPE                                       
------------------------------ -----------                                      
APEX$_ACL                      TABLE                                            
APEX$_WS_FILES                 TABLE                                            
APEX$_WS_HISTORY               TABLE                                            
APEX$_WS_LINKS                 TABLE                                            
APEX$_WS_NOTES                 TABLE                                            
APEX$_WS_ROWS                  TABLE                                            
APEX$_WS_TAGS                  TABLE                                            
APEX$_WS_WEBPG_SECTIONS        TABLE                                            
APEX$_WS_WEBPG_SECTION_HISTORY TABLE                                            
COURSE                         TABLE                                            
DEMO_CUSTOMERS                 TABLE                                            

TABLE_NAME                     TABLE_TYPE                                       
------------------------------ -----------                                      
DEMO_CUST_SEQ                  SEQUENCE                                         
DEMO_ORDERS                    TABLE                                            
DEMO_ORDER_ITEMS               TABLE                                            
DEMO_ORDER_ITEMS_SEQ           SEQUENCE                                         
DEMO_ORD_SEQ                   SEQUENCE                                         
DEMO_PRODUCT_INFO              TABLE                                            
DEMO_PROD_SEQ                  SEQUENCE                                         
DEMO_STATES                    TABLE                                            
DEMO_USERS                     TABLE                                            
DEMO_USERS_SEQ                 SEQUENCE                                         
DEPT                           TABLE                                            

TABLE_NAME                     TABLE_TYPE                                       
------------------------------ -----------                                      
EMP                            TABLE                                            
PARTICIPANT                    TABLE                                            
SQ1                            SEQUENCE                                         

25 rows selected.

SQL> INSERT INTO COURSE
  2  VALUES (COURSE_SQ.NEXTVAL, 'Cloud Computing', 3);
VALUES (COURSE_SQ.NEXTVAL, 'Cloud Computing', 3)
        *
ERROR at line 2:
ORA-02289: sequence does not exist 


SQL> SELECT COURSE_SQ.CURRVAL FROM DUAL;
SELECT COURSE_SQ.CURRVAL FROM DUAL
       *
ERROR at line 1:
ORA-02289: sequence does not exist 


SQL> SELECT * FROM USER_SEQUENCES;

SEQUENCE_NAME                   MIN_VALUE  MAX_VALUE INCREMENT_BY C O CACHE_SIZE
------------------------------ ---------- ---------- ------------ - - ----------
LAST_NUMBER                                                                     
-----------                                                                     
DEMO_CUST_SEQ                           1 1.0000E+28            1 N N         20
         21                                                                     
                                                                                
DEMO_ORDER_ITEMS_SEQ                    1 1.0000E+28            1 N N         20
         61                                                                     
                                                                                
DEMO_ORD_SEQ                            1 1.0000E+28            1 N N         20
         11                                                                     
                                                                                

SEQUENCE_NAME                   MIN_VALUE  MAX_VALUE INCREMENT_BY C O CACHE_SIZE
------------------------------ ---------- ---------- ------------ - - ----------
LAST_NUMBER                                                                     
-----------                                                                     
DEMO_PROD_SEQ                           1 1.0000E+28            1 N N         20
         21                                                                     
                                                                                
DEMO_USERS_SEQ                          1 1.0000E+28            1 N N         20
         21                                                                     
                                                                                
SQ1                                     1         10            1 N N         20
         11                                                                     
                                                                                

6 rows selected.

SQL> INSERT INTO COURSE
  2  VALUES (COURSE_SQ.NEXTVAL, 'Big Data Analytics', 5);
VALUES (COURSE_SQ.NEXTVAL, 'Big Data Analytics', 5)
        *
ERROR at line 2:
ORA-02289: sequence does not exist 


SQL> INSERT INTO COURSE
  2  VALUES (COURSE_SQ.NEXTVAL, 'Oracle Certified Analyst', 3);
VALUES (COURSE_SQ.NEXTVAL, 'Oracle Certified Analyst', 3)
        *
ERROR at line 2:
ORA-02289: sequence does not exist 


SQL> BEGIN
  2    FOR c IN ( SELECT table_name FROM user_tables WHERE table_name LIKE 'EXT_%' )
  3    LOOP
  4      EXECUTE IMMEDIATE 'DROP TABLE ' || c.table_name;
  5    END LOOP;
  6  
  7  ;
  8  
