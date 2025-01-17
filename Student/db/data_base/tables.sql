CREATE TABLE students (
                          id SERIAL PRIMARY KEY,
                          lastname VARCHAR(50) NOT NULL,
                          firstname VARCHAR(50) NOT NULL,
                          surname VARCHAR(50),
                          birth_date DATE,
                          phone VARCHAR(20) UNIQUE,
                          telegram VARCHAR(50) UNIQUE,
                          email VARCHAR(100) UNIQUE,
                          github VARCHAR(100) UNIQUE
);