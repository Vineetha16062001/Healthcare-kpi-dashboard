-- ============================================================
-- Healthcare KPI Analytics Dashboard
-- KPI Views — Power BI connects to these
-- ============================================================


-- ------------------------------------------------------------
-- VIEW 1: Clinical Summary KPIs
-- One row per department per month
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vw_clinical_kpis AS
SELECT
    d.department_id,
    d.department_name,
    d.department_type,
    EXTRACT(YEAR  FROM a.admission_date)  AS year_number,
    EXTRACT(MONTH FROM a.admission_date)  AS month_number,
    TO_CHAR(a.admission_date, 'YYYY-MM')  AS year_month,

    -- Total admissions
    COUNT(a.admission_id)                                           AS total_admissions,

    -- Emergency vs elective split
    COUNT(CASE WHEN a.admission_type = 'Emergency' THEN 1 END)     AS emergency_admissions,
    COUNT(CASE WHEN a.admission_type = 'Elective'  THEN 1 END)     AS elective_admissions,

    -- Average Length of Stay (ALOS) — exclude still-admitted patients
    ROUND(AVG(CASE WHEN a.discharge_date IS NOT NULL
              THEN a.discharge_date - a.admission_date END), 1)     AS avg_length_of_stay,

    -- Discharge count
    COUNT(CASE WHEN a.discharge_date IS NOT NULL THEN 1 END)        AS total_discharges,

    -- Discharge rate (% of admitted that were discharged same month)
    ROUND(
        COUNT(CASE WHEN a.discharge_date IS NOT NULL THEN 1 END)
        / NULLIF(COUNT(a.admission_id), 0) * 100, 1
    )                                                               AS discharge_rate_pct

FROM fact_admission a
JOIN dim_department d ON a.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department_name,
    d.department_type,
    EXTRACT(YEAR  FROM a.admission_date),
    EXTRACT(MONTH FROM a.admission_date),
    TO_CHAR(a.admission_date, 'YYYY-MM');


-- ------------------------------------------------------------
-- VIEW 2: Bed Occupancy KPIs
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vw_bed_occupancy AS
SELECT
    d.department_id,
    d.department_name,
    b.census_date,
    TO_CHAR(b.census_date, 'YYYY-MM')   AS year_month,
    b.total_beds,
    b.occupied_beds,
    b.available_beds,
    b.occupancy_rate,
    -- Flag if over 90% (alert threshold)
    CASE WHEN b.occupancy_rate >= 90 THEN 'High' 
         WHEN b.occupancy_rate >= 75 THEN 'Normal'
         ELSE 'Low' END                  AS occupancy_status
FROM fact_bed_census b
JOIN dim_department d ON b.department_id = d.department_id;


-- ------------------------------------------------------------
-- VIEW 3: ER Wait Time KPIs
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vw_er_kpis AS
SELECT
    EXTRACT(YEAR  FROM v.visit_date)    AS year_number,
    EXTRACT(MONTH FROM v.visit_date)    AS month_number,
    TO_CHAR(v.visit_date, 'YYYY-MM')   AS year_month,
    v.triage_level,

    COUNT(v.er_visit_id)                AS total_er_visits,

    -- Average wait time in minutes
    ROUND(AVG(v.wait_minutes), 0)       AS avg_wait_minutes,

    -- % seen within 30 minutes (target for triage levels 1-2)
    ROUND(
        COUNT(CASE WHEN v.wait_minutes <= 30 THEN 1 END)
        / NULLIF(COUNT(v.er_visit_id), 0) * 100, 1
    )                                   AS pct_seen_within_30min,

    -- Admission rate from ER
    ROUND(
        COUNT(CASE WHEN v.disposition = 'Admitted' THEN 1 END)
        / NULLIF(COUNT(v.er_visit_id), 0) * 100, 1
    )                                   AS er_admission_rate_pct,

    COUNT(CASE WHEN v.disposition = 'Admitted'    THEN 1 END) AS er_admissions,
    COUNT(CASE WHEN v.disposition = 'Discharged'  THEN 1 END) AS er_discharges,
    COUNT(CASE WHEN v.disposition = 'LWBS'        THEN 1 END) AS left_without_being_seen

FROM fact_er_visit v
GROUP BY
    EXTRACT(YEAR  FROM v.visit_date),
    EXTRACT(MONTH FROM v.visit_date),
    TO_CHAR(v.visit_date, 'YYYY-MM'),
    v.triage_level;


