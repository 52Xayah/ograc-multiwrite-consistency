
-- ============================================
-- Experiment 3: Concurrent Update
-- oGRAC Multi-Write Consistency
--
-- File: node1.sql
-- Execute on: Node1
-- Session: B
--
-- Purpose:
-- Update the same row as Node0 and observe
-- transaction waiting behavior.
-- ============================================


-- Step 1: Update the same target row

UPDATE test_mulNode
SET c3 = 66
WHERE c1 = 4;


-- Step 2:
-- If the UPDATE is waiting, do not interrupt it.
-- Wait for Node0 to commit its transaction.


-- Step 3: After the UPDATE completes,
-- commit the transaction.

COMMIT;


-- Step 4: Query the final result

SELECT * FROM test_mulNode
WHERE c1 = 4;
