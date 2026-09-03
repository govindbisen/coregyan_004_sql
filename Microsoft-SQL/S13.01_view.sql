/* =========================================================
   COMPLEX VIEW

   A Complex View can use:

   - Multiple tables
   - JOIN
   - GROUP BY
   - Aggregate functions
   - CASE
   - Calculations

   Example:
   Show each customer with their total orders
   and total amount spent.
   ========================================================= */



CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(50)
);


CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);


INSERT INTO Customers
VALUES
    (1, 'Alice'),
    (2, 'Bob'),
    (3, 'Charlie');


INSERT INTO Orders
VALUES
    (101, 1, 500),
    (102, 1, 300),
    (103, 2, 700);


/* =========================================================
   COMPLEX VIEW

   JOIN + COUNT + SUM + GROUP BY
   ========================================================= */


CREATE VIEW vw_CustomerOrderSummary
AS
SELECT
    C.CustomerID,
    C.CustomerName,

    COUNT(O.OrderID) AS TotalOrders,

    ISNULL(SUM(O.Amount), 0) AS TotalAmount

FROM Customers C

LEFT JOIN Orders O
    ON C.CustomerID = O.CustomerID

GROUP BY
    C.CustomerID,
    C.CustomerName;


/* Use the View */

SELECT *
FROM vw_CustomerOrderSummary;


/* =========================================================
   Example result:

   CustomerID   CustomerName   TotalOrders   TotalAmount
   ------------------------------------------------------
   1             Alice          2             800
   2             Bob            1             700
   3             Charlie        0             0

   ========================================================= */


/* Filter the View */

SELECT *
FROM vw_CustomerOrderSummary
WHERE TotalAmount > 500;


/* =========================================================
   VIEW CODE
   ========================================================= */

EXEC sp_helptext 'vw_CustomerOrderSummary';


/* =========================================================
   MODIFY VIEW
   ========================================================= */

CREATE OR ALTER VIEW vw_CustomerOrderSummary
AS
SELECT
    C.CustomerID,
    C.CustomerName,
    COUNT(O.OrderID) AS TotalOrders,
    ISNULL(SUM(O.Amount), 0) AS TotalAmount
FROM Customers C
LEFT JOIN Orders O
    ON C.CustomerID = O.CustomerID
GROUP BY
    C.CustomerID,
    C.CustomerName;


/* =========================================================
   DELETE VIEW
   ========================================================= */

-- DROP VIEW vw_CustomerOrderSummary;