CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE studios (
    studio_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INTEGER NOT NULL,
    runtime_min INTEGER,
    imdb_rating NUMERIC(3,1)
);

CREATE TABLE series (
    series_id SERIAL PRIMARY KEY,
    series_name VARCHAR(100) NOT NULL,
    seasons INTEGER,
    episodes_count INTEGER,
    imdb_rating NUMERIC(3,1),
    release_platform VARCHAR(100)
);

CREATE TABLE movie_actors (
    movie_id INTEGER REFERENCES movies(movie_id),
    actor_id INTEGER REFERENCES actors(actor_id),
    PRIMARY KEY (movie_id, actor_id)
);

CREATE TABLE movie_directors (
    movie_id INTEGER REFERENCES movies(movie_id),
    director_id INTEGER REFERENCES directors(director_id),
    PRIMARY KEY (movie_id, director_id)
);

CREATE TABLE series_actors (
    series_id INTEGER REFERENCES series(series_id),
    actor_id INTEGER REFERENCES actors(actor_id),
    PRIMARY KEY (series_id, actor_id)
);

CREATE TABLE series_directors (
    series_id INTEGER REFERENCES series(series_id),
    director_id INTEGER REFERENCES directors(director_id),
    PRIMARY KEY (series_id, director_id)
);

CREATE TABLE movie_finances (
    movie_id INTEGER PRIMARY KEY REFERENCES movies(movie_id),
    budget BIGINT,
    box_office_gross BIGINT,
    domestic_gross BIGINT,
    international_gross BIGINT,
    studio_id INTEGER REFERENCES studios(studio_id)
);

INSERT INTO directors (name) VALUES 
('George Lucas'), ('Irvin Kershner'), ('Richard Marquand'), ('J.J. Abrams'), 
('Rian Johnson'), ('Gareth Edwards'), ('Ron Howard'), ('Dave Filoni'), 
('Deborah Chow'), ('Tony Gilroy'), ('Jon Favreau'), ('Leslye Headland'), 
('Robert Rodriguez'), ('Jon Watts'), ('Kenji Kamiyama'), ('Bryce Dallas Howard'), 
('Shawn Levy'), ('Taika Waititi'), ('Sharmeen Obaid-Chinoy');  

INSERT INTO actors (name) VALUES 
('Mark Hamill'), ('Harrison Ford'), ('Carrie Fisher'), ('Ewan McGregor'), 
('Liam Neeson'), ('Natalie Portman'), ('Hayden Christensen'), ('Daisy Ridley'), 
('John Boyega'), ('Oscar Isaac'), ('Adam Driver'), ('Felicity Jones'), 
('Diego Luna'), ('Alan Tudyk'), ('Alden Ehrenreich'), ('Woody Harrelson'), 
('Emilia Clarke'), ('Matt Lanter'), ('Ashley Eckstein'), ('James Arnold Taylor'), 
('Tom Kane'), ('Dee Bradley Baker'), ('Taylor Gray'), ('Freddie Prinze Jr.'), 
('Ming-Na Wen'), ('Michelle Ang'), ('Rosario Dawson'), ('Natasha Liu Bordizzo'), 
('Mary Elizabeth Winstead'), ('Moses Ingram'), ('Vivien Lyra Blair'), 
('Denise Gough'), ('Stellan Skarsgård'), ('Pedro Pascal'), ('Chris Bartlett'), 
('Katee Sackhoff'), ('Lee Jung-jae'), ('Amandla Stenberg'), ('Manny Jacinto'), 
('Temuera Morrison'), ('Christopher Sean'), ('Scott Lawrence'), ('Josh Brener'), 
('Corey Burton'), ('Sigourney Weaver'), ('Jeremy Allen White'), ('Ryan Gosling'), 
('Mia Goth'), ('Matt Smith'), ('Aaron Pierre'), ('Amy Adams');  

INSERT INTO studios (name) VALUES 
('20th Century Fox'), ('Walt Disney Studios Motion Pictures'), ('Warner Bros.');  

