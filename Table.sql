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
use RestaurantSupplyExpressDroneDelivery;

-- CREATE TABLE STATEMENTS BELOW

DROP table if exists user;
CREATE TABLE user (
	username varchar(40) not null,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    address varchar(100) not null,
    birthdate date not null,
    primary key (username)
    );
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
    username varchar(40) not null,
    debt decimal(5,2),
    primary key (username),
	foreign key (username) references user(username)
    );
    
INSERT INTO owner VALUES('cjordan5',null),('jstone5', null),('sprince6', null);
    
DROP table if exists employee;
CREATE TABLE employee (
	username varchar(40) not null,
    taxID char(11) not null, -- Tax ID is 9 numbers with two hyphens
    hired date not null, -- ex. 2022-02-19 
    experience int not null,
    salary decimal(10,2) not null,
    primary key (username),
    foreign key (username) references user(username)
    );
    
INSERT INTO employee VALUES('agarcia7', '999-99-9999', '2019-03-17', 24, 41000), 
 ('awilson5','111-11-1111', '2020-03-15', 9, 46000),('bsummers4','000-00-0000', '2018-12-06', 17, 35000),
 ('ckann5','640-81-2357', '2019-08-03', 27, 46000),('csoares8','888-88-8888', '2019-02-25', 26, 57000),
 ('echarles19','777-77-7777', '2021-01-02', 3, 27000),('eross10','444-44-4444', '2020-04-17', 10, 61000),
 ('fprefontaine6','121-21-2121', '2020-04-19', 5, 20000),('hstark16','555-55-5555', '2018-07-23', 20, 59000),
 ('lrodriguez5','222-22-2222', '2019-04-15', 20, 58000),('mrobot1','101-01-0101', '2015-05-27', 8, 38000),
 ('mrobot2','010-10-1010', '2015-05-27', 8, 38000),('rlopez6','123-58-1321', '2017-02-05', 51, 64000),
 ('tmccall5','333-33-3333', '2018-10-17', 29, 33000);
    
DROP table if exists pilot;
CREATE TABLE pilot (
	username varchar(15) not null,
    licenseID char(6) not null, -- I assumed this is licenseID per the dataset 
    experience int not null,
    primary key (username),
    foreign key (username) references employee(username)
    );
INSERT INTO pilot VALUES('agarcia7', '610623', 38),('awilson5', '314159', 41),
('bsummers4', '411911', 35),('csoares8', '343563', 7),('echarles19', '236001', 10),
('fprefontaine6', '657483', 2),('lrodriguez5', '287182', 67),('mrobot1', '101010', 18),
('rlopez6', '235711', 58),('tmccall5', '181633', 10);

  
DROP table if exists worker;
CREATE TABLE worker (
	username varchar(15) not null,
	primary key (username),
    foreign key (username) references employee(username)
    );

INSERT INTO worker VALUES('ckann5'),('csoares8'),('echarles19'),('eross10'),
('hstark16'),('mrobot2'),('tmccall5');
    


DROP table if exists location;
CREATE TABLE location ( 
-- Dataset does not clearly specify label and space
	label varchar(40) not null,
    space INT,
    x_coord decimal(3, 0), 
    y_coord decimal(3, 0), 
    primary key (label)
);

INSERT INTO location VALUES('plaza', 10, -4, -3),
('buckhead', 8, 7, 10), ('avalon', null, 2,15),('mercedes', null, -8, 5),
('midtown', 7, 2, 1),('southside', 5, 1, - 16), ('airport', 15, 5, -6),
('highpoint', 4, 11, 3);

DROP table if exists restaurant;
CREATE TABLE restaurant (
	name_ varchar(100) not null,
    rating int not null,
    spent int not null,
    location varchar(40) not null,
    primary key (name_),
    foreign key (location) references location(label)    -- need to create location table to implement foreign key
    );
