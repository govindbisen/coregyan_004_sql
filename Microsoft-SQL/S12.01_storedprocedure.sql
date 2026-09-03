

/* =========================================================
   STORED PROCEDURE WITH INSERT + TRY/CATCH

   TRY:
       Executes the INSERT.

   CATCH:
       Executes if an error occurs.

   Example:
       Duplicate UserID will cause an error.
   ========================================================= */


CREATE PROCEDURE AddUser
    @UserID INT,
    @UserName NVARCHAR(50),
    @Email NVARCHAR(100),
    @Age INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Users
            (UserID, UserName, Email, Age)
        VALUES
            (@UserID, @UserName, @Email, @Age);
        PRINT 'User added successfully';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while adding the user';
        PRINT ERROR_MESSAGE();
    END CATCH
END;


/* =========================================================
   EXECUTE PROCEDURE
   ========================================================= */


EXEC AddUser
    @UserID = 4,
    @UserName = 'Anshul',
    @Email = 'anshul@example.com',
    @Age = 30;


SELECT *
FROM Users;


/* =========================================================
   TRY ERROR CASE

   UserID = 1 already exists.

   PRIMARY KEY violation will occur and CATCH will handle it.
   ========================================================= */


EXEC AddUser
    @UserID = 1,
    @UserName = 'David',
    @Email = 'david@example.com',
    @Age = 30;


/* =========================================================
   IMPORTANT

   CREATE PROCEDURE
       -> Creates/stores procedure in database.

   @Parameter
       -> Accepts input from caller.

   EXEC
       -> Executes procedure.

   TRY
       -> Code that may generate an error.

   CATCH
       -> Handles the error.

   ERROR_MESSAGE()
       -> Returns the actual SQL Server error message.

   DROP PROCEDURE
       -> Removes the procedure.
   ========================================================= */



