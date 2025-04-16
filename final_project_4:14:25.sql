CREATE SCHEMA empower;
USE empower;
--DROP SCHEMA empower 
--
-- Table structure for table `identifiables`
--

CREATE TABLE identifiables (
  patient_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  patient_dob DATE,
  gender CHAR(1),
  PRIMARY KEY  (patient_id)
);

--
-- Table structure for table `visits`
--

CREATE TABLE visits (
	PRIMARY KEY (visit_id),
    visit_id MEDIUMINT UNSIGNED AUTO_INCREMENT,
    patient_id SMALLINT UNSIGNED,
    visit_type ENUM('Psychiatric', 'Primary care'),
    visit_date DATE,
    primary_complaint VARCHAR(200),
    other_complaint VARCHAR(200),
	FOREIGN KEY (patient_id) REFERENCES identifiables(patient_id)
);

--
-- Table structure for table `diagnosislookup`
--

CREATE TABLE diagnosislookup (
	PRIMARY KEY (dx_id), 
    dx_id MEDIUMINT UNSIGNED AUTO_INCREMENT, 
    dx_name VARCHAR(200),
    dx_code VARCHAR(10),
	dx_category VARCHAR(50)
  );
  
  CREATE UNIQUE INDEX idx_dx_code 
  ON diagnosislookup (dx_code);

--
-- Table structure for table `diagnoses`
-- 

CREATE TABLE diagnoses (
	PRIMARY KEY (diagnosis_id), 
    diagnosis_id MEDIUMINT UNSIGNED AUTO_INCREMENT, 
    patient_id SMALLINT UNSIGNED, 
    visit_id MEDIUMINT UNSIGNED,
    dx_code VARCHAR(10),
    FOREIGN KEY (patient_id) REFERENCES identifiables(patient_id),
    FOREIGN KEY (visit_id) REFERENCES visits(visit_id),
    FOREIGN KEY (dx_code) REFERENCES diagnosislookup (dx_code)
    );

INSERT INTO identifiables (first_name, last_name, patient_dob, gender) VALUES
('John', 'Doe', '1980-01-15', 'M'),
('Jane', 'Smith', '1975-06-10', 'F'),
('Carlos', 'Martinez', '1990-09-23', 'M'),
('Emily', 'Johnson', '1988-02-02', 'F'),
('Mohammed', 'Ali', '1972-11-12', 'M'),
('Sarah', 'Connor', '1985-08-08', 'F'),
('James', 'Brown', '1992-04-18', 'M'),
('Anna', 'White', '1995-03-30', 'F'),
('Chris', 'Evans', '1987-07-07', 'M'),
('Sophia', 'Lee', '1993-12-14', 'F'),
('Liam', 'Wong', '1991-01-01', 'M'),
('Grace', 'Kim', '1979-10-10', 'F'),
('Aiden', 'Clark', '1983-05-19', 'M'),
('Maya', 'Patel', '1994-06-06', 'F'),
('Noah', 'Nguyen', '1986-09-09', 'M'),
('Lisa', 'Pardee', '2001-09-16', 'F'),
('Tobechi', 'Dimkpa', '2002-07-05', 'F');

INSERT INTO visits (patient_id, visit_type, visit_date, primary_complaint, other_complaint) VALUES
(6, 'Primary care', '2024-03-07', 'Chest pain', NULL),
(1, 'Primary care', '2024-02-14', 'Back pain', NULL),
(8, 'Primary care', '2024-03-10', 'Weight gain', NULL),
(11, 'Psychiatric', '2024-04-14', 'Isolation', NULL),
(17, 'Psychiatric', '2024-03-20', 'Self-harm thoughts', NULL),
(12, 'Primary care', '2024-02-23', 'Annual check-up', NULL),
(14, 'Psychiatric', '2024-03-16', 'Hopelessness', NULL),
(10, 'Primary care', '2024-02-20', 'Migraine', NULL),
(7, 'Psychiatric', '2024-03-08', 'Nightmares', NULL),
(5, 'Primary care', '2024-02-04', 'Diabetic symptoms', NULL),
(13, 'Primary care', '2024-03-15', 'Routine bloodwork', NULL),
(4, 'Primary care', '2024-03-02', 'Dizziness', NULL),
(6, 'Psychiatric', '2024-04-08', 'Crying often', NULL),
(2, 'Psychiatric', '2024-02-22', 'Anxiety attacks', NULL),
(3, 'Psychiatric', '2024-03-04', 'Restlessness', NULL),
(16, 'Primary care', '2024-04-20', 'Sore throat', NULL),
(9, 'Primary care', '2024-04-12', 'High blood pressure', NULL),
(15, 'Primary care', '2024-03-17', 'High cholesterol', NULL),
(10, 'Psychiatric', '2024-03-12', 'Anger outbursts', NULL),
(11, 'Primary care', '2024-03-13', 'Follow-up', NULL),
(1, 'Psychiatric', '2024-01-10', 'Feeling sad all the time', NULL),
(17, 'Primary care', '2024-04-21', 'Foot pain', NULL),
(9, 'Psychiatric', '2024-03-11', 'Fear of crowds', NULL),
(4, 'Psychiatric', '2024-04-06', 'Lack of energy', NULL),
(13, 'Psychiatric', '2024-04-16', 'Low energy', NULL),
(5, 'Psychiatric', '2024-03-06', 'Feeling worthless', NULL),
(3, 'Primary care', '2024-02-01', 'Breathing issues', 'Chest tightness'),
(16, 'Psychiatric', '2024-04-19', 'Generalized anxiety', NULL),
(12, 'Psychiatric', '2024-03-14', 'Panic attacks', NULL),
(2, 'Primary care', '2024-03-19', 'Cough and flu', NULL),
(6, 'Psychiatric', '2024-02-07', 'Anxious and restless', NULL),
(8, 'Psychiatric', '2024-04-11', 'Insomnia', NULL),
(3, 'Primary care', '2024-04-01', 'Diabetes check-up', NULL),
(7, 'Primary care', '2024-02-10', 'Obesity management', NULL),
(15, 'Psychiatric', '2024-02-26', 'Insomnia', NULL),
(1, 'Psychiatric', '2024-03-05', 'Mood swings', NULL),
(14, 'Primary care', '2024-04-17', 'Sleep apnea follow-up', NULL),
(8, 'Psychiatric', '2024-02-14', 'Trauma symptoms', NULL),
(9, 'Primary care', '2024-02-16', 'Asthma symptoms', 'Shortness of breath'),
(10, 'Primary care', '2024-04-13', 'Allergy symptoms', NULL),
(13, 'Psychiatric', '2024-02-24', 'Depression relapse', NULL),
(2, 'Primary care', '2024-01-12', 'Headaches and fatigue', 'High blood pressure'),
(4, 'Psychiatric', '2024-02-03', 'Difficulty sleeping', NULL),
(11, 'Psychiatric', '2024-02-21', 'Mood swings', NULL),
(15, 'Psychiatric', '2024-04-18', 'Suicidal ideation', NULL),
(7, 'Primary care', '2024-04-09', 'Fatigue', NULL),
(16, 'Primary care', '2024-03-18', 'Cough', NULL),
(17, 'Psychiatric', '2024-04-22', 'Excessive worry', NULL);

