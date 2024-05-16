/* 
This database is intended to be an exercise to create a well-formed, easily 
queried database of interesting details related to the reality show The Amazing
Race. Once complete the data should be complete through Season 36.

Data has been drawn from the show's Wiki (https://amazingrace.fandom.com/wiki/The_Amazing_Race_(US))
as well as its general Wikipedia page (https://en.wikipedia.org/wiki/The_Amazing_Race_(American_TV_series))

Author: Daniel Kolkena
*/
/* Create the database */
CREATE DATABASE IF NOT EXISTS tar;

/* Switch to the tar database */
USE tar;

/* Drop existing tables */
DROP TABLE IF EXISTS Challenges;
DROP TABLE IF EXISTS Contestants;
DROP TABLE IF EXISTS Episodes;
DROP TABLE IF EXISTS Seasons;
DROP TABLE IF EXISTS Countries;


/* Create the tables */
CREATE TABLE Seasons (
    ID int AUTO_INCREMENT,
    year_broadcast year,
    details varchar(255),
    PRIMARY KEY (ID)
);

CREATE TABLE Countries (
    country varchar(255),
    continent varchar(255),
    -- language varchar(255),
    PRIMARY KEY (country)
);

CREATE TABLE Contestants (
    ID int AUTO_INCREMENT,
    lastname varchar(255),
    firstname varchar(255),
    hometown varchar(255),
    age int,
    season int NOT NULL,
    languages varchar(255),
    details varchar(255),
    PRIMARY KEY (ID),
    FOREIGN KEY (season) REFERENCES Seasons(ID)
); 

CREATE TABLE Episodes (
    ID int NOT NULL,
    season int,
    season_episode int,
    episode_name varchar(255),
    elimination tinyint(1),
    PRIMARY KEY (ID),
    FOREIGN KEY (season) REFERENCES Seasons(ID)
); 

CREATE TABLE Challenges (
    ID int AUTO_INCREMENT,
    country varchar(255),
    episode_id int,
    challenge_type enum ('Task', 'Roadblock', 'Detour', 'Express Pass', 'Yield', 'Fast Forward', 'U-Turn', 'Speed Bump'),
    challenge_name varchar(255),
    category varchar(255),
    PRIMARY KEY (ID),
    FOREIGN KEY (episode_id) REFERENCES Episodes(ID),
    FOREIGN KEY (country) REFERENCES Countries(country)
); 

/*
TODO:
Refining schema some more
Think about what data to include
Continue to add data
*/

/* Inserting data  */
INSERT INTO Seasons (year_broadcast, details) VALUES 
    ('2001',''),('2002',''),('2002',''),('2003',''),('2004',''),('2004',''),('2005',''),('2005','Family Edition'),('2006',''),('2006',''),('2007','All-Stars (2007)'),('2007',''),('2008',''),('2009',''),('2009',''),('2010',''),('2010',''),('2011','Unfinished Business'),('2011',''),('2012',''),('2012',''),('2013',''),('2013',''),('2014','All-Stars (2014)'),('2014',''),('2015',''),('2015',''),('2016',''),('2017',''),('2018',''),('2019',''),('2020',''),('2022',''),('2022',''),('2023',''),('2024','');
INSERT INTO Countries (country, continent) VALUES 
    ('Botswana','Africa'),
    ('Burkina Faso','Africa'),
    ('Egypt','Africa'),
    ('Ethiopia','Africa'),
    ('Ghana','Africa'),
    ('Kenya','Africa'),
    ('Madagascar','Africa'),
    ('Malawi','Africa'),
    ('Mauritius','Africa'),
    ('Morocco','Africa'),
    ('Mozambique','Africa'),
    ('Namibia','Africa'),
    ('Senegal','Africa'),
    ('Seychelles','Africa'),
    ('South Africa','Africa'),
    ('Tanzania','Africa'),
    ('Tunisia','Africa'),
    ('Uganda','Africa'),
    ('Zambia','Africa'),
    ('Zimbabwe','Africa');
INSERT INTO Countries (country, continent) VALUES
    ('Armenia','Asia'),
    ('Azerbaijan','Asia'),
    ('Bahrain','Asia'),
    ('Bangladesh','Asia'),
    ('Cambodia','Asia'),
    ('China','Asia'),
    ('Georgia','Asia'),
    ('India','Asia'),
    ('Indonesia','Asia'),
    ('Japan','Asia'),
    ('Jordan','Asia'),
    ('Kazakhstan','Asia'),
    ('Kuwait','Asia'),
    ('Laos','Asia'),
    ('Malaysia','Asia'),
    ('Mongolia','Asia'),
    ('Oman','Asia'),
    ('Philippines','Asia'),
    ('Singapore','Asia'),
    ('South Korea','Asia'),
    ('Sri Lanka','Asia'),
    ('Taiwan','Asia'),
    ('Thailand','Asia'),
    ('Turkey','Asia'),
    ('United Arab Emirates','Asia'),
    ('Vietnam','Asia'),
    ('Hong Kong','Asia'),
    ('Macau','Asia');
