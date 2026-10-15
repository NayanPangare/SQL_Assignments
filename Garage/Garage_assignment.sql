--1.CREATE TABLE Customer

CREATE TABLE Customer (
    CID NUMBER(10) PRIMARY KEY, 
    CNAME VARCHAR2(100),
    CADD VARCHAR2(100),
    C_CONTACT VARCHAR2(20),
    C_CREDITDAYS NUMBER(5),
    CJ_DATE DATE,
    SEX VARCHAR2(10)
);

--INSERT DATA INTO CUSTOMER

INSERT INTO Customer VALUES (1001, 'Cyona blake', 'NEW YORK', '1235684', 20, TO_DATE('20-Jan-11', 'DD-Mon-RR'), 'FEMALE');
INSERT INTO Customer VALUES (1002, 'JOHN SMITH', 'NEW JERSI', '1341684', 20, TO_DATE('21-Feb-11', 'DD-Mon-RR'), 'MALE');
INSERT INTO Customer VALUES (1003, 'JORDAN WOOD', 'PRAG', '1805184', 20, TO_DATE('22-Mar-11', 'DD-Mon-RR'), 'MALE');
INSERT INTO Customer VALUES (1004, 'CHRISTNA', 'MANHATTON', '1125684', 31, TO_DATE('23-Apr-13', 'DD-Mon-RR'), 'FEMALE');
INSERT INTO Customer VALUES (1005, 'TOM HILL', 'LONDON', '1239284', 10, TO_DATE('25-Jun-15', 'DD-Mon-RR'), 'MALE');
INSERT INTO Customer VALUES (1006, 'KAMILA JOSEF', 'PARISE', '124568', 9, TO_DATE('28-Jul-11', 'DD-Mon-RR'), 'FEMALE');
INSERT INTO Customer VALUES (1007, 'ANDRU SYMON', 'TAXES', '125654', 15, TO_DATE('01-Apr-16', 'DD-Mon-RR'), 'MALE');
INSERT INTO Customer VALUES (1008, 'SANJU SAMSUNG', 'NEW YORK', '12346341', 4, TO_DATE('20-Jan-16', 'DD-Mon-RR'), 'MALE');

COMMIT;
SELECT * FROM CUSTOMER;

--2. CREATE TABLE Vendors

CREATE TABLE Vendors (
    VID NUMBER(10) PRIMARY KEY, 
    VNAME VARCHAR2(100),
    VADD VARCHAR2(100),
    VCONTACT VARCHAR2(20),
    VCREDITDAYS NUMBER(5),
    VJ_DATE DATE
);

-- INSERT DATA INTO VENDORS 
INSERT INTO Vendors VALUES (2001, 'KIRAN PATIL', 'PUNE', '20535535', 20, TO_DATE('20-Jan-10', 'DD-Mon-RR'));
INSERT INTO Vendors VALUES (2002, 'PRAKASH JAIN', 'MUMBAI', '2063564', 10, TO_DATE('05-Nov-11', 'DD-Mon-RR'));
INSERT INTO Vendors VALUES (2003, 'SWAPNIL THETE', 'NASHIK', '25355352', 15, TO_DATE('18-Mar-10', 'DD-Mon-RR'));
INSERT INTO Vendors VALUES (2004, 'AMOL SHENDE', 'SATARA', '23674776', 18, TO_DATE('07-Apr-15', 'DD-Mon-RR'));
INSERT INTO Vendors VALUES (2005, 'KARAN SINTRE', 'BULDHANA', '256756', 30, TO_DATE('22-Apr-09', 'DD-Mon-RR'));
INSERT INTO Vendors VALUES (2006, 'RAM KULKARNI', 'OSMANABAD', '20367454', 21, TO_DATE('09-Jul-10', 'DD-Mon-RR'));

COMMIT;
SELECT * FROM VENDORS;

--3.Employee1 

CREATE TABLE Employee1 (
    EID NUMBER(10) PRIMARY KEY, 
    ENAME VARCHAR2(100),
    EJOB VARCHAR2(50),
    EADD VARCHAR2(100),
    ECONTACT VARCHAR2(20),
    ESAL NUMBER(10, 2),
    EDOJ DATE,
    EDOL DATE
);

