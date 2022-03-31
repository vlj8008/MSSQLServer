create database db_school

use db_school

create table tb_Class (
Class_ID int primary key not null identity (1000, 10), 
Class_Name varchar(50) not null
);

select *
from tb_Class

create table tb_Instructors(
Instructor_ID int primary key not null identity(1,1),
Instructor_Name varchar(50)
);

create table tb_Students(
Student_ID int primary key not null identity (1,1),
Student_Name varchar(50)
);

alter table tb_Students
add Class_ID int;

alter table tb_Students
add Instructor_ID int;

select *
from tb_Students

alter table tb_Students
add foreign key (Class_ID) references tb_Class(Class_ID);

alter table tb_Students
add foreign key (Instructor_ID) references tb_Instructors(Instructor_ID);

insert into tb_Class(Class_Name)
values
('Software Developer Bootcamp'),
('C# Bootcamp');

select *
from tb_Class

insert into tb_Students(Student_Name)
values
('Bob Smith'),
('Lee Jones'),
('Jan Lee'),
('Billy Jackson'),
('Mark Jones'),
('Peter Jones');

select *
from tb_Students

insert into tb_Instructors(Instructor_Name)
values
('Professor Lilly Jones'),
('Professor Jack Delly');

select *
from tb_Instructors

update tb_Students
set Class_ID = 1000, Instructor_ID = 2
where Student_ID = 5;

select*
from tb_Students

select *
from tb_Instructors

select *
from tb_Students


select*
from tb_Class

select*
from tb_Instructors

select tb_Students.Student_Name, tb_Class.Class_Name, tb_Instructors.Instructor_Name
from ((tb_Students
inner join tb_Class on tb_Students.Class_ID = tb_Class.Class_ID)
inner join tb_Instructors on tb_Students.Instructor_ID = tb_Instructors.Instructor_ID);