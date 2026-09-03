
/* =========================================================
    HOW ARE LOCKS CREATED?

    Normally, USER DOES NOT CREATE LOCKS MANUALLY.

    SQL Server automatically creates/acquires locks when
    transactions perform READ or WRITE operations.

    Example:

        SELECT  -> Shared Lock (S)
        UPDATE  -> Exclusive Lock (X)
        DELETE  -> Exclusive Lock (X)
        INSERT  -> Exclusive Lock (X)

    SQL Server decides:
        - Which lock to take
        - On which resource
        - How long to hold it
        - When to release it

    User can influence locking using LOCK HINTS.

    Examples:

        UPDLOCK
        HOLDLOCK
        TABLOCK
        TABLOCKX
        ROWLOCK

    ========================================================= */


/* =========================================================
    1. SHARED LOCK (S)

    A normal SELECT can acquire Shared Locks.

    Multiple sessions can generally read the same data
    simultaneously.

    SQL Server automatically manages the lock.
    ========================================================= */


BEGIN TRANSACTION;

SELECT *
FROM Products
WHERE ProductID = 1;

-- SQL Server may acquire Shared Locks for this read.

COMMIT;


/* =========================================================
    2. EXCLUSIVE LOCK (X)

    UPDATE / DELETE / INSERT require Exclusive Locks.

    User does NOT write:

        CREATE X LOCK

    Instead, SQL Server automatically acquires the
    required Exclusive Lock.
    ========================================================= */


BEGIN TRANSACTION;

UPDATE Products
    SET Stock = Stock - 10
    WHERE ProductID = 1;

-- SQL Server automatically acquires an Exclusive Lock.

COMMIT;


/* =========================================================
    3. UPDATE LOCK (U)

    User can REQUEST an Update Lock using UPDLOCK.

    This is a LOCK HINT.

    Useful in a read-then-update operation.
    ========================================================= */


BEGIN TRANSACTION;

SELECT *
FROM Products WITH (UPDLOCK)
WHERE ProductID = 1;

-- UPDLOCK tells SQL Server to use Update Locks
-- for the selected rows.

UPDATE Products
    SET Stock = Stock - 10
    WHERE ProductID = 1;

COMMIT;


/* =========================================================
    4. HOLDLOCK

    HOLDLOCK requests serializable behavior for the
    referenced table/resource for the duration of the
    transaction.

    Example:
    ========================================================= */


BEGIN TRANSACTION;

SELECT *
FROM Products WITH (HOLDLOCK)
WHERE ProductID = 1;

COMMIT;


/* =========================================================
    5. TABLOCK

    Requests a table-level lock.

    Instead of focusing on row/page-level locking,
    SQL Server is instructed to use a table lock.
    ========================================================= */


SELECT *
FROM Products WITH (TABLOCK);


/* =========================================================
    6. TABLOCKX

    Requests an Exclusive Table Lock.

    Other sessions cannot access the table in ways
    incompatible with that exclusive lock.
    ========================================================= */


BEGIN TRANSACTION;

SELECT *
FROM Products WITH (TABLOCKX);

-- Table is exclusively locked while transaction is open.

COMMIT;


/* =========================================================
    7. ROWLOCK

    Requests row-level locking.

    Important:
    It is a HINT, not an absolute guarantee that SQL Server
    will always use row locks in every situation.
    ========================================================= */


SELECT *
FROM Products WITH (ROWLOCK)
WHERE ProductID = 1;


    /* =========================================================
    WHO CREATES THE LOCK?

    USER
        |
        | SQL statement
        v
    SQL SERVER
        |
        | decides/acquires appropriate locks
        v
    S / X / U / IS / IX / etc.
        |
        v
    Other sessions may READ / WAIT / BLOCK
    depending on lock compatibility.


    Example:

    Session 1:
        UPDATE Products
        SET Stock = Stock - 10
        WHERE ProductID = 1;

                    |
                    v
        SQL Server acquires X Lock


    Session 2:
        UPDATE Products
        SET Stock = Stock - 5
        WHERE ProductID = 1;

                    |
                    v
        Conflicting lock
                    |
                    v
                BLOCKED
                    |
                    v
        Session 1 COMMIT/ROLLBACK
                    |
                    v
        Lock released
                    |
                    v
        Session 2 continues
    ========================================================= */


    /* =========================================================
    IMPORTANT DISTINCTION

    AUTOMATIC LOCKING
    -----------------

    UPDATE Products ...
    
    SQL Server automatically creates/acquires
    the necessary locks.


    LOCK HINT
    ---------

    SELECT *
    FROM Products WITH (UPDLOCK);

    User is REQUESTING a particular locking behavior.


    So in interview:

    "Locks are primarily managed automatically by SQL Server.
    Developers normally don't create S/X locks directly.
    They can influence locking behavior using lock hints such
    as UPDLOCK, HOLDLOCK, TABLOCK and ROWLOCK."
    ========================================================= */