-- INSERT DATA Employee1
INSERT INTO Employee1 VALUES (3001, 'STEVEN KING', 'PAINTER', 'NEW YORK', '10367454', 1200, TO_DATE('09-Jul-10', 'DD-Mon-RR'), NULL);
INSERT INTO Employee1 VALUES (3002, 'DAVID AUSTIN', 'FITTER', 'MAN HATON', '10367434', 1100, TO_DATE('19-Aug-10', 'DD-Mon-RR'), NULL);
INSERT INTO Employee1 VALUES (3003, 'BRUCE ERNST', 'MECHANIC', 'NEW JERCY', '10367264', 2200, TO_DATE('08-Sep-10', 'DD-Mon-RR'), NULL);
INSERT INTO Employee1 VALUES (3004, 'LUIS POPP', 'MECHANIC', 'NEW JERCY', '10367264', 1700, TO_DATE('19-Oct-09', 'DD-Mon-RR'), TO_DATE('06-Sep-10', 'DD-Mon-RR'));
INSERT INTO Employee1 VALUES (3005, 'SHERI GOMES', 'FITTER', 'PARIS', '10327264', 1000, TO_DATE('19-Oct-09', 'DD-Mon-RR'), TO_DATE('01-Aug-10', 'DD-Mon-RR'));
INSERT INTO Employee1 VALUES (3000, 'JAMES PHILLIP', 'FITTER', 'PARIS', '10322264', NULL, TO_DATE('01-Jan-08', 'DD-Mon-RR'), NULL);

COMMIT;
SELECT * FROM Employee1;

--4. CREATE TABLE Sparepart
DROP TABLE Sparepart;
CREATE TABLE Sparepart (
    SPID NUMBER(10) PRIMARY KEY, 
    SPNAME VARCHAR2(100),
    SPRATE NUMBER(10, 2),
    SPUNIT VARCHAR2(10)
);


-- INSERT DATA INTO Sparepart
INSERT INTO Sparepart VALUES (4001, 'TWO WHEELER TUBE', 250, 'NOS');
INSERT INTO Sparepart VALUES (4002, 'TWO WHEELER ENGINE OIL', 400, 'LTRS');
INSERT INTO Sparepart VALUES (4003, 'FOUR WHEELER ENGINE OIL', 5000, 'LTRS');
INSERT INTO Sparepart VALUES (4004, 'TWO WHEELER CARBORATOR', 680, 'NOS');
INSERT INTO Sparepart VALUES (4005, 'TWO WHEELER CLUTCH WIRE', 129, 'MTRS');
INSERT INTO Sparepart VALUES (4006, 'TWO WHEELER TAILLIGHT', 100, 'NOS');
INSERT INTO Sparepart VALUES (4007, 'TWO WHEELER INDICATORS', 150, 'NOS');
INSERT INTO Sparepart VALUES (4008, 'FOUR WHEELER GASKIT', 1340, 'NOS');
INSERT INTO Sparepart VALUES (4009, 'WHITE COLOUR', 340, 'LTRS');
INSERT INTO Sparepart VALUES (4010, 'BLACK COLOUR', 240, 'LTRS');
INSERT INTO Sparepart VALUES (4011, 'TWO WHEELER SIDE MIRROR', 250, 'NOS');
INSERT INTO Sparepart VALUES (4012, 'FOUR WHEELER SIDE MIRROR', 450, 'NOS');
INSERT INTO Sparepart VALUES (4013, 'TWO WHEELER SHOCKUP', 1320, 'PAIR');
INSERT INTO Sparepart VALUES (4014, 'FOUR WHEELER BUMPER', 6000, 'NOS');
INSERT INTO Sparepart VALUES (4015, 'FOUR WHEELER FRONT GLASS', 7000, 'PCS');

COMMIT;
SELECT * FROM Sparepart;

-- 5.CRETAE TABLE Purchase 

CREATE TABLE Purchase (
    PID NUMBER(10) PRIMARY KEY, 
    VID NUMBER(10) REFERENCES Vendors(VID), 
    SPID NUMBER(10) REFERENCES Sparepart(SPID), 
    PQTY NUMBER(10),
    SPRATE NUMBER(10, 2),
    SPGST NUMBER(10, 2),
    PDATE DATE,
    TRANCOST NUMBER(10, 2),
    TOTAL NUMBER(10, 2),
    RCV_EID NUMBER(10) REFERENCES Employee1(EID) 
);


-- CREATE TABLE Purchase 

INSERT INTO Purchase VALUES (5001, 2001, 4001, 10, 250, 350, TO_DATE('01-Jan-11', 'DD-Mon-RR'), 1300, 4150, 3001);
INSERT INTO Purchase VALUES (5002, 2002, 4002, 4, 400, 288, TO_DATE('02-Mar-11', 'DD-Mon-RR'), 100, 1988, 3001);
INSERT INTO Purchase VALUES (5003, 2003, 4004, 8, 680, 761.6, TO_DATE('12-Jun-11', 'DD-Mon-RR'), 50, 6251.6, 3003);
INSERT INTO Purchase VALUES (5004, 2004, 4005, 10, 129, 154.8, TO_DATE('22-Aug-11', 'DD-Mon-RR'), 125, 1569.8, 3004);
INSERT INTO Purchase VALUES (5005, 2005, 4006, 20, 100, 300, TO_DATE('07-Sep-11', 'DD-Mon-RR'), 20, 2320, 3003);
INSERT INTO Purchase VALUES (5006, 2006, 4007, 30, 150, 630, TO_DATE('12-Oct-11', 'DD-Mon-RR'), 60, 5190, 3000);
INSERT INTO Purchase VALUES (5007, 2001, 4003, 20, 5000, 14000, TO_DATE('07-Sep-11', 'DD-Mon-RR'), 1000, 115000, 3000);
INSERT INTO Purchase VALUES (5008, 2006, 4005, 1, 129, 15.48, TO_DATE('12-Oct-11', 'DD-Mon-RR'), 50, 194.48, 3005);
INSERT INTO Purchase VALUES (5009, 2006, 4005, 1, 129, 15.48, TO_DATE('15-Oct-11', 'DD-Mon-RR'), 50, 194.48, 3005);
INSERT INTO Purchase VALUES (5010, 2006, 4009, 5, 340, 238, TO_DATE('20-Oct-11', 'DD-Mon-RR'), 0, 2938, 3005);

