--1.
DROP TABLE EMP;
CREATE TABLE Emp(
Emp_id NUMBER,
First_name VARCHAR(20),
Last_name VARCHAR(30),
Salary NUMBER(10,2),
Joining_date DATE,
Department VARCHAR(20)
);

INSERT ALL
  INTO Emp (emp_id, first_name, last_name, salary, joining_date, department)
  VALUES (1, 'John', 'Abraham', 1000000, TO_DATE('01-JAN-13','DD-MON-YY'), 'Banking')

  INTO Emp VALUES
  (2, 'Michael', 'Clarke', 800000, TO_DATE('01-JAN-13','DD-MON-YY'), 'Insurance')

  INTO Emp VALUES
  (3, 'Roy', 'Thomas', 700000, TO_DATE('01-FEB-13','DD-MON-YY'), 'Banking')

  INTO Emp VALUES
  (4, 'Tom', 'Jose', 600000, TO_DATE('01-FEB-13','DD-MON-YY'), 'Insurance')

  INTO Emp VALUES
  (5, 'Jerry', 'Pinto', 650000, TO_DATE('01-FEB-13','DD-MON-YY'), 'Insurance')

  INTO Emp VALUES
  (6, 'Philip', 'Mathew', 750000, TO_DATE('01-JAN-13','DD-MON-YY'), 'Services')
SELECT 1 FROM dual;

SELECT * FROM Emp;
--2.--------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE INCENTIVES(
Employee_ref_id NUMBER,
Incentive_date DATE,
Incentive_amount NUMBER(10,2)
);

INSERT ALL
INTO INCENTIVES (Employee_ref_id, Incentive_date, Incentive_amount)
VALUES(1, TO_DATE('01-FEB-13'),5000)

INTO INCENTIVES VALUES(2, TO_DATE('01-FEB-13'),3000)

INTO INCENTIVES VALUES(3, TO_DATE('01-FEB-13'),4000)

INTO INCENTIVES VALUES(1, TO_DATE('01-JAN-13'),4500)

INTO INCENTIVES VALUES(2, TO_DATE('01-JAN-13'),3500)

SELECT 1 FROM DUAL;

SELECT * FROM INCENTIVES;

--3.-----------------------------------------------------------------------------------------------

SELECT * FROM Emp;

--4.-----------------------------------------------------------------------------------------------

SELECT FIRST_NAME,LAST_NAME FROM EMP;

--5.-----------------------------------------------------------------------------------------------

SELECT FIRST_NAME AS Employee_Name
FROM EMP;

--6.-----------------------------------------------------------------------------------------------

SELECT FIRST_NAME, UPPER(FIRST_NAME)
FROM EMP;

--7.-----------------------------------------------------------------------------------------------

SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 1, 3)
FROM emp;

--8.-----------------------------------------------------------------------------------------------
SELECT INSTR(first_name, 'O') AS position_of_o
FROM emp
WHERE first_name = 'JOHN';

SELECT INSTR(UPPER(first_name), 'O')
FROM emp;

--9.-----------------------------------------------------------------------------------------------

SELECT RTRIM(first_name) AS first_name
FROM emp;

--10.----------------------------------------------------------------------------------------------

SELECT REPLACE(first_name, 'O', 'S') AS first_name
FROM emp;

--11.----------------------------------------------------------------------------------------------

SELECT first_name || '_' || last_name AS full_name
FROM emp;

--12.----------------------------------------------------------------------------------------------

SELECT first_name,
EXTRACT(YEAR  FROM JOINING_DATE) AS joining_year,
EXTRACT(MONTH FROM JOINING_DATE) AS joining_month,
EXTRACT(DAY   FROM JOINING_DATE) AS joining_day
FROM emp;

SELECT first_name, 
extract(YEAR to_date(JOINING_DATE)) AS joining_year, 
extract(MONTH to_date(JOINING_DATE)) AS joining_month, 
extract(DAY to_date(JOINING_DATE)) AS joining_day 
FROM emp;

--13.------------------------------------------------------------------------------------------------

SELECT * FROM emp
ORDER BY first_name ASC;

--14.------------------------------------------------------------------------------------------------

SELECT * FROM emp
ORDER BY first_name ASC, SALARY DESC;

