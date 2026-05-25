# KPI Definitions
## Healthcare KPI Analytics Dashboard

Understanding what each KPI means, how it's calculated, and what a good/bad value looks like.

---

## Clinical KPIs

### Total Admissions
- **Definition:** Count of all patient admissions in the selected period
- **Source:** `fact_admission` — count of `admission_id`
- **Target:** Track trend; flag if >10% above/below same period last year
- **Used for:** Capacity planning, revenue forecasting

### Average Length of Stay (ALOS)
- **Definition:** Average number of days a patient spends admitted, from admission to discharge
- **Formula:** `SUM(discharge_date - admission_date) / COUNT(admissions where discharged)`
- **Note:** Excludes patients not yet discharged (NULL discharge_date)
- **Benchmark:** Varies by department; hospital average ~4–5 days
- **Why it matters:** Longer stays increase cost; shorter stays may indicate premature discharge

### Bed Occupancy Rate
- **Definition:** Percentage of available beds that are occupied at a given time
- **Formula:** `(occupied_beds / total_beds) * 100`
- **Targets:**
  - Below 75% = Low (underutilized)
  - 75–89% = Normal (optimal range)
  - 90%+ = High (risk of capacity issues)
- **Why it matters:** Too high = patients wait; too low = unused resources

### 30-Day Readmission Rate
- **Definition:** Percentage of discharged patients who return within 30 days
- **Formula:** `(readmissions within 30 days / total discharges) * 100`
- **Benchmark:** Industry average ~15%; below 10% is excellent
- **Why it matters:** High readmissions indicate quality-of-care issues; also a CMS penalty metric

### Discharge Rate
- **Definition:** Percentage of admitted patients who were discharged in the period
- **Formula:** `(discharged patients / total admissions) * 100`
- **Target:** Should be close to 100% for short-stay departments
- **Why it matters:** Helps identify bottlenecks in discharge planning

---

## Emergency Room KPIs

### ER Average Wait Time
- **Definition:** Average time (in minutes) from patient arrival to being seen by a doctor
- **Formula:** `AVG(seen_by_doctor_time - arrival_time)` in minutes
- **Targets by Triage Level:**
  - Level 1 (Critical): Immediate (0 min)
  - Level 2 (Emergent): ≤ 15 minutes
  - Level 3 (Urgent): ≤ 30 minutes
  - Level 4 (Semi-urgent): ≤ 60 minutes
  - Level 5 (Non-urgent): ≤ 120 minutes
- **Overall target:** ≤ 30 minutes average

### % Seen Within 30 Minutes
- **Definition:** Percentage of ER patients seen by a physician within 30 minutes of arrival
- **Target:** ≥ 70%
- **Why it matters:** Key patient satisfaction driver; correlates with outcomes

### ER Admission Rate
- **Definition:** Percentage of ER visits resulting in a hospital admission
- **Formula:** `(ER visits with disposition = 'Admitted' / total ER visits) * 100`
- **Benchmark:** ~20–25% nationally
- **Why it matters:** Very high rate may indicate ER overcrowding; very low may indicate premature discharge

### Left Without Being Seen (LWBS)
- **Definition:** Count of patients who left the ER before being evaluated by a physician
- **Target:** < 2% of total ER visits
- **Why it matters:** Safety risk; also a patient satisfaction and liability concern

---

## Workforce KPIs

### Active Headcount
- **Definition:** Number of currently active employees by department and role
- **Source:** `dim_staff` where `is_active = 'Y'`
- **Used for:** Staffing ratio analysis; budgeting

### Staff Utilization Rate
- **Definition:** Percentage of scheduled hours actually worked
- **Formula:** `(actual_hours / scheduled_hours) * 100`
- **Targets:**
  - Below 80% = Low (overstaffed or no-shows)
  - 80–100% = Optimal
  - Above 100% = Overtime-heavy (burnout risk)
- **Why it matters:** Directly impacts labor costs and staff wellbeing

### Overtime Hours
- **Definition:** Hours worked beyond the scheduled shift
- **Source:** `fact_staff_hours[overtime_hours]`
- **Target:** Overtime should be < 5% of total scheduled hours
- **Why it matters:** High overtime = increased cost (1.5x pay); also linked to clinical errors from fatigue

### Shift Coverage Rate
- **Definition:** Percentage of scheduled shifts where the assigned staff actually showed up
- **Formula:** `(shifts where is_no_show = 'N' / total scheduled shifts) * 100`
- **Target:** ≥ 95%
- **Why it matters:** Uncovered shifts create patient safety risks and force last-minute overtime

---

## How KPIs Are Used in Leadership Meetings

| KPI | Reviewed By | Frequency | Action Threshold |
|-----|------------|-----------|-----------------|
| Total Admissions | CMO, CFO | Weekly | ±10% vs prior week |
| ALOS | CMO, Department Heads | Weekly | >6 days any department |
| Bed Occupancy | COO | Daily | >90% any department |
| 30-Day Readmission | Quality Team | Monthly | >15% overall |
| ER Wait Time | ER Director | Daily | >45 min average |
| Staff Utilization | CNO, HR | Weekly | <80% or >100% |
| Overtime Hours | CFO, HR | Weekly | >10% of scheduled hours |
