-- CS4400: Introduction to Database Systems
-- Fall 2022
-- Phase II Create Table and Insert Statements

-- Team 38
-- Maisa Basher (
-- Denny Nguyen (dnguyen369)
-- Ajoke Akinseye (aakinseye3)


-- CREATE DATABASE STATEMENTS BELOW
DROP DATABASE IF EXISTS rdd;
CREATE DATABASE IF NOT EXISTS rdd;
use rdd;

-- CREATE TABLE STATEMENTS BELOW

DROP table if exists user;
CREATE TABLE user (
	username varchar(200) not null,
    address varchar(200) not null,
    birthdate date not null,
    first_name varchar(200) not null,
    last_name varchar(200) not null,
    primary key (username)
    );
    
DROP table if exists owner;
CREATE TABLE owner (
    username varchar(200) not null,
    debt integer not null,
    primary key (username),
	foreign key (username) references user(username)
    );
    
DROP table if exists employee;
CREATE TABLE employee (
	username varchar(200) not null,
    taxID varchar(11) not null, -- Tax ID is 9 numbers with two hyphens
    experience int not null,
    hired varchar(10) not null, -- ex. 2022-02-19 
    salary int not null,
    primary key (username),
    foreign key (username) references user(username)
    );
    
DROP table if exists ingredient;
CREATE TABLE ingredient (
	barcode varchar(15),
    iname varchar(15),
    weight int
    );
    
DROP table if exists pilot;
CREATE TABLE pilot (
	username varchar(200) not null,
    experience int,
    license_type int, -- I assumed this is licenseID per the dataset 
    primary key (username),
    foreign key (username) references user(username)
    );
   
DROP table if exists worker;
CREATE TABLE worker (
	username varchar(200) not null,
	primary key (username),
    foreign key (username) references user(username)
    );

DROP table if exists location;
CREATE TABLE location ( 
		  	-- Dataset does not clearly specify label and space
);


DROP table if exists restaurant;
CREATE TABLE restaurant (
	name_ varchar(200) not null,
    spent int not null,
    rating int not null,
    location varchar(20) not null,
    primary key (name_),
    foreign key (location) references location(label)    -- need to create location table to implement foreign key
    );
   
DROP table if exists service; 
CREATE TABLE service (
	ID int not null,
    name_ varchar(20) not null,
    location varchar(20) not null,
    primary key (ID),
    foreign key (location) references location(label)
    );
    
DROP table if exists drone;
CREATE TABLE drone (
	ID int not null,
    tag int not null, 
    fuel int not null,
    cost int not null,
    capacity int not null,
    sales int not null,
    weight int not null,
    location varchar(20) not null);
    -- I'm confused about the ControllerPilot foreign key