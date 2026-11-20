CREATE DATABASE StudentManagementSystem;
GO

USE StudentManagementSystem;
GO

CREATE TABLE dbo.Student
(
    StudentID        INT IDENTITY(1,1) NOT NULL,
    StudentFirstName VARCHAR(100) NOT NULL,
    StudentLastName  VARCHAR(100) NOT NULL,
    Email            VARCHAR(254) NOT NULL,
    [Status]         VARCHAR(20) NOT NULL CONSTRAINT DF_Student_Status DEFAULT N'Active',

    CONSTRAINT PK_Student PRIMARY KEY (StudentID),
    CONSTRAINT UQ_Student_Email UNIQUE (Email),
    CONSTRAINT CK_Student_Status CHECK ([Status] IN (N'Active', N'Inactive')),
    CONSTRAINT CK_Student_Email CHECK (Email LIKE N'%_@_%._%')
);
GO

CREATE TABLE dbo.Course
(
    CourseID   INT IDENTITY(1,1) NOT NULL,
    CourseName NVARCHAR(150) NOT NULL,
    Duration   INT NOT NULL,

    CONSTRAINT PK_Course PRIMARY KEY (CourseID),
    CONSTRAINT UQ_Course_CourseName UNIQUE (CourseName),
    CONSTRAINT CK_Course_Duration CHECK (Duration > 0)
);
GO

CREATE TABLE dbo.Enroll
(
    EnrollID   INT IDENTITY(1,1) NOT NULL,
    StudentID  INT NOT NULL,
    CourseID   INT NOT NULL,
    EnrollDate DATE NOT NULL CONSTRAINT DF_Enroll_EnrollDate DEFAULT CAST(GETDATE() AS DATE),

    CONSTRAINT PK_Enroll PRIMARY KEY (EnrollID),
    CONSTRAINT UQ_Enroll_Student_Course UNIQUE (StudentID, CourseID),
    CONSTRAINT FK_Enroll_Student FOREIGN KEY (StudentID)
        REFERENCES dbo.Student(StudentID),
    CONSTRAINT FK_Enroll_Course FOREIGN KEY (CourseID)
        REFERENCES dbo.Course(CourseID)
);
GO

INSERT INTO dbo.Course (CourseName, Duration)
VALUES 
    (N'java', 30),
    (N'Python Basics', 40),
    (N'Web Development', 60),
    (N'Data Science', 50);

INSERT INTO dbo.Student
    (StudentFirstName, StudentLastName, Email, [Status])
VALUES
    ('John', 'Smith', 'john.smith@example.com', 'Active'),
    ('Ashna', 'Ramzy', 'mary.ashna@123.com', 'Active'),
    ('Hajara', 'Azmy', 'hajara@345gmail.com', 'Active');



INSERT INTO dbo.Enroll (StudentID, CourseID, EnrollDate)
VALUES
    (1, 1, '2026-11-06'),
    (1, 2, '2026-11-06'),
    (2, 3, '2026-11-06');




set identity_insert dbo.Student on;

INSERT INTO Student(studentID, StudentFirstName, StudentLastName, Email, status)
VALUES (1, 'Ashna', 'Ramzy', 'ashna6529@gmail.com', 'active');

SET IDENTITY_INSERT Course OFF;

SELECT * FROM Student;

SELECT * FROM Course;

SELECT * FROM enroll;
GO


USE StudentManagementSystem;
GO

SELECT StudentFirstName, studentLastName
FROM Student
WHERE Status = 'Active';


use StudentManagementSystem;
Go

select* 
from dbo.Student where Email ='john.smith@example.com';

select * 
from dbo.student where StudentID > 0;

INSERT INTO dbo.Student
    (StudentFirstName, StudentLastName, Email, [Status])
VALUES
    ('Amani', 'Zarir', 'amani789@gmail.com', 'Active');

SELECT *
FROM dbo.Student;

alter table Student 
add Adress varchar(50);

update Student
set Adress = 'Colombo'
where StudentID=1;

update Student
set Adress = 'Kandy'
where StudentID=3;

select* 
from Student
where Adress in('Kandy','Colombo');

SELECT StudentID, StudentFirstName, StudentLastName, Email, [Status]
FROM dbo.Student;

SELECT StudentID, StudentFirstName, StudentLastName, Email, [Status]
FROM dbo.Student
ORDER BY StudentID DESC;

SELECT CourseID, CourseName, Duration
FROM dbo.Course
ORDER BY CourseID ASC, CourseName DESC;



INSERT INTO dbo.Student
    (StudentFirstName, StudentLastName, Email, [Status])
VALUES
    ('Ashna', 'Ramzy', 'ashna.ramzy@gmail.com', 'Active'),
    ('Hajara', 'Azmy', 'hajara.azmy@gmail.com', 'Active'),
    ('Nimal', 'Perera', 'nimal.perera@gmail.com', 'Active'),
    ('Kavindi', 'Silva', 'kavindi.silva@gmail.com', 'Inactive'),
    ('Farhan', 'Ali', 'farhan.ali@gmail.com', 'Active');

	select top 5 *
	from Student
	order by StudentID Desc;

SELECT CourseID, CourseName, Duration
FROM dbo.Course
ORDER BY CourseID ASC
OFFSET 2 ROWS
FETCH NEXT 3 ROWS ONLY;

use StudentManagementSystem;
go

select * from student 

select StudentFirstName,
upper (StudentLastName)
from Student;

select StudentLastName,
upper (StudentFirstName)
from Student;

SELECT 
    StudentLastName,
    UPPER(StudentFirstName) AS Student_First_Name
FROM Student;

select upper(StudentFirstName),
lower (StudentLastName)
from Student;

select upper (StudentFirstName) as Student_First_Name,
lower (StudentLastName) as Student_Last_Name
from student;

SELECT 
    UPPER(StudentFirstName + ' ' + StudentLastName) AS Full_Name
FROM Student; 

select lower (StudentFirstName +' '+ StudentLastName) as Full_Name
from Student;

SELECT
    CONCAT(StudentID, ' - ', StudentFirstName, ' ', StudentLastName) AS StudentDetails,
    LOWER(Adress) AS StudentAddress
FROM Student
ORDER BY Email DESC;


select * from student order by Email Desc;


ALTER TABLE Enroll
ADD Marks INT;


INSERT INTO Enroll (StudentID, Marks)
VALUES
(1, 85),
(2, 92),
(3, 76),
(4, 88),
(5, 95);

SELECT *
FROM Enroll;

UPDATE Enroll
SET Marks = 85
WHERE EnrollID = 1;

UPDATE Enroll
SET Marks = 12
WHERE EnrollID = 2;

UPDATE Enroll
SET Marks = 76
WHERE EnrollID = 3;

UPDATE Enroll
SET Marks = 67
WHERE EnrollID = 7;

update enroll set Marks=77 where EnrollID= 10;

select *  from enroll;

SELECT *
FROM Course;

SELECT *
FROM Student;

SELECT *
FROM Enroll;

INSERT INTO Enroll
    (StudentID, CourseID, EnrollDate, Marks)
VALUES
    (1, 1, '2026-11-14', 85),
    (3, 2, '2026-11-14', 92),
    (5, 3, '2026-11-14', 76),
    (6, 4, '2026-11-14', 88),
    (7, 2, '2026-11-14', 95),
    (8, 3, '2026-11-14', 79),
    (9, 4, '2026-11-14', 90);

	SELECT *
FROM Enroll;


