# CREATING DATABASE AS Hospitalsystem
create database Hospitalsystem
use Hospitalsystem;

# CREATING TABLE NAME AS patient
CREATE TABLE patient 
(
email varchar(50) PRIMARY KEY,
password varchar(30) NOT NULL,
name varchar(50) NOT NULL,
address varchar(60) NOT NULL,
gender VARCHAR(20) NOT NULL
);

# SHOWING ALL COLUMNS PRESENT IN TABLE OF patient
SELECT * FROM patient;

# INSERTING VALUES IN TABLE OF patient
INSERT INTO patient (email,password,name,address,gender)
VALUES ('rae@gmail.com','Abcd123','Emily','New York','female'),
('rae_1@gmail.com','Abcd124','Michael','Paris','male'),
('rae_2@gmail.com','Abcd125','Olivia','Tokyo','female'),
('rae_3@gmail.com','Abcd126','Ethan','Sydney','male'),
('rae_4@gmail.com','Abcd127','Isabella','Rio de Janeiro','female'),
('rae_5@gmail.com','Abcd128','Benjamin','Moscow','male'),
('rae_6@gmail.com','Abcd129','Sophia','Rome','female'),
('rae_7@gmail.com','Abcd130','Matthew','Toronto','male'),
('rae_8@gmail.com','Abcd131','Abigail','Berlin','female'),
('rae_9@gmail.com','Abcd132','Joshua','Bangkok','male');

# SHOWING ALL VALUES PRESENT IN TABLE OF patient
SELECT * FROM patient;

# CREATING TABLE NAME AS medical history
CREATE TABLE medicalhistory
(
id int PRIMARY KEY,
date DATE NOT NULL,
conditions VARCHAR(100) NOT NULL,
surgeries VARCHAR(100) NOT NULL,
medication VARCHAR(100) NOT NULL
);

# SHOWING ALL COLUMNS PRESENT IN TABLE OF medicalhistory
SELECT * FROM medicalhistory;

# INSERTING VALUES IN TABLE OF medicalhistory
INSERT INTO medicalhistory (id,date,conditions,surgeries,medication)
VALUES (1,'23-01-01','Diabetes','none','Aspirin'),
(2,'22-02-02','Asthma','none','Ibuprofen'),
(3,'21-03-03','High blood pressure','none','Acetaminophen'),
(4,'20-04-04','Cancer','none','Metformin'),
(5,'19-05-05','Depression','none','Lipitor (atorvastatin)'),
(6,'18-06-06','Heart disease','none','Amoxicillin'),
(7,'17-07-07','Arthritis','none','Alprazolam'),
(8,'16-08-08','Chronic obstructive pulmonary disease(COPD)','none','Lisinopril'),
(9,'15-09-09','Kidney disease','none','Omeprazole'),
(10,'14-10-10','HIV/AIDS','none','Alprazolam');

# SHOWING ALL VALUES PRESENT IN TABLE OF medicalhistory
SELECT * FROM medicalhistory;

# CREATING TABLE NAME AS doctor
CREATE TABLE doctor
(
Email VARCHAR(500) primary key,
Gender varchar(20) NOT NULL,
Password varchar(30) NOT NULL,
name varchar(50) NOT NULL
);

# SHOWING ALL COLUMNS PRESENT IN TABLE OF doctor
SELECT * FROM doctor;

# INSERTING VALUES IN TABLE OF doctor
INSERT INTO doctor (email,gender,password,name)
VALUES ('rak_@gmail.com','female','R123','Emma'),
('rak_1@gmail.com','male','R124','Ethan'),
('rak_2@gmail.com','male','R125','Noah'),
('rak_3@gmail.com','male','R126','Aiden'),
('rak_4@gmail.com','male','R127','Jacob'),
('rak_5@gmail.com','female','R128','jasmin'),
('rak_6@gmail.com','female','R129','Sophia'),
('rak_7@gmail.com','female','R130','Eiya'),
('rak_8@gmail.com','female','R131','Abia'),
('rak_9@gmail.com','male','R132','shua');

# SHOWING ALL VALUES PRESENT IN TABLE OF doctor
SELECT * FROM doctor;

# CREATING TABLE NAME AS appointment
CREATE TABLE appointment
(
id int PRIMARY KEY,
date DATE NOT NULL,
starttime TIME NOT NULL,
endtime TIME NOT NULL
);

# SHOWING ALL COLUMNS PRESENT IN TABLE OF appointment
SELECT * FROM appointment;

# INSERTING VALUES IN TABLE OF appointment
INSERT INTO appointment (id,date,starttime,endtime)
VALUES (1,'23-01-01','01:00','02:00'),    
(2,'23-01-01','02:00','03:00'),  
(3,'23-01-01','04:00','05:00'),  
(4,'23-01-01','06:00','07:00'),  
(5,'23-01-01','08:00','09:00'),  
(6,'23-01-01','03:00','04:00'),  
(7,'23-01-01','05:00','06:00'),  
(8,'23-01-01','07:00','08:00'),  
(9,'23-01-01','04:00','06:00'),  
(10,'23-01-01','05:00','07:00');

