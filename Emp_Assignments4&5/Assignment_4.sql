/*
--- 
100 S.King  24000 6/17/2003
116 S.Baida 2900  12/24/2005
117 S.Tobias  2800  7/24/2005
123 S.Vollman 6500  10/10/2005
128 S.Markle  2200  3/8/2008
138 S.Stiles  3200  10/26/2005
161 S.Sewall  7000  11/3/2006                  */

CREATE TABLE EMPLOYEE2 (
 EMPLOYEE_ID NUMBER,
 FULL_NAME VARCHAR2(30),
 SALARY NUMBER,
 HIRE_DATE DATE 
);

INSERT ALL 
  INTO EMPLOYEE2 (Employee_id, Full_Name, Salary, Hire_date) VALUES (100, 'S.King', 24000, TO_DATE('2003-06-17', 'YYYY-MM-DD'))
  INTO EMPLOYEE2 (Employee_id, Full_Name, Salary, Hire_date) VALUES (116, 'S.Baida', 2900, TO_DATE('2005-12-24', 'YYYY-MM-DD'))
  INTO EMPLOYEE2 (Employee_id, Full_Name, Salary, Hire_date) VALUES (117, 'S.Tobias', 2800, TO_DATE('2005-07-24', 'YYYY-MM-DD'))
  INTO EMPLOYEE2 (Employee_id, Full_Name, Salary, Hire_date) VALUES (123, 'S.Vollman', 6500, TO_DATE('2005-10-10', 'YYYY-MM-DD'))
  INTO EMPLOYEE2 (Employee_id, Full_Name, Salary, Hire_date) VALUES (128, 'S.Markle', 2200, TO_DATE('2008-03-08', 'YYYY-MM-DD'))
  INTO EMPLOYEE2 (Employee_id, Full_Name, Salary, Hire_date) VALUES (138, 'S.Stiles', 3200, TO_DATE('2005-10-26', 'YYYY-MM-DD'))
  INTO EMPLOYEE2 (Employee_id, Full_Name, Salary, Hire_date) VALUES (161, 'S.Sewall', 7000, TO_DATE('2006-11-03', 'YYYY-MM-DD'))
SELECT * FROM dual;

SELECT * FROM EMPLOYEE2;

--- Q1: Write a query to display the Full name only those employees whose first name start with ‘S’ character. Employee_id Full Name Salary  Hire_date

SELECT FULL_NAME FROM EMPLOYEE2
WHERE FULL_NAME LIKE 'S%';

SELECT FULL_NAME, SALARY FROM EMPLOYEE2
WHERE FULL_NAME LIKE '__S%';


--- Q2. Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum
--- ,Minimum, Sum, and Average, respectively. Round your results to the nearest whole number. 

SELECT ROUND(MAX(SALARY)) HIGHEST_SALARY, 
ROUND(MIN(SALARY)) LOWEST_SALARY,
ROUND(SUM(SALARY)) SUM,
ROUND(AVG(SALARY)) AVERAGE_SALARY
FROM EMPLOYEE2;


/*
--- Q3. Display following output .
Employee Details
--------------------------------------------------------------------------------------
King earns $24,000.00 monthly but wants $72,000.00.
Kochhar earns $20,000.00 monthly but wants $60,000.00.
De Haan earns $17,000.00 monthly but wants $51,000.00.
Hunold earns $9,000.00 monthly but wants $27,000.00.
Ernst earns $6,000.00 monthly but wants $18,000.00.
Austin earns $4,800.00 monthly but wants $14,400.00. */


SELECT FULL_NAME|| ' ' || 'earns ' || TO_CHAR(SALARY, '$99999.00') || ' monthly but wants ' || TO_CHAR(SALARY*3, '$99999.00')
FROM EMPLOYEE2;


SELECT FULL_NAME || ' earns ' || TO_CHAR(SALARY, '$99999.00') || ' monthly but wants ' ||
TO_CHAR(SALARY*3, '$99999.00') FROM EMPLOYEE2;



--- Q4. Determine the number of managers without listing them. Label the column  Number of Managers Hint: Use the MANAGER_ID column to determine the number of managers. 

SELECT count(manager_id) number_of_managers
FROM employees;


--- Q5. Find the difference between the highest and lowest salaries. Label the column DIFFERENCE


SELECT max(salary)-min(salary) difference
FROM employee2;


--- Q6. Display how many employees joined in each month
--- Hint: Grouping by month and count the employees .use TO_CHAR functions also

SELECT TO_CHAR(HIRE_DATE, 'MONTH') MONTH, COUNT(EMPLOYEE_ID)
FROM EMPLOYEE2
GROUP BY TO_CHAR(HIRE_DATE, 'MONTH')
ORDER BY MONTH;


--- Q7. Display employee id , full name of employees and their hire date only those employees that has greater than 10 year experience in company.
SELECT EMPLOYEE_ID, FULL_NAME, HIRE_DATE FROM EMPLOYEE2
WHERE (TO_CHAR(HIRE_DATE) < SYSDATE-365*10);