INSERT INTO Countries (country, continent) VALUES
    ('Austria','Europe'),
    ('Belgium','Europe'),
    ('Croatia','Europe'),
    ('Czech Republic','Europe'),
    ('Denmark','Europe'),
    ('Estonia','Europe'),
    ('Finland','Europe'),
    ('France','Europe'),
    ('Germany','Europe'),
    ('Greece','Europe'),
    ('Hungary','Europe'),
    ('Iceland','Europe'),
    ('Ireland','Europe'),
    ('Italy','Europe'),
    ('Liechtenstein','Europe'),
    ('Lithuania','Europe'),
    ('Malta','Europe'),
    ('Monaco','Europe'),
    ('Netherlands','Europe'),
    ('Norway','Europe'),
    ('Poland','Europe'),
    ('Portugal','Europe'),
    ('Romania','Europe'),
    ('Russia','Europe'),
    ('Slovenia','Europe'),
    ('Spain','Europe'),
    ('Sweden','Europe'),
    ('Switzerland','Europe'),
    ('Ukraine','Europe'),
    ('United Kingdom','Europe');
INSERT INTO Countries (country, continent) VALUES
    ('Barbados','North America'),
    ('Costa Rica','North America'),
    ('Dominican Republic','North America'),
    ('Jamaica','North America'),
    ('Mexico','North America'),
    ('Panama','North America'),
    ('Trinidad and Tobago','North America'),
    ('United States','North America'),
    ('Puerto Rico','North America'),
    ('U.S. Virgin Islands','North America');
INSERT INTO Countries (country, continent) VALUES
    ('Australia','Oceania'),
    ('New Zealand','Oceania'),
    ('French Polynesia','Oceania'),
    ('Guam','Oceania');
INSERT INTO Countries (country, continent) VALUES
    ('Argentina','South America'),
    ('Brazil','South America'),
    ('Bolivia','South America'),
    ('Chile','South America'),
    ('Colombia','South America'),
    ('Ecuador','South America'),
    ('Paraguay','South America'),
    ('Peru','South America'),
    ('Uruguay','South America');

# Season 1
INSERT INTO Contestants (lastname, firstname, hometown, age, season, languages, details) VALUES ('Robar', 'Matt', 'Simsbury, Connecticut', '28', '1', '', '');
INSERT INTO Contestants (lastname, firstname, hometown, age, season, languages, details) VALUES ('Robar', 'Ana', 'Simsbury, Connecticut', '28', '1', '', '');
INSERT INTO Contestants (lastname, firstname, hometown, age, season, languages, details) VALUES ('Smith', 'Kim', 'Baytown, Texas', '28', '1', '', '');
INSERT INTO Contestants (lastname, firstname, hometown, age, season, languages, details) VALUES ('Kellner', 'Leslie', 'Baytown, Texas', '27', '1', '', '');

INSERT INTO Episodes (ID, season, season_episode, episode_name, elimination) VALUES
    ('3501', '35', '1', 'The Amazing Race Is Back!', 1),
    ('3502', '35', '2', 'You Don''t See That at Home', 1),
    ('3503', '35', '3', 'No Sleep and a Million Dollar Dream', 0),
    ('3504', '35', '4', 'The Day Keeps Rockin'' Here in Vietnam', 1),
    ('3505', '35', '5', 'Yessir, the Pink City', 1),
    ('3506', '35', '6', 'Driving Head On Into Scooters', 1),
    ('3507', '35', '7', 'Like Two Cats Fighting in a Car', 1),
    ('3508', '35', '8', 'A Planes, Trains and Automobiles Day', 1),
    ('3509', '35', '9', 'In the Belly of the Earth', 1),
    ('3510', '35', '10', 'Everyone Loves a Comeback Story', 1),
    ('3511', '35', '11', 'We''re Finding Our Pot of Gold', 1),
    ('3512', '35', '12', 'A Sunset, Seattle Scramble', 1)
    ;

INSERT INTO Challenges (country, episode_id, challenge_type, challenge_name, category) VALUES 
    ('United States', '3501', 'Roadblock', 'Who wants to be above it all?', 'Heights'),
    ('Thailand', '3501', 'Express Pass', '', 'Eating Challenge'),
    ('Thailand', '3501', 'Detour', 'Sword Play', 'Dancing'),
    ('Thailand', '3501', 'Detour', 'Spa Day', 'Pain Endurance'),
    ('Thailand', '3502', 'Roadblock', 'Who has a green thumb?', 'Searching, Crafting'),
    ('Thailand', '3502', 'Detour', 'Stock Up', 'Shopping, Language'),
    ('Thailand', '3502', 'Detour', 'Scoop Up', 'Searching, Rowing'),
    ('Vietnam', '3503', 'Task', '', 'Boating, Searching, Cluefinding'),
    ('Vietnam', '3503', 'Detour', 'Paper', 'Crafting'),
    ('Vietnam', '3503', 'Detour', 'Plastic', 'Crafting')
    ;