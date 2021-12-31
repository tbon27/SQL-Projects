
PRINT 'Hello World!'

DECLARE @myVariable INT
SET @myVariable = 6
PRINT @myVariable

DECLARE @var1 INT, @var2 INT
SET @var1 = 3
SET @var2 = 5
-- CHAR(13) is the enter key - this is for new line
-- CHAR(9) is indent/tab key
PRINT CHAR(9) + 'I have ' + CONVERT(varchar(5), @var1) + CHAR(13) + ' dollars...'

DECLARE @var3 INT, @var4 INT
SET @var3 = 4
SET @var4 = 5
PRINT 'Variable 3 = ' + CONVERT(varchar(5), @var3) + char(13) + 'Variable 4 = ' + CONVERT(varchar(50), @var4) + char(13) + 'Total: '
PRINT @var3 + @var4

IF @var3 < 2
	BEGIN
		PRINT '@var3 < 2'
	END
ELSE IF @var3 > 1 AND @var3 < 3
	BEGIN
		PRINT '@var3 > 1 and @var3 <3'
	END
ELSE IF @var3 = 4 OR @var3 < 6
	BEGIN
		PRINT '@var3 = 4 or @var3 < 6'
	END
ELSE
		PRINT '@var3 does not qualify!'

	-- ==================================
	-- ========  TABLE EXAMPLE =======
	-- ==================================
	/*
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

	-- I want to update a last name - permanent
	UPDATE tbl_persons SET persons_lname = 'grifith' WHERE persons_lname = 'flue';
	-- I want to update a first name - permanent
	UPDATE tbl_persons SET persons_fname = 'monica' WHERE persons_fname = 'grue';

	-- show new table
	SELECT * FROM tbl_persons;

	-- now we want to select wildcards...
	SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_id BETWEEN 3 AND 5;

	-- LIKE % - built in SQL operators: looking for a last name that starts with 'ke' (in this example)
	SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE 'bo%';

	-- example with multiple results
	SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE '%th';

	-- example starting with second letter - underscore is placeholder for first letter
	SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE '_o%s';

	-- example get persons_fname starting with b and anything else following, and order the results by last name
	--- can use ASC and DESC for ascending and descending order at the end of the line (after persons_lname)
	SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_fname LIKE 'b%' ORDER BY persons_lname;

	-- add in the aliases
	SELECT persons_fname AS 'First Name', persons_lname AS 'Last Name', persons_contact AS 'Phone' FROM tbl_persons WHERE persons_fname LIKE 'b%' ORDER BY persons_lname;

	-- *** BE AWARE OF USING DELETE AND DROP!
	-- DELETE statement
	DELETE FROM tbl_persons WHERE persons_lname = 'bongiovanni';

	-- drop the table/ delete the table all together
	DROP TABLE tbl_persons;
	*/