INSERT INTO movies (title, release_year, runtime_min, imdb_rating) VALUES 
('Star Wars: Episode IV - A New Hope', 1977, 121, 8.6),
('Star Wars: Episode V - The Empire Strikes Back', 1980, 124, 8.7),
('Star Wars: Episode VI - Return of the Jedi', 1983, 131, 8.3),
('Star Wars: Episode I - The Phantom Menace', 1999, 136, 6.5),
('Star Wars: Episode II - Attack of the Clones', 2002, 142, 6.6),
('Star Wars: Episode III - Revenge of the Sith', 2005, 140, 7.6),
('Star Wars: Episode VII - The Force Awakens', 2015, 138, 7.7),
('Star Wars: Episode VIII - The Last Jedi', 2017, 152, 6.8),
('Star Wars: Episode IX - The Rise of Skywalker', 2019, 141, 6.4),
('Rogue One: A Star Wars Story', 2016, 133, 7.8),
('Solo: A Star Wars Story', 2018, 135, 6.9),
('Star Wars: The Clone Wars', 2008, 98, 6.0), 
('Star Wars: New Republic', 2027, 142, 7.8),
('The Mandalorian & Grogu', 2026, 135, 8.2),
('Star Wars: Starfighter', 2027, 148, 7.5);  

INSERT INTO series (series_name, seasons, episodes_count, imdb_rating, release_platform) VALUES 
('Star Wars: The Clone Wars', 7, 133, 8.5, 'Cartoon Network/Disney+'),
('Star Wars Rebels', 4, 77, 8.1, 'Disney XD'),
('Star Wars: The Bad Batch', 3, 47, 7.8, 'Disney+'),
('Ahsoka', 1, 8, 7.4, 'Disney+'),
('Star Wars: Visions', 2, 27, 7.0, 'Disney+'),
('Obi-Wan Kenobi', 1, 6, 7.0, 'Disney+'),
('Star Wars: Andor', 1, 12, 8.6, 'Disney+'),
('The Mandalorian', 3, 24, 8.6, 'Disney+'),
('The Acolyte', 1, 8, 4.3, 'Disney+'),
('The Book of Boba Fett', 1, 7, 7.1, 'Disney+'),
('Star Wars: Resistance', 2, 40, 5.3, 'Disney XD'),
('Skeleton Crew', 1, 8, 7.1, 'Disney+'),
('Star Wars: Tales of the Jedi', 1, 6, 8.1, 'Disney+');  

INSERT INTO movie_directors (movie_id, director_id)
SELECT m.movie_id, d.director_id
FROM movies m
JOIN directors d ON d.name =  -- Changed from m.title =
  CASE m.title  -- Added m.title here for clarity
    WHEN 'Star Wars: Episode IV - A New Hope' THEN 'George Lucas'
    WHEN 'Star Wars: Episode V - The Empire Strikes Back' THEN 'Irvin Kershner'
    WHEN 'Star Wars: Episode VI - Return of the Jedi' THEN 'Richard Marquand'
    WHEN 'Star Wars: Episode I - The Phantom Menace' THEN 'George Lucas'
    WHEN 'Star Wars: Episode II - Attack of the Clones' THEN 'George Lucas'
    WHEN 'Star Wars: Episode III - Revenge of the Sith' THEN 'George Lucas'
    WHEN 'Star Wars: Episode VII - The Force Awakens' THEN 'J.J. Abrams'
    WHEN 'Star Wars: Episode VIII - The Last Jedi' THEN 'Rian Johnson'
    WHEN 'Star Wars: Episode IX - The Rise of Skywalker' THEN 'J.J. Abrams'
    WHEN 'Rogue One: A Star Wars Story' THEN 'Gareth Edwards'
    WHEN 'Solo: A Star Wars Story' THEN 'Ron Howard'
    WHEN 'Star Wars: The Clone Wars' THEN 'Dave Filoni'
    WHEN 'Star Wars: New Republic' THEN 'Sharmeen Obaid-Chinoy'
    WHEN 'The Mandalorian & Grogu' THEN 'Jon Favreau'
    WHEN 'Star Wars: Starfighter' THEN 'Shawn Levy'
  END;

