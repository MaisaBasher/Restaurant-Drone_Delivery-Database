-- CS4400: Introduction to Database Systems
-- Fall 2022
-- Phase II Create Table and Insert Statements

-- Team 38
-- Maisa Basher (mbasher3)
-- Denny Nguyen (dnguyen369)
-- Ajoke Akinseye (aakinseye3)



-- CREATE DATABASE STATEMENTS BELOW
DROP DATABASE IF EXISTS RestaurantSupplyExpressDroneDelivery ;
CREATE DATABASE IF NOT EXISTS RestaurantSupplyExpressDroneDelivery;
USE RestaurantSupplyExpressDroneDelivery;

-- CREATE TABLE STATEMENTS BELOW

DROP TABLE IF EXISTS user;
CREATE TABLE user (
	username VARCHAR(40) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    address VARCHAR(500) NOT NULL,
    birthdate DATE NOT NULL,
    PRIMARY KEY(username)
    )ENGINE=InnoDB;
    
INSERT INTO user VALUES ('agarcia7', 'Alejandro', 'Garcia', '710 Living Water Drive', '1966-10-29'),
('awilson5','Aaron','Wilson','220 Peachtree Street','1963-11-11'),('bsummers4', 'Brie','Summers','5105 Dragon Star Circle','1976-02-09'),
('cjordan5','Clark','Jordan','77 Infinite Stars Road','1966-06-05' ), ('ckann5','Carrot','Kann','64 Knights Square Trail', '1972-09-01'),
('csoares8','Claire','Soares','706 Living Stone Way', '1965-09-03' ),('echarles19','Ella', 'Charles', '22 Peachtree Street', '1974-05-06'),
('eross10', 'Erica', 'Ross', '22 Peachtree Street', '1975-04-02'),('fprefontaine6','Ford','Prefontaine','10 Hitch Hikers Lane','1961-01-28'),
('hstark16', 'Harmon', 'Stark', '53 Tanker Top Lane', '1971-10-27'),('jstone5','Jared', 'Stone', '101 Five Finger Way', '1961-01-06'),
('lrodriguez5','Lina', 'Rodriguez', '360 Corkscrew Circle', '1975-04-02'),('mrobot1', 'Mister', 'Robot', '10 Autonomy Trace', '1988-11-02'),
('mrobot2', 'Mister', 'Robot', '10 Clone Me Circle', '1988-11-02'),('rlopez6', 'Radish', 'Lopez','8 Queens Route','1999-09-03'),
('sprince6', 'Sarah', 'Prince', '22 Peachtree Street', '1968-06-15'),('tmccall5', 'Trey', 'McCall', '360 Corkscrew Circle', '1973-03-19');


DROP table if exists owner;
CREATE TABLE owner (
    username VARCHAR(40) NOT NULL,
    PRIMARY KEY(username),
	CONSTRAINT owner_ibfk_1 FOREIGN KEY(username) REFERENCES user(username)
    )ENGINE=InnoDB;
    
INSERT INTO owner VALUES('cjordan5'),('jstone5'),('sprince6');
    
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	username VARCHAR(40) NOT NULL,
    taxID CHAR(11) NOT NULL, -- Tax ID is 9 numbers with two hyphens
    hired DATE NOT NULL, -- ex. 2022-02-19 
    experience INT NOT NULL,
    salary DECIMAL(10,0) NOT NULL,
    PRIMARY KEY(username),
    UNIQUE (taxID),
    CONSTRAINT employee_ibfk_1 FOREIGN KEY(username) REFERENCES user(username)
    )ENGINE=InnoDB;
    
INSERT INTO employee VALUES('agarcia7', '999-99-9999', '2019-03-17', 24, 41000), 
 ('awilson5','111-11-1111', '2020-03-15', 9, 46000),('bsummers4','000-00-0000', '2018-12-06', 17, 35000),
 ('ckann5','640-81-2357', '2019-08-03', 27, 46000),('csoares8','888-88-8888', '2019-02-25', 26, 57000),
 ('echarles19','777-77-7777', '2021-01-02', 3, 27000),('eross10','444-44-4444', '2020-04-17', 10, 61000),
 ('fprefontaine6','121-21-2121', '2020-04-19', 5, 20000),('hstark16','555-55-5555', '2018-07-23', 20, 59000),
 ('lrodriguez5','222-22-2222', '2019-04-15', 20, 58000),('mrobot1','101-01-0101', '2015-05-27', 8, 38000),
 ('mrobot2','010-10-1010', '2015-05-27', 8, 38000),('rlopez6','123-58-1321', '2017-02-05', 51, 64000),
 ('tmccall5','333-33-3333', '2018-10-17', 29, 33000);
    
