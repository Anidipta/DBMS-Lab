drop table supplies;
drop table parts;
drop table catalog;

-- (i) Create TABLE Suppliers
CREATE TABLE Supplies(
   S_id INT PRIMARY KEY,
   Sname VARCHAR(50) NOT NULL,
   Address VARCHAR(100) UNIQUE
);

-- (ii) Create TABLE Parts
CREATE TABLE Parts(
   Pid INT PRIMARY KEY,
   Pname VARCHAR(50) NOT NULL,
   Color VARCHAR(20)
);

CREATE TABLE Catalog (
    S_id INT,   Pid INT,
    Cost DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (S_id, Pid),
    FOREIGN KEY (S_id) REFERENCES Supplies(S_id),
    FOREIGN KEY (Pid) REFERENCES Parts(Pid)
);
-- (iii) Populate the DataBase with Amazon data (Electronic Goods)
INSERT INTO Supplies VALUES
(1,'AmazonBasics','Seattle, USA'),
(2,'Samsung Electronics','Suwon, South Korea'),
(3,'Sony Corp','Tokyo, Japan'),
(4,'Apple Inc','Cupertino, USA');

INSERT INTO Parts VALUES
(101,'Wireless Mouse','White'),
(102,'Bluetooth Headphones','White'),
(103,'Smartphone','White'),
(104,'Laptop Charger','White');

INSERT INTO Catalog VALUES
(1, 101, 15000),(2, 101, 14500),
(3, 101, 15200),(4, 101, 14800),
(1, 102, 55000),(2, 102, 54000),
(3, 102, 56000),(1, 103, 3000),
(2, 103, 2800),(3, 103, 2900),
(4, 103, 3100),(2, 104, 12000),
(3, 104, 11800),(4, 104, 12200);

-- (iv) Queries for MAX, MIN, AVG cost for specific products
SELECT 
    P.Pid, P.Pname, S.Sname, 
    MAX(C.cost) AS MaxCost,
    MIN(C.cost) AS MinCost,
    AVG(C.cost) AS AvgCost
FROM Catalog C 
JOIN Parts P ON C.Pid = P.Pid 
JOIN Supplies S ON C.Sid = S.Sid
WHERE P.Pid = 103 GROUP BY P.Pid, P.Pname, S.Sname;

-- (v) Get all suppliers and parts filtered by color
SELECT S.Sname,P.Pname,P.Color
FROM Supplies S JOIN Catalog C ON S.Sid=C.Sid
JOIN Parts P ON C.Pid=P.Pid WHERE P.Color='White';

-- (vi) List all parts with their suppliers’ address for dispatch
SELECT P.Pname,S.Address
FROM Parts P JOIN Catalog C ON P.Pid=C.Pid
JOIN Supplies S ON C.Sid=S.Sid;

-- (vii) Find the cheapest supplier for each part
SELECT P.Pname,S.Sname,C.cost
FROM Catalog C JOIN Supplies S ON C.Sid=S.Sid JOIN Parts P ON C.Pid=P.Pid
WHERE C.cost = (SELECT MIN(C2.cost) FROM Catalog C2 WHERE C2.Pid=C.Pid);
