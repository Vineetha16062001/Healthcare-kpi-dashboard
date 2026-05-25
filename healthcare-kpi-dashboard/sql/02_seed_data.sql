-- ============================================================
-- Healthcare KPI Analytics Dashboard
-- Seed Data: Realistic Sample Records
-- ============================================================

-- ------------------------------------------------------------
-- DEPARTMENTS
-- ------------------------------------------------------------
INSERT INTO dim_department VALUES (1,  'Emergency',          'Clinical',        1, 40,  'Y');
INSERT INTO dim_department VALUES (2,  'Intensive Care Unit', 'Clinical',       2, 20,  'Y');
INSERT INTO dim_department VALUES (3,  'Cardiology',          'Clinical',       3, 30,  'Y');
INSERT INTO dim_department VALUES (4,  'Orthopedics',         'Clinical',       4, 25,  'Y');
INSERT INTO dim_department VALUES (5,  'Pediatrics',          'Clinical',       2, 35,  'Y');
INSERT INTO dim_department VALUES (6,  'Oncology',            'Clinical',       5, 20,  'Y');
INSERT INTO dim_department VALUES (7,  'Neurology',           'Clinical',       3, 18,  'Y');
INSERT INTO dim_department VALUES (8,  'Maternity',           'Clinical',       2, 22,  'Y');
INSERT INTO dim_department VALUES (9,  'Radiology',           'Support',        1, 0,   'Y');
INSERT INTO dim_department VALUES (10, 'Administration',      'Administrative', 6, 0,   'Y');

-- ------------------------------------------------------------
-- SHIFTS
-- ------------------------------------------------------------
INSERT INTO dim_shift VALUES (1, 'Day',     '07:00', '19:00', 12);
INSERT INTO dim_shift VALUES (2, 'Night',   '19:00', '07:00', 12);
INSERT INTO dim_shift VALUES (3, 'Morning', '07:00', '15:00', 8);
INSERT INTO dim_shift VALUES (4, 'Evening', '15:00', '23:00', 8);
INSERT INTO dim_shift VALUES (5, 'Weekend', '08:00', '20:00', 12);