INSERT INTO series_directors (series_id, director_id)
SELECT s.series_id, d.director_id
FROM series s
JOIN directors d ON d.name =
  CASE
    WHEN s.series_name IN ('Star Wars: The Clone Wars', 'Star Wars Rebels', 'Star Wars: The Bad Batch', 'Ahsoka', 'Star Wars: Resistance', 'Star Wars: Tales of the Jedi') THEN 'Dave Filoni'
    WHEN s.series_name = 'Star Wars: Visions' THEN 'Kenji Kamiyama'
    WHEN s.series_name = 'Obi-Wan Kenobi' THEN 'Deborah Chow'
    WHEN s.series_name = 'Star Wars: Andor' THEN 'Tony Gilroy'
    WHEN s.series_name = 'The Mandalorian' THEN 'Jon Favreau'
    WHEN s.series_name = 'The Acolyte' THEN 'Leslye Headland'
    WHEN s.series_name = 'The Book of Boba Fett' THEN 'Robert Rodriguez'
    WHEN s.series_name = 'Skeleton Crew' THEN 'Jon Watts'
  END;

INSERT INTO series_directors (series_id, director_id)
SELECT s.series_id, d.director_id 
FROM series s JOIN directors d ON s.series_name = 'The Mandalorian' AND d.name = 'Dave Filoni';

INSERT INTO movie_actors (movie_id, actor_id)
SELECT m.movie_id, a.actor_id 
FROM movies m 
JOIN (
    SELECT 'Star Wars: Episode IV - A New Hope' AS title, 'Mark Hamill' AS name UNION ALL
    SELECT 'Star Wars: Episode IV - A New Hope', 'Harrison Ford' UNION ALL
    SELECT 'Star Wars: Episode IV - A New Hope', 'Carrie Fisher' UNION ALL
    SELECT 'Star Wars: Episode V - The Empire Strikes Back', 'Mark Hamill' UNION ALL
    SELECT 'Star Wars: Episode V - The Empire Strikes Back', 'Harrison Ford' UNION ALL
    SELECT 'Star Wars: Episode V - The Empire Strikes Back', 'Carrie Fisher' UNION ALL
    SELECT 'Star Wars: Episode VI - Return of the Jedi', 'Mark Hamill' UNION ALL
    SELECT 'Star Wars: Episode VI - Return of the Jedi', 'Harrison Ford' UNION ALL
    SELECT 'Star Wars: Episode VI - Return of the Jedi', 'Carrie Fisher' UNION ALL
    SELECT 'Star Wars: Episode I - The Phantom Menace', 'Ewan McGregor' UNION ALL
    SELECT 'Star Wars: Episode I - The Phantom Menace', 'Liam Neeson' UNION ALL
    SELECT 'Star Wars: Episode I - The Phantom Menace', 'Natalie Portman' UNION ALL
    SELECT 'Star Wars: Episode II - Attack of the Clones', 'Ewan McGregor' UNION ALL
    SELECT 'Star Wars: Episode II - Attack of the Clones', 'Hayden Christensen' UNION ALL
    SELECT 'Star Wars: Episode II - Attack of the Clones', 'Natalie Portman' UNION ALL
    SELECT 'Star Wars: Episode III - Revenge of the Sith', 'Ewan McGregor' UNION ALL
    SELECT 'Star Wars: Episode III - Revenge of the Sith', 'Hayden Christensen' UNION ALL
    SELECT 'Star Wars: Episode III - Revenge of the Sith', 'Natalie Portman' UNION ALL
    SELECT 'Star Wars: Episode VII - The Force Awakens', 'Daisy Ridley' UNION ALL
    SELECT 'Star Wars: Episode VII - The Force Awakens', 'John Boyega' UNION ALL
    SELECT 'Star Wars: Episode VII - The Force Awakens', 'Oscar Isaac' UNION ALL
    SELECT 'Star Wars: Episode VIII - The Last Jedi', 'Daisy Ridley' UNION ALL
    SELECT 'Star Wars: Episode VIII - The Last Jedi', 'John Boyega' UNION ALL
    SELECT 'Star Wars: Episode VIII - The Last Jedi', 'Mark Hamill' UNION ALL
    SELECT 'Star Wars: Episode IX - The Rise of Skywalker', 'Daisy Ridley' UNION ALL
    SELECT 'Star Wars: Episode IX - The Rise of Skywalker', 'John Boyega' UNION ALL
    SELECT 'Star Wars: Episode IX - The Rise of Skywalker', 'Oscar Isaac' UNION ALL
    SELECT 'Rogue One: A Star Wars Story', 'Felicity Jones' UNION ALL
    SELECT 'Rogue One: A Star Wars Story', 'Diego Luna' UNION ALL
    SELECT 'Rogue One: A Star Wars Story', 'Alan Tudyk' UNION ALL
    SELECT 'Solo: A Star Wars Story', 'Alden Ehrenreich' UNION ALL
    SELECT 'Solo: A Star Wars Story', 'Woody Harrelson' UNION ALL
    SELECT 'Solo: A Star Wars Story', 'Emilia Clarke' UNION ALL
    SELECT 'Star Wars: The Clone Wars', 'Matt Lanter' UNION ALL
    SELECT 'Star Wars: The Clone Wars', 'Ashley Eckstein' UNION ALL
    SELECT 'Star Wars: The Clone Wars', 'James Arnold Taylor' UNION ALL
    SELECT 'Star Wars: New Republic', 'Daisy Ridley' UNION ALL
    SELECT 'Star Wars: New Republic', 'John Boyega' UNION ALL
    SELECT 'Star Wars: New Republic', 'Oscar Isaac' UNION ALL
    SELECT 'The Mandalorian & Grogu', 'Pedro Pascal' UNION ALL
    SELECT 'The Mandalorian & Grogu', 'Sigourney Weaver' UNION ALL
    SELECT 'The Mandalorian & Grogu', 'Jeremy Allen White' UNION ALL
    SELECT 'Star Wars: Starfighter', 'Ryan Gosling' UNION ALL
    SELECT 'Star Wars: Starfighter', 'Mia Goth' UNION ALL
    SELECT 'Star Wars: Starfighter', 'Matt Smith' UNION ALL
    SELECT 'Star Wars: Starfighter', 'Aaron Pierre' UNION ALL
    SELECT 'Star Wars: Starfighter', 'Amy Adams'
) actor_list ON m.title = actor_list.title
JOIN actors a ON a.name = actor_list.name;  

