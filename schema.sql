/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species VARCHAR(250)
);

CREATE TABLE owners (
    id SERIAL NOT NULL,
    full_name VARCHAR(250),
    age INT,
    PRIMARY KEY (id)
);

CREATE TABLE species (
    id SERIAL NOT NULL,
    name VARCHAR(250),
    PRIMARY KEY (id)
);

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD FOREIGN KEY (species_id) REFERENCES species(id)
ON DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owner_id INT,
ADD FOREIGN KEY (owner_id) REFERENCES owners(id)
ON DELETE CASCADE;

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


