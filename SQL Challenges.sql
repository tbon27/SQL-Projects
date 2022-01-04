
USE AdventureWorks2017

-- SQL SELECT DISTINCT CHALLENGE
SELECT DISTINCT FirstName
FROM Person.person
ORDER BY FirstName
;

-- SQL SELECT TOP CHALLENGE
SELECT TOP 3 * FROM Production.Product;

-- SQL MIN/MAX CHALLENGE
SELECT MIN(StandardCost)
FROM Production.ProductCostHistory
SELECT MAX(StandardCost)
FROM Production.ProductCostHistory

-- SQL LIKE CHALLENGE W/ wildcard
SELECT * FROM Sales.CreditCard
WHERE CardType LIKE 'sup%';

-- SQL BETWEEN Challenge
SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice BETWEEN 100 AND 400;

-- SCHOOL ASSIGNMENT

CREATE DATABASE SchoolDB
GO

USE SchoolDB

CREATE TABLE Classes(
	Class_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Class_Name VARCHAR(50) NOT NULL
);
SELECT * FROM Classes;

CREATE TABLE Students(
	Student_ID INT PRIMARY KEY NOT NULL IDENTITY (100, 1),
	Student_Name VARCHAR(50) NOT NULL
);
SELECT * FROM Students;

CREATE TABLE Instructors(
	Instructor_ID INT PRIMARY KEY NOT NULL IDENTITY (100, 1),
	Instructor_Name VARCHAR(50) NOT NULL
);
SELECT * FROM Instructors;

ALTER TABLE Students
ADD Class_ID INT;

ALTER TABLE Students
ADD Instructor_ID INT;

ALTER TABLE Students
ADD FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID);
ALTER TABLE Students
ADD FOREIGN KEY (Instructor_ID) REFERENCES Instructors(Instructor_ID);

INSERT INTO Classes
(Class_Name)
VALUES
	('Software Developer Boot Camp'), 
	('C# Boot Camp')
;

INSERT INTO Students
(Student_Name)
VALUES
	('Tim Jones'),
	('Bobby McCoy'),
	('Tricia Langston'),
	('Frannie Olreud'),
	('Mark Cho'),
	('Everett King')
;

INSERT INTO Instructors
(Instructor_Name)
VALUES
	('Gil Faison'),
	('Jill Johansen')
;

UPDATE Students
SET Class_ID = '1'
WHERE Student_ID <= 102;

UPDATE Students
SET Class_ID = '2'
WHERE Student_ID > 102;

UPDATE Students
SET Instructor_ID = 100
WHERE Student_ID <= 102;

UPDATE Students
SET Instructor_ID = 101
WHERE Student_ID > 102;

SELECT * FROM Instructors;

SELECT * FROM Students
ORDER BY Student_Name;

SELECT Class_Name, Students.Student_Name
FROM Classes
INNER JOIN Students ON Students.Class_ID = Classes.Class_ID