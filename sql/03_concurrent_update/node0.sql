
-- ============================================
-- Experiment 3: Concurrent Update
-- oGRAC Multi-Write Consistency
--
-- File: node0.sql
-- Execute on: Node0
-- Session: A
--
-- Purpose:
-- Update the target row and hold the transaction
-- without committing immediately.
-- ============================================


-- Step 1: Update the target row

UPDATE test_mulNode
SET c3 = 55
WHERE c1 = 4;


-- Step 2: Do NOT commit immediately.
-- Keep this transaction open.
-- Switch to the Node1 session and execute node1.sql.


-- Step 3: After Node1 enters the waiting state,
-- return to this session and execute:

COMMIT;
