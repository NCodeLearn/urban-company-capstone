# Urban Company Service-Ops Diagnostic — Part A

This folder contains the complete Part A files for the capstone.

## Verified Results

- Categories: 7
- Raw partner rows: 52
- Clean partners: 49
- Duplicate partner IDs: P003, P017, P031
- Zero-booking category: Pest Control
- Zero-booking partner: P049
- Salon partners: 12
- Final bookings: 600
- Final revenue: INR 1047973
- city_category_summary.csv data rows: 27

## Important note on Task 6 insert

The supplied generator creates a 9-column `bookings` table and explicitly does not store
`status` or `customer_rating`. The project brief's shown 11-value INSERT therefore does not
fit the generated schema as written. The included `02_insert_delete.sql` uses the actual
9-column table schema while preserving the specified booking IDs, partners, cities,
categories, dates, and amounts. This produces the required final acceptance total of
600 bookings and INR 1,047,973.