COMMIT;
SELECT * FROM Purchase;

--6. CREATE TABLE SER_DET

CREATE TABLE SER_DET (
    SID NUMBER(10) PRIMARY KEY, 
    CID NUMBER(10) REFERENCES Customer(CID), 
    EID NUMBER(10) REFERENCES Employee1(EID), 
    SPID NUMBER(10) REFERENCES Sparepart(SPID),
    TYP_VEH VARCHAR2(50),
    VEH_NO VARCHAR2(20),
    TYP_SER VARCHAR2(100),
    SER_DATE DATE,
    QTY NUMBER(10, 2),
    SP_RATE NUMBER(10, 2),
    SP_AMT NUMBER(10, 2),
    SP_G NUMBER(10, 2),
    SER_AMT NUMBER(10, 2),
    COMM NUMBER(10, 2),
    TOTAL NUMBER(10, 2)
);


-- CREATE TABLE SER_DET 
INSERT INTO SER_DET VALUES (6001, 1001, 3001, 4001, 'TWO WHEELER', 'MH15CA3228', 'TUBE DAMAGED', TO_DATE('02-Jan-11', 'DD-Mon-RR'), 1, 250, 250, 35, 50, 0, 335);
INSERT INTO SER_DET VALUES (6002, 1002, 3002, 4002, 'TWO WHEELER', 'MH-16U5713', 'FULL SERVICING', TO_DATE('04-Mar-11', 'DD-Mon-RR'), 1, 400, 400, 52, 300, 50, 752);
INSERT INTO SER_DET VALUES (6003, 1003, 3004, 4005, 'TWO WHEELER', 'MH12PQ1313', 'CLUCH WIRE', TO_DATE('22-Aug-11', 'DD-Mon-RR'), 1, 129, 129, 0, 10, 0, 139);
INSERT INTO SER_DET VALUES (6004, 1002, 3002, 4002, 'TWO WHEELER', 'MH-16U5713', 'FULL SERVICING', TO_DATE('05-May-11', 'DD-Mon-RR'), 1, 400, 400, 52, 300, 50, 752);
INSERT INTO SER_DET VALUES (6005, 1004, 3001, 4009, 'TWO WHEELER', 'MH-14PA335', 'COLOR', TO_DATE('21-Oct-11', 'DD-Mon-RR'), 2.5, 340, 850, 119, 500, 150, 1469);
INSERT INTO SER_DET VALUES (6006, 1006, 3001, 4009, 'TWO WHEELER', 'MH-12WE334', 'COLOR', TO_DATE('01-Dec-11', 'DD-Mon-RR'), 2.5, 340, 850, 119, 500, 150, 1469);
INSERT INTO SER_DET VALUES (6007, 1007, 3001, 4001, 'FOUR WHEELER', 'MH17BB1345', 'TUBE DAMAGED', TO_DATE('01-Jan-12', 'DD-Mon-RR'), 1, 250, 250, 35, 150, 0, 435);

COMMIT;
SELECT * FROM SER_DET;


SELECT * FROM CUSTOMER;
SELECT * FROM VENDORS;
SELECT * FROM Employee1;
SELECT * FROM Sparepart;
SELECT * FROM Purchase;
SELECT * FROM SER_DET;


--- Q.1 List all the customers serviced.
SELECT DISTINCT CNAME FROM CUSTOMER C JOIN SER_DET S
ON C.CID = S.CID;


--- Q.2 Customers who are not serviced.
SELECT CNAME FROM CUSTOMER
WHERE CID NOT IN (SELECT CID FROM SER_DET);

--- Q.3 Employees who have not received the commission.
SELECT ENAME FROM EMPLOYEE1
WHERE EID NOT IN (SELECT EID FROM SER_DET WHERE COMM > 0);

--- Q.4 Name the employee who have maximum Commission.
SELECT DISTINCT ENAME FROM EMPLOYEE1 E JOIN SER_DET S
ON E.EID = S.EID
WHERE S.COMM = (SELECT MAX(COMM) FROM SER_DET);

--- Q.5 Show employee name and minimum commission amount received by an employee.
SELECT ENAME, MIN(COMM) FROM EMPLOYEE1 E JOIN SER_DET S
ON E.EID = S.EID
GROUP BY ENAME;

