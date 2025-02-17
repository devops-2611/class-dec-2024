CREATE DATABASE IF NOT EXISTS hospital;

USE hospital;

CREATE TABLE IF NOT EXISTS attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doctor_name VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    status VARCHAR(50) NOT NULL
);

INSERT INTO attendance (doctor_name, date, status) VALUES
('Dr. Smith', '2023-10-01', 'Present'),
('Dr. Johnson', '2023-10-01', 'Absent'),
('Dr. Williams', '2023-10-01', 'Present');