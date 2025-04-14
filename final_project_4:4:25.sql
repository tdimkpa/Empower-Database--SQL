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
  gender TINYINT UNSIGNED,
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

CREATE TABLE diagnoses (
	PRIMARY KEY (diagnosis_id), 
    diagnosis_id MEDIUMINT UNSIGNED AUTO_INCREMENT, 
    patient_id SMALLINT UNSIGNED, 
    visit_id MEDIUMINT UNSIGNED,
    dx_code VARCHAR(10),
    FOREIGN KEY (patient_id) REFERENCES identifiables(patient_id),
    FOREIGN KEY (visit_id) REFERENCES visits(visit_id),
    FOREIGN KEY ( dx_code) REFERENCES diagnosislookup (dx_code)
    );

CREATE TABLE diagnosislookup (
	PRIMARY KEY (dx_id), 
    dx_id MEDIUMINT UNSIGNED AUTO_INCREMENT, 
    dx_name VARCHAR(200),
    dx_code VARCHAR(10),
	dx_category VARCHAR(50)
  );

