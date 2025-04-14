DROP DATABASE IF EXISTS universityDB;

SET sql_mode = 'TRADITIONAL';

-- Adatbázis létrehozása
CREATE DATABASE universityDB
    CHARACTER SET utf8
    COLLATE utf8_hungarian_ci;

USE universityDB;

CREATE TABLE lectors (
    _id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_year INT,
    university_id INT
) ENGINE = INNODB;

CREATE TABLE universities (
    _id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    established_year INT,
    current_lector_id INT UNIQUE NOT NULL,
    FOREIGN KEY (current_lector_id) REFERENCES lectors(_id)
) ENGINE = INNODB;



INSERT INTO lectors (_id, name, birth_year, university_id) VALUES
    (1, 'Dr. Kiss László', 1962, 1),
    (2, 'Dr. Nagy Éva', 1971, 2),
    (3, 'Dr. Szabó Gábor', 1965, 3),
    (4, 'Dr. Kovács Dániel', 1970, 4),
    (5, 'Dr. Molnár Eszter', 1968, 5),
    (6, 'Dr. Tóth Péter', 1966, 6),
    (7, 'Dr. Varga Mária', 1975, 7),
    (8, 'Dr. Balogh Attila', 1972, 8),
    (9, 'Dr. Farkas Júlia', 1974, 9),
    (10, 'Dr. Lukács Zoltán', 1963, 10),
    (11, 'Prof. Székely János', 1955, 1),
    (12, 'Dr. Kálmán Júlia', 1960, 1),
    (13, 'Dr. Nagy Sándor', 1961, 1),
    (14, 'Dr. Tamás Lilla', 1962, 2),
    (15, 'Dr. Csikós András', 1967, 2),
    (16, 'Dr. Varga Imre', 1973, 2),
    (17, 'Dr. Hegedűs Anikó', 1969, 3),
    (18, 'Dr. Bognár Márton', 1965, 3),
    (19, 'Dr. Juhász Zsuzsanna', 1970, 3),
    (20, 'Dr. Lőrincz István', 1964, 4),
    (21, 'Dr. Horváth Nóra', 1976, 4),
    (22, 'Dr. Pataki Géza', 1972, 4),
    (23, 'Dr. Kádár Éva', 1967, 5),
    (24, 'Dr. Ferenczi László', 1969, 5),
    (25, 'Dr. Barna Judit', 1971, 5),
    (26, 'Dr. Takács Gábor', 1968, 6),
    (27, 'Dr. Vass Rita', 1973, 6),
    (28, 'Dr. Pál Dénes', 1975, 6),
    (29, 'Dr. Gulyás Zsófia', 1970, 7),
    (30, 'Dr. Erdei Károly', 1966, 7),
    (31, 'Dr. Sánta Ágnes', 1972, 7),
    (32, 'Dr. Hollósi Dóra', 1974, 8),
    (33, 'Dr. Mezei Gergő', 1971, 8),
    (34, 'Dr. Zsiga Balázs', 1970, 8),
    (35, 'Dr. Czibolya Áron', 1965, 9),
    (36, 'Dr. Bors Eszter', 1967, 9),
    (37, 'Dr. Jenei Róbert', 1974, 9),
    (38, 'Dr. Hunya Judit', 1963, 10),
    (39, 'Dr. Németh Orsolya', 1970, 10),
    (40, 'Dr. Kántor Mihály', 1969, 10);


INSERT INTO universities (_id, name, city, established_year, current_lector_id) VALUES
    (1, 'Budapesti Műszaki és Gazdaságtudományi Egyetem', 'Budapest', 1782, 1),
    (2, 'Eötvös Loránd Tudományegyetem', 'Budapest', 1635, 2),
    (3, 'Debreceni Egyetem', 'Debrecen', 1538, 3),
    (4, 'Szegedi Tudományegyetem', 'Szeged', 1872, 4),
    (5, 'Pécsi Tudományegyetem', 'Pécs', 1367, 5),
    (6, 'Miskolci Egyetem', 'Miskolc', 1949, 6),
    (7, 'Nyíregyházi Egyetem', 'Nyíregyháza', 1914, 7),
    (8, 'Dunaújvárosi Egyetem', 'Dunaújváros', 1950, 8),
    (9, 'Óbudai Egyetem', 'Budapest', 2000, 9),
    (10, 'Széchenyi István Egyetem', 'Győr', 1968, 10);

ALTER TABLE lectors ADD CONSTRAINT fk_university FOREIGN KEY (university_id) REFERENCES universities(_id);