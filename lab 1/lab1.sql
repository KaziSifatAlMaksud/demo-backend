-- lab 1

-- Question 1 A

CREATE TABLE INSTRUCTOR_2019360050 (
    ID NUMBER,
    NAME VARCHAR2(20),
    DEP_NAME VARCHAR2(20),
    SALARY NUMBER
);

-- Question 1 B

CREATE TABLE COURSES_2019360050 (
    COURSE_ID VARCHAR2(50),
    TITLE VARCHAR2(50),
    DEP_NAME VARCHAR2(50),
    CREDITS NUMBER
);


-- Question 2 A

INSERT INTO INSTRUCTOR_2019360050 VALUES ('10101', 'SRINIVASAN','COMP.SCI.','65000');
INSERT INTO INSTRUCTOR_2019360050 VALUES ('12121', 'WU','FINANCE','90000');
INSERT INTO INSTRUCTOR_2019360050 VALUES ('15151', 'MOZART','MUSIC','40000');
INSERT INTO INSTRUCTOR_2019360050 VALUES ('22222', 'EINSTEIN','PHYSICS','95000');
INSERT INTO INSTRUCTOR_2019360050 VALUES ('32343', 'EL SAID','HISTORY','60000');
INSERT INTO INSTRUCTOR_2019360050 VALUES ('33456', 'GOLD','PHYSICS','87000');
INSERT INTO INSTRUCTOR_2019360050 VALUES ('45565', 'KATZ','COMP.SCI.','75000');
INSERT INTO INSTRUCTOR_2019360050 VALUES ('58583', 'CALIFIERI','HISTORY','62000');
INSERT INTO INSTRUCTOR_2019360050 VALUES ('76543', 'SINGH','FINANCE','80000');
INSERT INTO INSTRUCTOR_2019360050 VALUES ('76766', 'CRICK','BIOLOGY','72000');
INSERT INTO INSTRUCTOR_2019360050 VALUES ('83821', 'BRANDT','COMP.SCI.','92000');
INSERT INTO INSTRUCTOR_2019360050 VALUES ('98345', 'KIM','ELEC. ENG.','80000');

-- Question 2 B
INSERT INTO COURSES_2019360050 VALUES ('BIO-1010','INTRO TO BIOLOGY', 'BIOLOGY', '4');
INSERT INTO COURSES_2019360050 VALUES ('BIO-301','GENETICS', 'BIOLOGY', '4');
INSERT INTO COURSES_2019360050 VALUES ('BIO-399','COMPUTATIONAL BIOLOGY', 'BIOLOGY', '3');
INSERT INTO COURSES_2019360050 VALUES ('CS-101','INTO. TO COMPUTER SCIENCE', 'COMP. SCI.', '4');
INSERT INTO COURSES_2019360050 VALUES ('CS-190','GAME DESIGN', 'COMP. SCI.', '4');
INSERT INTO COURSES_2019360050 VALUES ('CS-315','ROBOTICS', 'COMP. SCI.', '3');
INSERT INTO COURSES_2019360050 VALUES ('CS-319','IMAGE PROCESSING', 'COMP. SCI.', '3');
INSERT INTO COURSES_2019360050 VALUES ('CS-347','DATABASE SYSTEM CONCEPTS', 'COMP. SCI.', '3');
INSERT INTO COURSES_2019360050 VALUES ('EE-181','INTRO. TO DIGITAL SYSTEMS', 'COMP. SCI.', '3');
INSERT INTO COURSES_2019360050 VALUES ('FIN-201','INVESTMENT BANGKING', 'FINANCE', '3');
INSERT INTO COURSES_2019360050 VALUES ('HIS-351','WORLD HISTORY', 'HISTORY', '3');
INSERT INTO COURSES_2019360050 VALUES ('MU-199','MUSIC VIDEO PRODUCTION', 'HISTORY', '3');
INSERT INTO COURSES_2019360050 VALUES ('PHY-101','PHSICAL PRINCIPLES', 'PHYSICS', '4');

-- Question 3 i)

SELECT NAME FROM INSTRUCTOR_2019360050;

-- Question 3 ii)

SELECT COURSE_ID, TITLE FROM COURSES_2019360050;

-- Question 3 iii)

SELECT NAME, DEP_NAME FROM INSTRUCTOR_2019360050 WHERE ID=22222;

--Question 3 iv)

SELECT TITLE, CREDITS FROM COURSES_2019360050 WHERE DEP_NAME='COMP. SCI.';

--Question 3 v)

SELECT NAME, DEP_NAME FROM INSTRUCTOR_2019360050 WHERE SALARY>70000;

--Question 3 vi)

SELECT TITLE FROM COURSES_2019360050 WHERE CREDITS >= 4;

--Question 3 vii)

SELECT NAME, DEP_NAME FROM INSTRUCTOR_2019360050 WHERE SALARY >= 80000 AND SALARY<=100000;

--Question 3 viii)

SELECT TITLE, CREDITS FROM COURSES_2019360050 WHERE DEP_NAME != 'COMP. SCI.';

--Question 3 ix)

SELECT * FROM INSTRUCTOR_2019360050;

--Question 3 x)

SELECT * FROM COURSES_2019360050 WHERE DEP_NAME='BIOLOGY'AND CREDITS !=4;