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
    fullname varchar(255),
    age int,
    team_title varchar(255),
    hometown varchar(255),
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

INSERT INTO Contestants (fullname, age, team_title, hometown, season, languages, details) VALUES 
    ('Nathan Worthington', '39', 'Best Friends', 'Dayton, Tennessee', '32', '', ''),
    ('Cody Buell', '33', 'Best Friends', 'Paint Lick, Kentucky', '32', '', ''),
    ('Kellie Wells-Brinkley', '37', 'Former Olympic Hurdlers', 'Richmond, Virginia', '32', '', ''),
    ('LaVonne Idlette', '34', 'Former Olympic Hurdlers', 'Hampton, Virginia', '32', '', ''),
    ('Jerry Eaves', '61', 'Father & Son', 'Louisville, Kentucky', '32', '', ''),
    ('Frank Eaves', '25', 'Father & Son', 'Louisville, Kentucky', '32', '', ''),
    ('Michelle Newland', '34', 'Sisters', 'Lafayette, Louisiana', '32', '', ''),
    ('Victoria Newland', '33', 'Sisters', 'Lafayette, Louisiana', '32', '', ''),
    ('Leo Brown', '31', 'Dating', 'Somerville, Massachusetts', '32', '', ''),
    ('Alana Folsom', '29', 'Dating', 'Somerville, Massachusetts', '32', '', ''),
    ('Kaylynn Williams', '30', 'Sisters', 'Bluffton, South Carolina', '32', '', ''),
    ('Haley Williams', '31', 'Sisters', 'Bluffton, South Carolina', '32', '', ''),
    ('Eswar Dhinakaran', '24', 'Siblings', 'Fremont, California ', '32', '', ''),
    ('Aparna Dhinakaran', '26', 'Siblings', 'Berkeley, California', '32', '', ''),
    ('DeAngelo Williams', '36', 'Former NFL Stars', 'Charlotte, North Carolina', '32', '', ''),
    ('Gary Barnidge', '34', 'Former NFL Stars', 'Middleburg, Florida', '32', '', ''),
    ('Riley McKibbin', '31', 'Pro Volleyball Brothers', 'Honolulu, Hawaii', '32', '', ''),
    ('Maddison McKibbin', '29', 'Pro Volleyball Brothers', 'Honolulu, Hawaii', '32', '', ''),
    ('Hung Nguyen', '39', 'Married Parents', 'Houston, Texas', '32', '', ''),
    ('Chee Lee', '38', 'Married Parents', 'Houston, Texas', '32', '', ''),
    ('Will Jardell', '30', 'Boyfriends', 'Nederland, Texas', '32', '', ''),
    ('James Wallington', '31', 'Boyfriends', 'Grand Rapids, Michigan', '32', '', ''),
    ('Taylor Green-Jones', '38', 'Married', 'Fort Worth, Texas', '33', '', ''),
    ('Isaiah Green-Jones', '31', 'Married', 'Portland, Oregon', '33', '', ''),
    ('Caro Viehweg', '23', 'Dating', 'Los Angeles, California', '33', '', ''),
    ('Ray Gantt', '25', 'Dating', 'Lakewood, New Jersey', '33', '', ''),
    ('Connie Greiner', '37', 'Married', 'Newport News, Virginia', '33', '', ''),
    ('Sam Greiner', '39', 'Married', 'Charlotte, North Carolina', '33', '', ''),
    ('Anthony Sadler', '29', 'Childhood Friends', 'Sacramento, California', '33', '', ''),
    ('Spencer Stone', '29', 'Childhood Friends', 'Sacramento, California', '33', '', ''),
    ('Michael Norwood', '36', 'Singing Police Officers', 'Buffalo, New York', '33', '', ''),
    ('Moe Badger', '42', 'Singing Police Officers', 'Buffalo, New York', '33', '', ''),
    ('Akbar Cook Sr.', '45', 'Married Educators', 'Newark, New Jersey', '33', '', ''),
    ('Sheri Cook', '44', 'Married Educators', 'Havana, Florida', '33', '', ''),
    ('Lulu Gonzalez', '37', 'Twins & Radio Hosts', 'North Bergen, New Jersey', '33', '', ''),
    ('Lala Gonzalez', '37', 'Twins & Radio Hosts', 'North Bergen, New Jersey', '33', '', ''),
    ('Arun Kumar', '56', 'Father & Daughter', 'Detroit, Michigan', '33', '', ''),
    ('Natalia Kumar', '28', 'Father & Daughter', 'Detroit, Michigan', '33', '', ''),
    ('Ryan Ferguson', '37', 'Best Friends', 'Manhattan, New York', '33', '', ''),
    ('Dusty Harris', '38', 'Best Friends', 'Columbia, Missouri', '33', '', ''),
    ('Raquel Moore', '31', 'Flight Attendants', 'Chicago, Illinois', '33', '', ''),
    ('Cayla Platt', '30', 'Flight Attendants', 'Gulf Breeze, Florida', '33', '', ''),
    ('Kim Holderness', '45', 'Married', 'Sarasota, Florida', '33', '', ''),
    ('Penn Holderness', '47', 'Married', 'Durham, North Carolina', '33', '', ''),
    ('Aastha Lal', '33', 'Engaged', 'Marina del Rey, California', '34', '', ''),
    ('Nina Duong', '34', 'Engaged', 'Marina del Rey, California', '34', '', ''),
    ('Tim Mann', '40', 'Golf Buddies', 'Brentwood, Tennessee', '34', '', ''),
    ('Rex Ryan', '59', 'Golf Buddies', 'Brentwood, Tennessee', '34', '', ''),
    ('Rich Kuo', '32', 'Motivational Speakers', 'Huntington Beach, California', '34', '', ''),
    ('Dom Jones', '35', 'Motivational Speakers', 'Huntington Beach, California', '34', '', ''),
    ('Linton Atkinson', '50', 'Father & Daughter', 'Brooklyn, New York', '34', '', ''),
    ('Sharik Atkinson', '23', 'Father & Daughter', 'Brooklyn, New York', '34', '', ''),
    ('Abby Garrett', '24', 'Childhood Sweethearts', 'Birmingham, Alabama', '34', '', ''),
    ('Will Freeman', '25', 'Childhood Sweethearts', 'Birmingham, Alabama', '34', '', ''),
    ('Glenda Roberts', '41', 'Newlyweds', 'Norcross, Georgia', '34', '', ''),
    ('Lumumba Roberts', '41', 'Newlyweds', 'Norcross, Georgia', '34', '', ''),
    ('Quinton Peron', '29', 'Former Rams Cheerleaders', 'Pasadena, California', '34', '', ''),
    ('Mattie Lynch', '27', 'Former Rams Cheerleaders', 'Vista, California', '34', '', ''),
    ('Marcus Craig', '38', 'Military Brothers', 'Richmond Hill, Georgia', '34', '', ''),
    ('Michael Craig', '30', 'Military Brothers', 'Alamogordo, New Mexico', '34', '', ''),
    ('Aubrey Ares', '29', 'Ballroom Dancers', 'Los Angeles, California', '34', '', ''),
    ('David Hernandez', '29', 'Ballroom Dancers', 'Los Angeles, California', '34', '', ''),
    ('Luis Colon', '34', 'Married', 'Miami, Florida', '34', '', ''),
    ('Michelle Burgos', '34', 'Married', 'Miami, Florida', '34', '', ''),
    ('Emily Bushnell', '36', 'Long-Lost Twins', 'Ardmore, Pennsylvania', '34', '', ''),
    ('Molly Sinert', '36', 'Long-Lost Twins', 'Palm Beach Gardens, Florida', '34', '', ''),
    ('Derek Xiao', '25', 'Reality Romance', 'Los Angeles, California', '34', '', ''),
    ('Claire Rehfuss', '26', 'Reality Romance', 'Los Angeles, California', '34', '', ''),
    ('Alexandra Lichtor', '34', 'Siblings & Roommates', 'Chicago, Illinois', '35', '', ''),
    ('Sheridan Lichtor', '29', 'Siblings & Roommates', 'Chicago, Illinois', '35', '', ''),
    ('Elizabeth Rivera', '52', 'Mother & Daughter', 'Tampa, Florida', '35', '', ''),
    ('Iliana Rivera', '27', 'Mother & Daughter', 'Tampa, Florida', '35', '', ''),
    ('Jocelyn Chao', '49', 'Married Entrepreneurs', 'Albuquerque, New Mexico', '35', '', ''),
    ('Victor Limary', '49', 'Married Entrepreneurs', 'Albuquerque, New Mexico', '35', '', ''),
    ('Joe Moskowitz', '35', 'Engaged', 'New York City, New York', '35', '', ''),
    ('Ian Todd', '40', 'Engaged', 'New York City, New York', '35', '', ''),
    ('Liam Hykel', '23', 'Brothers', 'Cheyenne, Wyoming', '35', '', ''),
    ('Yeremi Hykel', '24', 'Brothers', 'San Marcos, Texas', '35', '', ''),
    ('Andrea Simpson', '44', 'College Friends', 'Philadelphia, Pennsylvania ', '35', '', ''),
    ('Malaina Hatcher', '45', 'College Friends', 'Philadelphia, Pennsylvania', '35', '', ''),
    ('Morgan Franklin', '31', 'Sisters', 'Brooklyn, New York', '35', '', ''),
    ('Lena Franklin', '29', 'Sisters', 'Los Angeles, California', '35', '', ''),
    ('Robbin Tomich', '41', 'Childhood Friends', 'Kirkland, Washington', '35', '', ''),
    ('Chelsea Day', '41', 'Childhood Friends', 'Shoreline, Washington', '35', '', ''),
    ('Todd Martin', '38', 'Married High School Sweethearts', 'Chino, California', '35', '', ''),
    ('Ashlie Martin', '38', 'Married High School Sweethearts', 'Chino, California', '35', '', ''),
    ('Steve Cargile', '54', 'Father & Daughter', 'Petty, Texas', '35', '', ''),
    ('Anna Leigh Wilson', '28', 'Father & Daughter', 'Royse City, Texas', '35', '', ''),
    ('Rob McArthur', '48', 'Father & Son', 'Riverside, California', '35', '', ''),
    ('Corey McArthur', '25', 'Father & Son', 'New York City, New York', '35', '', ''),
    ('Joel Strasser', '42', 'Best Friends', 'Kuna, Idaho', '35', '', ''),
    ('Garrett Smith', '43', 'Best Friends', 'Meridian, Idaho', '35', '', ''),
    ('Greg Franklin', '25', 'Brothers & Computer Scientists', 'New York City, New York', '35', '', ''),
    ('John Franklin', '27', 'Brothers & Computer Scientists', 'Mountain View, California', '35', '', '')
    ;

