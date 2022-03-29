CREATE DATABASE hospitaldb;


CREATE TABLE patients(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
name VARCHAR(255),
date_of_birth DATE);


CREATE TABLE medical_histories(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
admitted_at TIMESTAMP,
patient_id INT,
status VARCHAR(255),
FOREIGN KEY(patient_id) REFERENCES patients(id));


CREATE TABLE invoices(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
total_amount DECIMAL,
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_history_id INT,
FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id));


CREATE TABLE treatments(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
type VARCHAR(255),
name VARCHAR(255));


CREATE TABLE invoice_items(id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT,
treatment_id INT,
FOREIGN KEY(invoice_id) REFERENCES invoices(id),FOREIGN KEY(treatment_id) REFERENCES treatments(id));

CREATE TABLE medical_histories_treatments (
  med_histories_id integer,
  treat_id integer,
  FOREIGN KEY (med_histories_id) REFERENCES medical_histories(id),
  FOREIGN KEY (treat_id) REFERENCES treatments(id)
);
CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON medical_histories_treatments (med_histories_id);
CREATE INDEX ON medical_histories_treatments (treat_id);


