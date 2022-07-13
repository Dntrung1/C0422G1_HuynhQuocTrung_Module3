create database student_management;
use student_management;
create table class(
id_class int auto_increment,
name_class varchar(50),
primary key (id_class)
);

create table teacher(
id_student int auto_increment,
name_student varchar(50),
age_student int,
country_student varchar(100),
primary key (id_student)
);

insert into class(name_class) values ("C0422G1"),("C0322G1");

insert into teacher(name_student,age_student,country_student) values ("Trung",18,"da nang"),("Trong",38,"quang nam");

select * from class;

select * from teacher;