--- Q.6 Display the Middle record from any table.
SELECT * FROM (
         SELECT T.*, ROWNUM R FROM CUSTOMERS T
)WHERE R = (SELECT ROUND(COUNT(*) / 2) FROM CUSTOMER);


--- Q.7 Display last 4 records of any table.
SELECT * FROM (
         SELECT * FROM SER_DET 
         ORDER BY SID DESC
) WHERE ROWNUM <= 4;


--- Q.8 Count the number of records without count function from any table.
SELECT MAX(ROWNUM) FROM EMPLOYEE1;

-##-- Q.9 Delete duplicate records from "Ser_det" table on cid.(note Please rollback after execution).
DELETE FROM SER_DET 
WHERE ROWID NOT IN (SELECT MIN(ROWID) FROM SER_DET GROUP BY CID);

ROLLBACK;

--- Q.10 Show the name of Customer who have paid maximum amount 
SELECT C.CNAME FROM CUSTOMER C JOIN SER_DET S
ON C.CID =  S.CID
WHERE S.TOTAL = (SELECT MAX(TOTAL) FROM SER_DET);

--- Q.11 Display Employees who are not currently working.
SELECT ENAME AS NON_WORKING_EMP FROM EMPLOYEE1
WHERE EDOL IS NOT NULL;

--- Q.12 How many customers serviced their two wheelers.
SELECT COUNT(DISTINCT C.CID) AS CUST_SERVICED_TWOWHEELER FROM CUSTOMER C JOIN SER_DET S
ON C.CID = S.CID;

SELECT COUNT(DISTINCT CID) FROM SER_DET;


--- Q.13 List the Purchased Items which are used for Customer Service with Unit of that Item.
SELECT DISTINCT SPNAME, SPUNIT FROM SPAREPART SP JOIN PURCHASE P
ON SP.SPID = P.SPID
JOIN SER_DET S ON S.SPID = P.SPID;


--- Q.14 Customers who have Colored their vehicles.
SELECT CNAME FROM CUSTOMER C JOIN SER_DET S
ON C.CID = S.CID
WHERE TYP_SER = 'COLOR';



--- Q.15 Find the annual income of each employee inclusive of Commission
SELECT E.ENAME, (NVL(ESAL, 0) * 12) + 
                 NVL((SELECT SUM(COMM) FROM SER_DET S
                       WHERE S.EID = E.EID), 0) AS ANNUAL_INCOME
FROM EMPLOYEE1 E;


--- Q.16 Vendor Names who provides the engine oil.
SELECT DISTINCT VNAME FROM VENDORS V JOIN PURCHASE P
ON V.VID = P.VID
JOIN SPAREPART S
ON P.SPID = S.SPID
WHERE SPNAME LIKE '%ENGINE OIL%';

--- Q.17 Total Cost to purchase the Color and name the color purchased.
SELECT SP.SPNAME, SUM(P.TOTAL)
FROM SPAREPART SP JOIN PURCHASE P
ON SP.SPID = P.SPID
WHERE SP.SPNAME LIKE '%COLOUR%'
GROUP BY SP.SPNAME;

--- Q.18 Purchased Items which are not used in "Ser_det".
SELECT SP.SPNAME AS NOT_PURCHASED_ITEM
FROM SPAREPART SP JOIN PURCHASE P
ON SP.SPID = P.SPID
WHERE SP.SPID NOT IN (SELECT SPID FROM SER_DET);



--- Q.19 Spare Parts Not Purchased but existing in Sparepart
SELECT SPNAME AS NOT_PURCHASED_ITEM
FROM SPAREPART WHERE SPID NOT IN (
               SELECT SPID FROM PURCHASE);



--- Q.20 Calculate the Profit/Loss of the Firm. consider one month salary of each employee for Calculation.
-- Profit = (Total Service Income) - (Total Purchase Cost + Total Salaries)

SELECT 
   CASE
     WHEN (INCOME - EXPENSES) >= 0 THEN 'PROFIT IS ' || (INCOME-EXPENSES)
     ELSE 'LOSS IS ' || ABS(INCOME - EXPENSES)
   END AS FINACIAL_STATUS
FROM(
SELECT 
   (SELECT SUM(TOTAL) FROM SER_DET) AS INCOME ,
   ((SELECT SUM(TOTAL) FROM PURCHASE) + (SELECT (SUM(NVL(ESAL, 0))) AS PROFIT_LOSS FROM EMPLOYEE1))AS EXPENSES
   FROM DUAL);
   
   
--- Q.21 Specify the names of customers who have serviced their vehicles more than one time.
SELECT C.CNAME, COUNT(*) AS SERVICING_COUNT FROM CUSTOMER C JOIN SER_DET S
ON C.CID= S.CID
GROUP BY C.CNAME
HAVING COUNT(S.SID)>1;

