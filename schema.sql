/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species VARCHAR(250),
    PRIMARY KEY (id)
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

CREATE TABLE vets (
    id SERIAL NOT NULL,
    name VARCHAR(250),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY (id)
);

CREATE TABLE specializations (
    vet_id int NOT NULL,
    species_id int NOT NULL,
    PRIMARY KEY (vet_id, species_id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
    ON DELETE CASCADE,
    FOREIGN KEY (species_id) REFERENCES species(id)
    ON DELETE CASCADE
);

ALTER TABLE animals
ADD PRIMARY KEY(id);

CREATE TABLE visits (
    animal_id int NOT NULL,
    vet_id int NOT NULL,
    date_of_visit DATE,
    PRIMARY KEY (animal_id, vet_id, date_of_visit),
    FOREIGN KEY (animal_id) REFERENCES animals(id)
    ON DELETE CASCADE,
    FOREIGN KEY (vet_id) REFERENCES vets(id)
    ON DELETE CASCADE
);