INSERT INTO Episodes (ID, season, season_episode, episode_name, elimination) VALUES
    ('3201', '32', '1', 'One Million Miles', 1),
    ('3202', '32', '2', 'Red Lipstick Is Not My Color', 1),
    ('3203', '32', '3', 'We''re Makin'' Big Moves', 1),
    ('3204', '32', '4', 'Olé, Olé!', 0),
    ('3205', '32', '5', 'You Don''t Strike Me as a Renaissance Man', 1),
    ('3206', '32', '6', 'I''m Not Even Walking, I''m Falling', 0),
    ('3207', '32', '7', 'Give Me a Beard Bump', 1),
    ('3208', '32', '8', 'Are You a Rickshaw?', 0),
    ('3209', '32', '9', 'This Is Not Payback, This Is Karma', 1),
    ('3210', '32', '10', 'Getting Down to the Nitty Gritty', 1),
    ('3211', '32', '11', 'Run on Your Tippy Toes', 1),
    ('3212', '32', '12', 'Now It''s About Winning', 1),
    ('3301', '33', '1', 'We''re Back!', 1),
    ('3302', '33', '2', 'It Can''t Be That Easy', 0),
    ('3303', '33', '3', 'Who Has This One in the Bag?', 1),
    ('3304', '33', '4', 'Ready to Restart the Race', 1),
    ('3305', '33', '5', 'Stairway to Hell', 0),
    ('3306', '33', '6', 'Say Cheese', 1),
    ('3307', '33', '7', 'Gently Down the Stream', 0),
    ('3308', '33', '8', 'Souvlaki', 1),
    ('3309', '33', '9', 'Rock Bottom', 0),
    ('3310', '33', '10', 'No Room For Error', 1),
    ('3311', '33', '11', 'In the Hands of The Amazing Race Gods', 1),
    ('3401', '34', '1', 'Many Firsts But Don''t Be Last', 1),
    ('3402', '34', '2', 'Patience, is the New Me', 1),
    ('3403', '34', '3', 'It''s All in the Details', 0),
    ('3404', '34', '4', 'Everyone''s an Artist', 1),
    ('3405', '34', '5', 'The Amazing Race of Arabia', 1),
    ('3406', '34', '6', 'Step By Step', 1),
    ('3407', '34', '7', 'It''s Simply Medieval', 1),
    ('3408', '34', '8', 'La Ville Rose', 1),
    ('3409', '34', '9', 'Vamos a la Playa', 0),
    ('3410', '34', '10', 'Don''t Look Down', 1),
    ('3411', '34', '11', 'How Am I Going to Survive This?', 1),
    ('3412', '34', '12', 'The Only Leg That Matters', 1),
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