SELECT CNAME
FROM CUSTOMER
WHERE CID IN(SELECT CID
                    FROM SER_DET
                    GROUP BY CID
                    HAVING COUNT(*)>1);


--- Q.22 List the Items purchased from vendors locationwise.
SELECT SP.SPNAME, VADD AS LOCATION_ FROM PURCHASE P JOIN VENDORS V
ON P.VID=P.VID
JOIN SPAREPART SP
ON SP.SPID=P.SPID;

SELECT V.VADD AS LOCATION, S.SPNAME AS ITEM_NAME
FROM PURCHASE P JOIN VENDORS V
ON P.VID=V.VID
JOIN SPAREPART S
ON P.SPID=P.SPID
ORDER BY V.VADD, S.SPNAME; --NOT MANDATORY

SELECT DISTINCT V.VADD AS LOCATION, S.SPNAME AS ITEM_NAME
FROM PURCHASE P JOIN VENDORS V
ON P.VID=V.VID
JOIN SPAREPART S
ON P.SPID=P.SPID
ORDER BY V.VADD, S.SPNAME; --NOT MANDATORY


--- Q.23 Display count of two wheeler and four wheeler from ser_details
SELECT TYP_VEH AS TYPE_OF_VEHICLE, COUNT(*) FROM SER_DET
GROUP BY TYP_VEH;


--- Q24 Display name of customers who paid highest SPGST and for which item 

SELECT c.cname, sp.spname,s.sp_g FROM ser_det s JOIN customer c
ON s.cid = c.cid
JOIN sparepart sp ON s.spid = sp.spid
WHERE s.sp_g = ( SELECT MAX(sp_g)
                    FROM ser_det);


SELECT * FROM SER_DET;

--- Q25 Display vendors name who have charged highest SPGST rate for which item
SELECT V.VNAME, SP.SPNAME, P.SPGST FROM VENDORS V JOIN PURCHASE P
ON V.VID = P.VID
JOIN SPAREPART SP
ON SP.SPID = P.SPID
WHERE P.SPGST = (SELECT MAX(SPGST) FROM PURCHASE);
 


--- Q26 list name of item and employee name who have received item 
SELECT SP.SPNAME, E.ENAME FROM PURCHASE P JOIN SPAREPART SP
ON P.SPID = SP.SPID
JOIN EMPLOYEE1 E 
ON P.RCV_EID = E.EID;


-- Q27 Display the Name and Vehicle Number of Customer who serviced his vehicle, And Name the Item used for Service, And specify the purchase date of that Item with his vendor and Item Unit and Location, And employee Name who serviced the vehicle. for Vehicle NUMBER "MH-14PA335".
SELECT
    c.cname              AS customer_name,
    s.veh_no              AS vehicle_number,
    sp.spname            AS item_used,
    p.pdate              AS purchase_date,
    v.vname              AS vendor_name,
    v.vadd               AS vendor_location,
    sp.spunit            AS item_unit,
    e.ename              AS employee_name
FROM ser_det s
JOIN customer c
    ON s.cid = c.cid
JOIN sparepart sp
    ON s.spid = sp.spid
JOIN employee1 e
    ON s.eid = e.eid
JOIN purchase p
    ON p.spid = sp.spid
JOIN vendors v
    ON p.vid = v.vid
WHERE s.veh_no = 'MH-14PA335';


--- Q28 who belong this vehicle MH-14PA335" Display the customer name 

SELECT C.CNAME FROM CUSTOMER C JOIN SER_DET S
ON C.CID = S.CID
WHERE S.VEH_NO = 'MH-14PA335';


--- Q29 Display the name of customer who belongs to New York and when he /she service their vehicle on which date 

SELECT C.CNAME, S.SER_DATE FROM CUSTOMER C JOIN SER_DET S
ON C.CID = S.CID
WHERE C.CADD = 'NEW YORK';

SELECT * FROM CUSTOMER;

--- Q 30 from whom we have purchased items having maximum cost?


SELECT V.VNAME, P.TOTAL FROM VENDORS V JOIN PURCHASE P
ON V.VID=P.VID
WHERE P.TOTAL = (SELECT MAX(TOTAL)
                        FROM PURCHASE);


--- Q31 Display the names of employees who are not working as Mechanic and that employee done services .

SELECT DISTINCT E.ENAME FROM EMPLOYEE1 E JOIN SER_DET S
ON E.EID = S.EID
WHERE E.EADD <> 'MECHANIC';


SELECT e.ename
FROM employee1 e
WHERE e.ejob <> 'Mechanic'
AND EXISTS (
    SELECT 1
    FROM ser_det s
    WHERE s.eid = e.eid
);


--- Q32 Display the various jobs along with total number of employees in each job. The output should contain only those jobs with more than two employees.

SELECT EJOB, COUNT(*) AS NO_OF_EMP FROM EMPLOYEE1 
GROUP BY EJOB
HAVING COUNT(*) > 2;

--- Q33 Display the details of employees who done service and give them rank according to their no. of services .

