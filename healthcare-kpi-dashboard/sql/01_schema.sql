-- ============================================================
-- Healthcare KPI Analytics Dashboard
-- Schema: Table Definitions
-- Compatible with: Oracle XE, Oracle 19c+, PostgreSQL 13+
-- ============================================================

-- NOTE FOR PostgreSQL USERS:
-- Replace VARCHAR2 with VARCHAR
-- Replace NUMBER with NUMERIC or INTEGER
-- Replace DATE with TIMESTAMP where noted
-- Remove the schema prefix if not using one


-- ------------------------------------------------------------
-- DIMENSION TABLES
-- ------------------------------------------------------------

-- Departments (e.g. Emergency, ICU, Cardiology)
CREATE TABLE dim_department (
    department_id     NUMBER          PRIMARY KEY,
    department_name   VARCHAR2(100)   NOT NULL,
    department_type   VARCHAR2(50),   -- Clinical, Administrative, Support
    floor_number      NUMBER,
    total_beds        NUMBER          DEFAULT 0,
    is_active         CHAR(1)         DEFAULT 'Y'
);

-- Staff / Employees
CREATE TABLE dim_staff (
    staff_id          NUMBER          PRIMARY KEY,
    first_name        VARCHAR2(50)    NOT NULL,
    last_name         VARCHAR2(50)    NOT NULL,
    role              VARCHAR2(50),   -- Doctor, Nurse, Admin, Technician
    department_id     NUMBER          REFERENCES dim_department(department_id),
    hire_date         DATE,
    employment_type   VARCHAR2(20),   -- Full-Time, Part-Time, Contract
    is_active         CHAR(1)         DEFAULT 'Y'
);

-- Patients
CREATE TABLE dim_patient (
    patient_id        NUMBER          PRIMARY KEY,
    first_name        VARCHAR2(50)    NOT NULL,
    last_name         VARCHAR2(50)    NOT NULL,
    date_of_birth     DATE,
    gender            VARCHAR2(10),
    zip_code          VARCHAR2(10),
    insurance_type    VARCHAR2(50),   -- Medicare, Medicaid, Private, Uninsured
    registration_date DATE
);

-- Date dimension (pre-populated calendar table)
CREATE TABLE dim_date (
    date_id           NUMBER          PRIMARY KEY,
    full_date         DATE            NOT NULL,
    day_of_week       VARCHAR2(10),
    day_number        NUMBER,
    week_number       NUMBER,
    month_number      NUMBER,
    month_name        VARCHAR2(15),
    quarter_number    NUMBER,
    year_number       NUMBER,
    is_weekend        CHAR(1),
    is_holiday        CHAR(1)         DEFAULT 'N'
);

-- Shift types
CREATE TABLE dim_shift (
    shift_id          NUMBER          PRIMARY KEY,
    shift_name        VARCHAR2(30),   -- Day, Evening, Night, Weekend
    start_time        VARCHAR2(10),   -- e.g. '07:00'
    end_time          VARCHAR2(10),   -- e.g. '19:00'
    duration_hours    NUMBER
);


-- ------------------------------------------------------------
-- FACT TABLES
-- ------------------------------------------------------------

-- Patient admissions and discharges (core clinical fact table)
CREATE TABLE fact_admission (
    admission_id          NUMBER          PRIMARY KEY,
    patient_id            NUMBER          REFERENCES dim_patient(patient_id),
    department_id         NUMBER          REFERENCES dim_department(department_id),
    admitting_staff_id    NUMBER          REFERENCES dim_staff(staff_id),
    admission_date        DATE            NOT NULL,
    discharge_date        DATE,
    admission_type        VARCHAR2(30),   -- Emergency, Elective, Transfer
    primary_diagnosis     VARCHAR2(200),
    discharge_status      VARCHAR2(50),   -- Recovered, Transferred, Deceased, AMA
    bed_number            VARCHAR2(10),
    -- Calculated columns (can also be done in SQL views or DAX)
    length_of_stay        NUMBER          -- Computed as discharge_date - admission_date
);

-- Emergency department visits (tracks wait times)
CREATE TABLE fact_er_visit (
    er_visit_id           NUMBER          PRIMARY KEY,
    patient_id            NUMBER          REFERENCES dim_patient(patient_id),
    visit_date            DATE            NOT NULL,
    arrival_time          DATE,           -- Full timestamp
    triage_time           DATE,
    seen_by_doctor_time   DATE,
    discharge_time        DATE,
    triage_level          NUMBER,         -- 1 (Critical) to 5 (Non-urgent)
    disposition           VARCHAR2(50),   -- Admitted, Discharged, Transferred, LWBS
    wait_minutes          NUMBER          -- arrival_time to seen_by_doctor_time
);

-- Daily bed census (snapshot per department per day)
CREATE TABLE fact_bed_census (
    census_id             NUMBER          PRIMARY KEY,
    department_id         NUMBER          REFERENCES dim_department(department_id),
    census_date           DATE            NOT NULL,
    total_beds            NUMBER,
    occupied_beds         NUMBER,
    available_beds        NUMBER,
    occupancy_rate        NUMBER          -- occupied / total * 100
);

-- Staff scheduling and hours worked
CREATE TABLE fact_staff_hours (
    hours_id              NUMBER          PRIMARY KEY,
    staff_id              NUMBER          REFERENCES dim_staff(staff_id),
    department_id         NUMBER          REFERENCES dim_department(department_id),
    shift_id              NUMBER          REFERENCES dim_shift(shift_id),
    work_date             DATE            NOT NULL,
    scheduled_hours       NUMBER,
    actual_hours          NUMBER,
    overtime_hours        NUMBER          DEFAULT 0,
    is_no_show            CHAR(1)         DEFAULT 'N'
);

-- Readmissions tracking (patients readmitted within 30 days)
CREATE TABLE fact_readmission (
    readmission_id        NUMBER          PRIMARY KEY,
    original_admission_id NUMBER          REFERENCES fact_admission(admission_id),
    patient_id            NUMBER          REFERENCES dim_patient(patient_id),
    original_discharge    DATE,
    readmission_date      DATE,
    days_between          NUMBER,         -- readmission_date - original_discharge
    readmission_reason    VARCHAR2(200),
    department_id         NUMBER          REFERENCES dim_department(department_id)
);