--- Q8. Write a query to multipley  salary to commission and calculate the average salary of employees.
Hint: Commission column contain null values

ALTER TABLE EMPLOYEE2
ADD COMM FLOAT;

UPDATE EMPLOYEE2 SET COMM = 1700 WHERE EMPLOYEE_ID = 100;
UPDATE EMPLOYEE2 SET COMM = 600 WHERE EMPLOYEE_ID = 116;
UPDATE EMPLOYEE2 SET COMM = 500 WHERE EMPLOYEE_ID = 117;
UPDATE EMPLOYEE2 SET COMM = NULL WHERE EMPLOYEE_ID = 123;
UPDATE EMPLOYEE2 SET COMM = 200 WHERE EMPLOYEE_ID = 128;
UPDATE EMPLOYEE2 SET COMM = NULL WHERE EMPLOYEE_ID = 138;
UPDATE EMPLOYEE2 SET COMM = 100 WHERE EMPLOYEE_ID = 161;

SELECT * FROM EMPLOYEE2;

SELECT ROUND(AVG(SALARY * NVL(COMM,1)), 2)AVG_SAL_AFTER_COMMISSION FROM EMPLOYEE2;

--- Q9.Write a query to display department_id and number of manager under the particular department exclude the null department.
--- Hint: Grouping on department id


SELECT department_id,count(manager_id)
FROM HR.departments
WHERE department_id is not null
group by department_id;

SELECT * FROM HR.DEPARTMENTS;

SELECT DEPARTMENT_ID, COUNT(MANAGER_ID) FROM HR.DEPARTMENTS
WHERE DEPARTMENT_NAME IS NOT NULL
GROUP BY DEPARTMENT_ID;




*** --- Q10.Display job title and number of employees working those job and number of manager they perform job.

CREATE TABLE EMPLOYEE3 (
    Job_Title VARCHAR(30),
    Employees INT,
    Managers INT
);
DROP TABLE EMPLOYEE3;

INSERT ALL 
  INTO EMPLOYEE3 (Job_Title, Employees, Managers) VALUES ('Accountant', 5, 1)
  INTO EMPLOYEE3 (Job_Title, Employees, Managers) VALUES ('Accounting Manager', 1, 1)
  INTO EMPLOYEE3 (Job_Title, Employees, Managers) VALUES ('Administration Assistant', 1, 1)
  INTO EMPLOYEE3 (Job_Title, Employees, Managers) VALUES ('Administration Vice President', 2, 1)
  INTO EMPLOYEE3 (Job_Title, Employees, Managers) VALUES ('Finance Manager', 1, 1)
  INTO EMPLOYEE3 (Job_Title, Employees, Managers) VALUES ('Human Resources Representative', 1, 1)
  INTO EMPLOYEE3 (Job_Title, Employees, Managers) VALUES ('Marketing Manager', 1, 5)
  INTO EMPLOYEE3 (Job_Title, Employees, Managers) VALUES ('Shipping Clerk', 30, 5)
  INTO EMPLOYEE3 (Job_Title, Employees, Managers) VALUES ('Stock Clerk', 20, 5)
  INTO EMPLOYEE3 (Job_Title, Employees, Managers) VALUES (NULL, 20, 5)
SELECT * FROM dual;

SELECT * FROM EMPLOYEE3;

UPDATE EMPLOYEE3
SET JOB_TITLE = 'SALES REPRESENTATIVE'
WHERE JOB_TITLE IS NULL;


SELECT * FROM EMPLOYEE2;

SELECT count(employee_id),count(manager_id),j.job_title
FROM employee3 e,jobs j
WHERE e.job_id=j.job_id and manager_id is not null
group by j.job_title;

--- Q11. Display employee full name and pad both side asterisk sing 10 time . Example 

Employee Details
**********Ellen Abel**********
**********Sundar Ande**********
**********Mozhe Atkinson**********
**********David Austin**********
**********Hermann Baer**********
**********Shelli Baida**********
**********Amit Banda**********
**********Elizabeth Bates**********


SELECT RPAD('*', 10, '*') || FULL_NAME || RPAD('*', 10, '*') FROM EMPLOYEE2;


--- Q12. Display following output. (Hint: Use Months_between Function)
Employee Id Last _name  Weeks Months  Year
100      King           24    166     14
101      Kochhar        20    139     12
102      De Haan        28    195     16
103      Hunold         19    136     11
104      Ernst          17    119     10
105      Austin         20    142     12


SELECT
    employee_id,
    FULL_name,
    ROUND(months_between(sysdate, hire_date) * 4)AS weeks,
    ROUND(months_between(sysdate, hire_date))AS months,
    ROUND(months_between(sysdate, hire_date) / 12) AS years
FROM employee2;