SELECT E.ENAME, COUNT(S.SID), 
RANK() OVER (ORDER BY COUNT(S.SID) DESC) AS RANKING
FROM EMPLOYEE1 E JOIN SER_DET S
ON E.EID = S.EID
GROUP BY E.ENAME;

SELECT
    e.eid,
    e.ename,
    e.ejob,
    e.esal,
    svc.service_count,
    RANK() OVER (ORDER BY svc.service_count DESC) AS service_rank
FROM employee e
JOIN (
    SELECT eid, COUNT(*) AS service_count
    FROM ser_det
    GROUP BY eid
) svc
ON e.eid = svc.eid;


--- Q 34 Display those employees who are working as Painter and fitter and who provide service and total count of service done by fitter and painter 
SELECT E.ENAME, E.EJOB, COUNT(S.SID) AS NO_OF_SERVICES
FROM EMPLOYEE1 E JOIN SER_DET S
ON E.EID = S.EID
WHERE EJOB IN ('PAINTER', 'FITTER')
GROUP BY E.ENAME, E.EJOB;


--- Q35 Display employee salary and as per highest salary provide Grade to employee 
SELECT ENAME, ESAL,
CASE
  WHEN ESAL >= 2000 THEN 'GRADE A'
  WHEN ESAL >= 1100 THEN 'GRADE B'
  ELSE 'GRADE C'
END AS GRADE
FROM EMPLOYEE1;

SELECT 
    ENAME,
    SAL,
    CASE 
        WHEN SAL = (SELECT MAX(SAL) FROM EMPLOYEE) THEN 'A'
        WHEN SAL >= (SELECT MAX(SAL) FROM EMPLOYEE)*0.8 THEN 'B'
        WHEN SAL >= (SELECT MAX(SAL) FROM EMPLOYEE)*0.6 THEN 'C'
        ELSE 'D'
    END AS GRADE
FROM EMPLOYEE;


--- Q36 display the 4th record of emp table without using group by and rowid
SELECT * FROM (
       SELECT E.*, ROWNUM R FROM EMPLOYEE1 E
) WHERE R = 4;


SELECT * FROM (
         SELECT C.*, ROWNUM R FROM CUSTOMER C
)WHERE R = 4;


SELECT *
FROM (SELECT E.*,ROWNUM RN
      FROM (
           SELECT * 
           FROM EMPLOYEE1 
           ORDER BY EID
           ) E
       )
WHERE RN=4;---3RD RECORD

SELECT *
FROM EMPLOYEE1
WHERE ROWID = (
    SELECT rid
    FROM (
        SELECT ROWID AS rid, ROWNUM AS rn
        FROM (
            SELECT ROWID
            FROM EMPLOYEE1
            ORDER BY EID   -- define order explicitly
        )
    )
    WHERE rn = 4
);---WITH ROWID

--- Q37 Provide a commission 100 to employees who are not earning any commission.
SELECT E.ENAME,
       NVL(SUM(S.COMM), 100) AS TOTAL_COMMISSION
FROM EMPLOYEE1 E
LEFT JOIN SER_DET S ON S.EID = E.EID
GROUP BY E.ENAME;



SELECT ENAME,
       NVL((SELECT SUM(COMM) FROM SER_DET S WHERE S.EID = E.EID), 100) AS COMMISSION
FROM EMPLOYEE1 E;



SELECT * FROM SER_DET;

SELECT ENAME, CASE
                   WHEN NVL((SELECT SUM(COMM) FROM SER_DET S WHERE S.EID = E.EID),0) = 0
                   THEN 100
                   ELSE (SELECT SUM(COMM)  FROM SER_DET S WHERE S.EID = E.EID)
               END AS COMMISSION
FROM EMPLOYEE1 E;


--- Q38 write a query that totals no. of services for each day and place the results in descending order
SELECT TRUNC(SER_DATE), COUNT(*) FROM SER_DET 
GROUP BY TRUNC(SER_DATE) 
ORDER BY TRUNC(SER_DATE) DESC; 

SELECT SER_DATE, COUNT(*) AS TOTAL_SERVICES
FROM SER_DET
GROUP BY SER_DATE
ORDER BY TOTAL_SERVICES DESC;


--- Q39 Display the service details of those customer who belong from same city 
SELECT S.* FROM SER_DET S JOIN CUSTOMER C
ON S.CID = C.CID
WHERE C.CADD IN (SELECT CADD FROM CUSTOMER GROUP BY CADD 
               HAVING COUNT(*) > 1);


--- Q40 write a query join customers table to itself to find all pairs of customers service by a single employee
SELECT 
    C1.CNAME AS CUSTOMER_1,
    C2.CNAME AS CUSTOMER_2,
    S1.EID
FROM SER_DET S1
JOIN SER_DET S2 
     ON S1.EID = S2.EID
    AND S1.CID < S2.CID
JOIN CUSTOMER C1 ON C1.CID = S1.CID
JOIN CUSTOMER C2 ON C2.CID = S2.CID;



