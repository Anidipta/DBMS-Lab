CREATE TABLE Professor (
    SSN CHAR(9) PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Ra VARCHAR(20)
);

INSERT INTO Professor VALUES
('P11111111','Dr. Smith',50,'Professor'),
('P22222222','Dr. Johnson',45,'Associate');

CREATE TABLE Project (
    ProjectNo INT PRIMARY KEY,
    SponsorName VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(12,2)
);

INSERT INTO Project VALUES
(101,'NASA','2025-01-01','2025-12-31',50000),
(102,'NSF','2025-02-01','2025-11-30',30000);

CREATE TABLE Graduate_Student (
    SSN CHAR(9) PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Degree VARCHAR(30)
);

INSERT INTO Graduate_Student VALUES
('G11111111','Alice',24,'MS'),
('G22222222','Bob',26,'PhD'),
('G33333333','Charlie',25,'MS');

CREATE TABLE Supervises (
    SSN CHAR(9),
    ProjectNo INT PRIMARY KEY,
    FOREIGN KEY (SSN) REFERENCES Professor(SSN) ON DELETE CASCADE,
    FOREIGN KEY (ProjectNo) REFERENCES Project(ProjectNo) ON DELETE CASCADE
);

INSERT INTO Supervises VALUES
('P11111111',101),
('P22222222',102);

CREATE TABLE Works_On (
    GradSSN CHAR(9),
    ProjectNo INT,
    Hours INT,
    PRIMARY KEY (GradSSN, ProjectNo),
    FOREIGN KEY (GradSSN) REFERENCES Graduate_Student(SSN) ON DELETE CASCADE,
    FOREIGN KEY (ProjectNo) REFERENCES Project(ProjectNo) ON DELETE CASCADE
);

INSERT INTO Works_On VALUES
('G11111111',101,10),
('G22222222',101,15),
('G33333333',102,20);

SELECT g.Name, g.SSN, w.ProjectNo, w.Hours
FROM Graduate_Student g
JOIN Works_On w ON g.SSN = w.GradSSN;

SELECT p.Name AS ProfessorName, pr.ProjectNo, pr.SponsorName, pr.Budget
FROM Professor p
JOIN Supervises s ON p.SSN = s.SSN
JOIN Project pr ON s.ProjectNo = pr.ProjectNo;

DELIMITER //
CREATE TRIGGER UpdateBudget
AFTER INSERT ON Works_On
FOR EACH ROW
BEGIN
    UPDATE Project
    SET Budget = Budget + 1000
    WHERE ProjectNo = NEW.ProjectNo;
END;
//
DELIMITER ;

INSERT INTO Works_On VALUES ('G33333333',101,8);

select * from project;