CREATE TABLE Supplier ( 
  Supplier_ID INT PRIMARY KEY, 
  Supplier_Name VARCHAR(60), 
  Supplier_City VARCHAR(40) 
);

CREATE TABLE Part ( 
  Part_ID VARCHAR(20) PRIMARY KEY, 
  Part_Name VARCHAR(60) 
);

CREATE TABLE Projects ( 
  Project_ID VARCHAR(20) PRIMARY KEY, 
  Project_Name VARCHAR(60), 
  Client_Name VARCHAR(60) 
);

CREATE TABLE Supply_Detail ( 
  Supplier_ID INT, 
  Part_ID VARCHAR(20), 
  Project_ID VARCHAR(20), 
  Quantity INT, 
  PRIMARY KEY (Supplier_ID, Part_ID, Project_ID), 
  FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID), 
  FOREIGN KEY (Part_ID) REFERENCES Part(Part_ID), 
  FOREIGN KEY (Project_ID) REFERENCES Projects(Project_ID) 
);

INSERT INTO Supplier VALUES 
(1,'ABC Supplies','New York'),
(2,'Global Parts','Chicago');

INSERT INTO Part VALUES 
('P1','Bolts'),
('P2','Nuts');

INSERT INTO Projects VALUES 
('PR1','Bridge Construction','CityGov'),
('PR2','Road Repair','StateDept');

INSERT INTO Supply_Detail VALUES 
(1,'P1','PR1',100),
(1,'P2','PR2',200),
(2,'P1','PR2',150);

SELECT Supplier_ID, Supplier_Name, Supplier_City 
FROM Supplier;

SELECT DISTINCT Part_ID, Part_Name 
FROM Part;

SELECT DISTINCT Project_ID, Project_Name 
FROM Projects;

SELECT s.Supplier_City, SUM(sd.Quantity) AS Total_Units 
FROM Supply_Detail sd 
JOIN Supplier s ON sd.Supplier_ID = s.Supplier_ID 
GROUP BY s.Supplier_City;
