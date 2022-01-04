
CREATE DATABASE LibraryDB2
GO

USE LibraryDB2;

-- CREATE TABLES
CREATE TABLE LIBRARY_BRANCH(
	Branch_ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Branch_Name VARCHAR(50) NOT NULL,
	Branch_Address VARCHAR(50) NOT NULL
);
SELECT * FROM LIBRARY_BRANCH;

CREATE TABLE BOOK_COPIES(
	Book_ID INT NOT NULL,
	Branch_ID INT NOT NULL,
	Number_Of_Copies VARCHAR(50) NOT NULL
);
SELECT * FROM BOOK_COPIES;

CREATE TABLE BOOKS(
	Book_ID INT PRIMARY KEY IDENTITY (100,1),
	Title VARCHAR(50) NOT NULL,
	Publisher_Name VARCHAR(50) NOT NULL,
);
SELECT * FROM BOOKS;

CREATE TABLE BOOK_AUTHORS(
	Book_ID INT NOT NULL,
	Author_Name VARCHAR(50) NOT NULL
);
SELECT * FROM BOOK_AUTHORS;

CREATE TABLE BORROWER(
	Card_No INT PRIMARY KEY NOT NULL IDENTITY (500,1),
	Name VARCHAR(50) NOT NULL,
	Borrower_Address VARCHAR(50) NOT NULL,
	Borrower_Phone VARCHAR(50) NOT NULL,
);
SELECT * FROM BORROWER;

CREATE TABLE BOOK_LOANS(
	Book_ID INT NOT NULL,
	Branch_ID INT NOT NULL,
	Card_No INT NOT NULL,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);
SELECT * FROM BOOK_LOANS;

CREATE TABLE PUBLISHER(
	Publisher_Name VARCHAR(50) PRIMARY KEY NOT NULL,
	Publisher_Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);
SELECT * FROM PUBLISHER;

-- ALTER for Foreign Keys
ALTER TABLE BOOK_COPIES
ADD FOREIGN KEY (Book_ID) REFERENCES BOOKS(Book_ID);
ALTER TABLE BOOK_COPIES
ADD FOREIGN KEY (Branch_ID) REFERENCES LIBRARY_BRANCH(Branch_ID);

ALTER TABLE BOOKS
ADD FOREIGN KEY (Publisher_Name) REFERENCES Publisher(Publisher_Name);

ALTER TABLE BOOK_AUTHORS
ADD FOREIGN KEY (Book_ID) REFERENCES BOOKS(Book_ID);

ALTER TABLE BOOK_LOANS
ADD FOREIGN KEY (Book_ID) REFERENCES BOOKS(Book_ID);
ALTER TABLE BOOK_LOANS
ADD FOREIGN KEY (Branch_ID) REFERENCES LIBRARY_BRANCH(Branch_ID);
ALTER TABLE BOOK_LOANS
ADD FOREIGN KEY (Card_No) REFERENCES BORROWER(Card_No);


-- ADD DATA IN
INSERT INTO LIBRARY_BRANCH
(Branch_Name, Branch_Address)
VALUES
	('Sharpstown', '100 Park Ln.'),
	('Mountain View', '990 North Ln.'),
	('Folsom', '2354 River Rd.'),
	('Galt', '45 South St.'),
	('Roseville', '999 End Rd.'),
	('Orlando', '200 Beach Ln.')
;
SELECT * FROM LIBRARY_BRANCH

INSERT INTO BORROWER
(Name, Borrower_Address, Borrower_Phone)
VALUES
	('John H.', '23 Street Ln.', '555-5555'),
	('Bill B.', '4356 Home Ln.', '234-2342'),
	('Hannah T.', '5437 Tree Ln.', '234-3452'),
	('Xavier M.', '74475 Perfect Ln.', '123-2342'),
	('Lupe F.', '57 Top Ln.', '234-3455'),
	('Mark H.', '3457 City Ln.', '245-7653'),
	('David F.', '457 River Ln.', '325-7654'),
	('Pat C.', '7457 Mountain Ln.', '984-3245')
;
SELECT * FROM BORROWER


INSERT INTO PUBLISHER
(Publisher_Name, Publisher_Address, Phone)
VALUES
	('BooksABC', '2 Road Ln.', '555-5555'),
	('DeathRead', '436 Country Ln.', '234-2342'),
	('Word House', '543 Place Ln.', '234-3452'),
	('Gambler Books', '775 Road Ln.', '123-2342'),
	('Food Inc.', '5700 Place Ln.', '234-3455'),
	('Book Place LLC', '37 Interlock Ln.', '245-7653'),
	('Fantasy House', '7 Car Ln.', '325-7654'),
	('Crime Limited', '23 Small Ln.', '984-3245')
;
SELECT * FROM PUBLISHER


INSERT INTO BOOKS
(Title, Publisher_Name)
VALUES
	('The Lost Tribe', 'BooksABC'),
	('The Book of Dead', 'DeathRead'),
	('Sensitive Words', 'Word House'),
	('48', 'Word House'),
	('Betting It All', 'Gambler Books'),
	('Asteria', 'BooksABC'),
	('Nebula', 'BooksABC'),
	('Veggies Not Sugar', 'Food Inc.'),
	('Beef', 'Food Inc.'),
	('Something Inside', 'Book Place LLC'),
	('Seashell Star System', 'BooksABC'),
	('The Rambler', 'Fantasy House'),
	('Booked and Tired', 'Crime Limited'),
	('Lost Control', 'Crime Limited'),
	('Scared Them All', 'DeathRead'),
	('Wished', 'DeathRead'),
	('Things to Say', 'Word House'),
	('The Interested', 'Word House'),
	('Longest Drive', 'Word House'),
	('Tuesday Whisper', 'BooksABC'),
	('Lost Again', 'BooksABC'),
	('Eat Right', 'Food Inc.')
;
SELECT * FROM BOOKS
