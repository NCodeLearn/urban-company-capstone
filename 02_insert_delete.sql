-- Part A: Insert, Delete, LIKE, and Final Summary Export

-- Remove the 3 seeded test bookings
DELETE FROM bookings
WHERE is_test = 1;

-- NOTE:
-- The supplied generator creates a 9-column bookings table and does not store
-- status or customer_rating. Therefore the insert below uses the actual table schema
-- while preserving the booking IDs, partners, cities, categories, dates, and amounts
-- specified in the project brief.

INSERT INTO bookings (
    booking_id,
    partner_id,
    city,
    category,
    booking_date,
    amount_inr,
    complaint_flag,
    sla_breach_flag,
    is_test
)
VALUES
    ('B9001','P009','Mumbai','Deep Home Cleaning','2026-03-31',3200,0,0,0),
    ('B9002','P041','Chennai','Plumbing','2026-03-31',640,0,0,0),
    ('B9003','P035','Hyderabad','Electrical Repair','2026-03-31',980,0,0,0);

-- Expected result: 600 rows, INR 1047973 total
SELECT COUNT(*) AS total_bookings, SUM(amount_inr) AS total_revenue
FROM bookings;

-- LIKE query: expected 12 partners
SELECT
    partner_id,
    city,
    primary_category,
    rating
FROM partners
WHERE primary_category LIKE 'Salon%';

-- Final export query for city_category_summary.csv
SELECT
    city,
    category,
    COUNT(*) AS bookings_count,
    SUM(amount_inr) AS revenue_inr,
    SUM(sla_breach_flag) AS sla_breaches
FROM bookings
GROUP BY city, category
ORDER BY city, category;
