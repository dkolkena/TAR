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
DROP TABLE IF EXISTS Seasons;
DROP TABLE IF EXISTS Countries;
DROP TABLE IF EXISTS Contestants;
DROP TABLE IF EXISTS Legs;

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
    FOREIGN KEY (season) REFERENCES Seasons(ID),
); 

CREATE TABLE Legs (
    ID int AUTO_INCREMENT,
    season int,
    SeasonEpisode int,
    country varchar(255)
    FOREIGN KEY (season) REFERENCES Seasons(ID),
    FOREIGN KEY (country) REFERENCES Countries(country),
    Challenge1,
    Challenge2,
    Challenge3,
    elimination tinyint(1)
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
INSERT INTO Contestants VALUES ('Robar', 'Matt', 'Simsbury, Connecticut', '28', '1', '', '');
INSERT INTO Contestants VALUES ('Robar', 'Ana', 'Simsbury, Connecticut', '28', '1', '', '');
INSERT INTO Contestants VALUES ('Smith', 'Kim', 'Baytown, Texas', '28', '1', '', '');
INSERT INTO Contestants VALUES ('Kellner', 'Leslie', 'Baytown, Texas', '27', '1', '', '');