
-- create new table called tbl_animalia
--- add primary key animalia_id to tbl_animalia (starting at 1, increment +1); not null
---- add animalia_type to tbl_animalia with max 50 varchar; not null
CREATE TABLE tbl_animalia(
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	animalia_type VARCHAR(50) NOT NULL
);
-- insert new values into animalia_type of tbl_animalia
INSERT INTO tbl_animalia
	(animalia_type)
	VALUES
		('vertebrate'),
		('invertebrate')
;
-- show/select ALL from table tbl_animialia
SELECT * FROM tbl_animalia;

-- create new table called tbl_class
--- add primary key class_id to tbl_class (starting at 100, increment +1); not null
---- add class_type to tbl_class with max 50 varchar; not null
CREATE TABLE tbl_class(
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100, 1),
	class_type VARCHAR(50) NOT NULL
);

-- insert new values into class_type of tbl_class
INSERT INTO tbl_class
	(class_type)
	VALUES
		('bird'),
		('reptilian'),
		('mammal'),
		('arthropod'),
		('fish'),
		('worm'),
		('cnidaria'),
		('echinoderm')
;
-- show/select ALL from table tbl_class
SELECT * FROM tbl_class;

--we want to change 'bird' to 'birds' *different than replace, this is for permanent changes
--- update table (tbl_class)
---- SET (or assign, override class_type) to 'birds'
----- WHERE (condition is) class_type is 'bird'
-- (this example has been returned to original 'bird')
UPDATE tbl_class SET class_type = 'bird' WHERE class_type = 'birds';

-- REPLACE() built in method is temporary, that's why it's a SELECT statement
--- Do not confuse with the update method above, this is temporary
SELECT REPLACE(class_type,'bird', 'birds') from tbl_class;

-- show just 'bird'
--- select class_type from tbl_class WHERE the condition is class_type='bird'
---- added UPPER for uppercase 'BIRD', and parentheses around class_type
---- LOWER can be used also, COUNT will get the rows count (for now this is just 1 in this example)
SELECT UPPER(class_type) FROM tbl_class WHERE class_type = 'bird';

-- create a table to hold primary key, persons first and last name, and contact
CREATE TABLE tbl_persons(
	persons_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL
);

-- insert values into tbl_persons
INSERT INTO tbl_persons
	(persons_fname, persons_lname, persons_contact)
	VALUES
		('bob', 'smith', '202-303-4040'),
		('tony', 'bongiovanni', '897-456-3463'),
		('betty', 'jones', '654-426-7843'),
		('victoria', 'lady', '456-654-3755'),
		('grue', 'flue', '777-555-4444')
;

-- I want to update a last name
UPDATE tbl_persons SET persons_lname = 'grifith' WHERE persons_lname = 'flue';

-- show new table
SELECT * FROM tbl_persons;

-- now we want to select wildcards...
SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_id BETWEEN 3 AND 5;

-- LIKE % - built in SQL operators: looking for a last name that starts with 'ke' (in this example)
SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE 'bo%';
-- example with multiple results
SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE '%th';