-- ------------------------------------------------------------
-- VIEW 4: 30-Day Readmission Rate
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vw_readmission_kpis AS
SELECT
    d.department_id,
    d.department_name,
    EXTRACT(YEAR  FROM a.admission_date)    AS year_number,
    EXTRACT(MONTH FROM a.admission_date)    AS month_number,
    TO_CHAR(a.admission_date, 'YYYY-MM')   AS year_month,

    COUNT(DISTINCT a.patient_id)            AS unique_patients,
    COUNT(DISTINCT a.admission_id)          AS total_admissions,

    -- Count patients who had a readmission within 30 days
    COUNT(DISTINCT CASE 
        WHEN r.days_between IS NOT NULL 
         AND r.days_between <= 30 
        THEN r.original_admission_id 
    END)                                    AS readmissions_30day,

    -- Readmission rate
    ROUND(
        COUNT(DISTINCT CASE 
            WHEN r.days_between IS NOT NULL AND r.days_between <= 30 
            THEN r.original_admission_id 
        END)
        / NULLIF(COUNT(DISTINCT a.admission_id), 0) * 100, 1
    )                                       AS readmission_rate_30day_pct

FROM fact_admission a
JOIN dim_department d ON a.department_id = d.department_id
LEFT JOIN fact_readmission r ON r.original_admission_id = a.admission_id
GROUP BY
    d.department_id,
    d.department_name,
    EXTRACT(YEAR  FROM a.admission_date),
    EXTRACT(MONTH FROM a.admission_date),
    TO_CHAR(a.admission_date, 'YYYY-MM');


-- ------------------------------------------------------------
-- VIEW 5: Workforce / Staff Utilization KPIs
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vw_workforce_kpis AS
SELECT
    d.department_id,
    d.department_name,
    s.role,
    EXTRACT(YEAR  FROM h.work_date)     AS year_number,
    EXTRACT(MONTH FROM h.work_date)     AS month_number,
    TO_CHAR(h.work_date, 'YYYY-MM')    AS year_month,

    COUNT(DISTINCT s.staff_id)          AS headcount,
    COUNT(h.hours_id)                   AS total_shifts,

    -- No-show shifts
    COUNT(CASE WHEN h.is_no_show = 'Y' THEN 1 END)  AS no_show_shifts,

    -- Shift coverage rate (shifts actually worked / total scheduled)
    ROUND(
        COUNT(CASE WHEN h.is_no_show = 'N' THEN 1 END)
        / NULLIF(COUNT(h.hours_id), 0) * 100, 1
    )                                   AS shift_coverage_rate_pct,

    SUM(h.scheduled_hours)              AS total_scheduled_hours,
    SUM(h.actual_hours)                 AS total_actual_hours,
    SUM(h.overtime_hours)               AS total_overtime_hours,

    -- Staff utilization rate (actual / scheduled)
    ROUND(
        SUM(h.actual_hours)
        / NULLIF(SUM(h.scheduled_hours), 0) * 100, 1
    )                                   AS utilization_rate_pct

FROM fact_staff_hours h
JOIN dim_staff s       ON h.staff_id      = s.staff_id
JOIN dim_department d  ON h.department_id = d.department_id
GROUP BY
    d.department_id,
    d.department_name,
    s.role,
    EXTRACT(YEAR  FROM h.work_date),
    EXTRACT(MONTH FROM h.work_date),
    TO_CHAR(h.work_date, 'YYYY-MM');


-- ------------------------------------------------------------
-- VIEW 6: Executive Summary (single-row totals for KPI cards)
-- For a specific year — change '2023' to parameterize in Power BI
-- ------------------------------------------------------------
CREATE OR REPLACE VIEW vw_executive_summary AS
SELECT
    COUNT(a.admission_id)                               AS ytd_total_admissions,
    COUNT(CASE WHEN a.discharge_date IS NOT NULL 
               THEN 1 END)                             AS ytd_total_discharges,
    ROUND(AVG(CASE WHEN a.discharge_date IS NOT NULL
                   THEN a.discharge_date - a.admission_date 
              END), 1)                                 AS ytd_avg_length_of_stay,
    ROUND(AVG(bc.occupancy_rate), 1)                   AS avg_bed_occupancy_rate,
    (SELECT ROUND(AVG(wait_minutes), 0) 
     FROM fact_er_visit)                               AS avg_er_wait_minutes,
    (SELECT ROUND(
        COUNT(CASE WHEN days_between <= 30 THEN 1 END) 
        / NULLIF(COUNT(*), 0) * 100, 1)
     FROM fact_readmission
     WHERE days_between IS NOT NULL)                   AS readmission_rate_30day_pct,
    (SELECT ROUND(AVG(utilization_rate_pct), 1) 
     FROM vw_workforce_kpis)                           AS avg_staff_utilization_pct,
    (SELECT SUM(total_overtime_hours) 
     FROM vw_workforce_kpis)                           AS ytd_overtime_hours
FROM fact_admission a
CROSS JOIN (SELECT AVG(occupancy_rate) AS occupancy_rate FROM fact_bed_census) bc
WHERE EXTRACT(YEAR FROM a.admission_date) = 2023;
