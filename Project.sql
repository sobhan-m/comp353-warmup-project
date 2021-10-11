# Test 1

CREATE database Project;
USE Project;

/*
====================================================================
 Person
====================================================================
*/

CREATE TABLE Person(
id INT AUTO_INCREMENT,
firstName VARCHAR(100),
lastName VARCHAR(100),
dateOfBirth DATE,
telephoneNumber INT,
address VARCHAR(100),
city VARCHAR(100),
province ENUM('NL','PE','NS','NB','QC','ON','MB','SK','AB','BC','YT','NT','NU'),
postalCode VARCHAR(6),
citizenship VARCHAR(100),
emailAddress VARCHAR(100),
ageGroupID INT,
PRIMARY KEY(id),
FOREIGN KEY (ageGroupID) REFERENCES AgeGroup(groupID)
);
#("80+"), 1
#("70-79"), 2 
#("60-69"), 3
#("50-59"), 4
#("40-49"), 5
#("30-39"), 6
#("18-29"), 7
#("12-17"), 8
#("5-11"), 9
#("0-4"); 10
INSERT INTO Person (firstName, lastName, dateOfBirth, telephoneNumber, address, city, province, postalCode, citizenship, emailAddress, ageGroupID) 
VALUES ("John", "Smith", '1990-01-01', 000000, '100 Guy Street', 'Montreal', 'QC', 'A1A1A1', 'Canadian', 'john.smith@gmail.com', 6),
("Mark", "Julius", '1987-10-23', 111111, '200 Maisonneuve Street', 'Almaty', 'NB', 'B1B1B1', 'Kazakhastanian', 'mark.julius@gmail.com', 5),
("Jackie", "Chan", '2000-03-30', 222222, '1980 Norman Street', 'Kawasaki', 'NL', 'C1C1C1', 'Japanese', 'jackie.chan@gmail.com', 7),
("Bruce", "Lee", '2021-09-01', 333333, '3475 De la montagne Street', 'Bandung', 'PE', 'D1D1D1', 'Indian', 'bruce.goerge@gmail.com', 10),
("King", "George", '1960-03-20', 444444, '5000 Peel Street', 'Sapporo', 'NS', 'E1E1E1', 'Japanese', 'king.george@gmail.com', 3),
("Vanilla", "Ice", '1975-01-01', 555555, '2001 Dutrisac Street', 'Baghdad', 'ON', 'F1F1F1', 'Indian', 'vanilla.ice@gmail.com', 5),
("Rock", "Lee", '2003-11-10', 666666, '1111 Fillion Street', 'Shiraz', 'MB', 'G1G1G1', 'Iranian', 'rock.lee@gmail.com', 7),
("Black", "Reaper", '2017-01-01', 777777, '908 Deguire Street', 'Praque', 'SK', 'H1H1H1', 'Czechinians', 'black.reaper@gmail.com', 10),
("Naruto", "Uzumaki", '1974-10-28', 888888, '743 Cleroux Street', 'Kathmandu', 'AB', 'I1I1I1', 'Nepalian', 'naruto.uzumaki@gmail.com', 5),
("Monkey", "Luffy", '2011-12-02', 999999, '1111 Sherbrook Street', 'Yokohama', 'YT', 'J1J1J1', 'Japanese', 'monkey.luffy@gmail.com', 9),
("John", "Cena", '1980-01-01', 100000, '101 Guy Street', 'Montreal', 'QC', 'K1K1K1', 'Canadian', 'john.cena@gmail.com', 5),
("Xin", "Lu", '1977-10-23', 211111, '201 Maisonneuve Street', 'Almaty', 'NB', 'L1L1L1', 'Kazakhastanian', 'xin.lu@gmail.com', 5),
("Spongebob", "Squarepants", '1990-03-30', 322222, '1981 Norman Street', 'Kawasaki', 'NL', 'M1M1M1', 'Japanese', 'spongebob.squarepants@gmail.com', 6),
("Sanji", "Blackleg", '2011-09-01', 433333, '3476 De la montagne Street', 'Bandung', 'PE', 'N1N1N1', 'Indian', 'Sanji.Blackleg@gmail.com', 9),
("Black", "Beard", '1950-03-20', 544444, '5001 Peel Street', 'Sapporo', 'NS', 'O1O1O1', 'Japanese', 'black.beard@gmail.com', 2),
("Junior", "Desolo", '1965-01-01', 655555, '2002 Dutrisac Street', 'Baghdad', 'ON', 'P1P1P1', 'Indian', 'junior.desolo@gmail.com', 4),
("Adrien", "Burns", '1993-11-10', 766666, '1112 Fillion Street', 'Shiraz', 'MB', 'Q1Q1Q1', 'Iranian', 'adrien.burns@gmail.com', 7),
("Tala", "Sleeman", '2007-01-01', 877777, '909 Deguire Street', 'Praque', 'SK', 'R1R1R1', 'Czechinians', 'tala.sleeman@gmail.com', 8),
("Malek", "Jerbi", '1964-10-28', 988888, '744 Cleroux Street', 'Kathmandu', 'AB', 'S1S1S1', 'Nepalian', 'malek.jerbi@gmail.com', 4),
("Hercules", "DeGreece", '2001-12-02', 099999, '1112 Sherbrook Street', 'Yokohama', 'YT', 'T1T1T1', 'Japanese', 'Hercules.degreece@gmail.com', 7);
#("80+"), 1
#("70-79"), 2 
#("60-69"), 3
#("50-59"), 4
#("40-49"), 5
#("30-39"), 6
#("18-29"), 7
#("12-17"), 8
#("5-11"), 9
#("0-4"); 10
SELECT * FROM Person;

