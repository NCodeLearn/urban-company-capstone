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

# Urban Company Service-Ops Diagnostic — Part C

## Tableau Public Dashboard

Live Tableau Public URL:

TABLEAU_PUBLIC_URL_HERE

## Reconciled KPI Check

- Total Revenue: INR 1,047,973
- Total Bookings: 600
- Total SLA Breaches: 79
- SLA Breach Rate: 13.2%

## Files

- `city_category_summary.csv` — exact reconciled Part A/Part B source
- `DASHBOARD_STORY.md` — two stakeholder narratives
- `dashboard_metrics.txt` — verified numbers for dashboard construction
- `TABLEAU_BUILD_GUIDE.md` — step-by-step Tableau Public build instructions

## Important data note

The required `Month Focus` parameter is not fully implementable from
`city_category_summary.csv` alone because that reconciled file does not contain
`booking_date` or month. I have not invented month-level values. The build guide
explains the issue and the correct way to resolve it if a month-level reconciled
source is permitted.

After publishing the Tableau Public dashboard, replace `TABLEAU_PUBLIC_URL_HERE`
with the real public link.

