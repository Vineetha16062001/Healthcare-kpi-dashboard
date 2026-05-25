# Power BI DAX Measures
## Healthcare KPI Analytics Dashboard

Paste each measure into Power BI via **Modeling → New Measure**.  
All measures assume your tables are named as in the SQL schema.

---

## Clinical KPIs

### Total Admissions
```dax
Total Admissions = 
COUNTROWS(fact_admission)
```

### Total Admissions (Selected Period)
```dax
Admissions This Period = 
CALCULATE(
    COUNTROWS(fact_admission),
    USERELATIONSHIP(fact_admission[admission_date], dim_date[full_date])
)
```

### Average Length of Stay (ALOS)
```dax
Avg Length of Stay = 
AVERAGEX(
    FILTER(
        fact_admission,
        NOT ISBLANK(fact_admission[discharge_date])
    ),
    fact_admission[length_of_stay]
)
```

### ALOS vs Target (target = 5 days)
```dax
ALOS vs Target = 
[Avg Length of Stay] - 5
```

### Discharge Rate %
```dax
Discharge Rate % = 
DIVIDE(
    CALCULATE(COUNTROWS(fact_admission), NOT ISBLANK(fact_admission[discharge_date])),
    COUNTROWS(fact_admission),
    0
) * 100
```

### 30-Day Readmission Rate
```dax
Readmission Rate 30D = 
DIVIDE(
    CALCULATE(
        COUNTROWS(fact_readmission),
        fact_readmission[days_between] <= 30,
        NOT ISBLANK(fact_readmission[days_between])
    ),
    COUNTROWS(fact_admission),
    0
) * 100
```

### Emergency vs Elective Split
```dax
Emergency Admissions = 
CALCULATE(
    COUNTROWS(fact_admission),
    fact_admission[admission_type] = "Emergency"
)

Elective Admissions = 
CALCULATE(
    COUNTROWS(fact_admission),
    fact_admission[admission_type] = "Elective"
)

Emergency Admission % = 
DIVIDE([Emergency Admissions], [Total Admissions], 0) * 100
```

---

## Bed Occupancy KPIs

### Average Bed Occupancy Rate
```dax
Avg Bed Occupancy Rate = 
AVERAGE(fact_bed_census[occupancy_rate])
```

### Bed Occupancy Status
```dax
Occupancy Status = 
SWITCH(
    TRUE(),
    [Avg Bed Occupancy Rate] >= 90, "High ⚠️",
    [Avg Bed Occupancy Rate] >= 75, "Normal ✅",
    "Low ℹ️"
)
```

### Beds Available (latest snapshot)
```dax
Available Beds = 
CALCULATE(
    SUM(fact_bed_census[available_beds]),
    LASTDATE(fact_bed_census[census_date])
)
```

---

## ER (Emergency Room) KPIs

### Average ER Wait Time (minutes)
```dax
Avg ER Wait Time (min) = 
AVERAGE(fact_er_visit[wait_minutes])
```

### % Seen Within 30 Minutes
```dax
Pct Seen in 30 Min = 
DIVIDE(
    CALCULATE(
        COUNTROWS(fact_er_visit),
        fact_er_visit[wait_minutes] <= 30
    ),
    COUNTROWS(fact_er_visit),
    0
) * 100
```

### ER Admission Rate
```dax
ER Admission Rate = 
DIVIDE(
    CALCULATE(
        COUNTROWS(fact_er_visit),
        fact_er_visit[disposition] = "Admitted"
    ),
    COUNTROWS(fact_er_visit),
    0
) * 100
```

### Left Without Being Seen (LWBS) Count
```dax
LWBS Count = 
CALCULATE(
    COUNTROWS(fact_er_visit),
    fact_er_visit[disposition] = "LWBS"
)
```

---

## Workforce KPIs

### Total Active Staff (Headcount)
```dax
Active Headcount = 
CALCULATE(
    COUNTROWS(dim_staff),
    dim_staff[is_active] = "Y"
)
```

### Staff Utilization Rate
```dax
Staff Utilization Rate = 
DIVIDE(
    SUM(fact_staff_hours[actual_hours]),
    SUM(fact_staff_hours[scheduled_hours]),
    0
) * 100
```

### Total Overtime Hours
```dax
Total Overtime Hours = 
SUM(fact_staff_hours[overtime_hours])
```

### Overtime Hours % of Total
```dax
Overtime % = 
DIVIDE(
    [Total Overtime Hours],
    SUM(fact_staff_hours[scheduled_hours]),
    0
) * 100
```

### Shift Coverage Rate
```dax
Shift Coverage Rate = 
DIVIDE(
    CALCULATE(
        COUNTROWS(fact_staff_hours),
        fact_staff_hours[is_no_show] = "N"
    ),
    COUNTROWS(fact_staff_hours),
    0
) * 100
```

### No-Show Count
```dax
No Show Count = 
CALCULATE(
    COUNTROWS(fact_staff_hours),
    fact_staff_hours[is_no_show] = "Y"
)
```

---

## Time Intelligence Measures

### Admissions Month-over-Month Change
```dax
Admissions MoM Change = 
VAR CurrentMonth = [Total Admissions]
VAR PriorMonth = CALCULATE(
    [Total Admissions],
    DATEADD(dim_date[full_date], -1, MONTH)
)
RETURN
DIVIDE(CurrentMonth - PriorMonth, PriorMonth, 0) * 100
```

### Admissions YTD
```dax
Admissions YTD = 
CALCULATE(
    [Total Admissions],
    DATESYTD(dim_date[full_date])
)
```

### Admissions Same Period Last Year
```dax
Admissions SPLY = 
CALCULATE(
    [Total Admissions],
    SAMEPERIODLASTYEAR(dim_date[full_date])
)
```

### YoY Growth %
```dax
Admissions YoY Growth % = 
DIVIDE(
    [Total Admissions] - [Admissions SPLY],
    [Admissions SPLY],
    0
) * 100
```

---

## Formatting Helpers

### ALOS Formatted
```dax
ALOS Display = 
FORMAT([Avg Length of Stay], "0.0") & " days"
```

### Wait Time Formatted
```dax
ER Wait Display = 
FORMAT([Avg ER Wait Time (min)], "0") & " min"
```

### Occupancy Rate Color (for conditional formatting)
```dax
Occupancy Color = 
SWITCH(
    TRUE(),
    [Avg Bed Occupancy Rate] >= 90, "#E24B4A",  -- Red
    [Avg Bed Occupancy Rate] >= 75, "#639922",  -- Green
    "#BA7517"                                   -- Amber
)
```
