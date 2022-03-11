 --lab 3
 --load all the data from the sql file

 @ D:\SQL\banking.sql
--QUENTION 1
-- 1) Find all branch names and cities with assets more than 1000000. (on single table)

SELECT BRANCH_NAME, BRANCH_CITY
FROM Branch
WHERE ASSETS>1000000;

--QUESTION 2
-- 2) Find all account numbers and their balance which are opened in ‘Downtown’ branch or which have balance in between 600 and 750. (on single table)

SELECT Account_number, BALANCE 
FROM Account
WHERE BRANCH_NAME = 'Downtown' UNION SELECT Account_number, balance
from account
where BALANCE >= 600 AND BALANCE <=750;

SELECT Account_number, BALANCE 
FROM Account
WHERE BRANCH_NAME = 'Downtown' UNION SELECT Account_number, balance
from account
where BALANCE between 600 AND 750;

--or
SELECT Account_number, BALANCE 
FROM Account
WHERE BRANCH_NAME = 'Downtown' OR BALANCE >= 600 AND BALANCE <=750;


--QUESTION 3
--3) Find all account numbers which are opened in a branch located in ‘Rye’ city. (multiple tables)

SELECT Account_number
FROM Account NATURAL JOIN Branch
WHERE branch_city ='Rye';

--Question 4
--4) Find all loan numbers which have amount greater than or equal to 1000 and their customers are living in ‘Harrison’ city. (multiple tables)

SELECT loan_number
FROM LOAN NATURAL JOIN Customer
WHERE AMOUNT >= 1000 AND customer_city = 'Harrison';

-- Question 5
--5) Display the account related information based on the descending order of the balance. (order by clause)

SELECT *
FROM account order by balance desc;

--Question 6
-- 6) Display the customer related information in alphabetic order of customer cities. (order by clause)

SELECT *
from customer order by customer_city ;

-- Question 7
--7) Find all customer names who have an account as well as a loan. (intersect)

SELECT customer_name
from account natural join depositor intersect
SELECT customer_name
from loan natural join borrower;

-- Question 8
--8) Find all customer related information who have an account or a loan. (union)
SELECT customer_name
from account natural join depositor UNION
SELECT customer_name
from loan natural join borrower;

-- Question 9
-- 9) Find all customer names and their cities who have a loan but not an account. (minus)

SELECT customer_name, CUSTOMER_CITY
 from loan natural join borrower minus
SELECT customer_name
from account natural join depositor;

-- Qustion 10
-- 10) Find the total assets of all branches. (aggregate function)
SELECT SUM(ASSETS) AS TOTAL_ASSETS
FROM BRANCH;

-- Question 11
-- 11) Find the average balance of accounts at each branch. (aggregate function)
SELECT BRANCH_NAME, AVG(balance) as AVG_BALANCE
FROM ACCOUNT
GROUP BY BRANCH_NAME;

-- QUESTION 12
-- 12) Find the average balance of accounts at each branch city. (aggregate function)
SELECT BRANCH_CITY, AVG(BALANCE) AS AVG_BALANCE
FROM ACCOUNT NATURAL JOIN BRANCH
GROUP BY BRANCH_CITY;

--OR

SELECT BRANCH_CITY, AVG(BALANCE) AS AVG_BALANCE
FROM ACCOUNT, BRANCH
WHERE BRANCH.BRANCH_NAME = ACCOUNT.BRANCH_NAME
GROUP BY BRANCH_CITY;

--Question 13
-- 13) Find the lowest amount of loan at each branch. (aggregate function)

SELECT BRANCH_NAME, MIN(AMOUNT) AS LOWEST_AMOUNT
FROM LOAN
GROUP BY BRANCH_NAME;

--QUESTION 14
-- 14) Find the total number of loans at each branch. (aggregate function)

SELECT BRANCH_NAME, COUNT(loan_number) AS NUMBER_OF_LOAN
FROM LOAN 
GROUP BY BRANCH_NAME;

--QUENTION 15
-- 15) 15) Find the customer name and account number of the account which has the highest balance. (aggregate function)


SELECT ACCOUNT_NUMBER, CUSTOMER_NAME,  MAX(BALANCE)
FROM ACCOUNT,DEPOSITOR
WHERE DEPOSITOR.ACCOUNT_NUMBER = ACCOUNT.ACCOUNT_NUMBER;
