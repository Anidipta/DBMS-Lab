CREATE TABLE student (
    enrollment_No VARCHAR(20) PRIMARY KEY,
    collegeRoll_No VARCHAR(20) UNIQUE,
    student_Name VARCHAR(100),
    phone_No VARCHAR(15),
    address VARCHAR(255),
    bg VARCHAR(5)
);

select * from student;