INSERT INTO restaurant VALUES('Bishoku', 5, 10, 'plaza'),('Casi Cielo', 5, 30, 'plaza'),
('Ecco', 3, 0, 'buckhead'),('Fogo de Chao', 4, 30, 'buckhead'),('Hearth', 4, 0, 'avalon'),
('Il Giallo', 4, 10, 'mercedes'), ('Lure', 5, 20, 'midtown'),('Micks', 2, 0, 'southside'),
('South City Kitchen', 5, 30, 'midtown'),('Tre Vele', 4, 10, 'plaza');

   
DROP table if exists service; 
CREATE TABLE service (
	ID varchar(40) not null,
    long_name varchar(100),
    home_base varchar(40),
    manager varchar(40),
    primary key (ID),
    foreign key (manager) references worker(username),
    foreign key (home_base) references location(label)
    );
INSERT INTO service VALUES('rr','Ravishing Radish','avalon','echarles19'),('hf','Herban Feast','southside','hstark16'),
('osf', 'On Safari Foods','southside','eross10');    

    
DROP table if exists drone;
CREATE TABLE drone (
	ID varchar(40) not null,
    tag int not null, 
    fuel int not null,
    capacity int not null,
    sales int not null,
    flown_by varchar(40),
    hover varchar(40) not null,
    swarmDroneID varchar(40),
    swarmDroneTag int,
    PRIMARY KEY (ID,tag),
    foreign key (ID) references service(ID),
    foreign key (hover) references location(label),
    foreign key (flown_by) references pilot(username),
	foreign key (swarmDroneID, swarmDroneTag) references drone(ID, tag) on update cascade
    );
    
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


DROP table if exists Fund; 
CREATE TABLE Fund (
	Restaurant varchar(100) not null,
	funded_by varchar(40) not null,
    amount_invested decimal(5,0),
    dt_invested date,
    foreign key (Restaurant) references restaurant(name_),
    foreign key (funded_by) references owner(username)
    );
INSERT INTO Fund VALUES('Ecco','jstone5',20,'2022-10-25'),
('Il Giallo','sprince6',10,'2022-03-06'),('Lure','jstone5',30,'2022-09-08'),
('South City Kitchen','jstone5',5, '2022-07-25');


DROP table if exists works_for; 
CREATE TABLE works_for(
	employee varchar(40) not null,
    employed_by varchar(40) not null,
    PRIMARY KEY (employee, employed_by),
    foreign key (employee) references employee(username),
    foreign key (employed_by) references service(ID)
	);

INSERT INTO works_for VALUES('agarcia7', 'rr'), ('awilson5','osf'),
('bsummers4', 'hf'),('ckann5','osf'), ('echarles19','rr'),('eross10','osf'),
('fprefontaine6','hf'),('hstark16', 'hf'), ('mrobot1','osf'),('mrobot1','rr'),
('rlopez6','rr'),('tmccall5','hf');

DROP table if exists ingredient;
CREATE TABLE ingredient (
	barcode varchar(40) not null,
    iname varchar(100),
    weight int,
    PRIMARY KEY(barcode)
    );
INSERT INTO ingredient VALUES('bv_4U5L7M', 'balsamic vinegar', 4),
('clc_4T9U25X','caviar', 5),('pr_3C6A9R', 'prosciutto',6),('ap_9T25E36L', 'foie gras',4),
('ss_2D4E6L','saffron',3),('hs_5E7L23M', 'truffles', 3);

DROP table if exists contains; 
CREATE TABLE contains(
	droneSID varchar(40) not null,
    droneTag int not null,
    ingredient varchar(40) not null,
    quantity int not null,
    price decimal(5,0) not null,
    PRIMARY KEY(droneSID, droneTag, ingredient),
    foreign key (droneSID, droneTag) references drone(ID, tag),
    foreign key (ingredient) references ingredient(barcode)
    );
INSERT INTO contains VALUES('rr', 3, 'clc_4T9U25X', 2, 28),('hf', 5, 'clc_4T9U25X', 1, 30),
('osf', 1, 'pr_3C6A9R', 5, 20), ('hf', 8, 'pr_3C6A9R', 4, 18),('osf', 1, 'ss_2D4E6L',3, 23),
('hf', 11, 'ss_2D4E6L', 3, 19), ('hf', 1, 'ss_2D4E6L', 6, 27), ('osf', 2, 'hs_5E7L23M', 7, 14),
 ('rr', 3, 'hs_5E7L23M', 2, 15), ('hf', 5, 'hs_5E7L23M', 4, 17);




