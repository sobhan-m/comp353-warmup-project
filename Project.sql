# Test 1

# CREATE database Project;
# USE Project;

CREATE TABLE Person(
sin int NOT NULL,
firstName varchar(100) NOT NULL,
lastName varchar(100) NOT NULL,
dateOfBirth Date NOT NULL,
medicareCardNum int,
medicareIssueDate Date,
medicareExpiryDate Date,
telephoneNumber long,
address mediumtext,
city varchar(100),
province ENUM('NL','PE','NS','NB','QC','ON','MB','SK','AB','BC','YT','NT','NU'),
postalCode varchar(6),
citizenship varchar(100),
emailAddress varchar(100),
PRIMARY KEY (sin));

INSERT INTO Person (sin, firstName, lastName, dateOfBirth, medicareCardNum, medicareIssueDate, medicareExpiryDate, telephoneNumber, address, city, province, postalCode, citizenship, emailAddress) 
VALUES (111111, "John", "Smith", '1990-01-01', 11111, '1990-01-01', '2030-01-01', 111111, '100 Guy Street', 'Montreal', 'QC', 'A1A1A1', 'Canadian', 'john.smith@gmail.com');

SELECT * FROM Person;

# DROP TABLE Person;


CREATE TABLE HealthWorker(
workerID int AUTO_INCREMENT,
sin int,
PRIMARY KEY (workerID),
FOREIGN KEY (sin) REFERENCES Person(sin));

# DROP TABLE HealthWorker;

CREATE table Vaccinations(

CREATE table PublicHealthFacilities(
name varchar(100),
address mediumtext,
phoneNumber long,
webAddress varchar(100),
type ENUM('HOSPITAL', 'CLINIC', 'SPECIAL INSTALLMENT'),
capacity int,
workerID int, # This is the manger ID.
FOREIGN KEY (workerID) REFERENCES HealthWorker(workerID));
