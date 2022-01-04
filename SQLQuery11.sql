
CREATE DATABASE baseballDB
GO

USE baseballDB

CREATE TABLE tbl_manager(
	manager_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	manager_fname VARCHAR(50) NOT NULL,
	manager_lname VARCHAR(50) NOT NULL,
	manager_team VARCHAR(50) NOT NULL
);
SELECT * FROM tbl_manager;
CREATE TABLE tbl_player(
	player_id INT PRIMARY KEY NOT NULL IDENTITY (100, 1),
	player_fname VARCHAR(50) NOT NULL,
	player_lname VARCHAR(50) NOT NULL,
	player_team VARCHAR(50) NOT NULL CONSTRAINT fk_manager_team FOREIGN KEY REFERENCES tbl_manager(manager_team) ON UPDATE CASCADE ON DELETE CASCADE
);
SELECT * FROM tbl_player;

INSERT INTO tbl_manager
(manager_fname, manager_lname, manager_team)
	VALUES
		('gabe', 'kapler', 'san francisco giants'),
		('torey', 'lovullo', 'arizona diamondbacks'),
		('dave', 'roberts', 'los angeles dodgers'),
		('bob', 'melvin', 'san diego padres'),
		('bud', 'black', 'colorado rockies')
;

INSERT INTO tbl_player
(player_fname, player_lname, player_team)
VALUES
	('evan', 'longoria', 'san francisco giants'),
	('madison', 'bumgarner', 'arizona diamondbacks'),
	('clayton', 'kershaw', 'los angeles dodgers'),
	('manny', 'machado', 'san diego padres'),
	('trevor', 'story', 'colorado rockies')


SELECT * FROM tbl_manager;
SELECT * FROM tbl_player;


SELECT a1.manager_fname, a1.manager_lname, a1.manager_team, a2.player_fname, a2.player_lname
FROM tbl_manager a1 
INNER JOIN tbl_player a2 ON a2.player_team = a1.manager_team

