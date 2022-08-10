/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(250),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species_id  INT FOREIGN KEY REFERENCES species(id),
    owner_id INT FOREIGN KEY REFERENCES owners(id),
);

CREATE TABLE owners (
    id INT NOT NULL AUTO_INCREMENT,
    full_name VARCHAR(250),
    age INT,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(250),
    PRIMARY KEY (id)
);