INSERT INTO series_actors (series_id, actor_id)
SELECT s.series_id, a.actor_id 
FROM series s 
JOIN (
    SELECT 'Star Wars: The Clone Wars' AS series_name, 'Tom Kane' AS name UNION ALL
    SELECT 'Star Wars: The Clone Wars', 'Dee Bradley Baker' UNION ALL
    SELECT 'Star Wars: The Clone Wars', 'Matt Lanter' UNION ALL
    SELECT 'Star Wars Rebels', 'Taylor Gray' UNION ALL
    SELECT 'Star Wars Rebels', 'Freddie Prinze Jr.' UNION ALL
    SELECT 'Star Wars Rebels', 'Ming-Na Wen' UNION ALL
    SELECT 'Star Wars: The Bad Batch', 'Ming-Na Wen' UNION ALL
    SELECT 'Star Wars: The Bad Batch', 'Dee Bradley Baker' UNION ALL
    SELECT 'Star Wars: The Bad Batch', 'Michelle Ang' UNION ALL
    SELECT 'Ahsoka', 'Rosario Dawson' UNION ALL
    SELECT 'Ahsoka', 'Natasha Liu Bordizzo' UNION ALL
    SELECT 'Ahsoka', 'Mary Elizabeth Winstead' UNION ALL
    SELECT 'Star Wars: Visions', 'Christopher Sean' UNION ALL
    SELECT 'Star Wars: Visions', 'Scott Lawrence' UNION ALL
    SELECT 'Star Wars: Visions', 'Josh Brener' UNION ALL
    SELECT 'Obi-Wan Kenobi', 'Ewan McGregor' UNION ALL
    SELECT 'Obi-Wan Kenobi', 'Moses Ingram' UNION ALL
    SELECT 'Obi-Wan Kenobi', 'Vivien Lyra Blair' UNION ALL
    SELECT 'Star Wars: Andor', 'Diego Luna' UNION ALL
    SELECT 'Star Wars: Andor', 'Denise Gough' UNION ALL
    SELECT 'Star Wars: Andor', 'Stellan Skarsgård' UNION ALL
    SELECT 'The Mandalorian', 'Pedro Pascal' UNION ALL
    SELECT 'The Mandalorian', 'Chris Bartlett' UNION ALL
    SELECT 'The Mandalorian', 'Katee Sackhoff' UNION ALL
    SELECT 'The Acolyte', 'Lee Jung-jae' UNION ALL
    SELECT 'The Acolyte', 'Amandla Stenberg' UNION ALL
    SELECT 'The Acolyte', 'Manny Jacinto' UNION ALL
    SELECT 'The Book of Boba Fett', 'Temuera Morrison' UNION ALL
    SELECT 'The Book of Boba Fett', 'Ming-Na Wen' UNION ALL
    SELECT 'The Book of Boba Fett', 'Rosario Dawson' UNION ALL
    SELECT 'Star Wars: Resistance', 'Christopher Sean' UNION ALL
    SELECT 'Star Wars: Resistance', 'Scott Lawrence' UNION ALL
    SELECT 'Star Wars: Resistance', 'Josh Brener' UNION ALL
    SELECT 'Skeleton Crew', 'Temuera Morrison' UNION ALL
    SELECT 'Skeleton Crew', 'Ming-Na Wen' UNION ALL
    SELECT 'Skeleton Crew', 'Pedro Pascal' UNION ALL
    SELECT 'Star Wars: Tales of the Jedi', 'Corey Burton' UNION ALL
    SELECT 'Star Wars: Tales of the Jedi', 'Ashley Eckstein' UNION ALL
    SELECT 'Star Wars: Tales of the Jedi', 'Dee Bradley Baker'
) actor_list ON s.series_name = actor_list.series_name
JOIN actors a ON a.name = actor_list.name;  

