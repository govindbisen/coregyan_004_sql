
/* =========================================================
    TRANSACTION vs LOCK

    TRANSACTION
    -----------
    A Transaction is a logical unit of work.

    Example:
        Money transfer = Debit + Credit

    Transaction controls:
        BEGIN TRANSACTION
        COMMIT
        ROLLBACK


    LOCK
    ----
    A Lock controls concurrent access to data.

    Example:
        Transaction 1 is updating ProductID = 1.
        Transaction 2 tries to update the same row.
        Transaction 2 may have to WAIT until Transaction 1
        releases its lock.


    SIMPLE DIFFERENCE:

        TRANSACTION
            = "Which operations belong together?"

    LOCK
        = "Who can access the data right now?"

    A transaction can HOLD locks while it is running.

    COMMIT / ROLLBACK generally releases the locks held
    by that transaction.

    ========================================================= */


/* =========================================================
    LOCK TYPES

    Shared Lock (S)
    ----------------
    Used when data is being read.

    Multiple transactions can generally hold Shared Locks
    on the same resource simultaneously.


    Exclusive Lock (X)
    ------------------
    Used when data is modified.

    INSERT / UPDATE / DELETE require exclusive access to
    the affected resource.


    Update Lock (U)
    ----------------
    Used when SQL Server expects that data may be updated.

    Helps avoid certain conversion/deadlock situations
    in read-then-update scenarios.


    Intent Locks
    ------------
    Indicate that lower-level locks exist or are intended.

    IS  = Intent Shared
    IX  = Intent Exclusive
    SIX = Shared + Intent Exclusive


    Schema Locks
    ------------
    Sch-S = Schema Stability
    Sch-M = Schema Modification
    ========================================================= */


CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(50),
    Stock INT
);


INSERT INTO Products
    (ProductID, ProductName, Stock)
VALUES
    (1, 'Laptop', 50),
    (2, 'Phone', 100);


SELECT *
FROM Products;


/* =========================================================
    TRANSACTION + LOCK EXAMPLE

    Open TWO query windows/sessions in SSMS.

    SESSION 1
    ---------
    Start a transaction and update ProductID = 1.

    The transaction remains open for 1 minute.
    This allows us to observe blocking from Session 2.
    ========================================================= */


/* SESSION 1 */

BEGIN TRANSACTION;


-- UPDLOCK requests an Update Lock while reading the row.
SELECT *
FROM Products WITH (UPDLOCK)
WHERE ProductID = 1;


-- Modify the same row.
UPDATE Products
    SET Stock = Stock - 10
    WHERE ProductID = 1;


-- Keep transaction open for 1 minute.
-- Lock remains held while transaction is open.
WAITFOR DELAY '00:01';


-- Release transaction and save changes.
COMMIT;


/* =========================================================
    SESSION 2

    Run this while SESSION 1 is waiting.

    Session 2 tries to update the SAME row.

    It will be BLOCKED until Session 1 commits/rolls back
    and releases its lock.
    ========================================================= */


BEGIN TRANSACTION;


UPDATE Products
    SET Stock = Stock - 5
    WHERE ProductID = 1;


COMMIT;


/*
    FLOW:

    SESSION 1
        |
        | BEGIN TRANSACTION
        |
        | UPDLOCK
        |
        | UPDATE ProductID = 1
        |
        | LOCK HELD
        |
        | WAIT
        |
        | COMMIT
        |
        v
    LOCK RELEASED
        |
        v
    SESSION 2 CONTINUES
    */


/* =========================================================
    MONITOR LOCKS

    sys.dm_tran_locks shows locks currently requested/held
    by sessions.
    ========================================================= */


SELECT
    request_session_id AS SPID,
    resource_type AS ResourceType,
    resource_description AS Resource,
    request_mode AS LockType,
    request_status AS LockStatus
FROM sys.dm_tran_locks;


    /* =========================================================
    IMPORTANT TERMS

    LOCK
        Controls access to a resource.

    BLOCKING
        Session A holds a lock and Session B has to wait
        for a conflicting lock.

    DEADLOCK
        Session A waits for Session B,
        while Session B waits for Session A.

    TRANSACTION
        Logical unit of work.

    ISOLATION LEVEL
        Controls how one transaction can see/interact with
        changes made by other transactions.


    INTERVIEW ONE-LINER:

    Transaction defines the unit of work,
    while locks control concurrent access to the data
    involved in that work.
    ========================================================= */