SHOW GLOBAL VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = true;

LOAD DATA LOCAL INFILE '/Users/tobechidimkpa/Downloads/diagnosislookup_final.csv' /*insert path name here*/
INTO TABLE diagnosislookup
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(dx_code, dx_name, dx_category);


INSERT INTO diagnoses (patient_id, visit_id, dx_code) VALUES
(6, 1, 'I10'),
(1, 2, 'I10'),
(8, 3, 'E66.9'),
(11, 4, 'F31.9'),
(17, 5, 'F43.10'),
(12, 6, 'I10'),
(14, 7, 'F33.1'),
(10, 8, 'G43.909'),
(7, 9, 'F41.1'),
(5, 10, 'E11.9'),
(13, 11, 'I10'),
(4, 12, 'J45.909'),
(6, 13, 'F33.1'),
(2, 14, 'F41.1'),
(3, 15, 'F41.1'),
(16, 16, 'J45.909'),
(9, 17, 'I10'),
(15, 18, 'E78.5'), -- high cholesterol, hypothetical ICD-10
(10, 19, 'F41.1'),
(11, 20, 'I10'),
(1, 21, 'F33.1'),
(17, 22, 'M79.67'), -- foot pain, hypothetical ICD-10
(9, 23, 'F40.00'), -- agoraphobia (fear of crowds)
(4, 24, 'F33.1'),
(13, 25, 'F33.1'),
(5, 26, 'F33.1'),
(3, 27, 'J45.909'),
(16, 28, 'F41.1'),
(12, 29, 'F41.1'),
(2, 30, 'J00'), -- common cold, placeholder
(6, 31, 'F41.1'),
(8, 32, 'G47.00'),
(3, 33, 'E11.9'),
(7, 34, 'E66.9'),
(15, 35, 'G47.00'),
(1, 36, 'F31.9'),
(14, 37, 'G47.33'), -- sleep apnea (placeholder ICD-10)
(8, 38, 'F43.10'),
(9, 39, 'J45.909'),
(10, 40, 'J30.9'), -- allergy unspecified
(13, 41, 'F33.1'),
(2, 42, 'I10'),
(4, 43, 'G47.00'),
(11, 44, 'F33.1'),
(15, 45, 'F33.2'), -- major depressive episode, severe
(7, 46, 'R53.83'), -- fatigue, ICD-10
(16, 47, 'J00'),
(17, 48, 'F41.1');

-- Question 1: View + join
CREATE VIEW procedure_count AS
	SELECT d.dx_name, COUNT(p.patient_id) AS procedure_cnt
	FROM diagnosislookup AS d
	INNER JOIN diagnoses AS p 
	USING (dx_code)
	GROUP BY d.dx_name
	ORDER BY procedure_cnt DESC;
#This view is meant to show the number of patients who underwent each procedure, ordered from highest to lowest
#This should be stored as a view so it can be updated if we add more data to the tables

-- Question 3: CTE 
WITH diagnosis_per_patient AS (
    SELECT patient_id, COUNT(DISTINCT dx_code) AS unique_diagnoses
    FROM diagnoses
    GROUP BY patient_id
)
SELECT i.first_name, i.last_name, dpp.unique_diagnoses
FROM diagnosis_per_patient dpp
	INNER JOIN identifiables i 
    USING (patient_id) 
WHERE unique_diagnoses > 2;
#This tells us how many diagnoses per patient
