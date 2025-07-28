CREATE TABLE student (
    enrollment_No VARCHAR(20) PRIMARY KEY,
    collegeRoll_No VARCHAR(20) UNIQUE,
    student_Name VARCHAR(100),
    phone_No VARCHAR(15),
    address VARCHAR(255),
    bg VARCHAR(5)
);

select * from student;

INSERT INTO student VALUES
('ENR001', 'CR001', 'Anuj Sharma', '9876543210', '123 Park Street, Delhi', 'A+'),
('ENR002', 'CR002', 'Riya Verma', '9123456780', '56 MG Road, Mumbai', 'B+'),
('ENR003', 'CR003', 'Tanmay Rao', '9988776655', '88 Ring Road, Bangalore', 'O+'),
('ENR004', 'CR004', 'Sneha Kapoor', '9786543210', '21 Lakeview, Kolkata', 'AB+'),
('ENR005', 'CR005', 'Amit Das', '9678901234', '10 Salt Lake, Kolkata', 'A-'),
('ENR006', 'CR006', 'Neha Singh', '9345678123', '5 Ashok Nagar, Patna', 'B-'),
('ENR007', 'CR007', 'Karan Mehta', '9234567890', '4 Civil Lines, Kanpur', 'O-'),
('ENR008', 'CR008', 'Divya Jain', '9012345678', '77 Connaught Place, Delhi', 'AB-');

select phone_No, bg from student;

ALTER TABLE student ADD State VARCHAR(50);
ALTER TABLE student ADD Country VARCHAR(50);
ALTER TABLE student ADD Branch VARCHAR(50);

SELECT Enrollment_No, Student_Name, Branch FROM Student WHERE Enrollment_No BETWEEN 'ENR003' AND 'ENR006';

UPDATE Student SET Branch = 'Electrical', State = 'Maharashtra', Country = 'India' WHERE Enrollment_No IN ('ENR002', 'ENR005');

ALTER TABLE Student DROP COLUMN Phone_No;

ALTER TABLE Student RENAME COLUMN Address TO Full_Address;

SELECT * FROM Student WHERE Student_Name LIKE 'A%';

SELECT * FROM Student WHERE Student_Name LIKE '%an%';

SELECT Student_Name, Branch FROM Student WHERE Branch IN ('Computer Science', 'Electrical');