# SHOWING ALL VALUES PRESENT IN TABLE OF appointment
SELECT * FROM appointment;

# CREATING TABLE NAME AS diagnose
CREATE TABLE diagnose
(
appt int NOT NULL,
doctor varchar(50) NOT NULL,
diagnosis varchar(40) NOT NULL,
prescription varchar(50) NOT NULL,
FOREIGN KEY (appt)
REFERENCES Appointment (id)
ON DELETE CASCADE,
FOREIGN KEY (doctor)
REFERENCES Doctor (email)
ON DELETE CASCADE,
PRIMARY KEY (appt, doctor)
);

# SHOWING ALL COLUMNS PRESENT IN TABLE OF diagnose
SELECT * FROM diagnose;

# INSERTING VALUES IN TABLE OF diagnose
INSERT INTO diagnose (appt,doctor,diagnosis,prescription)
VALUES (1,'rak_@gmail.com','Diabetes','Balanced diet'),
(2,'rak_1@gmail.com','Hypertension','Plant based'),
(3,'rak_2@gmail.com','Asthma','Vegetable rich diet'),
(4,'rak_3@gmail.com','Cancer','Lean protiens'),
(5,'rak_4@gmail.com','Depression','Whole foods'),
(6,'rak_5@gmail.com','Tyroid disorder','Hydration focus'),
(7,'rak_6@gmail.com','Influenza','No alcohol'),
(8,'rak_7@gmail.com','Pneumonia','No processed'),
(9,'rak_8@gmail.com','Sinusitis','Low carb'),
(10,'rak_9@gmail.com','Bronchitis','High fibre');

# SHOWING ALL VALUES PRESENT IN TABLE OF diagnose
SELECT * FROM diagnose;

############### QUERIES WITH SOLUTION ###############

# query 1: Fetch total number of patients from PATIENT Table whose gender is ‘MALE’.
SELECT COUNT(*) FROM patient WHERE gender = 'male';

# query 2: Fetch address,total number of patients from PATIENT Table address-wise.
SELECT address, COUNT(*) FROM patient GROUP BY address;

# query 3: Fetch the ID from Medical History Table where no surgeries performed.
SELECT id FROM medicalhistory WHERE surgeries = 'none';

# query 4: Fetch the gender & show total number of male and female doctors from DOCTOR Table.
SELECT gender, COUNT(*) FROM doctor GROUP BY gender;

# query 5: Fetch name from PATIENT Table & Surgery from MEDICAL HISTORY Table where Surgery is ‘None’.
SELECT patient.name, medicalhistory.surgeries 
FROM patient, medicalhistory
WHERE medicalhistory.surgeries = 'none';

# query 6: Fetch the Name from PATIENT Table & Condition from MEDICAL HISTORY Table and give all the matching records.
SELECT patient.name, medicalhistory.conditions 
FROM patient, medicalhistory;

# query 7: Fetch Name, Address from PATIENT Table and Condition from MEDICAL HISTORY who haven’t undergo any surgery.
SELECT patient.name, patient.address, medicalhistory.conditions, medicalhistory.surgeries 
FROM patient, medicalhistory 
WHERE medicalhistory.surgeries = 'none';

# query 8: Fetch all the records from APPOINTMENT and DIAGNOSIS Table (identify which join would be relevant)
SELECT * 
FROM appointment
NATURAL JOIN diagnose; 

/*The join that would be relevant in this scenario is an natural join. This join would combine the records from both the APPOINTMENT and DIAGNOSIS tables.*/

# que 9: Explain any 2 insights you generated from the data. (what did you get to know or what did you found out after analyzing the data or performing queries).

/*[Insight 1]: A Hospital Management System (HMS) can improve the overall efficiency and 
organization of a hospital by providing a central location for storing and accessing patient 
information, scheduling appointments, and tracking patient progress.*/

/*[Insight 2]: By utilizing a HMS with multiple tables and relationships, a hospital can ensure that data 
is properly organized and protected, while also allowing for easy access and retrieval of information for both patients and staff.*/

# que 10: What is the main goal of creating a Hospital Management System?

/*[1] The main goal of creating a Hospital Management System is to improve the efficiency and 
organization of the hospital's operations by providing a centralized location for storing and accessing 
patient information, scheduling appointments, and tracking patient progress. 

[2] The system also allows for better communication and coordination between different departments, physicians, and staff 
members, which can ultimately lead to better patient care and outcomes. 

[3] Additionally, it helps to streamline administrative and financial processes, and can also provide valuable data and insights for hospital management.

[4] The project primary aims to improve the speed and efficiency of patient service and hospital operations through computerization.

[5] The hospital billing system allows for quick access to patient information and streamlines processes for both patients and staff.*/

############### THE END ############ 








