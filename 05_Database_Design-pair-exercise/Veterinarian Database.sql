-- CREATE DATABASE veterinarian;
-- https://online.visual-paradigm.com/community/share/animal-hospital-health-report-l1j4jcc3m (database design chart)

DROP TABLE pet_owner;
DROP TABLE pet_procedure;
DROP TABLE visit;
DROP TABLE owner;
DROP TABLE pet;
DROP TABLE date;
DROP TABLE procedure;

CREATE TABLE pet (
        pet_id serial primary key, 
        pet_name varchar(30) NOT NULL, 
        pet_type varchar(15) NOT NULL
        
--      CONSTRAINT chk_pet_type check(pet_type IN('cat', 'dog', 'reptile', 'bird', 'horse')) getting an error we can't figure out
);

CREATE TABLE owner (
        owner_id serial primary key,
        first_name varchar(50) NOT NULL,
        last_name varchar(50) NOT NULL,
        street_address_one varchar(255) NOT NULL,
        street_address_two varchar(255),
        district varchar(50) NOT NULL,
        postal_code varchar(255) NOT NULL
);

CREATE TABLE pet_owner (
        pet_id int NOT NULL,
        owner_id int NOT NULL,
        
        CONSTRAINT fk_pet_owner_pet_id foreign key (pet_id) references pet(pet_id),
        CONSTRAINT fk_pet_owner_owner_id foreign key (owner_id) references owner(owner_id),
        CONSTRAINT pk_pet_owner primary key (pet_id, owner_id)
);

CREATE TABLE procedure (
        procedure_id serial primary key,
        cost decimal NOT NULL,
        name varchar(100)
);

CREATE TABLE date (
        date_id serial primary key,
        month varchar(10) NOT NULL,
        day int NOT NULL,
        year int NOT NULL
);

CREATE TABLE visit (
        visit_id serial primary key,
        date_id int NOT NULL,
        procedure_id int NOT NULL,
        
        CONSTRAINT fk_date_id foreign key (date_id) references date(date_id),
        CONSTRAINT fk_procedure_id foreign key (procedure_id) references procedure(procedure_id)
);

CREATE TABLE pet_procedure (
        pet_id int NOT NULL,
        visit_id int NOT NULL,
        
        CONSTRAINT fk_pet_id foreign key (pet_id) references pet(pet_id),
        CONSTRAINT fk_visit_id foreign key (visit_id) references visit(visit_id),
        CONSTRAINT pk_pet_procedure primary key (pet_id, visit_id)  
);


 
       
