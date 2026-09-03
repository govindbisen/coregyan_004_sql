01. CONSTRAINTS
    ├── PRIMARY KEY
    ├── FOREIGN KEY
    ├── NOT NULL
    ├── UNIQUE
    ├── CHECK
    └── DEFAULT

02. TRANSACTIONS
    ├── Transaction concept
    ├── ACID Properties
    │   ├── Atomicity
    │   ├── Consistency
    │   ├── Isolation
    │   └── Durability
    ├── BEGIN TRANSACTION
    ├── COMMIT
    └── ROLLBACK

03. LOCKS & CONCURRENCY
    ├── Why Locks?
    ├── Transaction vs Lock
    ├── Shared Lock (S)
    ├── Exclusive Lock (X)
    ├── Update Lock (U)
    ├── Intent Locks
    │   ├── IS
    │   ├── IX
    │   └── SIX
    ├── Schema Locks
    │   ├── Sch-S
    │   └── Sch-M
    ├── Row / Key Locks
    ├── Page Locks
    ├── Table Locks
    ├── Lock Hints
    │   ├── UPDLOCK
    │   ├── HOLDLOCK
    │   ├── ROWLOCK
    │   ├── TABLOCK
    │   └── TABLOCKX
    ├── Blocking
    ├── Deadlocks
    └── Monitoring Locks

04. STORED PROCEDURES
    ├── Create Procedure
    ├── Execute Procedure
    ├── Input Parameters
    ├── Output Parameters
    ├── INSERT Procedure
    ├── UPDATE Procedure
    ├── DELETE Procedure
    ├── TRY / CATCH
    ├── ERROR_MESSAGE()
    ├── ALTER PROCEDURE
    ├── CREATE OR ALTER
    ├── View Procedure Definition
    └── DROP PROCEDURE

05. VIEWS
    ├── What is View?
    ├── Simple View
    ├── Complex View
    ├── View with JOIN
    ├── View with GROUP BY
    ├── View with Aggregate Functions
    ├── CREATE OR ALTER VIEW
    ├── View Definition
    └── DROP VIEW


06. JOINS
    ├── INNER JOIN
    ├── LEFT JOIN
    ├── RIGHT JOIN
    ├── FULL OUTER JOIN
    ├── CROSS JOIN
    └── SELF JOIN


07. GROUP BY & HAVING
    ├── GROUP BY
    ├── COUNT()
    ├── SUM()
    ├── AVG()
    ├── MIN()
    ├── MAX()
    └── HAVING


08. SUBQUERIES
    ├── What is Subquery?
    ├── Scalar Subquery
    ├── Single-Row Subquery
    ├── Multi-Row Subquery
    ├── Correlated Subquery
    ├── IN
    ├── NOT IN
    ├── EXISTS
    └── NOT EXISTS


09. CTE
    ├── Common Table Expression
    ├── Basic CTE
    ├── CTE with JOIN
    ├── Multiple CTE
    ├── CTE with Aggregation
    └── Recursive CTE


10. WINDOW FUNCTIONS
    ├── OVER()
    ├── PARTITION BY
    ├── ORDER BY
    ├── ROW_NUMBER()
    ├── RANK()
    ├── DENSE_RANK()
    ├── LAG()
    ├── LEAD()
    ├── FIRST_VALUE()
    └── LAST_VALUE()


11. INDEXES
    ├── What is Index?
    ├── Why Index?
    ├── Clustered Index
    ├── Non-Clustered Index
    ├── Composite Index
    ├── Unique Index
    ├── Included Columns
    ├── Covering Index
    ├── Index Seek
    ├── Index Scan
    └── Index Maintenance


