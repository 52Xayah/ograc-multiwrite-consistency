
-- ============================================
-- Experiment 3: Concurrent Update
-- oGRAC Multi-Write Consistency
--
-- File: setup.sql
-- Purpose: Initialize test data.
-- Execute on: Node0
-- ============================================

-- Step 1: Remove the previous test table if necessary

DROP TABLE IF EXISTS test_mulNode;


-- Step 2: Create test table

CREATE TABLE test_mulNode (
    c1 INT,
    c2 VARCHAR(50),
    c3 INT
);


-- Step 3: Insert initial data

INSERT INTO test_mulNode (c1, c2, c3)
VALUES (2, 'bbb', 22);

INSERT INTO test_mulNode (c1, c2, c3)
VALUES (3, 'ccc', 33);

INSERT INTO test_mulNode (c1, c2, c3)
VALUES (4, 'ddd', 44);


-- Step 4: Commit initialization transaction

COMMIT;


-- Step 5: Verify initial data

SELECT * FROM test_mulNode;
