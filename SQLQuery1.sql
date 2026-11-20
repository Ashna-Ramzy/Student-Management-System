CREATE DATABASE student;

USE student;

create table student 
(student_id int identity(1,1) primary key not null,
student_First_name varchar(20),
student_last_name varchar(40),
email varchar (50),
status varchar (40)
);

USE student;

create table course
(course_id int identity (1,1) primary key not null,
course_name varchar(40),
Duration Varchar (40)
);

USE student;

create table enroll(
Enroll_id int primary key identity (1,1),
student_id int,
course_id int,
enrollDate date,
foreign key (student_id) references student (student_id),
foreign key (course_id) references course(course_id)
);