12. TEMPORARY TABLES
    ├── Local Temp Table (#Table)
    ├── Global Temp Table (##Table)
    ├── Temporary Tables vs Permanent Tables
    ├── Temp Tables with JOIN
    ├── Temp Tables with Stored Procedures
    └── Table Variables


13. FUNCTIONS
    ├── Built-in Functions
    ├── Scalar Functions
    ├── User Defined Functions
    ├── Scalar UDF
    ├── Inline Table-Valued Function
    ├── Multi-Statement Table-Valued Function
    └── Function vs Stored Procedure


14. TRIGGERS
    ├── What is Trigger?
    ├── DML Trigger
    ├── AFTER Trigger
    ├── INSTEAD OF Trigger
    ├── INSERTED Table
    ├── DELETED Table
    ├── INSERT Trigger
    ├── UPDATE Trigger
    ├── DELETE Trigger
    └── Trigger Management


15. ERROR HANDLING
    ├── TRY
    ├── CATCH
    ├── ERROR_MESSAGE()
    ├── ERROR_NUMBER()
    ├── ERROR_LINE()
    ├── ERROR_PROCEDURE()
    ├── THROW
    └── RAISERROR


16. ADVANCED TRANSACTIONS
    ├── Transaction Isolation
    ├── READ UNCOMMITTED
    ├── READ COMMITTED
    ├── REPEATABLE READ
    ├── SERIALIZABLE
    ├── SNAPSHOT
    ├── Dirty Read
    ├── Non-Repeatable Read
    └── Phantom Read


17. QUERY PERFORMANCE
    ├── Query Optimization
    ├── Execution Plan
    ├── Actual Execution Plan
    ├── Estimated Execution Plan
    ├── Index Seek vs Index Scan
    ├── SARGability
    ├── Statistics
    ├── Query Cost
    └── Query Optimization Techniques


18. DATABASE DESIGN
    ├── Database Design
    ├── Normalization
    ├── 1NF
    ├── 2NF
    ├── 3NF
    ├── BCNF
    ├── Denormalization
    ├── Primary Key Design
    └── Relationships


19. BACKUP & RESTORE
    ├── Database Backup
    ├── Full Backup
    ├── Differential Backup
    ├── Transaction Log Backup
    ├── Restore Database
    ├── Recovery Models
    │   ├── Simple
    │   ├── Full
    │   └── Bulk-Logged
    └── Point-in-Time Recovery


20. HIGH AVAILABILITY & DISASTER RECOVERY
    ├── HA vs DR
    ├── Replication
    ├── Log Shipping
    ├── Always On Availability Groups
    ├── Failover
    ├── Failover Cluster
    └── Disaster Recovery Strategy


21. SQL SERVER SECURITY
    ├── Login
    ├── Database User
    ├── Roles
    ├── Server Roles
    ├── Database Roles
    ├── GRANT
    ├── DENY
    ├── REVOKE
    ├── Object Permissions
    └── Principle of Least Privilege


22. SQL SERVER AGENT
    ├── SQL Server Agent
    ├── Jobs
    ├── Job Steps
    ├── Schedules
    ├── Alerts
    ├── Operators
    └── Automated Database Tasks


23. DATABASE MIGRATION
    ├── Migration Concepts
    ├── Schema Migration
    ├── Data Migration
    ├── SQL Server → SQL Server
    ├── SQL Server → PostgreSQL
    ├── SQL Server → MySQL
    ├── Bulk Data Migration
    ├── Data Validation
    ├── Data Transformation
    ├── Migration Scripts
    ├── Migration Testing
    └── Rollback Strategy


24. ADVANCED SQL
    ├── MERGE
    ├── PIVOT
    ├── UNPIVOT
    ├── Dynamic SQL
    ├── JSON
    ├── XML
    ├── STRING_AGG()
    ├── STRING_SPLIT()
    ├── APPLY
    │   ├── CROSS APPLY
    │   └── OUTER APPLY
    └── Advanced Query Patterns


25. SQL SERVER MONITORING
    ├── DMVs
    ├── sys.dm_tran_locks
    ├── Active Sessions
    ├── Blocking Sessions
    ├── Long Running Queries
    ├── CPU Usage
    ├── Memory Usage
    ├── Disk Usage
    └── Wait Statistics


26. SQL SERVER STORAGE & ARCHITECTURE
    ├── Database Files
    ├── MDF
    ├── NDF
    ├── LDF
    ├── Filegroups
    ├── Data Pages
    ├── Extents
    ├── Buffer Pool
    └── Transaction Log


27. DATABASE ADMINISTRATION
    ├── Create Database
    ├── Alter Database
    ├── Drop Database
    ├── Database Properties
    ├── File Management
    ├── User Management
    ├── Permissions
    ├── Backup Management
    ├── Restore Management
    ├── Maintenance
    └── Monitoring


28. SQL SERVER MIGRATION & UPGRADE
    ├── Version Upgrade
    ├── Server Migration
    ├── Database Migration
    ├── Compatibility Level
    ├── Backup/Restore Migration
    ├── Detach/Attach
    ├── Script-Based Migration
    ├── Data Migration
    ├── Validation
    └── Rollback Plan


29. PRODUCTION TROUBLESHOOTING
    ├── Query Suddenly Slow
    ├── Blocking
    ├── Deadlock
    ├── High CPU
    ├── High Memory
    ├── Disk Full
    ├── Transaction Log Full
    ├── Failed Job
    ├── Connection Problems
    └── Database Recovery


30. SQL SERVER INTERVIEW
    ├── SQL Fundamentals
    ├── Joins
    ├── Subqueries
    ├── CTE
    ├── Window Functions
    ├── Indexes
    ├── Transactions
    ├── Locks
    ├── Deadlocks
    ├── Stored Procedures
    ├── Views
    ├── Triggers
    ├── Performance Tuning
    ├── Backup & Restore
    ├── HA/DR
    ├── Migration
    └── Scenario-Based Questions