--15.------------------------------------------------------------------------------------------------

SELECT * FROM emp
WHERE first_name = 'John';

--16.-----------------------------------------------------------------------------------------------

SELECT * FROM emp
WHERE first_name = 'John' OR FIRST_NAME = 'Roy';

--17.-----------------------------------------------------------------------------------------------

SELECT * FROM emp
WHERE first_name != 'John' OR FIRST_NAME != 'Roy';

--18.-----------------------------------------------------------------------------------------------

SELECT * FROM EMP
WHERE FIRST_NAME LIKE 'J%';

--19.-----------------------------------------------------------------------------------------------

SELECT *
FROM emp
WHERE first_name LIKE '%o%';

--20.-----------------------------------------------------------------------------------------------

SELECT * FROM EMP
WHERE FIRST_NAME LIKE '%n';

--21.-----------------------------------------------------------------------------------------------

SELECT * FROM EMP
WHERE FIRST_NAME LIKE '%___n';

--22.-----------------------------------------------------------------------------------------------

SELECT *
FROM emp
WHERE first_name LIKE 'J___%';

--23.-----------------------------------------------------------------------------------------------

SELECT * 
FROM Emp
WHERE SALARY > 600000;

--24.-----------------------------------------------------------------------------------------------

SELECT * 
FROM EMP
WHERE EXTRACT(YEAR FROM TO_DATE(JOINING_DATE))= 2013;

--25.-----------------------------------------------------------------------------------------------

SELECT * 
FROM EMP
WHERE EXTRACT(MONTH FROM TO_DATE(JOINING_DATE))= '01';

--26.-----------------------------------------------------------------------------------------------

SELECT * 
FROM EMP
WHERE JOINING_DATE < '01-Jan-2013';

--27.-----------------------------------------------------------------------------------------------

SELECT * 
FROM EMP
WHERE JOINING_DATE > '31-Jan-2013';

--28.----------------------------------------------------------------------------------------------

SELECT TO_CHAR(joining_date, 'DD-MON-YYYY HH24:MI:SS') AS joining_datetime
FROM emp;

--29.----------------------------------------------------------------------------------------------

SELECT TO_CHAR(joining_date,'DD-MON-YYYY HH24:MI:SS.FF3') AS joining_datetime --ERROR
FROM emp;

--30.----------------------------------------------------------------------------------------------

SELECT
e.emp_id,
e.first_name,
e.joining_date,
i.incentive_date,
(i.incentive_date - e.joining_date) AS diff_in_days
FROM Emp e
JOIN INCENTIVES i
ON e.emp_id = i.employee_ref_id;


SELECT
e.emp_id,
e.First_name,
e.joining_date,
i.incentive_date,
(i.incentive_date - e.joining_date) AS Day_difference
FROM Emp e
JOIN INCENTIVES i
ON e.Emp_id = i.employee_ref_id;



--- 31. Get department, total salary with respect to a department from employee table.
SELECT DEPARTMENT, SUM(SALARY) FROM EMPLOYEE
GROUP BY DEPARTMENT;

--- 32. Get department, total salary with respect to a department from employee table order by total salary descending.
SELECT DEPARTMENT, SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY DESC;

--- 33. Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.
SELECT DEPARTMENT, COUNT(*) As No_of_Emp, SUM(SALARY) TOTAL_SALARY FROM Emp
GROUP BY DEPARTMENT
ORDER BY TOTAL_SALARY DESC;

select * from emp;
--- 34. Get department wise average salary from employee table order by salary ascending?
SELECT DEPARTMENT, ROUND(AVG(SALARY), 2) AVG_SALARY FROM EMP
GROUP BY DEPARTMENT
ORDER BY AVG_SALARY ASC;


--- 35. Get department wise maximum salary from employee table order by salary ascending?
SELECT DEPARTMENT, MAX(SALARY) MAX_SALARY FROM EMP
GROUP BY DEPARTMENT
ORDER BY MAX_SALARY ASC;


--- 36. Get department wise minimum salary from employee table order by salary ascending?
SELECT DEPARTMENT, MIN(SALARY) MIN_SALARY FROM EMP
GROUP BY DEPARTMENT 
ORDER BY MIN_SALARY ASC;


