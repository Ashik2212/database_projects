CREATE DATABASE HospitalManagement;

USE HospitalManagement;

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(100) NOT NULL,
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    registration_date DATE
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15) UNIQUE,
    consultation_fee DECIMAL(10,2),
    department_id INT,
    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id)
    REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id)
    REFERENCES Doctors(doctor_id)
);

CREATE TABLE Bills (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    appointment_id INT,
    consultation_amount DECIMAL(10,2),
    medicine_amount DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    payment_status VARCHAR(20) DEFAULT 'Pending',
    bill_date DATE,
    FOREIGN KEY (patient_id)
    REFERENCES Patients(patient_id),
    FOREIGN KEY (appointment_id)
    REFERENCES Appointments(appointment_id)
);

ALTER TABLE Patients
ADD address VARCHAR(255);

ALTER TABLE Patients
MODIFY phone VARCHAR(20);

ALTER TABLE Doctors
RENAME COLUMN specialization TO doctor_specialization;

ALTER TABLE Patients
DROP COLUMN address;

INSERT INTO Patients
VALUES
(NULL, 'Arun Kumar', 25, 'Male', '9876543210', 'arun@gmail.com', 'Kochi', '2026-11-01'),
(NULL, 'Anjali Menon', 32, 'Female', '9876543211', 'anjali@gmail.com', 'Thiruvananthapuram', '2026-11-02'),
(NULL, 'Antony Das', 45, 'Male', '9876543212', 'antony@gmail.com', 'Kollam', '2026-11-03'),
(NULL, 'Sneha Nair', 28, 'Female', '9876543213', 'sneha@gmail.com', 'Kochi', '2026-11-04'),
(NULL, 'Vishnu Raj', 55, 'Male', '9876543214', 'vishnu@gmail.com', 'Kozhikode', '2026-11-05'),
(NULL, 'Anand Krishnan', 38, 'Male', '9876543215', 'anand@gmail.com', 'Thrissur', '2026-11-06'),
(NULL, 'Meera Joseph', 22, 'Female', '9876543216', 'meera@gmail.com', 'Kochi', '2026-11-07'),
(NULL, 'Sanjay Kumar', 61, 'Male', '9876543217', 'sanjay@gmail.com', 'Thiruvananthapuram', '2026-11-08'),
(NULL, 'Divya Mohan', 35, 'Female', '9876543218', 'divya@gmail.com', 'Kollam', '2026-11-09'),
(NULL, 'Kiran Thomas', 42, 'Male', '9876543219', 'kiran@gmail.com', 'Kozhikode', '2026-11-10');

INSERT INTO Departments
VALUES
(NULL, 'Cardiology', 'Block A'),
(NULL, 'Neurology', 'Block B'),
(NULL, 'Orthopedics', 'Block C'),
(NULL, 'Dermatology', 'Block D'),
(NULL, 'Pediatrics', 'Block E');

INSERT INTO Doctors
VALUES
(NULL, 'Dr. Arun', 'Cardiologist', '9811111111', 800.00, 1),
(NULL, 'Dr. Meera', 'Neurologist', '9822222222', 900.00, 2),
(NULL, 'Dr. Joseph', 'Orthopedic Surgeon', '9833333333', 750.00, 3),
(NULL, 'Dr. Priya', 'Dermatologist', '9844444444', 600.00, 4),
(NULL, 'Dr. Kiran', 'Pediatrician', '9855555555', 500.00, 5),
(NULL, 'Dr. Anjali', 'Cardiologist', '9866666666', 850.00, 1),
(NULL, 'Dr. Vishnu', 'Neurologist', '9877777777', 700.00, 2),
(NULL, 'Dr. Sneha', 'Orthopedic Surgeon', '9888888888', 650.00, 3);

