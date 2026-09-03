/* =========================================================
   TRANSACTIONS

   A Transaction is a group of SQL operations treated as
   one unit.

   Transactions follow ACID:

   Atomicity  : All operations succeed or all are rolled back.
   Consistency: Database remains in a valid state.
   Isolation  : Transactions work independently from each other.
   Durability : COMMIT makes changes permanent.

   Transaction Commands:

   BEGIN TRANSACTION : Starts transaction.
   COMMIT            : Permanently saves changes.
   ROLLBACK          : Reverts changes made in transaction.
   ========================================================= */


CREATE TABLE Accounts
(
    AccountID INT PRIMARY KEY,
    AccountHolder NVARCHAR(50),
    Balance DECIMAL(10, 2)
);


INSERT INTO Accounts
    (AccountID, AccountHolder, Balance)
VALUES
    (1, 'Alice', 1000.00),
    (2, 'Bob', 500.00);


SELECT *
FROM Accounts;


/* =========================================================
   COMMIT

   Transfer $200 from Alice to Bob.

   Two operations are required:

   1. Debit Alice
   2. Credit Bob

   Both operations should be completed together.
   ========================================================= */


BEGIN TRANSACTION;


-- Debit Alice
UPDATE Accounts
SET Balance = Balance - 200
WHERE AccountID = 1;


-- Credit Bob
UPDATE Accounts
SET Balance = Balance + 200
WHERE AccountID = 2;


-- Check changes before COMMIT
SELECT *
FROM Accounts;


-- Save the transaction permanently
COMMIT;


-- Final balance
SELECT *
FROM Accounts;


/*
   Expected:

   Alice = 800
   Bob   = 700
*/


/* =========================================================
   ROLLBACK

   ROLLBACK cancels all changes made after
   BEGIN TRANSACTION.

   Example:
   Alice has only $1000 but we try to transfer $2000.
   ========================================================= */


BEGIN TRANSACTION;


-- Debit Alice
UPDATE Accounts
SET Balance = Balance - 2000
WHERE AccountID = 1;


-- Credit Bob
UPDATE Accounts
SET Balance = Balance + 2000
WHERE AccountID = 2;


-- Something went wrong.
-- Undo all changes made in this transaction.

ROLLBACK;


-- Balances return to their previous state.
SELECT *
FROM Accounts;


/* =========================================================
   IMPORTANT

   BEGIN TRANSACTION
          |
          v
      SQL Operations
          |
      +---+---+
      |       |
    COMMIT  ROLLBACK
      |       |
      v       v
    SAVE    UNDO
    DATA    CHANGES


   COMMIT   -> Changes become permanent.
   ROLLBACK -> Changes are undone.
   ========================================================= */