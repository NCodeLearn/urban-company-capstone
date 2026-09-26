
-- Part A: Duplicate Detection and Join Diagnostics


-- 1. Find duplicate partner IDs

SELECT
    partner_id,
    COUNT(*) AS duplicate_count
FROM partners_import
GROUP BY partner_id
HAVING COUNT(*) > 1;