DROP TABLE IF EXISTS pilot;
CREATE TABLE pilot (
	username VARCHAR(40) NOT NULL,
    licenseID CHAR(6) NOT NULL,
    experience INT NOT NULL,
    PRIMARY KEY(username),
    UNIQUE (licenseID),
    CONSTRAINT pilot_ibfk_1 FOREIGN KEY(username) REFERENCES employee(username)
    )ENGINE=InnoDB;
INSERT INTO pilot VALUES('agarcia7', '610623', 38),('awilson5', '314159', 41),
('bsummers4', '411911', 35),('csoares8', '343563', 7),('echarles19', '236001', 10),
('fprefontaine6', '657483', 2),('lrodriguez5', '287182', 67),('mrobot1', '101010', 18),
('rlopez6', '235711', 58),('tmccall5', '181633', 10);

  
DROP TABLE IF EXISTS worker;
CREATE TABLE worker (
	username VARCHAR(40) NOT NULL,
	PRIMARY KEY(username),
    CONSTRAINT worker_ibfk_1 FOREIGN KEY(username) REFERENCES employee(username)
    )ENGINE=InnoDB;

INSERT INTO worker VALUES('ckann5'),('csoares8'),('echarles19'),('eross10'),
('hstark16'),('mrobot2'),('tmccall5');
    


DROP TABLE IF EXISTS location;
CREATE TABLE location ( 
-- Dataset does not clearly specify label and space
	label VARCHAR(40) NOT NULL,
    space INT,
    x_coord DECIMAL(3, 0), 
    y_coord DECIMAL(3, 0), 
    PRIMARY KEY(label)
)ENGINE=InnoDB;

INSERT INTO location VALUES('plaza', 10, -4, -3),
('buckhead', 8, 7, 10), ('avalon', null, 2,15),('mercedes', null, -8, 5),
('midtown', 7, 2, 1),('southside', 5, 1, - 16), ('airport', 15, 5, -6),
('highpoint', 4, 11, 3);

DROP TABLE IF EXISTS restaurant;
CREATE TABLE restaurant (
	name_ VARCHAR(40) NOT NULL,
    rating INT NOT NULL,
    spent DECIMAL(3,0) NOT NULL,
    location VARCHAR(40) NOT NULL,
    PRIMARY KEY (name_),
    CONSTRAINT restaurant_ibfk_1 FOREIGN KEY (location) REFERENCES location(label)    -- need to create location table to implement foreign key
    )ENGINE=InnoDB;
INSERT INTO restaurant VALUES('Bishoku', 5, 10, 'plaza'),('Casi Cielo', 5, 30, 'plaza'),
('Ecco', 3, 0, 'buckhead'),('Fogo de Chao', 4, 30, 'buckhead'),('Hearth', 4, 0, 'avalon'),
('Il Giallo', 4, 10, 'mercedes'), ('Lure', 5, 20, 'midtown'),('Micks', 2, 0, 'southside'),
('South City Kitchen', 5, 30, 'midtown'),('Tre Vele', 4, 10, 'plaza');

   
DROP TABLE IF EXISTS service; 
CREATE TABLE service (
	ID VARCHAR(40) NOT NULL,
    long_name VARCHAR(100),
    home_base VARCHAR(40),
    manager VARCHAR(40),
    PRIMARY KEY (ID),
    CONSTRAINT service_ibfk_1 FOREIGN KEY(manager) REFERENCES worker(username),
    CONSTRAINT service_ibfk_2 FOREIGN KEY (home_base) REFERENCES location(label)
    )ENGINE=InnoDB;
INSERT INTO service VALUES('rr','Ravishing Radish','avalon','echarles19'),('hf','Herban Feast','southside','hstark16'),
('osf', 'On Safari Foods','southside','eross10');    

    
DROP TABLE IF EXISTS drone;
CREATE TABLE drone (
	ID VARCHAR(40) NOT NULL,
    tag INT NOT NULL, 
    fuel INT NOT NULL,
    capacity INT NOT NULL,
    sales INT NOT NULL,
    flown_by VARCHAR(40),
    hover VARCHAR(40) NOT NULL,
    swarmDroneID VARCHAR(40),
    swarmDroneTag INT,
    PRIMARY KEY (ID,tag),
    CONSTRAINT drone_ibfk_1 FOREIGN KEY (ID) REFERENCES service(ID),
    CONSTRAINT drone_ibfk_2 FOREIGN KEY (hover) REFERENCES location(label),
    CONSTRAINT drone_ibfk_3 FOREIGN KEY (flown_by) REFERENCES pilot(username),
	CONSTRAINT drone_ibfk_4 FOREIGN KEY (swarmDroneID, swarmDroneTag) REFERENCES drone(ID, tag)
    )ENGINE=InnoDB;
    
