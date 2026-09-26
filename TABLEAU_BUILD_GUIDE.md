# Tableau Public Build Guide — Part C

Use `city_category_summary.csv` in this folder as the main Tableau Public data source.

## 1. Connect the data

Open Tableau Public and connect to `city_category_summary.csv`.

Confirm:
- `city` = Dimension
- `category` = Dimension
- `bookings_count` = Measure
- `revenue_inr` = Measure
- `sla_breaches` = Measure

Do not use the raw `bookings.csv` for the reconciled KPI totals.

## 2. KPI sheets

Create a sheet called `KPI - Total Revenue`.

Use:
`SUM([revenue_inr])`

Expected value:
INR 1,047,973

Create a sheet called `KPI - Total Bookings`.

Use:
`SUM([bookings_count])`

Expected value:
600

Create a third KPI sheet called `KPI - SLA Breach Rate`.

Calculated field:

```
SUM([sla_breaches]) / SUM([bookings_count])
```

Format as Percentage with 1 decimal place.

Expected:
13.2%

## 3. Revenue by Category

Create a sheet named `Revenue by Category`.

- Rows: `category`
- Columns: `SUM(revenue_inr)`
- Marks: Bar
- Sort descending by revenue
- Format revenue as INR

Expected descending order:
- Deep Home Cleaning: INR 508,964 (176 bookings)
- Salon for Women: INR 151,689 (65 bookings)
- Electrical Repair: INR 119,881 (112 bookings)
- AC Repair & Service: INR 113,039 (74 bookings)
- Plumbing: INR 80,837 (95 bookings)
- Salon for Men: INR 73,563 (78 bookings)

## 4. Revenue by City Map

Create a sheet named `Revenue by City Map`.

- Assign `city` Geographic Role → City.
- Place `city` on Detail.
- Place `SUM(revenue_inr)` on Size and/or Color.
- For `Delhi NCR`, use Map → Edit Locations and match it to Delhi if Tableau does not recognize it.

Expected city revenue totals:
- Pune: INR 228,727
- Bengaluru: INR 179,835
- Chennai: INR 175,572
- Hyderabad: INR 171,638
- Mumbai: INR 151,430
- Delhi NCR: INR 140,771

## 5. City → Category Drill-Down

Create a hierarchy:
1. Right-click `city` → Hierarchy → Create Hierarchy.
2. Name it `City → Category`.
3. Drag `category` into the hierarchy below `city`.

Create a new sheet and place the hierarchy on Rows.
Use `SUM(revenue_inr)` on Columns or Text.
The viewer should be able to expand a city to see categories.

## 6. Cross-chart City Filter

Add `city` to Filters on one chart.
Choose Show Filter.
From the filter menu choose:
`Apply to Worksheets → All Using This Data Source`.

Keep the filter visible on the dashboard.

## 7. Dashboard

Create one dashboard with:
- Top row: Total Revenue, Total Bookings, SLA Breach Rate
- Middle: Revenue by Category + Revenue by City Map
- Bottom: City → Category Drill-Down
- Visible City filter
- Consistent fonts and formatting
- INR/₹ only for currency

Recommended dashboard title:
`Urban Company Service-Ops Diagnostic`

## 8. Month Focus parameter — source-data issue

Create a String parameter called `Month Focus` with:
- January
- February
- March

However, the assignment requires this parameter to filter/highlight bookings by month while also requiring Tableau to use `city_category_summary.csv`.

The supplied reconciled CSV has only these fields:
`city, category, bookings_count, revenue_inr, sla_breaches`

It contains no `booking_date` or month field. Therefore a genuine month-level calculation cannot be derived from this CSV alone.

Do not fabricate January/February/March values. If your evaluator requires the parameter to function, the source specification needs either:
- a reconciled month-level export containing month/date, or
- permission to add a second reconciled data source derived from the final post-delete/post-insert database.

The parameter itself can still be created, but it cannot truthfully filter the reconciled summary data by month without an actual month field.

## 9. Publish

Sign in to Tableau Public and publish the workbook publicly.

After publishing, copy the public URL and replace this placeholder in `README.md`:

`TABLEAU_PUBLIC_URL_HERE`

Then open the URL in a private/incognito window to confirm that it is publicly viewable without login.