INSERT INTO Appointments
VALUES
(NULL, 1, 1, '2026-11-11', '09:00:00', DEFAULT),
(NULL, 2, 2, '2026-11-11', '10:00:00', DEFAULT),
(NULL, 3, 3, '2026-11-11', '11:00:00', 'Completed'),
(NULL, 4, 4, '2026-11-12', '09:30:00', DEFAULT),
(NULL, 5, 5, '2026-11-12', '10:30:00', DEFAULT),
(NULL, 6, 6, '2026-11-12', '11:30:00', 'Completed'),
(NULL, 7, 7, '2026-11-13', '09:00:00', DEFAULT),
(NULL, 8, 8, '2026-11-13', '10:00:00', DEFAULT),
(NULL, 9, 1, '2026-11-13', '11:00:00', 'Completed'),
(NULL, 10, 2, '2026-11-14', '09:30:00', DEFAULT),
(NULL, 1, 3, '2026-11-14', '10:30:00', DEFAULT),
(NULL, 2, 4, '2026-11-14', '11:30:00', 'Completed'),
(NULL, 3, 5, '2026-11-15', '09:00:00', DEFAULT),
(NULL, 4, 6, '2026-11-15', '10:00:00', DEFAULT),
(NULL, 5, 7, '2026-11-15', '11:00:00', DEFAULT);

INSERT INTO Bills
VALUES
(NULL, 1, 1, 800.00, 350.00, 1150.00, 'Paid', '2026-11-11'),
(NULL, 2, 2, 900.00, 450.00, 1350.00, DEFAULT, '2026-11-11'),
(NULL, 3, 3, 750.00, 200.00, 950.00, 'Paid', '2026-11-11'),
(NULL, 4, 4, 600.00, 300.00, 900.00, DEFAULT, '2026-11-12'),
(NULL, 5, 5, 500.00, 250.00, 750.00, 'Paid', '2026-11-12'),
(NULL, 6, 6, 850.00, 400.00, 1250.00, DEFAULT, '2026-11-12'),
(NULL, 7, 7, 700.00, 150.00, 850.00, 'Paid', '2026-11-13'),
(NULL, 8, 8, 650.00, 350.00, 1000.00, DEFAULT, '2026-11-13'),
(NULL, 9, 9, 800.00, 500.00, 1300.00, 'Paid', '2026-11-13'),
(NULL, 10, 10, 900.00, 300.00, 1200.00, DEFAULT, '2026-11-14');

INSERT INTO Patients
VALUES
(NULL, 'Nithya Raj', 29, 'Female', '9876543220',
 'nithya@gmail.com', 'Alappuzha', '2026-11-16');

INSERT INTO Departments
VALUES (NULL, 'ENT', 'Block F');

INSERT INTO Doctors
VALUES (NULL, 'Dr. Nikhil', 'ENT Specialist',
 '9899999999', 700.00, 6);

UPDATE Patients
SET phone = '9000000001'
WHERE patient_id = 1;

UPDATE Doctors
SET consultation_fee = 950.00
WHERE doctor_id = 1;

UPDATE Appointments
SET status = 'Completed'
WHERE appointment_id = 1;

UPDATE Bills
SET payment_status = 'Paid'
WHERE bill_id = 2;

DELETE FROM Patients
WHERE patient_id = 11;

SELECT * FROM Patients;
SELECT * FROM Departments;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Bills;

SELECT *
FROM Patients
WHERE city = 'Kochi';

SELECT *
FROM Patients
WHERE age > 50;

SELECT *
FROM Patients
WHERE patient_name LIKE 'S%';

SELECT *
FROM Patients
WHERE patient_name LIKE '%an%';

SELECT *
FROM Patients
WHERE age BETWEEN 20 AND 40;

SELECT d.*
FROM Doctors d
JOIN Departments dep
ON d.department_id = dep.department_id
WHERE dep.department_name IN ('Cardiology', 'Neurology');

SELECT *
FROM Patients
WHERE email IS NOT NULL;

SELECT *
FROM Doctors
WHERE consultation_fee > 500;

SELECT *
FROM Patients
ORDER BY registration_date DESC;

SELECT *
FROM Patients
ORDER BY registration_date DESC
LIMIT 5;