INSERT INTO drone VALUES('hf',1, 100, 6, 0, 'fprefontaine6','southside', null, null), 
('hf', 5, 27, 7, 100, 'fprefontaine6', 'southside', null, null),
('hf', 8, 100, 8, 0, 'bsummers4', 'southside', null, null),
('hf', 11, 25, 10, 0, null,'buckhead', 'hf',5),
('hf', 16, 17, 5, 40, 'fprefontaine6', 'buckhead', null, null),
('osf', 1, 100, 9, 0, 'awilson5','airport', null, null),
('osf', 2, 75, 7, 0, null,'airport', 'osf',1),
('rr', 3, 100, 5, 50, 'agarcia7', 'avalon', null, null),
('rr', 7, 53, 5, 100, 'agarcia7', 'avalon', null, null),
('rr', 8, 100, 6, 0, 'agarcia7','highpoint', null, null),
('rr', 11, 90, 6, 0, null, 'highpoint', 'rr',8);


DROP TABLE IF EXISTS Fund; 
CREATE TABLE Fund (
	Restaurant VARCHAR(100) NOT NULL,
	funded_by VARCHAR(40) NOT NULL,
    amount_invested DECIMAL(5,0),
    dt_invested DATE,
    PRIMARY KEY (Restaurant, funded_by),
    CONSTRAINT fund_ibfk_1 FOREIGN KEY (Restaurant) REFERENCES restaurant(name_),
    CONSTRAINT fund_ibfk_2 FOREIGN KEY (funded_by) REFERENCES owner(username)
    )ENGINE=InnoDB;
INSERT INTO Fund VALUES('Ecco','jstone5',20,'2022-10-25'),
('Il Giallo','sprince6',10,'2022-03-06'),('Lure','jstone5',30,'2022-09-08'),
('South City Kitchen','jstone5',5, '2022-07-25');


DROP TABLE IF EXISTS works_for; 
CREATE TABLE works_for(
	employee VARCHAR(40) NOT NULL,
    employed_by VARCHAR(40) NOT NULL,
    PRIMARY KEY (employee, employed_by),
    CONSTRAINT worksfor_ibfk_1 FOREIGN KEY (employee) REFERENCES employee(username),
    CONSTRAINT worksfor_ibfk_2 FOREIGN KEY (employed_by) REFERENCES service(ID)
	)ENGINE=InnoDB;

INSERT INTO works_for VALUES('agarcia7', 'rr'), ('awilson5','osf'),
('bsummers4', 'hf'),('ckann5','osf'), ('echarles19','rr'),('eross10','osf'),
('fprefontaine6','hf'),('hstark16', 'hf'), ('mrobot1','osf'),('mrobot1','rr'),
('rlopez6','rr'),('tmccall5','hf');

DROP TABLE IF EXISTS ingredient;
CREATE TABLE ingredient (
	barcode VARCHAR(40) NOT NULL,
    iname VARCHAR(100),
    weight INT,
    PRIMARY KEY(barcode)
    )ENGINE=InnoDB;
    
INSERT INTO ingredient VALUES('bv_4U5L7M', 'balsamic vinegar', 4),
('clc_4T9U25X','caviar', 5),('pr_3C6A9R', 'prosciutto',6),('ap_9T25E36L', 'foie gras',4),
('ss_2D4E6L','saffron',3),('hs_5E7L23M', 'truffles', 3);

DROP TABLE IF EXISTS contains; 
CREATE TABLE contains(
	droneSID VARCHAR(40) NOT NULL,
    droneTag INT NOT NULL,
    ingredient VARCHAR(40) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(5,0) NOT NULL,
    PRIMARY KEY(droneSID, droneTag, ingredient),
    CONSTRAINT contains_ibfk_1 FOREIGN KEY(droneSID, droneTag) REFERENCES drone(ID, tag),
    CONSTRAINT contains_ibfk_2 FOREIGN KEY(ingredient) REFERENCES ingredient(barcode)
    )ENGINE=InnoDB;
INSERT INTO contains VALUES('rr', 3, 'clc_4T9U25X', 2, 28),('hf', 5, 'clc_4T9U25X', 1, 30),
('osf', 1, 'pr_3C6A9R', 5, 20), ('hf', 8, 'pr_3C6A9R', 4, 18),('osf', 1, 'ss_2D4E6L',3, 23),
('hf', 11, 'ss_2D4E6L', 3, 19), ('hf', 1, 'ss_2D4E6L', 6, 27), ('osf', 2, 'hs_5E7L23M', 7, 14),
 ('rr', 3, 'hs_5E7L23M', 2, 15), ('hf', 5, 'hs_5E7L23M', 4, 17);




