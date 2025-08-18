CREATE TABLE emp (
    eid INT PRIMARY KEY,
    ename VARCHAR(50) NOT NULL UNIQUE,
    sal DECIMAL(10,2) NOT NULL CHECK (sal > 0)
);

CREATE TABLE dept (
    did INT PRIMARY KEY,
    dname VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) NOT NULL
);

CREATE TABLE manages (
    did INT,
    eid INT,
    day DATE NOT NULL,
    PRIMARY KEY (did, eid),
    FOREIGN KEY (did) REFERENCES dept(did) ON DELETE CASCADE,
    FOREIGN KEY (eid) REFERENCES emp(eid) ON DELETE CASCADE
);

ALTER TABLE emp ADD CONSTRAINT unique_emp_name UNIQUE(ename);
ALTER TABLE emp ALTER COLUMN sal SET NOT NULL;

INSERT INTO emp (eid, ename, sal) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 55000);

INSERT INTO dept (did, dname, location) VALUES
(101, 'Research', 'Delhi'),
(102, 'HR', 'Mumbai'),
(103, 'IT', 'Bangalore');

INSERT INTO manages (did, eid, day) VALUES
(101, 1, '2025-01-01'),
(102, 2, '2025-02-01'),
(103, 3, '2025-03-01');

CREATE VIEW emp_dept_manager AS
SELECT e.eid, e.ename, d.did, d.dname, d.location, m.day
FROM emp e
JOIN manages m ON e.eid = m.eid
JOIN dept d ON d.did = m.did;