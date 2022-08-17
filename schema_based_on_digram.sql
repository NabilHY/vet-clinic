CREATE TABLE patients (
    id serial NOT NULL INT,
    name VARCHAR(250),
    date_of_birth DATE,
    PRIMARY KEY (id)
)

CREATE TABLE treatements (
    id serial NOT NULL INT,
    type VARCHAR(250),
    name VARCHAR(250)
    PRIMARY KEY (id)
)

CREATE TABLE medical_histories (
    id serial NOT NULL INT ,
    admitted_at TIMESTAMP,
    patient_id INTEGER REFERENCES patients(id),
    STATUS VARCHAR(250),
    PRIMARY KEY (id),
    FOREIGN KEY (patient_id) REFENRENCES patients(id)
)

CREATE TABLE invoices (
    id serial NOT NULL INT,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history__id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (medical_history__id) REFERENCES medical_histories(id),
)

CREATE TABLE invoice_items (
    id serial NOT NULL,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
)