INSERT INTO movie_finances (movie_id, budget, box_office_gross, domestic_gross, international_gross, studio_id)
SELECT m.movie_id, 
  CASE m.title 
    WHEN 'Star Wars: Episode IV - A New Hope' THEN 11000000 
    WHEN 'Star Wars: Episode V - The Empire Strikes Back' THEN 18000000 
    WHEN 'Star Wars: Episode VI - Return of the Jedi' THEN 32500000 
    WHEN 'Star Wars: Episode I - The Phantom Menace' THEN 115000000 
    WHEN 'Star Wars: Episode II - Attack of the Clones' THEN 115000000 
    WHEN 'Star Wars: Episode III - Revenge of the Sith' THEN 113000000 
    WHEN 'Star Wars: Episode VII - The Force Awakens' THEN 447000000 
    WHEN 'Star Wars: Episode VIII - The Last Jedi' THEN 300000000 
    WHEN 'Star Wars: Episode IX - The Rise of Skywalker' THEN 416000000 
    WHEN 'Rogue One: A Star Wars Story' THEN 232000000 
    WHEN 'Solo: A Star Wars Story' THEN 271000000 
    WHEN 'Star Wars: The Clone Wars' THEN 8500000 
    ELSE 0  
  END AS budget,
  CASE m.title 
    WHEN 'Star Wars: Episode IV - A New Hope' THEN 775398000 
    WHEN 'Star Wars: Episode V - The Empire Strikes Back' THEN 550016000 
    WHEN 'Star Wars: Episode VI - Return of the Jedi' THEN 482466000 
    WHEN 'Star Wars: Episode I - The Phantom Menace' THEN 1046515000 
    WHEN 'Star Wars: Episode II - Attack of the Clones' THEN 653779000 
    WHEN 'Star Wars: Episode III - Revenge of the Sith' THEN 905595000 
    WHEN 'Star Wars: Episode VII - The Force Awakens' THEN 2071310000 
    WHEN 'Star Wars: Episode VIII - The Last Jedi' THEN 1334407000 
    WHEN 'Star Wars: Episode IX - The Rise of Skywalker' THEN 1077022000 
    WHEN 'Rogue One: A Star Wars Story' THEN 1058682000 
    WHEN 'Solo: A Star Wars Story' THEN 392924000 
    WHEN 'Star Wars: The Clone Wars' THEN 68300000 
    ELSE 0
  END AS box_office_gross,
  CASE m.title 
    WHEN 'Star Wars: Episode IV - A New Hope' THEN 460998000 
    WHEN 'Star Wars: Episode V - The Empire Strikes Back' THEN 292753000 
    WHEN 'Star Wars: Episode VI - Return of the Jedi' THEN 316566000 
    WHEN 'Star Wars: Episode I - The Phantom Menace' THEN 487576000 
    WHEN 'Star Wars: Episode II - Attack of the Clones' THEN 310676000 
    WHEN 'Star Wars: Episode III - Revenge of the Sith' THEN 414378000 
    WHEN 'Star Wars: Episode VII - The Force Awakens' THEN 936662000 
    WHEN 'Star Wars: Episode VIII - The Last Jedi' THEN 620181000 
    WHEN 'Star Wars: Episode IX - The Rise of Skywalker' THEN 515202000 
    WHEN 'Rogue One: A Star Wars Story' THEN 533539000 
    WHEN 'Solo: A Star Wars Story' THEN 213767000 
    WHEN 'Star Wars: The Clone Wars' THEN 35200000 
    ELSE 0
  END AS domestic_gross,
  CASE m.title 
    WHEN 'Star Wars: Episode IV - A New Hope' THEN 314400000 
    WHEN 'Star Wars: Episode V - The Empire Strikes Back' THEN 257263000 
    WHEN 'Star Wars: Episode VI - Return of the Jedi' THEN 165900000 
    WHEN 'Star Wars: Episode I - The Phantom Menace' THEN 558939000 
    WHEN 'Star Wars: Episode II - Attack of the Clones' THEN 343103000 
    WHEN 'Star Wars: Episode III - Revenge of the Sith' THEN 491217000 
    WHEN 'Star Wars: Episode VII - The Force Awakens' THEN 1134648000 
    WHEN 'Star Wars: Episode VIII - The Last Jedi' THEN 714226000 
    WHEN 'Star Wars: Episode IX - The Rise of Skywalker' THEN 561820000 
    WHEN 'Rogue One: A Star Wars Story' THEN 525143000 
    WHEN 'Solo: A Star Wars Story' THEN 179157000 
    WHEN 'Star Wars: The Clone Wars' THEN 33100000 
    ELSE 0
  END AS international_gross,
  s.studio_id
