
Create database Zest;

Use zest;

/*Table structure for table `users` */
create table students(
studentID int  AUTO_INCREMENT,
studentLastName varchar(50),
studentFirstName varchar (50),
studentUserName varchar (50),
studentEmail varchar (50),
password varchar(50),
primary key(studentID));



/*Table structure for table `login information` */
Create table loginInformation(
loginID int AUTO_INCREMENT,
userName varchar (50),
password varchar (50),
loginDate date,
Primary Key (loginID));


create table tutorialsessions(
    sessionID INT,
    tutorName VARCHAR(50),
    tutorEmail varchar(50),
    meetingLink varchar(50),
    Date DATE,
    startTime TIME,
    endTime TIME,
    availability BOOLEAN, 
    Primary KEY (sessionID));

   
create table bookedsessions(
bookedsessionID int AUTO_INCREMENT,
confirmationNumber VARCHAR (50),
sessionID int,
studentID int,
tutorName VARCHAR(50),
Date DATE,
startTime TIME,
endTime TIME,
Primary KEY (bookedsessionID)); 

  
INSERT into tutorialsessions (sessionID, tutorName, Date, startTime , endTime, available, reviews )
VALUES (1,'Nadine Check', '2023-05-02', '14:00:00', '15:00:00', true, '   ' ),
(2, 'Brian Fongyen','2023-05-10', '19:00:00', '20:00:00', true, '  '),
(3, 'Tenzin Namsel','2023-05-15', '20:00:00', '21:00:00', true, '  ');


