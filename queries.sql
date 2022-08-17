/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE escape_attempts < 3 AND neutered = true;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';
SELECT * FROM animals WHERE weight_kg <= 17.3 AND weight_kg >= 10.4;


SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT COUNT(escape_attempts), FROM animals GROUP BY neutered;
SELECT MIN(weight_kg), MAX(weight_kg), species FROM animals GROUP BY species;
SELECT AVG(escape_attempts), species FROM animals WHERE  date_of_birth < '01-01-2000' AND date_of_birth > '01-01-1990' GROUP BY species;


SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT animals.name, owners.full_name FROM animals JOIN owners ON animals.owner_id = owners.id;

SELECT COUNT(*), species.name FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name, species.name FROM animals JOIN species ON animals.species_id = species.id JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Wincherster' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(*) FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY COUNT(*) DESC;


SELECT a.name
FROM animals a
INNER JOIN visits ON visits.animal_id = a.id
INNER JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(*)                                                                                 
FROM animals a 
JOIN visits v
ON a.id = v.animal_id
JOIN vets  
ON vets.id = v.vet_id
WHERE vets.name = 'Stephanie Mendez'; 

SELECT vets.name, species.name
FROM vets                                          
JOIN specializations ON specializations.vet_id = vets.id
JOIN species ON species.id = specializations.species_id;

SELECT a.name, vets.name
FROM animals a
join visits on visits.animal_id = a.id
join vets on vets.id = visits.vet_id
where vets.name = 'Stephanie Mendez'

SELECT a.name, vets.name
FROM animals a
join visits on visits.animal_id = a.id
join vets on vets.id = visits.vet_id
where vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30'; 

SELECT a.name, COUNT(v.date_of_visit) as visits_n
FROM animals a 
JOIN visits v ON a.id = v.animal_id 
JOIN vets ON vets.id = v.vet_id 
GROUP BY a.name 
ORDER BY visits_n DESC 
LIMIT 1;

SELECT a.name      
FROM animals a
JOIN visits         
ON a.id = visits.animal_id
JOIN vets v  
ON v.id = visits.vet_id
WHERE v.name = 'Maisy Smith'
ORDER BY visits.date_of_visit
LIMIT 1;


SELECT * 
FROM animals a 
JOIN visits ON a.id = visits.animal_id 
JOIN vets v ON v.id = visits.vet_id
ORDER BY visits.date_of_visit
DESC LIMIT 1;

SELECT COUNT(*) 
FROM animals a 
JOIN visits ON a.id = visits.animal_id 
JOIN vets v ON v.id = visits.vet_id 
JOIN specializations ON specializations.vet_id = v.id 
JOIN species s ON s.id = specializations.species_id 
WHERE a.species_id != specializations.species_id;

SELECT species.name as most_species
FROM animals a JOIN visits ON a.id = visits.animal_id 
JOIN vets v ON v.id = visits.vet_id 
JOIN species ON a.species_id = species.id 
WHERE v.name = 'Maisy Smith' 
GROUP BY a.name, species.name 
LIMIT 1;

-- Perforamance indexes--

CREATE INDEX va_index ON visits(animal_id);

CREATE INDEX vets_id_asc ON visits(vet_id);

CREATE INDEX email_asc_index ON owners(email);