SELECT *
FROM Appointments
WHERE status = 'Scheduled';

SELECT *
FROM Bills
WHERE payment_status = 'Pending';

SELECT COUNT(*)
FROM Patients;

SELECT AVG(age)
FROM Patients;

SELECT MAX(consultation_fee)
FROM Doctors;

SELECT MIN(consultation_fee)
FROM Doctors;

SELECT SUM(total_amount)
FROM Bills
WHERE payment_status = 'Paid';

SELECT city, COUNT(*)
FROM Patients
GROUP BY city;

SELECT department_id, COUNT(*)
FROM Doctors
GROUP BY department_id;

SELECT doctor_id, COUNT(*)
FROM Appointments
GROUP BY doctor_id;

SELECT department_id, COUNT(*)
FROM Doctors
GROUP BY department_id
HAVING COUNT(*) > 2;

SELECT AVG(consultation_fee)
FROM Doctors;

SELECT p.patient_name, a.appointment_date
FROM Patients p
INNER JOIN Appointments a
ON p.patient_id = a.patient_id;

SELECT d.doctor_name, dep.department_name
FROM Doctors d
INNER JOIN Departments dep
ON d.department_id = dep.department_id;

SELECT p.patient_name, d.doctor_name, a.appointment_date
FROM Appointments a
INNER JOIN Patients p
ON a.patient_id = p.patient_id
INNER JOIN Doctors d
ON a.doctor_id = d.doctor_id;

SELECT p.patient_name, a.appointment_date
FROM Patients p
LEFT JOIN Appointments a
ON p.patient_id = a.patient_id;

SELECT dep.department_name, d.doctor_name
FROM Departments dep
LEFT JOIN Doctors d
ON dep.department_id = d.department_id;

SELECT p.patient_name, b.total_amount
FROM Patients p
INNER JOIN Bills b
ON p.patient_id = b.patient_id;

SELECT d.doctor_name, COUNT(a.appointment_id)
FROM Doctors d
LEFT JOIN Appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.doctor_name;

SELECT p.patient_name, d.doctor_name, a.status
FROM Appointments a
INNER JOIN Patients p
ON a.patient_id = p.patient_id
INNER JOIN Doctors d
ON a.doctor_id = d.doctor_id;

SELECT *
FROM Patients
WHERE age > (
    SELECT AVG(age)
    FROM Patients
);

SELECT *
FROM Doctors
WHERE consultation_fee = (
    SELECT MAX(consultation_fee)
    FROM Doctors
);

SELECT *
FROM Doctors
WHERE consultation_fee > (
    SELECT AVG(consultation_fee)
    FROM Doctors
);

SELECT DISTINCT p.*
FROM Patients p
JOIN Appointments a
ON p.patient_id = a.patient_id
JOIN Doctors d
ON a.doctor_id = d.doctor_id
WHERE d.doctor_name = 'Dr. Arun';

SELECT *
FROM Bills
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM Bills
);

SELECT doctor_id, COUNT(*) AS appointment_count
FROM Appointments
GROUP BY doctor_id
HAVING COUNT(*) > (
    SELECT AVG(appointment_count)
    FROM (
        SELECT COUNT(*) AS appointment_count
        FROM Appointments
        GROUP BY doctor_id
    ) AS appointment_counts
);

SELECT UPPER(patient_name)
FROM Patients;

SELECT LOWER(doctor_name)
FROM Doctors;

SELECT patient_name, LENGTH(patient_name)
FROM Patients;

SELECT CURRENT_DATE();

SELECT YEAR(registration_date)
FROM Patients;

SELECT patient_name, YEAR(registration_date)
FROM Patients;

SELECT doctor_name, ROUND(consultation_fee)
FROM Doctors;

SELECT LEFT(department_name, 3)
FROM Departments;

SELECT MONTH(appointment_date)
FROM Appointments;

SELECT bill_id,
       consultation_amount,
       medicine_amount,
       consultation_amount + medicine_amount AS total_amount
FROM Bills;