SELECT A.CNAME, B.CNAME, E.ENAME
FROM SER_DET S1 
JOIN Customer A ON S1.CID = A.CID
JOIN SER_DET S2 ON S1.EID = S2.EID 
JOIN Customer B ON S2.CID = B.CID
JOIN Employee1 E ON S1.EID = E.EID
WHERE A.CID < B.CID;


--- Q41 List each service number follow by name of the customer who made that service

SELECT C.CNAME, S.SID
FROM CUSTOMER C JOIN SER_DET S
ON C.CID = S.CID;

SELECT S.SID AS SERVICE_NO,
       C.CNAME AS CUSTOMER_NAME
FROM SER_DET S
JOIN CUSTOMER C
     ON S.CID = C.CID;
     
--- Q42 Write a query to get details of employee and provide rating on basis of maximum services provide by employee .Note (rating should be like A,B,C,D)
SELECT E.ENAME, COUNT(S.SID),
CASE
  WHEN COUNT(S.SID) >= 3 THEN 'A'
  WHEN COUNT(S.SID) = 2 THEN 'B'
  WHEN COUNT(S.SID) = 1 THEN 'C'
  ELSE 'D'
 END AS RATING
FROM EMPLOYEE1 E LEFT JOIN SER_DET S
ON E.EID = S.EID
GROUP BY E.ENAME;


SELECT EID,
       ENAME,
       TOTAL_SERVICES,
       CASE DENSE_RANK() OVER (ORDER BY TOTAL_SERVICES DESC)
            WHEN 1 THEN 'A'
            WHEN 2 THEN 'B'
            WHEN 3 THEN 'C'
            ELSE 'D'
       END AS RATING
FROM (
    SELECT E.EID, E.ENAME, COUNT(S.SID) AS TOTAL_SERVICES
    FROM EMPLOYEE1 E
    LEFT JOIN SER_DET S ON E.EID = S.EID
    GROUP BY E.EID, E.ENAME
);----correlated subquery


--- Q43 Write a query to get maximum service amount of each customer with their customer details ?

SELECT C.*, (SELECT MAX(TOTAL) FROM SER_DET S
             WHERE S.CID = C.CID) AS MAX_AMT 
FROM CUSTOMER C;



SELECT C.CID,
       C.CNAME,
       C.CITY,
       MAX(S.SERVICE_AMT) AS MAX_SERVICE_AMOUNT
FROM CUSTOMER C
JOIN SER_DET S
     ON C.CID = S.CID
GROUP BY C.CID, C.CNAME, C.CITY;


--- Q44 Get the details of customers with his total no of services ?

SELECT C.*, (SELECT COUNT(S.SID) FROM SER_DET S
             WHERE S.CID = C.CID) AS NO_OF_SERVICES
FROM CUSTOMER C;


SELECT C.CID,
       C.CNAME,
       C.CITY,
       COUNT(S.SID) AS TOTAL_SERVICES
FROM CUSTOMER C
LEFT JOIN SER_DET S
       ON C.CID = S.CID
GROUP BY C.CID, C.CNAME, C.CITY;


--- Q45 From which location sparpart purchased with highest cost ?


SELECT V.VADD AS MAX_PURCHASED_AMT_FROM FROM VENDORS V JOIN PURCHASE P
ON V.VID = P.VID
WHERE P.TOTAL = (SELECT MAX(TOTAL) FROM PURCHASE);


--- Q46 Get the details of employee with their service details who has salary is null

SELECT E.*, S.* FROM EMPLOYEE1 E JOIN SER_DET S
ON E.EID = S.EID
WHERE E.ESAL IS NULL;


SELECT * FROM EMPLOYEE1
WHERE ESAL IS NULL;

SELECT E.EID,
       E.ENAME,
       E.ESAL,
       S.SID,
       S.SER_DATE
FROM EMPLOYEE1 E
JOIN SER_DET S
     ON E.EID = S.EID
WHERE E.ESAL IS NULL;


--- Q.47 find the sum of purchase location wise 


SELECT V.VADD, SUM(P.TOTAL)
FROM VENDORS V JOIN PURCHASE P
ON V.VID = P.VID
GROUP BY V.VADD;


--- Q.48 write a query sum of purchase amount in word location wise ?

SELECT V.VADD AS LOCATION,
       SUM(P.TOTAL) AS TOTAL_PURCHASE_AMOUNT
FROM PURCHASE P
JOIN VENDORS V
  ON P.VID = V.VID
GROUP BY V.VADD
ORDER BY TOTAL_PURCHASE_AMOUNT DESC;


SELECT V.VADD AS LOCATION,
       TO_CHAR(SUM(P.TOTAL), 'SP') AS TOTAL_PURCHASE_IN_WORDS
FROM PURCHASE P
JOIN VENDORS V
  ON P.VID = V.VID
GROUP BY V.VADD
ORDER BY SUM(P.TOTAL) DESC; ----INVALID NUMBER FORMAT ERROR

