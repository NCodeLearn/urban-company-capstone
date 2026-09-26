-- Part A: Duplicate Detection and Join Diagnostics

-- 1. Find duplicate partner IDs
SELECT partner_id, COUNT(*) AS duplicate_count
FROM partners_import
GROUP BY partner_id
HAVING COUNT(*) > 1;

-- 2. Build clean partners table
DROP TABLE IF EXISTS partners;

CREATE TABLE partners AS
SELECT
    partner_id,
    city,
    primary_category,
    rating,
    active,
    days_since_onboarding
FROM partners_import
GROUP BY
    partner_id,
    city,
    primary_category,
    rating,
    active,
    days_since_onboarding;

-- Check clean row count: expected 49
SELECT COUNT(*) AS clean_partner_count
FROM partners;

-- 3a. INNER JOIN: confirm every booking resolves to a partner
SELECT
    b.booking_id,
    b.partner_id,
    b.city,
    b.category,
    p.primary_category,
    p.rating
FROM bookings b
INNER JOIN partners p
    ON b.partner_id = p.partner_id;

-- Optional count check: expected 600
SELECT COUNT(*) AS matched_bookings
FROM bookings b
INNER JOIN partners p
    ON b.partner_id = p.partner_id;

-- 3b. Category LEFT JOIN: find categories with zero bookings
SELECT c.category
FROM categories c
LEFT JOIN bookings b
    ON c.category = b.category
WHERE b.booking_id IS NULL;

-- 3c. Partner LEFT JOIN: find partners with zero bookings
SELECT
    p.partner_id,
    p.city,
    p.primary_category
FROM partners p
LEFT JOIN bookings b
    ON p.partner_id = b.partner_id
WHERE b.booking_id IS NULL;

-- 3d. COUNT(*) vs COUNT(b.booking_id)
SELECT
    c.category,
    COUNT(*) AS joined_row_count,
    COUNT(b.booking_id) AS actual_booking_count
FROM categories c
LEFT JOIN bookings b
    ON c.category = b.category
GROUP BY c.category
ORDER BY c.category;

-- For Pest Control, COUNT(*) = 1 because LEFT JOIN keeps one unmatched row.
-- COUNT(b.booking_id) = 0 because no real booking_id exists for that unmatched row.
