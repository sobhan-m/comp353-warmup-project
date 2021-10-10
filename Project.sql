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

INSERT INTO Person (id, firstName, lastName, dateOfBirth, telephoneNumber, address, city, province, postalCode, citizenship, emailAddress) 
VALUES (000000, "John", "Smith", '1990-01-01', 000000, '100 Guy Street', 'Montreal', 'QC', 'A1A1A1', 'Canadian', 'john.smith@gmail.com'),
(111111, "Mark", "Julius", '1987-10-23', 111111, '200 Maisonneuve Street', 'Almaty', 'NB', 'B1B1B1', 'Kazakhastanian', 'mark.julius@gmail.com'),
(222222, "Jackie", "Chan", '2000-03-30', 222222, '1980 Norman Street', 'Kawasaki', 'NL', 'C1C1C1', 'Japanese', 'jackie.chan@gmail.com'),
(333333, "Bruce", "Lee", '2021-09-01', 333333, '3475 De la montagne Street', 'Bandung', 'PE', 'D1D1D1', 'Indian', 'bruce.goerge@gmail.com'),
(444444, "King", "George", '1960-03-20', 444444, '5000 Peel Street', 'Sapporo', 'NS', 'E1E1E1', 'Japanese', 'king.george@gmail.com'),
(555555, "Vanilla", "Ice", '1975-01-01', 555555, '2001 Dutrisac Street', 'Baghdad', 'ON', 'F1F1F1', 'Indian', 'vanilla.ice@gmail.com'),
(666666, "Rock", "Lee", '2003-11-10', 666666, '1111 Fillion Street', 'Shiraz', 'MB', 'G1G1G1', 'Iranian', 'rock.lee@gmail.com'),
(777777, "Black", "Reaper", '2017-01-01', 777777, '908 Deguire Street', 'Praque', 'SK', 'H1H1H1', 'Czechinians', 'black.reaper@gmail.com'),
(888888, "Naruto", "Uzumaki", '1974-10-28', 888888, '743 Cleroux Street', 'Kathmandu', 'AB', 'I1I1I1', 'Nepalian', 'naruto.uzumaki@gmail.com'),
(999999, "Monkey", "Luffy", '2011-12-02', 999999, '1111 Sherbrook Street', 'Yokohama', 'YT', 'J1J1J1', 'Japanese', 'monkey.luffy@gmail.com');

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

/*
====================================================================
 Age Group
====================================================================
*/

CREATE TABLE AgeGroup(
groupID int auto_increment,
groupDescription varchar(20),
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
FOREIGN KEY (id) REFERENCES Person(id));

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
SELECT phf.name, phf.address, phf.phoneNumber, phf.webAddress, phf.facilityType, m.firstName, m.lastName, q1.employeeCount, q2.nurseCount
FROM ((PublicHealthFacilities phf INNER JOIN HealthWorker hw
	ON phf.managerID = hw.workerID) INNER JOIN 
		(SELECT a1.facilityName, COUNT(a.workerID) employeeCount
		FROM Assignments a1
		GROUP BY a1.facilityName) q1
			ON q1.facilityName = phf.name) INNER JOIN
				(SELECT a.facilityName, COUNT(a.workerID) nurseCount
				FROM Assignments a INNER JOIN HealthWorker hw
					ON a.workerID = hw.workerID
				WHERE hw.employeeType = "NURSE"
				GROUP BY a.facilityName) q2
					ON q2.facilityName = phf.name;

-- 4
SELECT p.firstName, p.lastName, p.dateOfBirth, p.emailAddress, p.phoneNumber, p.citizenship, v.vaccinationDate, av.vaccinationType, EXISTS(SELECT * FROM InfectionHistory ih WHERE p.id = ih.personID)
FROM (((Vaccinations v INNER JOIN Person p
	ON v.id = p.id) INNER JOIN Unregistered u
		ON v.id = u.id) INNER JOIN ApprovedVaccinations av
			ON av.vaccinationName = v.vaccinationName);
				 



-- 5

-- 6

-- 7

-- 8

-- 9