FROM movies m JOIN studios s ON 
  CASE 
    WHEN m.title = 'Star Wars: The Clone Wars' THEN 'Warner Bros.'
    WHEN m.release_year < 2013 THEN '20th Century Fox'
    ELSE 'Walt Disney Studios Motion Pictures'
  END = s.name
WHERE m.release_year <= 2019;

INSERT INTO movie_finances (movie_id, budget, box_office_gross, domestic_gross, international_gross, studio_id)
SELECT m.movie_id, 
  CASE m.title 
    WHEN 'Star Wars: New Republic' THEN 350000000
    WHEN 'The Mandalorian & Grogu' THEN 250000000
    WHEN 'Star Wars: Starfighter' THEN 300000000
    ELSE 0
  END AS budget,
  CASE m.title 
    WHEN 'Star Wars: New Republic' THEN 1400000000
    WHEN 'The Mandalorian & Grogu' THEN 1200000000
    WHEN 'Star Wars: Starfighter' THEN 1000000000
    ELSE 0
  END AS box_office_gross,
  CASE m.title 
    WHEN 'Star Wars: New Republic' THEN 500000000
    WHEN 'The Mandalorian & Grogu' THEN 400000000
    WHEN 'Star Wars: Starfighter' THEN 350000000
    ELSE 0
  END AS domestic_gross,
  CASE m.title 
    WHEN 'Star Wars: New Republic' THEN 900000000
    WHEN 'The Mandalorian & Grogu' THEN 800000000
    WHEN 'Star Wars: Starfighter' THEN 650000000
    ELSE 0
  END AS international_gross,
  s.studio_id
FROM movies m JOIN Studios s ON 
  CASE 
    WHEN m.release_year > 2019 THEN 'Walt Disney Studios Motion Pictures'  
    ELSE 'Unknown'
  END = s.name
WHERE m.release_year > 2019;