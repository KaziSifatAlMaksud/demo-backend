create user <name> identified by <password>

-- Lab Task # 01 (Schema Definition):
-- i)
CREATE TABLE ACCOUNT (
    ACCOUNT_NO CHAR(10),
    BALANCE NUMBER NOT NULL,
    CONSTRAINT ACCOUNT_PK PRIMARY KEY(ACCOUNT_NO),
    CONSTRAINT ACCOUNT_BLNC_CHK CHECK(BALANCE>0)
);

--ii)
CREATE TABLE CUSTOMER (
    CUSTOMER_NO CHAR(5),
    CUSTOMER_NAME VARCHAR2(20) NOT NULL,
    CUSTOMER_CITY VARCHAR2(10),
    CONSTRAINT CUSTOMER_PK PRIMARY KEY(CUSTOMER_NO)
);

-- iii)

CREATE TABLE DEPOSITOR (
    ACCOUNT_NO CHAR(5),
    CUSTOMER_NO CHAR(5),
    CONSTRAINT  DEPOSITOR_PK PRIMARY KEY(ACCOUNT_NO,CUSTOMER_NO)
);

-- Lab Task # 02 (Schema Modification):

-- i. Write SQL statement to add a new attribute ‘date_of_birth’ (date type) in customer table.

ALTER TABLE CUSTOMER ADD DATE_OF_BIRTH DATE;

-- ii. Write SQL statement to drop the attribute ‘date_of_birth’ from customer table.

ALTER TABLE CUSTOMER DROP COLUMN DATE_OF_BIRTH;

-- iii. Write SQL statement to rename the attribute account_no, customer_no from depositor table to a_no and c_no, respectively.

ALTER TABLE DEPOSITOR RENAME COLUMN ACCOUNT_NO TO A_NO;
ALTER TABLE DEPOSITOR RENAME COLUMN CUSTOMER_NO TO C_NO;
DESC DEPOSITOR;

--iv) Write SQL statements to add two foreign key constraints ‘depositor_fk1’ and ‘depositor_fk2’ which identifies a_no and c_no as a foreign key.

ALTER TABLE DEPOSITOR ADD CONSTRAINT DEPOSITOR_FK1 FOREIGN KEY(A_NO) REFERENCES ACCOUNT(ACCOUNT_NO);


ALTER TABLE DEPOSITOR ADD CONSTRAINT DEPOSITOR_FK2 FOREIGN KEY(C_NO) REFERENCES CUSTOMER(CUSTOMER_NO);


--Lab Task # 03 (Inserting Records into Tables):

INSERT INTO ACCOUNT VALUES('A-101',12000);
INSERT INTO ACCOUNT VALUES('A-102',6000);
INSERT INTO ACCOUNT VALUES('A-103',2500);
SELECT * FROM ACCOUNT;
INSERT INTO CUSTOMER VALUES('C-101','ALICE','DHAKA');
INSERT INTO CUSTOMER VALUES('C-102','ALICE','DHAKA');
INSERT INTO CUSTOMER VALUES('C-103','BOB','CHITTAGONG');
INSERT INTO CUSTOMER VALUES('C-104','CHARLIE','KHULNA');
SELECT * FROM CUSTOMER;
INSERT INTO DEPOSITOR VALUES('A-101','C-101');
INSERT INTO DEPOSITOR VALUES('A-103','C-102');
INSERT INTO DEPOSITOR VALUES('A-103','C-104');
INSERT INTO DEPOSITOR VALUES('A-102','C-103');
SELECT * FROM DEPOSITOR;


--Lab Task # 04 (Queries):

--i)Display customer name and customer city only.

SELECT CUSTOMER_NAME, CUSTOMER_CITY FROM CUSTOMER;
--ii)Display the unique customer city. No repetitions are allowed.
SELECT DISTINCT CUSTOMER_CITY FROM CUSTOMER;
--iii)Find account numbers with balance more than 7000.

SELECT ACCOUNT_NO FROM ACCOUNT WHERE BALANCE >7000;

--iv)Find customer number and customer name who live in Khulna.

    SELECT CUSTOMER_NO CUSTOMER_NAME FROM CUSTOMER WHERE CUSTOMER_CITY='KHULNA';
--v)Find customer number and customer name who do not live in Dhaka

SELECT CUSTOMER_NO, CUSTOMER_NAME FROM CUSTOMER WHERE CUSTOMER_CITY !='DHAKA';

--vi)Find customer name and customer city who have accounts with balance more than 7000.
--Natural_Join
--select customer_name, customer_city, balance
--from (account natural join depositor) natural join customer
--where balance>7000;

SELECT CUSTOMER_NAME, CUSTOMER_CITY FROM ACCOUNT A, CUSTOMER C, DEPOSITOR D WHERE A.ACCOUNT_NO = D.A_NO AND C.CUSTOMER_NO = D.C_NO AND BALANCE > 7000;


--vii)Find customer name and customer city who have accounts with balance more than 7000 and do not live in Khulna.

SELECT CUSTOMER_NAME, CUSTOMER_CITY FROM ACCOUNT A, CUSTOMER C, DEPOSITOR D WHERE A.ACCOUNT_NO = D.A_NO AND C.CUSTOMER_NO = D.C_NO AND BALANCE >7000 AND CUSTOMER_CITY != 'KHULNA';

--viii)Find account number and balance for those accounts which belong to a customer with id ‘C-102’.

SELECT ACCOUNT_NO, BALANCE FROM ACCOUNT A, CUSTOMER C, DEPOSITOR D WHERE A.ACCOUNT_NO = D.A_NO AND C.CUSTOMER_NO = D.C_NO AND C_NO = 'C-102';

--ix)Find all account number and balance for those accounts which belong to customers of Dhaka and Khulna city.

SELECT ACCOUNT_NO, BALANCE FROM ACCOUNT A, CUSTOMER C, DEPOSITOR D WHERE A.ACCOUNT_NO = D.A_NO AND C.CUSTOMER_NO = D.C_NO AND CUSTOMER_CITY = 'DHAKA' OR CUSTOMER_CITY = 'KHULNA';

--x)Find the customer who have no accounts.

SELECT CUSTOMER_NAME , CUSTOMER_CITY FROM ACCOUNT A, CUSTOMER C, DEPOSITOR D WHERE A.ACCOUNT_NO = D.A_NO AND C.CUSTOMER_NO = D.C_NO AND A_NO =NULL;