SELECT V.VADD AS LOCATION,
       TO_CHAR(TRUNC(SUM(TO_NUMBER(P.TOTAL))), 'JSP') AS TOTAL_PURCHASE_IN_WORDS
FROM PURCHASE P
JOIN VENDORS V
  ON P.VID = V.VID
GROUP BY V.VADD
ORDER BY SUM(TO_NUMBER(P.TOTAL)) DESC; ---INVALID NUMBER FORMAT ERROR



--- Q.48 write a query sum of purchase amount in word location wise?
-- Note: In Oracle, use TO_CHAR with 'J' (Julian) format for words, or standard aggregate.

SELECT V.VADD, TO_CHAR(TO_DATE(SUM(P.TOTAL), 'J'), 'JSP') AS AMT_IN_WORDS 
FROM Vendors V 
JOIN Purchase P ON V.VID = P.VID 
GROUP BY V.VADD;


--- Q.49 Has the customer who spent largest amount been given highest rating.
-- (Relies on a Rating definition, assuming 1 star per 1000 spent).
SELECT C.CNAME, S.TOTAL 
FROM Customer C 
JOIN SER_DET S ON C.CID = S.CID 
WHERE S.TOTAL = (SELECT MAX(TOTAL) FROM SER_DET);

SELECT
  CASE
    WHEN c.creditdays = (SELECT MAX(creditdays) FROM customer)
    THEN 'YES'
    ELSE 'NO'
  END AS highest_rating_given
FROM customer c
JOIN ser_det s ON s.cid = c.cid
GROUP BY c.cid, c.creditdays
HAVING SUM(s.total) = (
    SELECT MAX(SUM(total))
    FROM ser_det
    GROUP BY cid
);


--- Q50 select the total amount in service for each customer for which the total is greater than the amount of the largest service amount in the table
SELECT C.CNAME, SUM(S.TOTAL)
FROM CUSTOMER C JOIN SER_DET S
ON C.CID = S.CID
GROUP BY C.CNAME
HAVING SUM(S.TOTAL) > (SELECT MAX(S.TOTAL) FROM SER_DET S);

SELECT
    c.cid,
    c.cname,
    SUM(s.total) AS customer_total
FROM customer c
JOIN ser_det s ON s.cid = c.cid
GROUP BY c.cid, c.cname
HAVING SUM(s.total) >
       (SELECT MAX(total) FROM ser_det);

--- Q51 List the customer name and sparepart name used for their vehicle and vehicle type
SELECT C.CNAME, SP.SPNAME, S.TYP_VEH
FROM CUSTOMER C JOIN SER_DET S
ON C.CID = S.CID
JOIN SPAREPART SP ON SP.SPID = S.SPID;


--- Q52 Write a query to get spname ,ename,cname quantity ,rate ,service amount for record exist in service table 
SELECT SP.SPNAME, E.ENAME, C.CNAME, S.QTY, S.SER_AMT
FROM SER_DET S JOIN SPAREPART SP
ON S.SPID = SP.SPID
JOIN EMPLOYEE1 E ON E.EID = S.EID
JOIN CUSTOMER C ON C.CID = S.CID;


--- Q53 specify the vehicles owners who’s tube damaged.
SELECT C.CNAME, S.TYP_SER
FROM CUSTOMER C JOIN SER_DET S
ON C.CID = S.CID
WHERE TYP_SER = 'TUBE DAMAGED';



--- Q.54 Specify the details who have taken full service.
SELECT * FROM SER_DET
WHERE TYP_SER = 'FULL SERVICING';

--- Q.55 Select the employees who have not worked yet and left the job.


SELECT * FROM EMPLOYEE1
WHERE EID NOT IN (
                   SELECT EID 
                   FROM SER_DET)
                   
AND EDOL IS NOT NULL;


--- Q.56 Select employee who have worked first ever.


SELECT * FROM EMPLOYEE1
WHERE EDOJ = (SELECT MIN(EDOJ) 
                     FROM EMPLOYEE1);


--- Q.57 Display all records falling in odd date

SELECT * FROM SER_DET
WHERE MOD(TO_CHAR(SER_DATE, 'DD'), 2) <> 0;


--- Q.58 Display all records falling in even date

SELECT * FROM SER_DET
WHERE MOD(TO_CHAR(SER_DATE, 'DD'), 2) = 0;


--- Q.59 Display the vendors whose material is not yet used.
SELECT VNAME FROM VENDORS V JOIN PURCHASE P
ON V.VID = P.VID 
WHERE P.SPID NOT IN (SELECT SPID FROM SER_DET);

--- Q.60 Difference between purchase date and used date of spare part.

SELECT SP.SPNAME, (S.SER_DATE - P.PDATE) AS DAYS_DIFF
FROM SER_DET S JOIN PURCHASE P
ON S.SPID = P.SPID
JOIN SPAREPART SP ON S.SPID = SP.SPID;
