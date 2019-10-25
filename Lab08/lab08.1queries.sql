--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PropertiesPlayerGame;
DROP TABLE IF EXISTS House;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS Piece;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Property;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY, 
	startTime timestamp NOT NULL,
	endTime timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	name varchar(50) NOT NULL
	);

CREATE TABLE PlayerGame (
	ID integer PRIMARY KEY,
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer,
	cash integer
	);

CREATE TABLE PropertiesPlayerGame (
	pGID integer REFERENCES PlayerGame(ID),
	propertyID integer REFERENCES Property(ID)
	);

CREATE TABLE House (
	ID integer PRIMARY KEY,
	pGID integer REFERENCES PlayerGame(ID),
	propertyID integer REFERENCES Property(ID)
	);

CREATE TABLE Hotel (
	ID integer PRIMARY KEY,
	pGID integer REFERENCES PlayerGame(ID),
	propertyID integer REFERENCES Property(ID)
	);

CREATE TABLE Piece (
	ID integer PRIMARY KEY,
	pGID integer REFERENCES PlayerGame(ID),
	locationID integer REFERENCES Property(ID)
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON House TO PUBLIC;
GRANT SELECT ON Hotel TO PUBLIC;
GRANT SELECT ON Piece TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PropertiesPlayerGame TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2019-10-20 13:20:00');
INSERT INTO Game VALUES (4, '2006-05-29 18:41:00', '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

INSERT INTO PlayerGame VALUES (1, 1, 1, 0.00, 0);
INSERT INTO PlayerGame VALUES (2, 1, 2, 0.00, 0);
INSERT INTO PlayerGame VALUES (3, 1, 3, 2350.00, 0);
INSERT INTO PlayerGame VALUES (4, 2, 1, 1000.00, 0);
INSERT INTO PlayerGame VALUES (5, 2, 2, 0.00, 0);
INSERT INTO PlayerGame VALUES (6, 2, 3, 500.00, 0);
INSERT INTO PlayerGame VALUES (7, 3, 2, 0.00, 0);
INSERT INTO PlayerGame VALUES (8, 3, 3, 5500.00, 0);

INSERT INTO Property VALUES (3, 'Broadway');

INSERT INTO House VALUES (1, 7, 3);

INSERT INTO Hotel VALUES (1, 2, 3);

INSERT INTO Piece VALUES (1, 6, 3);

INSERT INTO PropertiesPlayerGame VALUES (5, 3);

-- EXERCISE 8.1

-- a
-- SELECT *
-- FROM Game
-- ORDER BY startTime DESC;

-- b
-- SELECT *
-- FROM Game
-- WHERE startTime > CURRENT_DATE - 7;

-- c
-- SELECT *
-- FROM Player
-- WHERE name IS NOT NULL;

-- d
-- SELECT DISTINCT playerID
-- FROM PlayerGame
-- WHERE PlayerGame.score > 2000;

-- e
-- SELECT *
-- FROM Player
-- WHERE emailAddress LIKE '%@gmail%';
