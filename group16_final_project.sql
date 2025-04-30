CREATE SCHEMA empower;
USE empower;

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
#This view is meant to show the number of patients who underwent each procedure, ordered from highest to lowest.
#This should be stored as a view so it can be updated if we add more data to the tables.

-- Question 2: Temporary table that incorporates at least one join and then queries it (must be different from view)
CREATE TEMPORARY TABLE dx_gender AS 
(
	SELECT id.gender , vi.visit_type , vi.primary_complaint
    	FROM identifiables AS id 
	INNER JOIN visits AS vi
	USING (patient_id)
); 

SELECT gender, visit_type , COUNT(*) AS count_visits
FROM dx_gender
GROUP BY gender, visit_type
ORDER BY count_visits ,visit_type;

#This temporary table displays the number of primary and psych visits by gender to view differences in the patient population.  
	
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

#This CTE tells us how many diagnoses there are per patient. 

-- Question 4: Pivoting 
SELECT patient_id, 
    MAX(CASE WHEN visit_type = 'Psychiatric' AND row_num = 1 THEN primary_complaint END) AS psych_complaint_1,
    MAX(CASE WHEN visit_type = 'Psychiatric' AND row_num = 2 THEN primary_complaint END) AS psych_complaint_2,
    MAX(CASE WHEN visit_type = 'Primary care' AND row_num = 1 THEN primary_complaint END) AS pcp_complaint_1,
    MAX(CASE WHEN visit_type = 'Primary care' AND row_num = 2 THEN primary_complaint END) AS pcp_complaint_2
FROM (
    SELECT patient_id, visit_type, primary_complaint,
           ROW_NUMBER() OVER (PARTITION BY patient_id, visit_type ORDER BY visit_date) AS row_num
    FROM visits
) AS subquery
GROUP BY patient_id;

# This pivots the table from long to wide to display psychiatric and primary care complaints per patient. 
#We can compare complaints for psychiatric and primary care for each patient (i.e, within patient characteristics to view differences in complaints at each visit). 
	
-- Question 5: Self-Join 
#This query displays patients who have visited on the same day as another patient: Name and Visit Type
	
SELECT i.first_name AS patient_a, i2.first_name AS patient_b, v.visit_type AS vtype_a, b.visit_type AS vtype_b, 
					v.visit_date
FROM visits as v
	INNER JOIN visits AS b
    USING (visit_date)
    INNER JOIN identifiables AS i
    ON v.patient_id = i.patient_id
	INNER JOIN identifiables AS i2
    ON b.patient_id = i2.patient_id
WHERE v.patient_id <  b.patient_id;

-- Question 6: Subquery (accounts for ties)

SELECT first_name, last_name
FROM (
    SELECT id.first_name, id.last_name, 
    RANK() OVER(ORDER BY COUNT(*) DESC) AS rnk
    FROM diagnoses d
    INNER JOIN identifiables id on id.patient_id = d.patient_id
    WHERE d.dx_code IN (
		SELECT dx_code
        	FROM diagnosislookup
        	WHERE dx_name LIKE '%sleep apnea%'
		OR dx_category LIKE '%sleep apnea%'
)
GROUP BY d.patient_id
) AS ranked 
WHERE rnk = 1; 

# This query shows the patient with the highest number of diagnoses for sleep apnea.  

-- Question 7: Union    
SELECT primary_complaint AS complaint
FROM visits

UNION

SELECT other_complaint
FROM visits
WHERE other_complaint IS NOT NULL;

#This gives a full list of unique complaints reported in the visits table. We use the UNION operator since we do not want duplicate rows for a table displaying unique complaints.  

-- Question 8: Adds an aggregated value with OVER or PARTITION
WITH diagnosis_counts AS (
    SELECT v.visit_type, d.patient_id, COUNT(d.diagnosis_id) AS diagnosis_count
    FROM diagnoses d
    INNER JOIN visits v 
    ON d.visit_id = v.visit_id
 GROUP BY v.visit_type, d.patient_id
)

SELECT dc.visit_type, dc.patient_id, dc.diagnosis_count,AVG(dc.diagnosis_count) OVER (PARTITION BY dc.visit_type) AS avg_diagnosis_count,
    CASE 
	WHEN dc.diagnosis_count > AVG(dc.diagnosis_count) OVER (PARTITION BY dc.visit_type) THEN 'Above Average'
        WHEN dc.diagnosis_count < AVG(dc.diagnosis_count) OVER (PARTITION BY dc.visit_type) THEN 'Below Average'
        ELSE 'Average'
    END AS comparison_to_average
FROM diagnosis_counts dc
ORDER BY dc.visit_type, dc.patient_id;

#This query compares each patient diagnosis count with the average diagnosis count for their visit type (Psychiatric or Primary Care). 
#We used OVER(PARTITION BY) to calculate separate averages for each visit type to compare patients to others within the same category.  
	
-- Question 9 

#This query aims to rank the diagnoses per visit type and see the top 2 for each category. For this query, we dense ranked to account for ties. 
	
WITH ranked_diagnoses AS (
    SELECT v.visit_type, dl.dx_name, COUNT(d.diagnosis_id) AS diagnosis_count,
        DENSE_RANK() OVER (PARTITION BY v.visit_type ORDER BY COUNT(d.diagnosis_id) DESC) AS rank_type
    FROM diagnoses d
		INNER JOIN visits v 
        ON d.visit_id = v.visit_id
		INNER JOIN diagnosislookup dl 
        ON d.dx_code = dl.dx_code
    GROUP BY v.visit_type, dl.dx_name
)
SELECT visit_type, dx_name, diagnosis_count, rank_type
FROM ranked_diagnoses
WHERE rank_type <= 2
ORDER BY visit_type, rank_type;

-- Question 10: Question of our choice 
	
WITH patient_ages AS (
    SELECT i.patient_id,TIMESTAMPDIFF(YEAR, i.patient_dob, CURDATE()) AS age
    FROM identifiables AS i
),
age_grouped_visits AS (
    SELECT 
        CASE 
	    WHEN pa.age < 18 THEN 'Under 18'
            WHEN pa.age BETWEEN 18 AND 29 THEN '18-29'
            WHEN pa.age BETWEEN 30 AND 44 THEN '30-44'
            WHEN pa.age BETWEEN 45 AND 64 THEN '45-64'
            ELSE '65+'
        END AS age_group, v.visit_type
    FROM patient_ages AS pa
    INNER JOIN visits AS v 
    USING (patient_id)
)
SELECT age_group,visit_type,COUNT(*) AS visit_count
FROM age_grouped_visits
GROUP BY age_group, visit_type
ORDER BY FIELD(age_group, 'Under 18', '18-29', '30-44', '45-64', '65+'), visit_type;

# This query displays the age group and visit count per age group for both psychiatric and primary care visits 
#/*'18-29','Psychiatric','3'
#'18-29','Primary care','3'
#'30-44','Psychiatric','17'
#'30-44','Primary care','15'
#'45-64','Psychiatric','5'
#'45-64','Primary care','5' #/

