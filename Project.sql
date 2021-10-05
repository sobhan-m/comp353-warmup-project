# Test 1

CREATE database Project;
USE Project;

CREATE TABLE Person(
sin int NOT NULL,
firstName varchar(100) NOT NULL,
lastName varchar(100) NOT NULL,
dateOfBirth Date NOT NULL,
medicareCardNum int,
medicareIssueDate Date,
medicareExpiryDate Date,
telephoneNumber int,
address mediumtext,
city varchar(100),
province ENUM('NL','PE','NS','NB','QC','ON','MB','SK','AB','BC','YT','NT','NU'),
postalCode varchar(6),
citizenship varchar(100),
emailAddress varchar(100),
passportNumber int,
PRIMARY KEY(sin)
);



INSERT INTO Person (sin, firstName, lastName, dateOfBirth, medicareCardNum, medicareIssueDate, medicareExpiryDate, telephoneNumber, address, city, province, postalCode, citizenship, emailAddress) 
VALUES (000000, "John", "Smith", '1990-01-01', 00000, '1990-01-01', '2030-01-01', 000000, '100 Guy Street', 'Montreal', 'QC', 'A1A1A1', 'Canadian', 'john.smith@gmail.com'),
(111111, "Mark", "Julius", '1987-10-23', 11111, '1987-10-23', '2030-01-04', 111111, '200 Maisonneuve Street', 'Almaty', 'NB', 'B1B1B1', 'Kazakhastanian', 'mark.julius@gmail.com'),
(222222, "Jackie", "Chan", '2000-03-30', 22222, '2000-03-30', '2030-01-09', 222222, '1980 Norman Street', 'Kawasaki', 'NL', 'C1C1C1', 'Japanese', 'jackie.chan@gmail.com'),
(333333, "Bruce", "Lee", '2021-09-01', 33333, '2021-09-01', '2030-01-10', 333333, '3475 De la montagne Street', 'Bandung', 'PE', 'D1D1D1', 'Indian', 'bruce.goerge@gmail.com'),
(444444, "King", "George", '1960-03-20', 44444, '1990-01-01', '2030-01-12', 444444, '5000 Peel Street', 'Sapporo', 'NS', 'E1E1E1', 'Japanese', 'king.george@gmail.com'),
(555555, "Vanilla", "Ice", '1975-01-01', 55555, '1960-03-20', '2030-01-15', 555555, '2001 Dutrisac Street', 'Baghdad', 'ON', 'F1F1F1', 'Indian', 'vanilla.ice@gmail.com'),
(666666, "Rock", "Lee", '2003-11-10', 66666, '2003-11-10', '2030-01-18', 666666, '1111 Fillion Street', 'Shiraz', 'MB', 'G1G1G1', 'Iranian', 'rock.lee@gmail.com'),
(777777, "Black", "Reaper", '2017-01-01', 77777, '2017-01-01', '2030-01-25', 777777, '908 Deguire Street', 'Praque', 'SK', 'H1H1H1', 'Czechinians', 'black.reaper@gmail.com'),
(888888, "Naruto", "Uzumaki", '1974-10-28', 88888, '1974-10-28', '2030-01-28', 888888, '743 Cleroux Street', 'Kathmandu', 'AB', 'I1I1I1', 'Nepalian', 'naruto.uzumaki@gmail.com'),
(999999, "Monkey", "Luffy", '2011-12-02', 99999, '1990-01-01', '2030-01-30', 999999, '1111 Sherbrook Street', 'Yokohama', 'YT', 'J1J1J1', 'Japanese', 'monkey.luffy@gmail.com');

SELECT * FROM Person;

# DROP TABLE Person;


CREATE TABLE HealthWorker(
workerID int AUTO_INCREMENT,
sin int,
PRIMARY KEY (workerID),
FOREIGN KEY (sin) REFERENCES Person(sin));

# DROP TABLE HealthWorker;

CREATE TABLE Vaccinations(
sin int, # Person key.
vaccineType ENUM('Pfizer', 'Moderna', 'AstraZeneca', 'Johnson & Johnson'),
doseNumber int,
vaccinationDate Date,
status ENUM('SAFE', 'SUSPENDED'));

CREATE TABLE PublicHealthFacilities(
name varchar(100),
address mediumtext,
phoneNumber int,
webAddress varchar(100),
facilityType ENUM('HOSPITAL', 'CLINIC', 'SPECIAL INSTALLMENT'),
capacity int,
workerID int, # This is the manger ID.
FOREIGN KEY (workerID) REFERENCES HealthWorker(workerID));

CREATE TABLE GroupAge(
groupID int auto_increment,
groupDescription varchar(20),
PRIMARY KEY (groupID));

INSERT INTO GroupAge (groupDescription)
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



