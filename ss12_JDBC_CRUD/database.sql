drop database if exists users;

create database users;

use users;

create table users(
	id int primary key auto_increment not null,
    name varchar(45) not null,
    email varchar(50) not null,
    country varchar(50)
);