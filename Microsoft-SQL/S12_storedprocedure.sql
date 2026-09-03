/* =========================================================
   STORED PROCEDURE

   A Stored Procedure is a pre-defined SQL program stored
   inside the database.

   Benefits:
   - Reusable SQL logic
   - Accepts parameters
   - Can perform SELECT / INSERT / UPDATE / DELETE
   - Can contain IF, loops, transactions, TRY/CATCH, etc.
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


SELECT *
FROM Users;


/* =========================================================
   BASIC STORED PROCEDURE

   @UserId is an INPUT PARAMETER.

   The procedure returns the user whose UserID is provided.
   ========================================================= */


CREATE PROCEDURE GetUserById
    @UserId INT
AS
BEGIN

    SELECT UserID, UserName, Email, Age
    FROM Users
    WHERE UserID = @UserId;

END;


/*Watch stored procedure */


SELECT OBJECT_DEFINITION(
    OBJECT_ID('GetUserById')
);

-- or 

sp_helptext GetUserById

/* Execute Stored Procedure */

EXEC GetUserById 2;


/* Named parameter */

EXEC GetUserById
    @UserId = 2;


/* =========================================================
   DROP PROCEDURE

   Deletes the stored procedure.
   ========================================================= */

-- DROP PROCEDURE GetUserById;
