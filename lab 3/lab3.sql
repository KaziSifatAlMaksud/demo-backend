 --lab 3
 --load all the data from the sql file

 @ D:\SQL\banking.sql
--QUENTION 1

SELECT *
FROM Branch
WHERE ASSETS>1000000;

--QUESTION 2
SELECT Account_number, BALANCE 
FROM Account
WHERE BRANCH_NAME = 'Downtown' UNION SELECT Account_number, balance
from account
where BALANCE >= 600 AND BALANCE <=750;


--or
SELECT Account_number, BALANCE 
FROM Account
WHERE BRANCH_NAME = 'Downtown' OR BALANCE >= 600 AND BALANCE <=750;


--QUESTION 3

SELECT Account_number
FROM Account NATURAL JOIN Branch
WHERE branch_city ='Rye';

--Question 4

SELECT loan_number
FROM LOAN NATURAL JOIN Customer
WHERE AMOUNT >= 1000 AND customer_city = 'Harrison';

-- Question 5

SELECT *
FROM account order by Account_number desc;

--Question 6

SELECT *
from customer order by customer_name;

-- Question 7

SELECT customer_name
from account natural join depositor intersect
SELECT customer_name
from loan natural join borrower;

-- Question 8

SELECT customer_name
from account natural join depositor UNION
SELECT customer_name
from loan natural join borrower;
-- Question 9

SELECT customer_name
 from loan natural join borrower minus
SELECT customer_name
from account natural join depositor;