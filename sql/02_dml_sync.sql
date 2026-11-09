
-- ============================================
-- Experiment 2: DML Synchronization
-- oGRAC Multi-Write Consistency
--
-- Purpose:
-- Verify cross-node visibility of DML operations.
--
-- Execution:
-- Execute each section on the specified node.
-- ============================================


-- ============================================
-- Step 1: Initialize test table on Node0
-- ============================================

-- Execute on Node0

DROP TABLE IF EXISTS test_mulNode;

CREATE TABLE test_mulNode (
    c1 INT,
    c2 VARCHAR(50),
    c3 INT
);

INSERT INTO test_mulNode (c1, c2, c3)
VALUES (1, 'aaa', 11);

INSERT INTO test_mulNode (c1, c2, c3)
VALUES (2, 'bbb', 22);

INSERT INTO test_mulNode (c1, c2, c3)
VALUES (3, 'ccc', 33);


-- ============================================
-- Step 2: Update data on Node1
-- ============================================

-- Execute on Node1

UPDATE test_mulNode
SET c3 = 77
WHERE c1 = 1;


-- ============================================
-- Step 3: Query updated data on Node0
-- ============================================

-- Execute on Node0

SELECT * FROM test_mulNode
WHERE c1 = 1;