-- ------------------------------------------------------------
-- STAFF (50 employees across departments)
-- ------------------------------------------------------------
INSERT INTO dim_staff VALUES (1,  'James',   'Carter',    'Doctor',     1, DATE '2018-03-12', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (2,  'Sarah',   'Mitchell',  'Doctor',     1, DATE '2020-07-01', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (3,  'Kevin',   'Thompson',  'Nurse',      1, DATE '2019-01-15', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (4,  'Linda',   'Nguyen',    'Nurse',      1, DATE '2021-06-20', 'Part-Time', 'Y');
INSERT INTO dim_staff VALUES (5,  'Robert',  'Williams',  'Doctor',     2, DATE '2015-09-08', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (6,  'Angela',  'Davis',     'Nurse',      2, DATE '2017-11-30', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (7,  'Michael', 'Brown',     'Doctor',     3, DATE '2016-04-22', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (8,  'Patricia','Jones',     'Nurse',      3, DATE '2022-02-14', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (9,  'David',   'Garcia',    'Doctor',     4, DATE '2019-08-05', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (10, 'Susan',   'Martinez',  'Nurse',      4, DATE '2020-12-01', 'Part-Time', 'Y');
INSERT INTO dim_staff VALUES (11, 'John',    'Anderson',  'Doctor',     5, DATE '2018-06-17', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (12, 'Karen',   'Taylor',    'Nurse',      5, DATE '2021-03-08', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (13, 'Charles', 'Wilson',    'Doctor',     6, DATE '2014-01-20', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (14, 'Nancy',   'Moore',     'Nurse',      6, DATE '2019-09-15', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (15, 'Daniel',  'Jackson',   'Doctor',     7, DATE '2017-07-04', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (16, 'Betty',   'Harris',    'Nurse',      7, DATE '2023-01-09', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (17, 'Paul',    'Clark',     'Doctor',     8, DATE '2016-10-31', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (18, 'Helen',   'Lewis',     'Nurse',      8, DATE '2020-05-19', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (19, 'Mark',    'Robinson',  'Technician', 9, DATE '2018-08-23', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (20, 'Sandra',  'Walker',    'Admin',     10, DATE '2015-02-14', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (21, 'Steven',  'Hall',      'Nurse',      1, DATE '2022-09-01', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (22, 'Donna',   'Allen',     'Nurse',      2, DATE '2021-04-11', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (23, 'Edward',  'Young',     'Doctor',     1, DATE '2023-03-15', 'Full-Time', 'Y');
INSERT INTO dim_staff VALUES (24, 'Maria',   'Hernandez', 'Nurse',      3, DATE '2020-11-22', 'Part-Time', 'Y');
INSERT INTO dim_staff VALUES (25, 'Thomas',  'King',      'Doctor',     5, DATE '2019-07-07', 'Full-Time', 'Y');

-- ------------------------------------------------------------
-- PATIENTS (30 sample patients)
-- ------------------------------------------------------------
INSERT INTO dim_patient VALUES (1,  'Alice',   'Johnson',   DATE '1968-04-12', 'Female', '75201', 'Medicare',  DATE '2022-01-05');
INSERT INTO dim_patient VALUES (2,  'Bob',     'Smith',     DATE '1952-11-30', 'Male',   '75202', 'Medicare',  DATE '2022-03-10');
INSERT INTO dim_patient VALUES (3,  'Carol',   'White',     DATE '1985-07-22', 'Female', '75203', 'Private',   DATE '2022-05-18');
INSERT INTO dim_patient VALUES (4,  'David',   'Brown',     DATE '1990-02-14', 'Male',   '75204', 'Private',   DATE '2022-06-01');
INSERT INTO dim_patient VALUES (5,  'Emma',    'Davis',     DATE '2015-09-03', 'Female', '75205', 'Medicaid',  DATE '2022-07-20');
INSERT INTO dim_patient VALUES (6,  'Frank',   'Miller',    DATE '1944-01-19', 'Male',   '75206', 'Medicare',  DATE '2022-08-14');
INSERT INTO dim_patient VALUES (7,  'Grace',   'Wilson',    DATE '1978-06-28', 'Female', '75207', 'Private',   DATE '2022-09-05');
INSERT INTO dim_patient VALUES (8,  'Henry',   'Moore',     DATE '1961-12-07', 'Male',   '75208', 'Medicare',  DATE '2022-10-22');
INSERT INTO dim_patient VALUES (9,  'Iris',    'Taylor',    DATE '1995-03-15', 'Female', '75209', 'Private',   DATE '2022-11-01');
INSERT INTO dim_patient VALUES (10, 'Jack',    'Anderson',  DATE '1950-08-25', 'Male',   '75210', 'Medicare',  DATE '2022-11-18');
INSERT INTO dim_patient VALUES (11, 'Karen',   'Thomas',    DATE '1983-05-11', 'Female', '75201', 'Private',   DATE '2023-01-08');
INSERT INTO dim_patient VALUES (12, 'Leo',     'Jackson',   DATE '1970-10-04', 'Male',   '75202', 'Medicaid',  DATE '2023-02-14');
INSERT INTO dim_patient VALUES (13, 'Mona',    'Harris',    DATE '2010-12-19', 'Female', '75203', 'Medicaid',  DATE '2023-03-01');
INSERT INTO dim_patient VALUES (14, 'Nathan',  'Martin',    DATE '1958-07-30', 'Male',   '75204', 'Medicare',  DATE '2023-04-10');
INSERT INTO dim_patient VALUES (15, 'Olivia',  'Garcia',    DATE '1999-01-06', 'Female', '75205', 'Private',   DATE '2023-04-22');
INSERT INTO dim_patient VALUES (16, 'Peter',   'Martinez',  DATE '1965-04-17', 'Male',   '75206', 'Medicare',  DATE '2023-05-15');
INSERT INTO dim_patient VALUES (17, 'Quinn',   'Robinson',  DATE '1988-09-09', 'Female', '75207', 'Private',   DATE '2023-06-01');
INSERT INTO dim_patient VALUES (18, 'Ryan',    'Clark',     DATE '1975-02-28', 'Male',   '75208', 'Private',   DATE '2023-06-20');
INSERT INTO dim_patient VALUES (19, 'Sophie',  'Rodriguez', DATE '2018-11-14', 'Female', '75209', 'Medicaid',  DATE '2023-07-07');
INSERT INTO dim_patient VALUES (20, 'Tom',     'Lewis',     DATE '1942-06-05', 'Male',   '75210', 'Medicare',  DATE '2023-07-25');
INSERT INTO dim_patient VALUES (21, 'Uma',     'Lee',       DATE '1992-08-21', 'Female', '75201', 'Private',   DATE '2023-08-10');
INSERT INTO dim_patient VALUES (22, 'Victor',  'Walker',    DATE '1980-03-13', 'Male',   '75202', 'Private',   DATE '2023-08-28');
INSERT INTO dim_patient VALUES (23, 'Wendy',   'Hall',      DATE '1955-10-02', 'Female', '75203', 'Medicare',  DATE '2023-09-14');
INSERT INTO dim_patient VALUES (24, 'Xander',  'Allen',     DATE '2005-05-27', 'Male',   '75204', 'Medicaid',  DATE '2023-09-30');
INSERT INTO dim_patient VALUES (25, 'Yara',    'Young',     DATE '1972-01-18', 'Female', '75205', 'Private',   DATE '2023-10-12');
INSERT INTO dim_patient VALUES (26, 'Zach',    'King',      DATE '1960-07-08', 'Male',   '75206', 'Medicare',  DATE '2023-10-28');
INSERT INTO dim_patient VALUES (27, 'Amy',     'Wright',    DATE '1987-04-24', 'Female', '75207', 'Private',   DATE '2023-11-05');
INSERT INTO dim_patient VALUES (28, 'Brian',   'Scott',     DATE '1948-12-16', 'Male',   '75208', 'Medicare',  DATE '2023-11-22');
INSERT INTO dim_patient VALUES (29, 'Claire',  'Green',     DATE '2000-09-03', 'Female', '75209', 'Private',   DATE '2023-12-01');
INSERT INTO dim_patient VALUES (30, 'Dennis',  'Baker',     DATE '1967-02-11', 'Male',   '75210', 'Private',   DATE '2023-12-15');

-- ------------------------------------------------------------
-- ADMISSIONS (60 records across 2023)
-- ------------------------------------------------------------
INSERT INTO fact_admission VALUES (1,  1,  1,  1,  DATE '2023-01-04', DATE '2023-01-06', 'Emergency',  'Chest pain',              'Recovered',    'A1',  2);
INSERT INTO fact_admission VALUES (2,  2,  3,  7,  DATE '2023-01-10', DATE '2023-01-17', 'Elective',   'Coronary artery disease', 'Recovered',    'B3',  7);
INSERT INTO fact_admission VALUES (3,  3,  1,  1,  DATE '2023-01-15', DATE '2023-01-16', 'Emergency',  'Appendicitis',            'Recovered',    'A4',  1);
INSERT INTO fact_admission VALUES (4,  4,  4,  9,  DATE '2023-01-20', DATE '2023-01-25', 'Elective',   'Hip replacement',         'Recovered',    'C2',  5);
INSERT INTO fact_admission VALUES (5,  5,  5, 11,  DATE '2023-02-02', DATE '2023-02-05', 'Emergency',  'Respiratory infection',   'Recovered',    'D1',  3);
INSERT INTO fact_admission VALUES (6,  6,  2,  5,  DATE '2023-02-08', DATE '2023-02-20', 'Emergency',  'Stroke',                  'Transferred',  'E2', 12);
INSERT INTO fact_admission VALUES (7,  7,  8, 17,  DATE '2023-02-14', DATE '2023-02-17', 'Elective',   'Labor and delivery',      'Recovered',    'F1',  3);
INSERT INTO fact_admission VALUES (8,  8,  3,  7,  DATE '2023-02-22', DATE '2023-03-01', 'Elective',   'Atrial fibrillation',     'Recovered',    'B5',  7);
INSERT INTO fact_admission VALUES (9,  9,  1,  2,  DATE '2023-03-05', DATE '2023-03-06', 'Emergency',  'Broken arm',              'Recovered',    'A2',  1);
INSERT INTO fact_admission VALUES (10,10,  2,  5,  DATE '2023-03-10', DATE '2023-03-24', 'Emergency',  'Sepsis',                  'Recovered',    'E3', 14);
INSERT INTO fact_admission VALUES (11,11,  6, 13,  DATE '2023-03-18', DATE '2023-04-05', 'Elective',   'Breast cancer treatment', 'Recovered',    'G1', 18);
INSERT INTO fact_admission VALUES (12,12,  7, 15,  DATE '2023-03-25', DATE '2023-03-30', 'Elective',   'Migraine disorder',       'Recovered',    'H2',  5);
INSERT INTO fact_admission VALUES (13,13,  5, 11,  DATE '2023-04-02', DATE '2023-04-04', 'Emergency',  'Febrile seizure',         'Recovered',    'D3',  2);
INSERT INTO fact_admission VALUES (14,14,  3,  7,  DATE '2023-04-08', DATE '2023-04-13', 'Elective',   'Valve replacement',       'Recovered',    'B1',  5);
INSERT INTO fact_admission VALUES (15,15,  1,  1,  DATE '2023-04-15', DATE '2023-04-16', 'Emergency',  'Allergic reaction',       'Recovered',    'A5',  1);
INSERT INTO fact_admission VALUES (16,16,  4,  9,  DATE '2023-04-20', DATE '2023-04-27', 'Elective',   'Knee surgery',            'Recovered',    'C4',  7);
INSERT INTO fact_admission VALUES (17,17,  8, 17,  DATE '2023-04-28', DATE '2023-05-01', 'Elective',   'Labor and delivery',      'Recovered',    'F2',  3);
INSERT INTO fact_admission VALUES (18,18,  1,  2,  DATE '2023-05-06', DATE '2023-05-07', 'Emergency',  'Laceration',              'Recovered',    'A3',  1);
INSERT INTO fact_admission VALUES (19,19,  5, 25,  DATE '2023-05-12', DATE '2023-05-15', 'Emergency',  'Pneumonia',               'Recovered',    'D2',  3);
INSERT INTO fact_admission VALUES (20,20,  2,  5,  DATE '2023-05-18', DATE '2023-06-03', 'Emergency',  'Heart failure',           'Recovered',    'E1', 16);
INSERT INTO fact_admission VALUES (21, 1,  1,  1,  DATE '2023-05-25', DATE '2023-05-26', 'Emergency',  'Chest pain recurrence',   'Recovered',    'A6',  1);
INSERT INTO fact_admission VALUES (22,21,  3,  7,  DATE '2023-06-01', DATE '2023-06-06', 'Elective',   'Hypertension management', 'Recovered',    'B2',  5);
INSERT INTO fact_admission VALUES (23,22,  4,  9,  DATE '2023-06-08', DATE '2023-06-12', 'Elective',   'Shoulder surgery',        'Recovered',    'C1',  4);
INSERT INTO fact_admission VALUES (24,23,  6, 13,  DATE '2023-06-15', DATE '2023-07-01', 'Elective',   'Chemotherapy',            'Recovered',    'G3', 16);
INSERT INTO fact_admission VALUES (25,24,  5, 11,  DATE '2023-06-22', DATE '2023-06-25', 'Emergency',  'Asthma attack',           'Recovered',    'D4',  3);
INSERT INTO fact_admission VALUES (26,25,  7, 15,  DATE '2023-06-28', DATE '2023-07-02', 'Elective',   'Epilepsy monitoring',     'Recovered',    'H1',  4);
INSERT INTO fact_admission VALUES (27, 2,  3,  7,  DATE '2023-07-05', DATE '2023-07-12', 'Elective',   'Arrhythmia',              'Recovered',    'B4',  7);
INSERT INTO fact_admission VALUES (28,26,  1,  1,  DATE '2023-07-10', DATE '2023-07-11', 'Emergency',  'Diabetic emergency',      'Recovered',    'A7',  1);
INSERT INTO fact_admission VALUES (29,27,  8, 17,  DATE '2023-07-15', DATE '2023-07-18', 'Elective',   'Prenatal complication',   'Recovered',    'F3',  3);
INSERT INTO fact_admission VALUES (30,28,  2,  5,  DATE '2023-07-20', DATE '2023-08-08', 'Emergency',  'Pneumonia with sepsis',   'Recovered',    'E4', 19);
INSERT INTO fact_admission VALUES (31,29,  1,  2,  DATE '2023-07-28', DATE '2023-07-28', 'Emergency',  'Minor trauma',            'Recovered',    'A8',  0);
INSERT INTO fact_admission VALUES (32,30,  4,  9,  DATE '2023-08-03', DATE '2023-08-09', 'Elective',   'Spinal fusion',           'Recovered',    'C3',  6);
INSERT INTO fact_admission VALUES (33,11,  6, 13,  DATE '2023-08-10', DATE '2023-08-28', 'Elective',   'Cancer follow-up',        'Recovered',    'G2', 18);
INSERT INTO fact_admission VALUES (34,12,  7, 15,  DATE '2023-08-15', DATE '2023-08-19', 'Elective',   'Parkinson monitoring',    'Recovered',    'H4',  4);
INSERT INTO fact_admission VALUES (35,13,  1, 23,  DATE '2023-08-22', DATE '2023-08-23', 'Emergency',  'High fever',              'Recovered',    'A9',  1);
INSERT INTO fact_admission VALUES (36,14,  2,  5,  DATE '2023-08-28', DATE '2023-09-10', 'Emergency',  'Post-op complication',    'Recovered',    'E5', 13);
INSERT INTO fact_admission VALUES (37,15,  3,  7,  DATE '2023-09-04', DATE '2023-09-08', 'Elective',   'Pacemaker implant',       'Recovered',    'B6',  4);
INSERT INTO fact_admission VALUES (38,16,  1,  1,  DATE '2023-09-10', DATE '2023-09-11', 'Emergency',  'Fall injury',             'Recovered',    'A10', 1);
INSERT INTO fact_admission VALUES (39,17,  8, 17,  DATE '2023-09-15', DATE '2023-09-18', 'Elective',   'Labor and delivery',      'Recovered',    'F4',  3);
INSERT INTO fact_admission VALUES (40,18,  4,  9,  DATE '2023-09-20', DATE '2023-09-26', 'Elective',   'Joint replacement',       'Recovered',    'C5',  6);
INSERT INTO fact_admission VALUES (41,19,  5, 25,  DATE '2023-09-28', DATE '2023-10-01', 'Emergency',  'RSV infection',           'Recovered',    'D5',  3);
INSERT INTO fact_admission VALUES (42,20,  3,  7,  DATE '2023-10-05', DATE '2023-10-10', 'Elective',   'Cardiac catheterization', 'Recovered',    'B7',  5);
INSERT INTO fact_admission VALUES (43,21,  6, 13,  DATE '2023-10-12', DATE '2023-10-30', 'Elective',   'Chemotherapy cycle 2',    'Recovered',    'G4', 18);
INSERT INTO fact_admission VALUES (44,22,  1,  2,  DATE '2023-10-18', DATE '2023-10-19', 'Emergency',  'Overdose',                'Recovered',    'A11', 1);
INSERT INTO fact_admission VALUES (45,23,  7, 15,  DATE '2023-10-25', DATE '2023-10-29', 'Elective',   'Neuropathy treatment',    'Recovered',    'H3',  4);
INSERT INTO fact_admission VALUES (46,24,  1, 23,  DATE '2023-11-01', DATE '2023-11-02', 'Emergency',  'Fever and vomiting',      'Recovered',    'A12', 1);
INSERT INTO fact_admission VALUES (47,25,  3,  7,  DATE '2023-11-06', DATE '2023-11-11', 'Elective',   'Angioplasty',             'Recovered',    'B8',  5);
INSERT INTO fact_admission VALUES (48,26,  2,  5,  DATE '2023-11-10', DATE '2023-11-22', 'Emergency',  'Cardiac arrest',          'Transferred',  'E6', 12);
INSERT INTO fact_admission VALUES (49,27,  5, 11,  DATE '2023-11-15', DATE '2023-11-17', 'Emergency',  'Croup',                   'Recovered',    'D6',  2);
INSERT INTO fact_admission VALUES (50,28,  4,  9,  DATE '2023-11-20', DATE '2023-11-26', 'Elective',   'Back surgery',            'Recovered',    'C6',  6);
INSERT INTO fact_admission VALUES (51,29,  8, 17,  DATE '2023-11-25', DATE '2023-11-28', 'Elective',   'Labor and delivery',      'Recovered',    'F5',  3);
INSERT INTO fact_admission VALUES (52,30,  1,  1,  DATE '2023-12-01', DATE '2023-12-02', 'Emergency',  'Chest pain',              'Recovered',    'A13', 1);
INSERT INTO fact_admission VALUES (53, 1,  6, 13,  DATE '2023-12-04', DATE '2023-12-22', 'Elective',   'Cancer screening',        'Recovered',    'G5', 18);
INSERT INTO fact_admission VALUES (54, 3,  1,  2,  DATE '2023-12-08', DATE '2023-12-09', 'Emergency',  'Abdominal pain',          'Recovered',    'A14', 1);
INSERT INTO fact_admission VALUES (55, 4,  3,  7,  DATE '2023-12-11', DATE '2023-12-15', 'Elective',   'Stress test follow-up',   'Recovered',    'B9',  4);
INSERT INTO fact_admission VALUES (56, 5,  5, 25,  DATE '2023-12-14', DATE '2023-12-16', 'Emergency',  'Ear infection',           'Recovered',    'D7',  2);
INSERT INTO fact_admission VALUES (57, 6,  2,  5,  DATE '2023-12-16', DATE '2023-12-31', 'Emergency',  'Acute kidney injury',     'Recovered',    'E7', 15);
INSERT INTO fact_admission VALUES (58, 7,  7, 15,  DATE '2023-12-18', DATE '2023-12-22', 'Elective',   'MS monitoring',           'Recovered',    'H5',  4);
INSERT INTO fact_admission VALUES (59, 8,  4,  9,  DATE '2023-12-20', DATE '2023-12-28', 'Elective',   'Knee revision',           'Recovered',    'C7',  8);
INSERT INTO fact_admission VALUES (60, 9,  1,  1,  DATE '2023-12-27', NULL,              'Emergency',  'Head injury',             NULL,           'A15', NULL);

-- ------------------------------------------------------------
-- ER VISITS (30 records)
-- ------------------------------------------------------------
INSERT INTO fact_er_visit VALUES (1,  1,  DATE '2023-01-04', DATE '2023-01-04 08:15:00', DATE '2023-01-04 08:30:00', DATE '2023-01-04 09:00:00', DATE '2023-01-04 11:00:00', 2, 'Admitted',    45);
INSERT INTO fact_er_visit VALUES (2,  3,  DATE '2023-01-15', DATE '2023-01-15 14:20:00', DATE '2023-01-15 14:35:00', DATE '2023-01-15 15:10:00', DATE '2023-01-15 17:30:00', 2, 'Admitted',    50);
INSERT INTO fact_er_visit VALUES (3,  9,  DATE '2023-03-05', DATE '2023-03-05 10:00:00', DATE '2023-03-05 10:10:00', DATE '2023-03-05 10:45:00', DATE '2023-03-05 12:00:00', 3, 'Admitted',    45);
INSERT INTO fact_er_visit VALUES (4,  15, DATE '2023-04-15', DATE '2023-04-15 16:30:00', DATE '2023-04-15 16:40:00', DATE '2023-04-15 17:00:00', DATE '2023-04-15 18:30:00', 2, 'Admitted',    30);
INSERT INTO fact_er_visit VALUES (5,  18, DATE '2023-05-06', DATE '2023-05-06 09:45:00', DATE '2023-05-06 10:00:00', DATE '2023-05-06 10:30:00', DATE '2023-05-06 12:00:00', 4, 'Admitted',    45);
INSERT INTO fact_er_visit VALUES (6,  28, DATE '2023-07-10', DATE '2023-07-10 22:10:00', DATE '2023-07-10 22:20:00', DATE '2023-07-10 22:50:00', DATE '2023-07-11 02:00:00', 2, 'Admitted',    40);
INSERT INTO fact_er_visit VALUES (7,  31, DATE '2023-07-28', DATE '2023-07-28 13:00:00', DATE '2023-07-28 13:15:00', DATE '2023-07-28 13:45:00', DATE '2023-07-28 15:30:00', 4, 'Admitted',    45);
INSERT INTO fact_er_visit VALUES (8,  35, DATE '2023-08-22', DATE '2023-08-22 18:00:00', DATE '2023-08-22 18:10:00', DATE '2023-08-22 18:40:00', DATE '2023-08-22 20:00:00', 3, 'Admitted',    40);
INSERT INTO fact_er_visit VALUES (9,  38, DATE '2023-09-10', DATE '2023-09-10 11:30:00', DATE '2023-09-10 11:45:00', DATE '2023-09-10 12:20:00', DATE '2023-09-10 14:00:00', 3, 'Admitted',    50);
INSERT INTO fact_er_visit VALUES (10, 44, DATE '2023-10-18', DATE '2023-10-18 03:15:00', DATE '2023-10-18 03:20:00', DATE '2023-10-18 03:35:00', DATE '2023-10-18 07:00:00', 1, 'Admitted',    20);
INSERT INTO fact_er_visit VALUES (11, 46, DATE '2023-11-01', DATE '2023-11-01 07:00:00', DATE '2023-11-01 07:15:00', DATE '2023-11-01 08:00:00', DATE '2023-11-01 10:30:00', 3, 'Admitted',    60);
INSERT INTO fact_er_visit VALUES (12, 52, DATE '2023-12-01', DATE '2023-12-01 20:45:00', DATE '2023-12-01 21:00:00', DATE '2023-12-01 21:30:00', DATE '2023-12-01 23:45:00', 2, 'Admitted',    45);
INSERT INTO fact_er_visit VALUES (13, 54, DATE '2023-12-08', DATE '2023-12-08 14:00:00', DATE '2023-12-08 14:10:00', DATE '2023-12-08 14:50:00', DATE '2023-12-08 16:30:00', 3, 'Admitted',    50);
INSERT INTO fact_er_visit VALUES (14, 60, DATE '2023-12-27', DATE '2023-12-27 19:30:00', DATE '2023-12-27 19:35:00', DATE '2023-12-27 19:50:00', NULL,                       1, 'Admitted',    20);
-- Walk-in ER visits that were discharged (not admitted)
INSERT INTO fact_er_visit VALUES (15, 2,  DATE '2023-02-01', DATE '2023-02-01 10:00:00', DATE '2023-02-01 10:20:00', DATE '2023-02-01 11:30:00', DATE '2023-02-01 13:00:00', 4, 'Discharged',  90);
INSERT INTO fact_er_visit VALUES (16, 4,  DATE '2023-03-20', DATE '2023-03-20 15:00:00', DATE '2023-03-20 15:15:00', DATE '2023-03-20 16:00:00', DATE '2023-03-20 17:30:00', 5, 'Discharged',  60);
INSERT INTO fact_er_visit VALUES (17, 7,  DATE '2023-04-01', DATE '2023-04-01 09:30:00', DATE '2023-04-01 09:45:00', DATE '2023-04-01 10:30:00', DATE '2023-04-01 11:45:00', 4, 'Discharged',  60);
INSERT INTO fact_er_visit VALUES (18, 10, DATE '2023-05-14', DATE '2023-05-14 11:00:00', DATE '2023-05-14 11:20:00', DATE '2023-05-14 12:10:00', DATE '2023-05-14 14:00:00', 3, 'Discharged',  70);
INSERT INTO fact_er_visit VALUES (19, 14, DATE '2023-06-10', DATE '2023-06-10 16:00:00', DATE '2023-06-10 16:10:00', DATE '2023-06-10 17:00:00', DATE '2023-06-10 18:30:00', 4, 'Discharged',  60);
INSERT INTO fact_er_visit VALUES (20, 20, DATE '2023-06-28', DATE '2023-06-28 08:30:00', DATE '2023-06-28 08:50:00', DATE '2023-06-28 10:00:00', DATE '2023-06-28 12:00:00', 3, 'Discharged',  90);
INSERT INTO fact_er_visit VALUES (21, 22, DATE '2023-07-19', DATE '2023-07-19 13:00:00', DATE '2023-07-19 13:15:00', DATE '2023-07-19 14:15:00', DATE '2023-07-19 15:30:00', 5, 'Discharged',  75);
INSERT INTO fact_er_visit VALUES (22, 25, DATE '2023-08-09', DATE '2023-08-09 17:30:00', DATE '2023-08-09 17:45:00', DATE '2023-08-09 18:45:00', DATE '2023-08-09 20:00:00', 4, 'Discharged',  75);
INSERT INTO fact_er_visit VALUES (23, 27, DATE '2023-09-02', DATE '2023-09-02 10:00:00', DATE '2023-09-02 10:20:00', DATE '2023-09-02 11:15:00', DATE '2023-09-02 12:30:00', 3, 'Discharged',  75);
INSERT INTO fact_er_visit VALUES (24, 29, DATE '2023-10-01', DATE '2023-10-01 14:00:00', DATE '2023-10-01 14:15:00', DATE '2023-10-01 15:30:00', DATE '2023-10-01 17:00:00', 4, 'Discharged',  90);
INSERT INTO fact_er_visit VALUES (25, 30, DATE '2023-11-14', DATE '2023-11-14 20:00:00', DATE '2023-11-14 20:10:00', DATE '2023-11-14 21:00:00', DATE '2023-11-14 22:30:00', 3, 'Discharged',  60);

-- ------------------------------------------------------------
-- BED CENSUS (daily snapshots - monthly averages per department)
-- ------------------------------------------------------------
INSERT INTO fact_bed_census VALUES (1,  1, DATE '2023-01-31', 40, 36, 4,  90);
INSERT INTO fact_bed_census VALUES (2,  2, DATE '2023-01-31', 20, 18, 2,  90);
INSERT INTO fact_bed_census VALUES (3,  3, DATE '2023-01-31', 30, 24, 6,  80);
INSERT INTO fact_bed_census VALUES (4,  4, DATE '2023-01-31', 25, 20, 5,  80);
INSERT INTO fact_bed_census VALUES (5,  5, DATE '2023-01-31', 35, 28, 7,  80);
INSERT INTO fact_bed_census VALUES (6,  1, DATE '2023-02-28', 40, 34, 6,  85);
INSERT INTO fact_bed_census VALUES (7,  2, DATE '2023-02-28', 20, 17, 3,  85);
INSERT INTO fact_bed_census VALUES (8,  3, DATE '2023-02-28', 30, 25, 5,  83);
INSERT INTO fact_bed_census VALUES (9,  4, DATE '2023-02-28', 25, 21, 4,  84);
INSERT INTO fact_bed_census VALUES (10, 5, DATE '2023-02-28', 35, 29, 6,  83);
INSERT INTO fact_bed_census VALUES (11, 1, DATE '2023-03-31', 40, 38, 2,  95);
INSERT INTO fact_bed_census VALUES (12, 2, DATE '2023-03-31', 20, 19, 1,  95);
INSERT INTO fact_bed_census VALUES (13, 3, DATE '2023-03-31', 30, 27, 3,  90);
INSERT INTO fact_bed_census VALUES (14, 4, DATE '2023-03-31', 25, 22, 3,  88);
INSERT INTO fact_bed_census VALUES (15, 5, DATE '2023-03-31', 35, 32, 3,  91);
INSERT INTO fact_bed_census VALUES (16, 1, DATE '2023-06-30', 40, 33, 7,  83);
INSERT INTO fact_bed_census VALUES (17, 2, DATE '2023-06-30', 20, 16, 4,  80);
INSERT INTO fact_bed_census VALUES (18, 3, DATE '2023-06-30', 30, 23, 7,  77);
INSERT INTO fact_bed_census VALUES (19, 1, DATE '2023-09-30', 40, 35, 5,  88);
INSERT INTO fact_bed_census VALUES (20, 2, DATE '2023-09-30', 20, 18, 2,  90);
INSERT INTO fact_bed_census VALUES (21, 1, DATE '2023-12-31', 40, 37, 3,  93);
INSERT INTO fact_bed_census VALUES (22, 2, DATE '2023-12-31', 20, 19, 1,  95);
INSERT INTO fact_bed_census VALUES (23, 3, DATE '2023-12-31', 30, 26, 4,  87);

-- ------------------------------------------------------------
-- STAFF HOURS (sample workforce records)
-- ------------------------------------------------------------
INSERT INTO fact_staff_hours VALUES (1,  1,  1, 1, DATE '2023-01-04', 12, 13, 1, 'N');
INSERT INTO fact_staff_hours VALUES (2,  3,  1, 2, DATE '2023-01-04', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (3,  2,  1, 1, DATE '2023-01-05', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (4,  4,  1, 3, DATE '2023-01-05',  8,  0, 0, 'Y');
INSERT INTO fact_staff_hours VALUES (5,  5,  2, 1, DATE '2023-01-06', 12, 14, 2, 'N');
INSERT INTO fact_staff_hours VALUES (6,  6,  2, 2, DATE '2023-01-06', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (7,  7,  3, 1, DATE '2023-01-10', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (8,  8,  3, 3, DATE '2023-01-10',  8,  8, 0, 'N');
INSERT INTO fact_staff_hours VALUES (9,  9,  4, 1, DATE '2023-01-20', 12, 13, 1, 'N');
INSERT INTO fact_staff_hours VALUES (10,10,  4, 4, DATE '2023-01-20',  8,  8, 0, 'N');
INSERT INTO fact_staff_hours VALUES (11, 1,  1, 1, DATE '2023-02-01', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (12, 2,  1, 2, DATE '2023-02-01', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (13, 5,  2, 1, DATE '2023-02-08', 12, 15, 3, 'N');
INSERT INTO fact_staff_hours VALUES (14, 6,  2, 2, DATE '2023-02-08', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (15,11,  5, 1, DATE '2023-02-02', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (16,12,  5, 3, DATE '2023-02-02',  8,  0, 0, 'Y');
INSERT INTO fact_staff_hours VALUES (17,13,  6, 1, DATE '2023-03-18', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (18,14,  6, 2, DATE '2023-03-18', 12, 13, 1, 'N');
INSERT INTO fact_staff_hours VALUES (19,15,  7, 1, DATE '2023-03-25', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (20,16,  7, 3, DATE '2023-03-25',  8,  8, 0, 'N');
INSERT INTO fact_staff_hours VALUES (21, 1,  1, 1, DATE '2023-06-01', 12, 14, 2, 'N');
INSERT INTO fact_staff_hours VALUES (22, 3,  1, 2, DATE '2023-06-01', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (23,21,  1, 4, DATE '2023-06-01',  8,  8, 0, 'N');
INSERT INTO fact_staff_hours VALUES (24, 5,  2, 1, DATE '2023-09-01', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (25,22,  2, 2, DATE '2023-09-01', 12, 11, 0, 'N');
INSERT INTO fact_staff_hours VALUES (26, 7,  3, 1, DATE '2023-09-04', 12, 12, 0, 'N');
INSERT INTO fact_staff_hours VALUES (27,24,  3, 3, DATE '2023-09-04',  8,  8, 0, 'N');
INSERT INTO fact_staff_hours VALUES (28, 9,  4, 1, DATE '2023-12-20', 12, 14, 2, 'N');
INSERT INTO fact_staff_hours VALUES (29,10,  4, 4, DATE '2023-12-20',  8,  8, 0, 'N');
INSERT INTO fact_staff_hours VALUES (30,17,  8, 1, DATE '2023-12-18', 12, 12, 0, 'N');

-- ------------------------------------------------------------
-- READMISSIONS
-- ------------------------------------------------------------
INSERT INTO fact_readmission VALUES (1, 1,  1,  DATE '2023-01-06', DATE '2023-05-25', 139, 'Recurring chest pain',   1);
INSERT INTO fact_readmission VALUES (2, 2,  2,  DATE '2023-01-17', DATE '2023-07-05',  169, 'Arrhythmia recurrence',  3);
INSERT INTO fact_readmission VALUES (3, 10,10,  DATE '2023-03-24', NULL,              NULL, NULL,                     NULL);

COMMIT;
