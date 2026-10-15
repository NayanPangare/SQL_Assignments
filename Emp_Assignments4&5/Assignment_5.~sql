SELECT * FROM HR.EMPLOYEES;

SELECT * FROM HR.DEPARTMENTS;

SELECT * FROM HR.LOCATIONS;

SELECT * FROM HR.COUNTRIES;

SELECT * FROM HR.REGIONS;



/* Q1. Write a query to generate following output.
Employee_id Full_Name Email Salary
100 Steven King sking@gmail.com  $24,000.00
101 Neena Kochhar nkochhar@gmail.com   $20,000.00
102 Lex De Haan ldehaan@gmail.com  $17,000.00
103 Alexander Hunold  ahunold@gmail.com   $9,000.00
104 Bruce Ernst bernst@gmail.com    $6,000.00
105 David Austin  daustin@gmail.com   $4,800.00
106 Valli Pataballa vpatabal@gmail.com    $4,800.00  */

SELECT * FROM EMPLOYEE5;

SELECT * FROM EMPLOYEE2;

SELECT * FROM EMPLOYEE3;

SELECT * FROM HR.EMPLOYEES;


SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME AS FULL_NAME, 
SUBSTR(FIRST_NAME, 1, 1) || SUBSTR(LAST_NAME, 1, LENGTH(LAST_NAME)) || '@GMAIL.COM' AS GMAIL,
TO_CHAR(SALARY, '$99999.00')SALARY FROM HR.EMPLOYEES;



/*Q2.Write a query to display job_id and number of manager under particular job. Show only those jobs that have more than one manager.
Example:
Job_ID  Managers
IT_PROG 3
SH_CLERK  5
SA_REP  5
ST_CLERK  5  */

SELECT JOB_ID, COUNT(MANAGER_ID) NO_OF_MANAGERS FROM HR.EMPLOYEES
GROUP BY JOB_ID
HAVING COUNT(MANAGER_ID)> 1;



 /* Q3. Display the country name and number of employees those working in particular city that count of employee is greater than 30.
(Hint: Using Equijoin and Group by )  */

SELECT * FROM HR.EMPLOYEES;

SELECT * FROM HR.DEPARTMENTS;

SELECT * FROM HR.LOCATIONS;

SELECT * FROM HR.COUNTRIES;

SELECT * FROM HR.REGIONS;

SELECT * FROM JOB_GRADE;


SELECT C.COUNTRY_NAME, COUNT(E.EMPLOYEE_ID)
FROM HR.COUNTRIES C JOIN HR.LOCATIONS L
ON C.COUNTRY_ID = L.COUNTRY_ID
JOIN HR.DEPARTMENTS D
ON D.LOCATION_ID = L.LOCATION_ID
JOIN HR.EMPLOYEES E
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY C.COUNTRY_NAME
HAVING COUNT(E.EMPLOYEE_ID) > 30;



--- Q4. Display cities name and number of departments present those cities. And exculde departments there are no any employees.
SELECT L.CITY, COUNT(D.DEPARTMENT_ID)NO_OF_DEPARTMENTS
FROM HR.LOCATIONS L JOIN HR.DEPARTMENTS D
ON L.LOCATION_ID = D.LOCATION_ID
JOIN HR.EMPLOYEES E
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID IS NOT NULL
GROUP BY L.CITY;



** /* Q5. Display the salary range and number of employees how are salary in between of range. 
(Hint : Job_Grade table , Equijoin , Group by )
Low_Sal Hig_Sal Number_Of_Employees
1000  2999  24
3000  4999  25
5000  9999  40
10000 14999 16
15000 19999 1
20000 25000 2     */



/*Q6. Display Year list and number of Employees join in particular year.
(Hint: Group by and To_Char Function)   

Year  Number_Of_Employees
2001  1
2002  7
2003  6
2004  10
2005  29
2006  24
2007  19
2008  11        */

SELECT TO_CHAR(HIRE_DATE, 'YYYY')YEAR, COUNT(EMPLOYEE_ID) FROM HR.EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY 1; 



/*Q7. Display Manager_id , Manager Full Name and Under number of employees only those managers how have more than 5 employees under working. Result sort by manager_ID
Manager_ID  Full_Name Number_Of_Employees
100 Steven King 14
120 Matthew Weiss 8
121 Adam Fripp  8
122 Payam Kaufling  8
123 Shanta Vollman  8     */


SELECT E2.EMPLOYEE_ID AS MANAGER_ID, E2.FIRST_NAME || ' ' || E2.LAST_NAME AS MANAGER_NAME,
 COUNT(E1.EMPLOYEE_ID) NUM_OF_EMP
FROM HR.EMPLOYEES E1 JOIN HR.EMPLOYEES E2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID
GROUP BY E2.EMPLOYEE_ID, E2.FIRST_NAME, E2.LAST_NAME
HAVING COUNT(E1.EMPLOYEE_ID) > 5
ORDER BY E2.EMPLOYEE_ID;
