CREATE TABLE emp(
    eid INT PRIMARY KEY,
    ename VARCHAR(50) NOT NULL,
    sal DECIMAL(10,2)
    );

CREATE TABLE dept(
    did INT PRIMARY KEY,
    dname VARCHAR(50) UNIQUE NOT NULL,
    location VARCHAR(50));

CREATE TABLE manages(
    did INT,eid INT,
    day DATE,PRIMARY KEY(did,eid,day),
    FOREIGN KEY(did) REFERENCES dept(did),
    FOREIGN KEY(eid) REFERENCES emp(eid)
);

ALTER TABLE emp ADD CONSTRAINT uq_ename UNIQUE(ename);

INSERT INTO emp VALUES(1,'A',50000),(2,'B',60000);
INSERT INTO dept VALUES(10,'HR','Delhi'),(20,'IT','Mumbai');
INSERT INTO manages VALUES(10,1,'2025-08-20'),(20,2,'2025-08-21');

CREATE VIEW emp_dept AS
SELECT e.eid,e.ename,e.sal,d.dname,d.location,m.day
FROM emp e JOIN manages m ON e.eid=m.eid
JOIN dept d ON m.did=d.did;