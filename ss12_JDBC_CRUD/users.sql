drop database if exists users;

create database users;

use users;

create table users(
	id int primary key auto_increment not null,
    name varchar(45) not null,
    email varchar(50) not null,
    country varchar(50)
);
 create table employee(
	id int primary key,
    name varchar(45),
    salary double
 );
 
create table Permision(
	id int primary key,
    name varchar(50)
);

create table User_Permision(
	permision_id int,
	user_id int
);

insert into Permision(id, name) values(1, 'add'),(2, 'edit'),(3, 'delete'),(4, 'view');

insert into users(name,email,country) value("trung","Dntrung1","huế");
insert into employee(id,name,salary) value(1,"trung",100);

DELIMITER $$

CREATE PROCEDURE get_user_by_id(IN user_id INT)

BEGIN

    SELECT users.name, users.email, users.country

    FROM users

    where users.id = user_id;

    END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE insert_user(

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)

)
BEGIN

    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);

    END$$

DELIMITER ;


DELIMITER $$
CREATE PROCEDURE update_user(
in user_id int,

IN user_name varchar(50),

IN user_email varchar(50),

IN user_country varchar(50)
)
BEGIN

    update users set name = user_name, email = user_email, country = user_country
    where id = user_id;

    END$$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE delete_user(
in user_id int
)
BEGIN
    delete from users
    where id = user_id;
    END$$

DELIMITER ;


