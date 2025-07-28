CREATE TABLE Student (
    sid INT PRIMARY KEY,
    sname VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);

CREATE TABLE Course (
    cid INT PRIMARY KEY,
    cname VARCHAR(100) NOT NULL,
    fee DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Enrolled (
    cid INT,
    sid INT,
    doj DATE NOT NULL,
    FOREIGN KEY (cid) REFERENCES Course(cid),
    FOREIGN KEY (sid) REFERENCES Student(sid)
);

INSERT INTO Student VALUES 
(101, 'Riya Sharma', 'Delhi'),
(102, 'Amit Verma', 'Mumbai'),
(103, 'Sneha Roy', 'Kolkata');

INSERT INTO Course VALUES 
(1, 'Mathematics', 5000),
(2, 'Computer Science', 7000),
(3, 'Physics', 6000);

INSERT INTO Enrolled VALUES 
(1, 101, TO_DATE('2025-07-01', 'YYYY-MM-DD')),
(2, 102, TO_DATE('2025-07-10', 'YYYY-MM-DD')),
(3, 103, TO_DATE('2025-06-20', 'YYYY-MM-DD')),
(2, 103, TO_DATE('2025-07-15', 'YYYY-MM-DD'));

SELECT * FROM Student;

SELECT DISTINCT c.cid, c.cname
FROM Course c
JOIN Enrolled e ON c.cid = e.cid;

SELECT s.sid, s.sname, c.cname, e.doj
FROM Student s
JOIN Enrolled e ON s.sid = e.sid
JOIN Course c ON c.cid = e.cid;

SELECT DISTINCT s.sid, s.sname, e.doj
FROM Student s
JOIN Enrolled e ON s.sid = e.sid
WHERE e.doj > TO_DATE('2025-07-01', 'YYYY-MM-DD');

SELECT c.cname, COUNT(e.sid) AS num_students
FROM Course c
LEFT JOIN Enrolled e ON c.cid = e.cid
GROUP BY c.cname;

SELECT c.cname, COUNT(e.sid) AS total_enrolled, SUM(c.fee) AS total_fee_collected
FROM Course c
JOIN Enrolled e ON c.cid = e.cid
GROUP BY c.cname;

SELECT s.sid, s.sname, c.cname, c.fee
FROM Student s
JOIN Enrolled e ON s.sid = e.sid
JOIN Course c ON e.cid = c.cid;