--- 37. Select no of employees joined with respect to year and month from employee table.
SELECT JOINING_DATE,count(*) As No_of_emp FROM EMP
GROUP BY JOINING_DATE;


--- 38. Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending
SELECT DEPARTMENT, SUM(SALARY) TOTAL_SALARY FROM EMP
GROUP BY DEPARTMENT
HAVING SUM(SALARY) > 800000
ORDER BY TOTAL_SALARY DESC;


--- 39. Select employee details from employee table if data in incentive table?
SELECT * FROM EMP e
INNER JOIN INCENTIVES i 
ON e.EMP_ID = i.EMPLOYEE_REF_ID;

SELECT * FROM EMP;
--- 40. Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table

SELECT FIRST_NAME, LAST_NAME,SALARY,
  CASE
    WHEN FIRST_NAME = 'John' THEN SALARY *.20
    WHEN FIRST_NAME = 'Roy' THEN SALARY *.10
    ELSE SALARY *.15
      
END AS CALCULATED_INCENTIVE
FROM EMP;
      
--- 41. Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services Dept' from employee table.
SELECT E.*,
   CASE
     WHEN DEPARTMENT = 'Banking' THEN REPLACE(DEPARTMENT, 'Banking', 'Bank_dept')
     WHEN DEPARTMENT = 'Insurance' THEN REPLACE(DEPARTMENT, 'Insurance', 'Insurance_Dept')
     WHEN DEPARTMENT = 'Services' THEN REPLACE (DEPARTMENT, 'Services', 'Services_Dept')
   END AS UPDATED_DEPARTMENT
FROM EMP E;

SELECT REPLACE(DEPARTMENT, 'BANKING', 'BANK_DEPT') FROM EMPLOYEE;
SELECT * FROM EMP;

--- 42. Delete employee data from employee table who got incentives in incentive table

SELECT * FROM INCENTIVES;

DELETE e FROM EMP e
INNER JOIN Incentives i
ON e.EMP_ID = i.Employee_Ref_Id;

DELETE FROM EMP e
WHERE EMP_ID IN (SELECT EMPLOYEE_REF_ID FROM INCENTIVES i
WHERE e.Emp_id = i.Employee_ref_id )
;
DELETE FROM EMP e
       WHERE EXISTS(
             SELECT 1
             FROM INCENTIVES i
             WHERE e.Emp_id = i.Employee_ref_id
             );
             

SELECT * FROM EMP;

Rollback;
--- 43. Select first_name, incentive amount from employee and incentives table for those employees who have incentives.

SELECT * FROM INCENTIVES;

SELECT FIRST_NAME,INCENTIVE_AMOUNT 
FROM EMP E JOIN INCENTIVES I
ON E.EMP_ID = I.EMPLOYEE_REF_ID;

--- 44. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT FIRST_NAME,INCENTIVE_AMOUNT 
FROM EMP E JOIN INCENTIVES I
ON E.EMP_ID = I.EMPLOYEE_REF_ID
WHERE INCENTIVE_AMOUNT >3000;

--- 45. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives

SELECT FIRST_NAME,INCENTIVE_AMOUNT 
FROM EMP E LEFT JOIN INCENTIVES I
ON E.EMP_ID = I.EMPLOYEE_REF_ID;

--- 46. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get incentives.

SELECT FIRST_NAME, NVL(INCENTIVE_AMOUNT, 0)
FROM EMP E LEFT JOIN INCENTIVES I
ON E.EMP_ID = I.EMPLOYEE_REF_ID;

--- 47. Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join

SELECT FIRST_NAME, INCENTIVE_AMOUNT
FROM EMP E LEFT JOIN INCENTIVES I
ON E.EMP_ID = I.EMPLOYEE_REF_ID;

--- 48. Select max incentive with respect to employee from employee and incentives table using sub query.

SELECT e.first_name, i.incentive_amount
FROM Emp e
JOIN INCENTIVES i
ON e.emp_id = i.employee_ref_id

WHERE i.incentive_amount = (SELECT MAX(incentive_amount)
                            FROM INCENTIVES);
                            
/*SELECT INCENTIVE_AMOUNT,FIRST_NAME
FROM INCENTIVES
WHERE EMPLOYEE_REF_ID IN (SELECT EMP_ID
                            FROM EMP);*/
                            

