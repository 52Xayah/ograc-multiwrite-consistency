
-- ============================================
-- Experiment 1: DDL Synchronization
-- oGRAC Multi-Write Consistency
--
-- Purpose:
-- Verify cross-node visibility of DDL operations.
--
-- Execution:
-- Execute each section on the specified node.
-- Do NOT execute the entire file in one session.
-- ============================================


-- ============================================
-- Step 1: Create table on Node0
-- ============================================

-- Execute on Node0

CREATE TABLE test_mulNode (
    c1 INT,
    c2 VARCHAR(50),
    c3 INT
);


-- ============================================
-- Step 2: Attempt to create the same table on Node1
-- ============================================

-- Execute on Node1
-- Expected: The operation fails because the table already exists.

CREATE TABLE test_mulNode (
    c1 INT,
    c2 VARCHAR(50),
    c3 INT
);


-- ============================================
-- Step 3: Drop table on Node0
-- ============================================

-- Execute on Node0

DROP TABLE test_mulNode;


-- ============================================
-- Step 4: Re-create table on Node1
-- ============================================

-- Execute on Node1

CREATE TABLE test_mulNode (
    c1 INT,
    c2 VARCHAR(50),
    c3 INT
);


-- ============================================
-- Step 5: Insert test data on Node1
-- ============================================

-- Execute on Node1

INSERT INTO test_mulNode (c1, c2, c3)
VALUES (1, 'aaa', 11);


-- ============================================
-- Step 6: Query test data on Node1
-- ============================================

-- Execute on Node1

SELECT * FROM test_mulNode;
