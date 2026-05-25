# Power BI Dashboard Setup Guide
## Healthcare KPI Analytics Dashboard

---

## Prerequisites

- Power BI Desktop (free download from microsoft.com/powerbi)
- Either: a database with the SQL schema loaded, OR the `sample_export.csv` file

---

## Step 1 — Connect to Your Data Source

### Option A: Connect to Oracle / PostgreSQL Database

1. Open Power BI Desktop
2. Click **Home → Get Data → More**
3. Search for **Oracle Database** (or PostgreSQL)
4. Enter your connection details:
   - Server: `localhost` (or your DB host)
   - Database: your database name
5. In the Navigator, select all tables:
   - `FACT_ADMISSION`
   - `FACT_BED_CENSUS`
   - `FACT_ER_VISIT`
   - `FACT_STAFF_HOURS`
   - `FACT_READMISSION`
   - `DIM_DEPARTMENT`
   - `DIM_STAFF`
   - `DIM_PATIENT`
   - `DIM_SHIFT`
6. Also select all views:
   - `VW_CLINICAL_KPIS`
   - `VW_BED_OCCUPANCY`
   - `VW_ER_KPIS`
   - `VW_WORKFORCE_KPIS`
   - `VW_EXECUTIVE_SUMMARY`
7. Click **Load**

### Option B: Import CSV (No Database Required)

1. Click **Home → Get Data → Text/CSV**
2. Select `data/sample_export.csv`
3. Click **Load**

---

## Step 2 — Set Up the Data Model (Star Schema)

Go to **Model view** (left sidebar, looks like a diagram).

Create these relationships (drag from one table to the other):

| From Table | From Column | To Table | To Column | Cardinality |
|-----------|-------------|----------|-----------|-------------|
| `fact_admission` | `department_id` | `dim_department` | `department_id` | Many-to-One |
| `fact_admission` | `patient_id` | `dim_patient` | `patient_id` | Many-to-One |
| `fact_admission` | `admitting_staff_id` | `dim_staff` | `staff_id` | Many-to-One |
| `fact_staff_hours` | `department_id` | `dim_department` | `department_id` | Many-to-One |
| `fact_staff_hours` | `staff_id` | `dim_staff` | `staff_id` | Many-to-One |
| `fact_staff_hours` | `shift_id` | `dim_shift` | `shift_id` | Many-to-One |
| `fact_bed_census` | `department_id` | `dim_department` | `department_id` | Many-to-One |
| `fact_er_visit` | `patient_id` | `dim_patient` | `patient_id` | Many-to-One |
| `fact_readmission` | `patient_id` | `dim_patient` | `patient_id` | Many-to-One |

This creates a **star schema** — the gold standard for analytics data models.

---

## Step 3 — Add DAX Measures

1. Go to **Report view**
2. Click on `fact_admission` in the Fields pane
3. Click **Home → New Measure**
4. Paste each measure from `powerbi/dax_measures.md`
5. Press Enter and repeat for each measure

Organize your measures by right-clicking a table → **Create measure table** (optional but clean).

---

## Step 4 — Build Page 1: Clinical Overview

### Layout
Add a blank page. Name it **Clinical Overview**.

### KPI Cards (top row)
Insert 4 **Card** visuals side by side:
- Card 1: `Total Admissions`
- Card 2: `Avg Length of Stay` (use `ALOS Display` measure)
- Card 3: `Avg Bed Occupancy Rate`
- Card 4: `Avg ER Wait Time (min)` (use `ER Wait Display`)

Format each card:
- Font size: 28 for value, 12 for label
- Remove border
- Background: light gray `#F1EFE8`

### Line Chart — Admissions Trend
- Visual: **Line chart**
- X-axis: `admission_date` (set to Month level)
- Y-axis: `Total Admissions`
- Title: "Monthly Admissions Trend"

### Bar Chart — Admissions by Department
- Visual: **Clustered bar chart**
- Y-axis: `dim_department[department_name]`
- X-axis: `Total Admissions`
- Title: "Admissions by Department"
- Sort descending by admissions

### Gauge — Bed Occupancy Target
- Visual: **Gauge**
- Value: `Avg Bed Occupancy Rate`
- Target: 85
- Min: 0, Max: 100
- Title: "Bed Occupancy Rate"
- Color the needle red if > 90, green if < 85

### Slicers (right side or top)
Add slicers for:
- `dim_department[department_name]` — dropdown slicer
- `fact_admission[admission_date]` — date range slicer
- `fact_admission[admission_type]` — list slicer (Emergency / Elective)

---

## Step 5 — Build Page 2: Workforce Operations

### Layout
Add a new blank page. Name it **Workforce Operations**.

### KPI Cards (top row)
- Card 1: `Active Headcount`
- Card 2: `Staff Utilization Rate`
- Card 3: `Total Overtime Hours`
- Card 4: `Shift Coverage Rate`

### Table — Department Staffing Breakdown
- Visual: **Table**
- Columns: `department_name`, `Active Headcount`, `Staff Utilization Rate`, `Total Overtime Hours`, `Shift Coverage Rate`
- Add conditional formatting (color scale) on Utilization Rate

### Column Chart — Overtime by Month
- Visual: **Clustered column chart**
- X-axis: `work_date` (Month level)
- Y-axis: `Total Overtime Hours`
- Title: "Overtime Hours by Month"

### Donut Chart — Headcount by Role
- Visual: **Donut chart**
- Legend: `dim_staff[role]`
- Values: `Active Headcount`
- Title: "Staff by Role"

### Slicers
- `dim_department[department_name]`
- `dim_staff[role]`
- `fact_staff_hours[work_date]` — date range

---

## Step 6 — Build Page 3: ER Performance

### KPI Cards
- `Avg ER Wait Time (min)`
- `Pct Seen in 30 Min`
- `ER Admission Rate`
- `LWBS Count`

### Line Chart — ER Wait Time Trend
- X-axis: `visit_date` (Month)
- Y-axis: `Avg ER Wait Time (min)`
- Add a constant line at 30 minutes (target line)

### Bar Chart — ER Visits by Triage Level
- X-axis: `triage_level`
- Y-axis: count of ER visits
- Color each bar differently (1 = red/critical, 5 = blue/minor)

---

## Step 7 — Final Formatting

### Theme
- Go to **View → Themes → Browse for themes**
- Or manually set:
  - Background: white `#FFFFFF`
  - Accent color: `#0A2540` (dark navy)
  - Text color: `#2C2C2A`

### Add a Header
Insert a **Text Box** at the top of each page:
- Page 1: "Clinical Operations Dashboard | 2023"
- Page 2: "Workforce Operations | 2023"

### Logo placeholder
Insert a **Shape** (rectangle) in the top left — use as logo placeholder.

---

## Step 8 — Set Up Data Refresh (Database Users Only)

1. Click **Home → Transform Data → Data Source Settings**
2. Confirm your Oracle/PostgreSQL credentials are saved
3. Click **Home → Refresh** to test a manual refresh
4. To schedule: publish to Power BI Service (powerbi.microsoft.com) and configure scheduled refresh there

---

## Tips for Presenting This Project

- Walk through the star schema in Model view — shows you understand data modelling
- Explain why views were created in SQL vs. doing all transformation in Power BI
- Mention the DAX time-intelligence measures (MoM, YTD, SPLY)
- Talk about the bed occupancy threshold (90% = high alert) as a business rule