DROP TABLE Person;

/*
====================================================================
 Registered Person
====================================================================
*/

CREATE TABLE Registered(
id INT,
medicareCardNum INT AUTO_INCREMENT,
medicareIssueDate DATE,
medicareExpiryDate DATE,
PRIMARY KEY (medicareCardNum),
FOREIGN KEY (id) REFERENCES Person(id)
);
INSERT INTO Registered (id, medicareIssueDate, medicareExpiryDate)
VALUES(000000, '1990-01-01','2040-01-01'),
(111111,'1987-10-23', '2037-10-23'),
(222222, '2000-03-30', '2050-03-30'),
(333333, '2021-09-01', '2071-09-01'),
(444444, '1960-03-20', '2022-03-20'),
(555555, '1975-01-01', '2025-01-01'),
(666666, '2003-11-10', '2053-11-10'),
(777777, '2017-01-01', '2067-01-01'),
(888888, '1974-10-28', '2024-10-28'),
(999999, '2011-12-02', '2011-12-02');

/*
====================================================================
 Unregistered Person
====================================================================
*/

CREATE TABLE Unregistered(
id INT,
passportNum INT AUTO_INCREMENT,
PRIMARY KEY (passportNum),
FOREIGN KEY (id) REFERENCES Person(id)
);

INSERT INTO Unregistered(id)
VALUES (11),(12),(13),(14),(15),(16),(17),(18),(19),(20);

SELECT * FROM Unregistered;

DROP TABLE Unregistered;
/*
====================================================================
 Age Group
====================================================================
*/

CREATE TABLE AgeGroup(
groupID int AUTO_INCREMENT,
groupDescription VARCHAR(20),
PRIMARY KEY (groupID));

INSERT INTO AgeGroup (groupDescription)
VALUES ("80+"), 
("70-79"), 
("60-69"), 
("50-59"), 
("40-49"), 
("30-39"), 
("18-29"), 
("12-17"), 
("5-11"), 
("0-4");

SELECT * FROM AgeGroup;

DROP TABLE AgeGroup;
/*
====================================================================
 Infection History
====================================================================
*/

