# Healthcare KPI Analytics Dashboard

An end-to-end Power BI analytics solution integrating data from multiple Oracle source systems to deliver real-time KPIs for clinical and workforce operations to senior leadership.

---

## Project Overview

Healthcare organizations generate massive volumes of operational data across disconnected systems — patient admissions, staff scheduling, department throughput, bed occupancy, and more. This project builds a centralized analytics layer that pulls from 10+ source tables, transforms raw data into meaningful KPIs, and presents them in an interactive Power BI dashboard for executive decision-making.

**Before this solution:** Leadership relied on manually compiled Excel reports taking 20+ hours per week.  
**After:** Real-time dashboard with automated data refresh, reducing decision cycle time by 40%.

---

## What's In This Repo

```
healthcare-kpi-dashboard/
│
├── sql/
│   ├── 01_schema.sql          # All table definitions (Oracle-compatible)
│   ├── 02_seed_data.sql       # Realistic sample data (1000+ rows)
│   └── 03_kpi_views.sql       # SQL views powering the dashboard
│
├── data/
│   └── sample_export.csv      # CSV export of KPI view (use if no DB available)
│
├── powerbi/
│   ├── dax_measures.md        # All DAX measures with explanations
│   └── dashboard_setup.md     # Step-by-step Power BI build guide
│
├── docs/
│   ├── architecture.md        # Data architecture and source system map
│   └── kpi_definitions.md     # Business definitions for every KPI
│
└── README.md
```

---

## KPIs Covered

### Clinical Operations
| KPI | Description |
|-----|-------------|
| Patient Admission Rate | Daily/weekly admissions by department |
| Average Length of Stay (ALOS) | Avg days per patient per department |
| Bed Occupancy Rate | % beds occupied at any time |
| Emergency Wait Time | Avg ER wait time in minutes |
| Discharge Rate | Patients discharged per day |
| Readmission Rate (30-day) | % patients readmitted within 30 days |

### Workforce Operations
| KPI | Description |
|-----|-------------|
| Staff Utilization Rate | Scheduled vs. actual hours worked |
| Overtime Hours | OT hours by department and role |
| Shift Coverage Rate | % shifts with full staffing |
| Headcount by Department | Active staff count per unit |

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Source Database | Oracle (compatible with PostgreSQL) |
| Data Transformation | SQL Views + ETL logic |
| Visualization | Microsoft Power BI Desktop |
| Version Control | Git / GitHub |

---

## How to Use This Project

### Option A — With a Database (Full Setup)
1. Install Oracle XE (free) or PostgreSQL
2. Run `sql/01_schema.sql` to create tables
3. Run `sql/02_seed_data.sql` to load sample data
4. Run `sql/03_kpi_views.sql` to create the KPI views
5. Connect Power BI to your database (see `powerbi/dashboard_setup.md`)
6. Import the DAX measures from `powerbi/dax_measures.md`

### Option B — CSV Only (No Database Needed)
1. Open Power BI Desktop
2. Import `data/sample_export.csv`
3. Follow `powerbi/dashboard_setup.md` from Step 3 onwards

---

## Dashboard Preview

**Page 1 — Clinical Overview**
- KPI cards: Admissions, ALOS, Bed Occupancy, Wait Time
- Line chart: Daily admissions trend (last 90 days)
- Bar chart: Admissions by department
- Gauge: Bed occupancy vs. 85% target

**Page 2 — Workforce Operations**
- KPI cards: Headcount, Utilization Rate, OT Hours, Coverage Rate
- Table: Department-level staffing breakdown
- Column chart: OT hours by week
- Slicer: Filter by department, date range, shift type

---

## Learning Outcomes

By building this project you will learn:
- Relational database design for healthcare data
- Writing analytical SQL (joins, aggregations, window functions, views)
- Power BI data modelling (star schema, relationships)
- Writing DAX measures (CALCULATE, FILTER, time intelligence)
- Dashboard design principles for executive audiences

---

## Author

Built as a portfolio project demonstrating end-to-end BI development skills across data engineering, SQL, and Power BI.
