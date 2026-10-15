SELECT * FROM HR.EMPLOYEES;
SELECT * FROM HR.DEPARTMENTS;
SELECT * FROM HR.JOBS;
SELECT * FROM HR.LOCATIONS;
SELECT * FROM HR.COUNTRIES;
SELECT * FROM HR.REGIONS;
SELECT * FROM HR.JOB_HOSTORY;


--1.Display employee name and department name.

Tables:
- EMPLOYEES
- DEPARTMENTS

Join:
- EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID

--2.Display employee name and job title.

Tables:
- EMPLOYEES
- JOBS

Join:
- EMPLOYEES.JOB_ID = JOBS.JOB_ID



--3.Display employee name and city where the employee works.

Tables:
- EMPLOYEES
- DEPARTMENTS
- LOCATIONS

Join:
- EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
- DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID

SELECT E.FIRST_NAME || ' ' || E.LAST_NAME, L.CITY
FROM HR.EMPLOYEES E JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
JOIN HR.LOCATIONS L
ON L.LOCATION_ID=D.LOCATION_ID;

--4.Display employee name and department name for employees who do NOT belong to any department.

Tables:
- EMPLOYEES
- DEPARTMENTS

Join:
- EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
- LEFT OUTER JOIN (EMPLOYEES → DEPARTMENTS)


SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM HR.EMPLOYEES E LEFT JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID IS NULL;


--5.Display employee name and manager name.

Tables:
- EMPLOYEES (used twice)

Join:
- EMPLOYEES.MANAGER_ID = EMPLOYEES.EMPLOYEE_ID

SELECT E.FIRST_NAME ||' ' || E.LAST_NAME AS EMPLOYEE_NAME , M.FIRST_NAME || ' ' || M.LAST_NAME AS MANAGER_NAME
FROM HR.EMPLOYEES E LEFT JOIN HR.EMPLOYEES M
ON E.MANAGER_ID=M.EMPLOYEE_ID;

--6.Display department name and total salary of employees in each department.
Tables:
- EMPLOYEES
- DEPARTMENTS

Join:
- EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
- INNER JOIN

Group by:
- DEPARTMENTS.DEPARTMENT_NAME


SELECT DEPARTMENT_NAME,SUM(SALARY) AS TOTAL_SALARY
FROM HR.EMPLOYEES E JOIN HR.DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;

--7.Display manager name and the total salary of employees reporting to each manager.
Tables:
- EMPLOYEES (employee)
- EMPLOYEES (manager)

Join:
- employee.MANAGER_ID = manager.EMPLOYEE_ID

Join type:
- INNER JOIN (employees who have a manager)

Aggregation:
- SUM(employee.SALARY)

Group by:
- manager.EMPLOYEE_ID
- manager.FIRST_NAME
- manager.LAST_NAME

SELECT
    M.FIRST_NAME || ' ' || M.LAST_NAME AS MANAGER_NAME,
    SUM(E.SALARY) AS TOTAL_TEAM_SALARY
FROM HR.EMPLOYEES E
JOIN HR.EMPLOYEES M
    ON E.MANAGER_ID = M.EMPLOYEE_ID
GROUP BY
    M.EMPLOYEE_ID,
    M.FIRST_NAME,
    M.LAST_NAME;

--8.Display employee name, department, salary, and rank employees by salary within each department.

Tables:
- EMPLOYEES

Join:
- NO JOIN REQUIRED

Join type:
- NOT APPLICABLE

Aggregation:
- NONE (ANALYTIC FUNCTION IS USED)

Group by:
- NOT REQUIRED

SELECT
    E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLOYEE_NAME,
    E.DEPARTMENT_ID,
    E.SALARY,
    RANK() OVER (
        PARTITION BY E.DEPARTMENT_ID
        ORDER BY E.SALARY DESC
    ) AS SALARY_RANK
FROM HR.EMPLOYEES E;



--9.Display only the highest-paid employee in each department.

Tables:
- EMPLOYEES

Join:
- NO JOIN REQUIRED

Join type:
- NOT APPLICABLE

Aggregation:
- NONE (ANALYTIC FUNCTION IS REQUIRED)

Group by:
- NOT REQUIRED

