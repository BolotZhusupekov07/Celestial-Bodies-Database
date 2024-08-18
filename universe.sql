CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    type TEXT NOT NULL,
    distance NUMERIC(10, 2) NOT NULL,
    discovered BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    galaxy_id INT NOT NULL,
    mass NUMERIC(10, 2) NOT NULL,
    habitable BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    star_id INT NOT NULL,
    radius INT NOT NULL,
    atmosphere_composition TEXT,
    FOREIGN KEY (star_id) REFERENCES star(star_id)
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    planet_id INT NOT NULL,
    diameter INT NOT NULL,
    has_water BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

CREATE TABLE solar_system (
    solar_system_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    age NUMERIC(10, 2) NOT NULL,
    number_of_planets INT NOT NULL,
    main_star TEXT NOT NULL
);

INSERT INTO galaxy (name, type, distance, discovered)
VALUES
('Milky Way', 'Spiral', 0.00, TRUE),
('Andromeda', 'Spiral', 2.537, TRUE),
('Triangulum', 'Spiral', 3.00, FALSE),
('Whirlpool', 'Spiral', 23.00, TRUE),
('Sombrero', 'Elliptical', 29.30, FALSE),
('Cartwheel', 'Lenticular', 500.00, TRUE);

INSERT INTO star (name, galaxy_id, mass, habitable)
VALUES
('Sun', 1, 1.00, TRUE),
('Sirius', 1, 2.06, FALSE),
('Alpha Centauri', 2, 1.10, TRUE),
('Betelgeuse', 1, 18.00, FALSE),
('Vega', 1, 2.14, FALSE),
('Proxima Centauri', 2, 0.12, TRUE);

INSERT INTO planet (name, star_id, radius, atmosphere_composition)
VALUES
('Earth', 1, 6371, 'Nitrogen, Oxygen'),
('Mars', 1, 3389, 'Carbon Dioxide, Nitrogen'),
('Jupiter', 1, 69911, 'Hydrogen, Helium'),
('Venus', 1, 6052, 'Carbon Dioxide, Nitrogen'),
('Proxima b', 6, 7160, 'Unknown'),
('Betelgeuse b', 4, 45900, 'Hydrogen, Helium'),
('Sirius b', 2, 60800, 'Helium'),
('Vega b', 5, 60300, 'Helium'),
('Alpha b', 3, 7200, 'Nitrogen, Oxygen'),
('Proxima c', 6, 6000, 'Unknown'),
('Proxima d', 6, 7000, 'Unknown'),
('Andromeda b', 3, 6300, 'Hydrogen, Helium');

INSERT INTO moon (name, planet_id, diameter, has_water)
VALUES
('Moon', 1, 3474, FALSE),
('Phobos', 2, 22.4, FALSE),
('Deimos', 2, 12.4, FALSE),
('Europa', 3, 3121.6, TRUE),
('Ganymede', 3, 5268.2, TRUE),
('Callisto', 3, 4820.6, FALSE),
('Io', 3, 3643.2, FALSE),
('Triton', 7, 2706.8, TRUE),
('Titan', 7, 5149.4, TRUE),
('Mimas', 7, 396.4, FALSE),
('Enceladus', 7, 504.2, TRUE),
('Hyperion', 7, 270.2, FALSE),
('Dione', 7, 1123.4, FALSE),
('Rhea', 7, 1528, FALSE),
('Tethys', 7, 1060.4, FALSE),
('Charon', 4, 1207.2, FALSE),
('Vega Moon', 8, 5500, FALSE),
('Andromeda Moon', 11, 5000, TRUE),
('Proxima Moon', 10, 4800, TRUE),
('Alpha Moon', 9, 5400, FALSE);

INSERT INTO solar_system (name, age, number_of_planets, main_star)
VALUES
('Solar System', 4.6, 8, 'Sun'),
('Proxima System', 5.0, 3, 'Proxima Centauri'),
('Alpha System', 6.5, 2, 'Alpha Centauri');
