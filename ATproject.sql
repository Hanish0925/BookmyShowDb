CREATE DATABASE BookMyShowDB;

USE BookMyShowDB;

CREATE TABLE Theatre (
    TheatreID INT PRIMARY KEY,
    TheatreName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL
);

CREATE TABLE Movie (
    MovieID INT PRIMARY KEY,
    MovieName VARCHAR(100) NOT NULL,
    Language VARCHAR(50) NOT NULL,
    Rating VARCHAR(10) NOT NULL,
    Genre VARCHAR(50)
);

CREATE TABLE MovieShow (
    ShowID INT PRIMARY KEY,
    TheatreID INT NOT NULL,
    MovieID INT NOT NULL,
    ShowDate DATE NOT NULL,
    ShowTime TIME NOT NULL,
    FOREIGN KEY (TheatreID) REFERENCES Theatre(TheatreID),
    FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    UNIQUE (TheatreID, MovieID, ShowDate, ShowTime) -- Ensures no duplicate shows
);

INSERT INTO Theatre (TheatreID, TheatreName, Location) VALUES
(1, 'PVR: Nexus', 'Hyderabad'); -- Location assumed

INSERT INTO Movie (MovieID, MovieName, Language, Rating, Genre) VALUES
(1, 'Dasara', 'Telugu', 'UA', 'Action'),
(2, 'Kisi Ka Bhai Kisi Ki Jaan', 'Hindi', 'UA', 'Action'),
(3, 'Tu Jhoothi Main Makkaar', 'Hindi', 'UA', 'Romantic Comedy'),
(4, 'Avatar: The Way of Water', 'English', 'UA', 'Sci-Fi');

INSERT INTO MovieShow (ShowID, TheatreID, MovieID, ShowDate, ShowTime) VALUES
(1, 1, 1, '2023-04-25', '12:15:00'), -- Dasara
(2, 1, 2, '2023-04-25', '01:00:00'), -- Kisi Ka Bhai Kisi Ki Jaan
(3, 1, 2, '2023-04-25', '04:10:00'),
(4, 1, 2, '2023-04-25', '07:20:00'),
(5, 1, 2, '2023-04-25', '10:30:00'),
(6, 1, 3, '2023-04-25', '01:15:00'), -- Tu Jhoothi Main Makkaar
(7, 1, 4, '2023-04-25', '01:20:00'); -- Avatar: The Way of Water

SELECT 
    t.TheatreName,
    m.MovieName,
    m.Language,
    m.Rating,
    s.ShowTime
FROM MovieShow s
JOIN Theatre t ON s.TheatreID = t.TheatreID
JOIN Movie m ON s.MovieID = m.MovieID
WHERE t.TheatreID = 1 AND s.ShowDate = '2023-04-25'
ORDER BY s.ShowTime;