CREATE TABLE InfectionHistory(
personID INT,
infectionDate DATE,
PRIMARY KEY (personID, infectionDate),
FOREIGN KEY (personID) REFERENCES Person(id)
);

INSERT INTO InfectionHistory(personID, infectionDate)
VALUES(6,'2020-10-10'),(16,'2020-09-09'),(19, '2020-08-08'),(8, '2020-07-07'),(9, '2020-06-06'),
(5, '2020-05-05'),(11, '2020-04-04'),(13, '2020-03-03'),(1, '2020-02-02'),(3, '2020-01-01');

SELECT * FROM InfectionHistory;

DROP TABLE InfectionHistory;
/*
====================================================================
 Health Worker
====================================================================
*/

CREATE TABLE HealthWorker(
workerID INT AUTO_INCREMENT,
id INT,
employeeType ENUM("Nurse", "Manager", "Security", "Secretary", "Regular Employee"),
PRIMARY KEY (workerID),
FOREIGN KEY (id) REFERENCES Person(id)
);

INSERT INTO HealthWorker(id, employeeType)
VALUES(1,'Manager'),(2, 'Nurse'), (3, 'Security'), (4, 'Secretary'),(5, 'Regular Employee'),(6, 'Nurse'),
(7, 'Security'),(8, 'Regular Employee'),(9, 'Nurse'),(10, 'Security');

SELECT * FROM HealthWorker;

DROP TABLE HealthWorker;

/*
====================================================================
 Health Worker
====================================================================
*/

CREATE TABLE PublicHealthFacilities(
name VARCHAR(100),
address VARCHAR(100),
phoneNumber INT,
webAddress VARCHAR(100),
facilityType ENUM('HOSPITAL', 'CLINIC', 'SPECIAL INSTALLMENT'),
capacity INT,
managerID INT,
FOREIGN KEY (managerID) REFERENCES HealthWorker(workerID),
PRIMARY KEY (name)
);

/*
====================================================================
 Assignments
====================================================================
*/

CREATE TABLE Assignments(
workerID INT,
facilityName VARCHAR(100),
startDate DATE,
endDate DATE,
PRIMARY KEY (workerID, facilityName),
FOREIGN KEY (workerID) REFERENCES HealthWorker(workerID),
FOREIGN KEY (facilityName) REFERENCES PublicHealthFacilities(name)
);

/*
====================================================================
 ApprovedVaccinations
====================================================================
*/

CREATE TABLE ApprovedVaccinations(
vaccinationName VARCHAR(100),
dateOfApproval DATE,
vaccinationType ENUM("SAFE","SUSPENDED"),
dateOfSuspension DATE,
PRIMARY KEY (vaccinationName)
);

INSERT INTO ApprovedVaccinations(vaccinationName, dateOfApproval, vaccinationType, dateOfSuspension)
 VALUES('AstraZeneca', '2020-10-28', 'SAFE', NULL), ('Pfizer', '2020-06-10', 'SAFE', NULL),
 ('JJ', '2021-01-03', 'SUSPENDED', '2021-02-04'), ('Moderna', '2020-04-04', 'SAFE', NULL);
/*
====================================================================
 Vaccinations
====================================================================
*/

CREATE TABLE Vaccinations(
id INT,
healthWorkerID INT,
vaccinationName VARCHAR(100),
vaccinationDate DATE,
lotNumber INT,
location VARCHAR(100),
country VARCHAR(100),
doseNumber INT,
PRIMARY KEY (id, vaccinationDate),
FOREIGN KEY (id) REFERENCES Person(id),
FOREIGN KEY (healthWorkerID) REFERENCES HealthWorker(workerID),
FOREIGN KEY (vaccinationName) REFERENCES ApprovedVaccinations(vaccinationName)
);

/*
====================================================================
Queries
====================================================================
*/

-- 1

-- 2

-- 3

-- 4

-- 5

-- 6

-- 7

-- 8

-- 9

