# Data Architecture
## Healthcare KPI Analytics Dashboard

---

## Architecture Overview

```
┌─────────────────────────────────────────────────────────┐
│                  SOURCE SYSTEMS (Oracle)                 │
│                                                          │
│  Patient Mgmt  │  HR System  │  ER System  │  Scheduling │
└───────┬────────┴──────┬──────┴──────┬──────┴──────┬──────┘
        │               │             │              │
        ▼               ▼             ▼              ▼
┌─────────────────────────────────────────────────────────┐
│                  STAGING / RAW LAYER                     │
│     dim_patient    dim_staff    fact_er_visit            │
│     dim_department dim_shift    fact_staff_hours         │
└───────────────────────────┬─────────────────────────────┘
                            │ SQL Views (KPI Layer)
                            ▼
┌─────────────────────────────────────────────────────────┐
│                    ANALYTICS LAYER                       │
│  vw_clinical_kpis   vw_bed_occupancy   vw_er_kpis        │
│  vw_workforce_kpis  vw_readmission_kpis                  │
│  vw_executive_summary                                    │
└───────────────────────────┬─────────────────────────────┘
                            │ DirectQuery / Import
                            ▼
┌─────────────────────────────────────────────────────────┐
│                   POWER BI LAYER                         │
│  Star Schema Model │ DAX Measures │ Report Pages         │
│                                                          │
│  • Clinical Overview                                     │
│  • Workforce Operations                                  │
│  • ER Performance                                        │
└─────────────────────────────────────────────────────────┘
                            │
                            ▼
                  Senior Leadership Dashboards
```

---

## Source System Mapping

| Source System | Tables Fed | Data Volume | Refresh Frequency |
|--------------|-----------|-------------|-------------------|
| Patient Management System | `dim_patient`, `fact_admission` | ~500 admissions/month | Daily |
| HR / Workforce System | `dim_staff`, `fact_staff_hours` | ~2,000 shift records/month | Daily |
| ER Tracking System | `fact_er_visit` | ~800 visits/month | Hourly |
| Bed Management System | `fact_bed_census` | ~300 snapshots/month | Daily |
| Clinical Records | `fact_readmission` | ~50 records/month | Daily |
| Department Master | `dim_department` | 10 departments | On change |
| Scheduling System | `dim_shift` | 5 shift types | On change |

---

## Data Model: Star Schema

```
              dim_date
                 │
    dim_patient  │  dim_department  dim_shift
         │       │        │            │
         └───────┼────────┼────────────┘
                 │        │
         ┌───────┴─┐  ┌───┴──────────┐
         │ fact_   │  │ fact_        │
         │admission│  │ staff_hours  │
         └───────┬─┘  └──────────────┘
                 │
         ┌───────┴────────┐
         │ fact_          │
         │ readmission    │
         └────────────────┘

         fact_bed_census ──── dim_department
         fact_er_visit   ──── dim_patient
```

### Why Star Schema?

- Simplifies DAX measures (no complex join chains in Power BI)
- Improves query performance (columnar storage on dimension keys)
- Matches how Power BI's query engine (VertiPaq) works best
- Easy to understand for non-technical stakeholders reviewing the model

---

## KPI Layer: SQL Views

Views were chosen over Power BI transformations for several reasons:

1. **Performance** — Aggregations happen in the database, not in-memory in Power BI
2. **Reusability** — Other tools (Excel, Tableau, custom reports) can use the same views
3. **Maintainability** — Business logic lives in SQL, not scattered across DAX measures
4. **Source of truth** — One definition of "Average Length of Stay" across all reports

---

## Refresh Strategy

| Layer | Method | Frequency |
|-------|--------|-----------|
| Raw tables | ETL job from source systems | Nightly (2 AM) |
| KPI views | Recomputed on query (no refresh needed) | Real-time |
| Power BI dataset | Scheduled refresh via Power BI Service | Daily (6 AM) |
| Executive dashboard | Available by 7 AM each morning | Daily |