SELECT
    EMPLOYEE_NAME,
    DEPARTMENT_ID,
    SALARY
FROM (
    SELECT
        E.FIRST_NAME || ' ' || E.LAST_NAME AS EMPLOYEE_NAME,
        E.DEPARTMENT_ID,
        E.SALARY,
        ROW_NUMBER() OVER (
            PARTITION BY E.DEPARTMENT_ID
            ORDER BY E.SALARY DESC
        ) AS RN
    FROM HR.EMPLOYEES E
)
WHERE RN = 1;


--10.Display employee name, salary, commission, and total pay.(If commission is NULL, treat it as 0.)
Tables:
- EMPLOYEES

Join:
- NO JOIN REQUIRED

Join type:
- NOT APPLICABLE

Aggregation:
- NONE (ROW-LEVEL CALCULATION USING NVL)

Group by:
- NOT REQUIRED


SELECT
    FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME,
    SALARY,
    NVL(COMMISSION_PCT, 0) AS COMMISSION,
    SALARY + NVL(COMMISSION_PCT, 0) AS TOTAL_PAY
FROM HR.EMPLOYEES;

--11.Q2: Display employee name, department ID, and department label.(If department ID is NULL, display ‘NO DEPARTMENT’.)

Tables:
- EMPLOYEES

Join:
- NO JOIN REQUIRED

Join type:
- NOT APPLICABLE

Aggregation:
- NONE (SCALAR FUNCTION USING NVL)

Group by:
- NOT REQUIRED

SELECT
    FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME,
    DEPARTMENT_ID,
    NVL(TO_CHAR(DEPARTMENT_ID), 'NO DEPARTMENT') AS DEPT_STATUS
FROM HR.EMPLOYEES;

--12.Display employee name, commission status, and commission value.(If commission exists, show ‘HAS COMMISSION’, else show ‘NO COMMISSION’.)

Tables:
- EMPLOYEES

Join:
- NO JOIN REQUIRED

Join type:
- NOT APPLICABLE

Aggregation:
- NONE (SCALAR FUNCTION USING NVL2)

Group by:
- NOT REQUIRED

SELECT
    FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME,
    NVL2(COMMISSION_PCT, 'HAS COMMISSION', 'NO COMMISSION') AS COMMISSION_STATUS,
    COMMISSION_PCT
FROM HR.EMPLOYEES;

What NVL2 is doing here (logic):

If COMMISSION_PCT is NOT NULL → 'HAS COMMISSION'

If COMMISSION_PCT is NULL → 'NO COMMISSION'
  
--13.Display employee name and manager label.(If employee has a manager, display ‘HAS MANAGER’, otherwise display ‘TOP LEVEL’.)
Tables:
- EMPLOYEES

Join:
- NO JOIN REQUIRED

Join type:
- NOT APPLICABLE

Aggregation:
- NONE (SCALAR FUNCTION USING NVL2)

Group by:
- NOT REQUIRED

SELECT
    FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME,
    NVL2(MANAGER_ID, 'HAS MANAGER', 'TOP LEVEL') AS MANAGER_STATUS
FROM HR.EMPLOYEES;


What NVL2 is doing here (logic):

If MANAGER_ID is NOT NULL → employee reports to someone

If MANAGER_ID is NULL → top-level employee (CEO / Director)


--14.Show commission, but if commission is NULL show 0.

SELECT
    FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME,
    COALESCE(COMMISSION_PCT, 0) AS COMMISSION
FROM HR.EMPLOYEES;

--15.Display a “reference ID” for each employee:Use DEPARTMENT_ID if present, else MANAGER_ID, else show 0.
SELECT
    FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME,
    COALESCE(DEPARTMENT_ID, MANAGER_ID, 0) AS REFERENCE_ID
FROM HR.EMPLOYEES;

--16.Display department information.If DEPARTMENT_ID is NULL, show ‘NO DEPARTMENT’.

SELECT
    FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE_NAME,
    COALESCE(TO_CHAR(DEPARTMENT_ID), 'NO DEPARTMENT') AS DEPARTMENT
FROM HR.EMPLOYEES;

When to use what:

NVL → simple NULL replacement

NVL2 → IF / ELSE based on NULL

COALESCE → first non-NULL from multiple REAL columns
