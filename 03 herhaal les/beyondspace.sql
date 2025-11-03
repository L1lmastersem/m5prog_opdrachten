-- Table: Crew
CREATE TABLE Crew (
    crew_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    species VARCHAR(50),
    `rank` VARCHAR(50),
    birth_year INT
);

-- Table: Missions
CREATE TABLE Missions (
    mission_id INT AUTO_INCREMENT PRIMARY KEY,
    mission_name VARCHAR(100),
    destination VARCHAR(100),
    start_date DATE,
    end_date DATE
);

-- Table: Crew_Missions (many-to-many relationship)
CREATE TABLE Crew_Missions (
    crew_id INT,
    mission_id INT,
    role VARCHAR(50),
    FOREIGN KEY (crew_id) REFERENCES Crew(crew_id),
    FOREIGN KEY (mission_id) REFERENCES Missions(mission_id)
);


-- Crew (minstens 1 Andoriaan)
INSERT INTO Crew (crew_id, name, species, `rank`, birth_year) VALUES
  (1, 'Talas zh’Thane', 'Andoriaan', 'Lieutenant', 2312),
  (2, 'Maya Chen', 'Mens', 'Commander', 2298),
  (3, 'Rok Thar', 'Tellariet', 'Ensign', 2305);

-- Missions (2 missies)
INSERT INTO Missions (mission_id, mission_name, destination, start_date, end_date) VALUES
  (1, 'Aurora Survey', 'Proxima Centauri b', '2401-03-12', '2401-06-28'),
  (2, 'Ice Rift Recon', 'Andoria Orbit',      '2401-07-10', '2401-08-22');

-- Koppel de bemanning aan missies (sommigen gaan mee op beide)
INSERT INTO Crew_Missions (crew_id, mission_id, role) VALUES
  (1, 1, 'Science Officer'),
  (1, 2, 'Mission Specialist'),
  (2, 1, 'XO'),
  (3, 2, 'Engineer');

  SELECT * FROM Crew;

-- Alle Andorianen geboren na 2300
SELECT *
FROM Crew
WHERE species = 'Andoriaan'
  AND birth_year > 2300;


  SELECT 
  C.crew_id,
  C.name AS crew_name,
  CM.role
FROM Crew AS C
JOIN Crew_Missions AS CM ON CM.crew_id = C.crew_id;


SELECT
  C.crew_id,
  C.name AS crew_name,
  CM.role,
  M.mission_name
FROM Crew AS C
JOIN Crew_Missions AS CM ON CM.crew_id = C.crew_id
JOIN Missions AS M ON M.mission_id = CM.mission_id;


SELECT 
  M.mission_name,
  C.name AS crew_name
FROM Missions AS M
JOIN Crew_Missions AS CM ON CM.mission_id = M.mission_id
JOIN Crew AS C ON C.crew_id = CM.crew_id
WHERE M.mission_id = 1;


SELECT 
  M.mission_name,
  C.name AS crew_name
FROM Missions AS M
JOIN Crew_Missions AS CM ON CM.mission_id = M.mission_id
JOIN Crew AS C ON C.crew_id = CM.crew_id
WHERE M.mission_id = 2;




SELECT
  crew_id, name, species, `rank`, birth_year
FROM Crew
ORDER BY birth_year DESC
LIMIT 2;



SELECT
  crew_id, name, species, `rank`, birth_year,
  (2400 - birth_year) AS leeftijd
FROM Crew;



SELECT
  species,
  COUNT(*) AS aantal
FROM Crew
GROUP BY species
ORDER BY aantal DESC, species ASC;



INSERT INTO Crew (crew_id, name, species, `rank`, birth_year) VALUES
  (4, 'Shira Vel',     'Andoriaan',  'Lieutenant JG', 2318),
  (5, 'Ibrahim Rao',   'Mens',       'Captain',       2289),
  (6, 'Lira Vos',      'Betazoid',   'Lieutenant',    2308),
  (7, 'Grek Nog',      'Ferengi',    'Ensign',        2315),
  (8, 'Sovek',         'Vulcan',     'Lieutenant',    2299),
  (9, 'Kora zh’Raan',  'Andoriaan',  'Ensign',        2319);