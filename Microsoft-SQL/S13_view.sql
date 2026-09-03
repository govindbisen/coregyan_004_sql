/* =========================================================
   SIMPLE VIEW

   A View is a virtual table based on a SELECT query.

   Simple View:
   - Usually based on one table
   - Used to simplify/reuse a SELECT query
   - Does not normally store the actual data separately
   ========================================================= */


CREATE TABLE Users
(
    UserID INT PRIMARY KEY,
    UserName NVARCHAR(50),
    Email NVARCHAR(100),
    Age INT
);


INSERT INTO Users
    (UserID, UserName, Email, Age)
VALUES
    (1, 'Alice', 'alice@example.com', 25),
    (2, 'Bob', 'bob@example.com', 30),
    (3, 'Charlie', 'charlie@example.com', 22);


/* Create View */

CREATE VIEW vw_Users
AS
SELECT
    UserID,
    UserName,
    Email,
    Age
FROM Users;


/* Use the View */

SELECT *
FROM vw_Users;


/* View can be filtered like a table */

SELECT *
FROM vw_Users
WHERE Age >= 25;


/* =========================================================
   VIEW CODE

   See the SELECT query stored inside the View.
   ========================================================= */

EXEC sp_helptext 'vw_Users';


/* =========================================================
   MODIFY VIEW
   ========================================================= */

CREATE OR ALTER VIEW vw_Users
AS
SELECT
    UserID,
    UserName,
    Email
FROM Users;


/* =========================================================
   DELETE VIEW
   ========================================================= */

-- DROP VIEW vw_Users;