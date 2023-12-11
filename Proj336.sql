create database if not exists proj336;
use proj336;
drop table if exists Customers, CustReps, Administers, Airline, AirportHas, AircraftOperates, Flights, f_Tickets, Serves, Administerslogin, Oversees, Reserves, SearchesFor, Login, Forum;

-- Customers table and insertion
CREATE TABLE Customers(
	cid char(10) primary key, 
	name varchar(50), 
	dob date);

INSERT INTO `Customers` VALUES 
	('3001234567','Charles Fitz','1980-05-17'),
	('3001234568','Taylor Quinn','1992-02-28'),
	('3001234569','Phillip Jean','2000-12-22'),
	('3001234570','Alex Smith','1970-03-01'),
	('3001234571','Michael Scanlan','2001-09-18');
-- Customers table and insertion

-- Customer Representative table and insertion
CREATE TABLE CustReps(
	rid char(10) primary key, 
	name varchar(50), 
	dob date);

INSERT INTO `CustReps` VALUES 
	('2001234567','Jeremy Wright','1975-02-13'),
	('2001234568','Stephanie Goldman','2000-11-28'),
	('2001234569','Pablo Garcia','2002-07-21'),
	('2001234570','Jerome Sachs','1972-09-05'),
	('2001234571','Joseph Derolle','2001-09-18');
-- Customer Representative table and insertion

-- Administer table and insertion
CREATE TABLE Administers(
	aid char(10) primary key, 
	name varchar(50), 
	dob date);

INSERT INTO `Administers` VALUES 
	('1001234567','Douglas Bishop','1952-01-16'),
	('1001234568','Madeleine Livingston','1970-11-18'),
	('1001234569','Hiba Watson','2000-10-20'),
	('1001234570','Lacie Boone','1969-04-04'),
	('1001234571','Everett Underwood','1999-05-12');
-- Administer table and insertion

-- Airline table and insertion
CREATE TABLE Airline(
	lid char(2) primary key, 
	name varchar(50)
    );
INSERT INTO Airline (lid, name) VALUES
('AA', 'American Airlines'),
('DL', 'Delta Airlines'),
('UA', 'United Airlines'),
('EK', 'Emirates Airlines'),
('AS','Alaska Airlines'),
('NK','Spirit Airlines'),
('B6','jetBlue Airlines');

-- Airline table and insertion

CREATE TABLE AirportHas(
	pid char(3) primary key, 
	lid char(2), 
	name varchar(50),
    location varchar(50),
    foreign key (lid) references Airline (lid));
    
INSERT INTO AirportHas (pid, lid, name, location) VALUES
('ATL', 'DL', 'Hartsfield-Jackson Atlanta International Airport', 'Atlanta, GA'),
('LAX', 'AA', 'Los Angeles International Airport', 'Los Angeles, CA'),
('JFK', 'UA', 'John F. Kennedy International Airport', 'New York, NY'),
('DXB', 'EK', 'Dubai International Airport', 'Dubai, UAE'),
('DIA', 'AA', 'Denver International Airport', 'Denver, CO'),
('BOS','DL','Boston Logan International Airport','Massachusetts, BO');
-- AirportHas table and insertion

-- AircraftOperates table and insertion
CREATE TABLE AircraftOperates(
	cNumber int primary key,
    pid char(3),
    lid char(2),
    economySeat int, # Start from the full number of economy-class seats. Every time purchasing an economy seat, this value is deduced by 1. 0 Seat means out of stock.
    businessSeat int, # Start from the full number of business-class seats. Every time purchasing a business seat, this value is deduced by 1. 0 Seat means out of stock.
    firstSeat int, # Start from the full number of first-class seats. Every time purchasing a first seat, this value is deduced by 1. 0 Seat means out of stock.
    name varchar(50),
    foreign key (lid) references Airline (lid),
    foreign key (pid) references AirportHas (pid)
    );
    
INSERT INTO AircraftOperates (cNumber, pid, lid, economySeat, businessSeat, firstSeat, name) VALUES
(101, 'LAX', 'AA', 150, 300, 900, 'Boeing 737'),
(201, 'ATL', 'DL', 200, 400, 1000, 'Airbus A320'),
(301, 'JFK', 'UA', 180, 360, 1000, 'Boeing 777'),
(401, 'JFK', 'AS', 180, 360, 1100, 'Boeing 777'),
(501, 'LAX', 'EK', 150, 300, 900, 'Boeing 737'),
(601, 'JFK', 'B6', 150, 360, 800, 'Boeing 737'),
(701, 'BOS', 'DL', 200, 400, 1000, 'Airbus A320');
-- AircraftOperates table and insertion

-- Flights table and insertion
CREATE TABLE Flights(
	fNumber int,
    cNumber int,
    lid char(2),
    depPort char(3),
    depDate datetime,
    destPort char(3),
    destDate date,
    duration varchar(20),
    days varchar(50),
    waitingList int,
    ticketType enum('Round-Trip','One-Way'),
	flightType enum('Domestic','International'),
    economyPrice int,
    businessPrice int,
    firstPrice int,
    primary key (fNumber, lid),
    foreign key (lid) references Airline (lid),
    foreign key (cNumber) references AircraftOperates(cNumber)
    );
    
INSERT INTO Flights (fNumber, lid, cNumber, depPort, depDate, destPort, destDate, duration, days, waitingList, ticketType, flightType, economyPrice, businessPrice, firstPrice) VALUES
(1001, 'AA', 101, 'LAX', '2020-02-14 01:45:54.000', 'JFK', '2020-02-14', '5 hours', 'Mon, Wed, Fri', 3, 'Round-Trip', 'Domestic', 400, 700, 1300),
(2001, 'DL', 201, 'ATL', '2023-01-01 01:12:46.000', 'LAX', '2023-01-01', '4 hours', 'Tue, Thu, Sat', 0, 'One-Way', 'Domestic', 250, 700, 1100),
(3001, 'UA', 301, 'JFK', '2024-01-25 01:45:54.000', 'DXB', '2024-01-25', '15 hours', 'Sun', 1, 'Round-Trip', 'International', 800, 1700, 2600),
(4001, 'EK', 501, 'LAX', '2024-01-10 01:45:54.000', 'BOS', '2024-01-11', '5 hours', 'Mon, Wed, Sat, Sun', 3, 'One-Way', 'International', 500, 800, 1360),
(5001, 'DL', 701, 'BOS', '2024-01-13 01:45:54.000', 'LAX', '2024-01-13', '5 hours', 'Mon, Wed, Fri', 0, 'One-Way', 'International', 500, 800, 1360),
(1002, 'AA', 101, 'LAX', '2024-01-16 01:45:54.000', 'JFK', '2024-01-16', '5 hours', 'Mon, Wed, Fri', 3, 'Round-Trip', 'Domestic', 400, 700, 1300),
(2002, 'DL', 201, 'ATL', '2024-01-15 01:45:54.000', 'LAX', '2024-01-16', '4 hours', 'Tue, Thu, Sat', 3, 'Round-Trip', 'Domestic', 250, 700, 1100),
(4002, 'EK', 501, 'LAX', '2024-01-15 01:45:54.000', 'BOS', '2024-01-15', '5 hours', 'Mon, Wed, Sat, Sun', 3, 'Round-Trip', 'International', 500, 800, 1360);

-- Flights table and insertion



-- f_Tickets table and insertion
CREATE TABLE f_Tickets(
	tNumber int primary key,
    fNumber int,
    cid char(10),
	name varchar(50), 
    seatNum int,
    class varChar(20),
    fare float,	
    purchaseDate datetime,
    bookingFee float,
    foreign key (fNumber) references Flights (fNumber),
    foreign key (cid) references Customers (cid));

INSERT INTO f_Tickets VALUES
(1, 1001, 3001234567, 'Charles Fitz', 5, 'Economy', 350.00, '2020-02-15 01:45:54.000', 15.00),
(2, 2001, 3001234567, 'Charles Fitz', 7, 'Business', 1200.00, '2023-01-01 01:12:46.000', 15.00),
(3, 1002, 3001234567, 'Charles Fitz', 7, 'Economy', 350.00, '2024-01-14 01:45:54.000', 15.00),
(4, 1002, '3001234568','Taylor Quinn', 2, 'First-Class', 2500.00, '2024-01-13 05:35:52.000', 15.00),
(5, 4001, '3001234569', 'Phillip Jean', 9, 'Economy', 400.00, '2024-01-10 01:45:54.000', 20.00);
-- f_Tickets table and insertion

-- Serves table and insertion
CREATE TABLE Serves(
	rid char(10), 
    pid char(3), 
    cNumber int, 
    cid char(10), 
    tNumber int, 
    lid char(2), 
    fNumber int, 
    Primary Key (rid, pid, cNumber, cid, tNumber, lid, fNumber), 
    foreign key (rid) references CustReps (rid), 
    foreign key (pid) references AirportHas (pid), 
    foreign key (cNumber) references AircraftOperates (cNumber), 
    foreign key (cid) references Customers (cid), 
    foreign key (tNumber) references F_tickets (tNumber), 
    foreign key (lid) references Airline (lid), 
    foreign key (lid, fNumber) references Flights (lid, fNumber));
-- Serves table and insertion
    
-- Reserves table and insertion
CREATE TABLE Reserves(
	tNumber int,
    fNumber integer,
    cid char(10), 
    lid char(2), 
    primary key (tNumber, fNumber, cid, lid), 
    foreign key (tNumber) references F_tickets (tNumber), 
    foreign key (cid) references Customers (cid), 
    foreign key (lid, fNumber) references Flights (lid, fNumber));
-- Reserves table and insertion

-- SearchesFor
CREATE TABLE SearchesFor(
	cid char(10),  
    fNumber integer, 
    lid char(2), 
    primary key (cid, fNumber, lid), 
    foreign key (cid) references Customers (cid), 
    foreign key (lid, fNumber) references Flights (lid, fNumber));
-- SearchesFor    

-- Login table and insertion
CREATE TABLE Login(
	id char(10),
	username varchar(128),
	password varchar(128),
	userType enum('Customer','Customer_Rep','Admin'),
    primary key (id, username, password)
    );

INSERT INTO `Login` VALUES
	('3001234568','customer','password','Customer'),
	('3001234567','cfitz','password1234', 'Customer'),
	('2001234567','jwright','tenacious20','Customer_Rep'),
	('1001234567','dbishop','rackets!*!', 'Admin');
-- Login table and insertion
    
create table Forum(
	qid integer AUTO_INCREMENT,
	question varchar(256),
    answer varchar(512),
    cid char(10),
    rid char(10),
    primary key (qid),
    foreign key (cid) references Customers (cid),
    foreign key (rid) references CustReps (rid)
);

INSERT INTO `Forum` VALUES
	(1, 'When is my flight today?','Your flight is at 7pm.', '3001234567', '2001234567'),
	(2, 'How can i book my flight?','Press click book', '3001234567', '2001234567'),
	(3, 'How to ask Questions?','Press Ask Questions', '3001234567', '2001234567');
;

CREATE TABLE waiting(
	insertOrder integer AUTO_INCREMENT,
    cid char(10),
    fNumber int,
    lid char(2),
    primary key (insertOrder, cid, fNumber, lid),
    foreign key (cid) references customers (cid),
    foreign key (fNumber, lid) references flights (fNumber, lid)
);
    
INSERT INTO `waiting` (cid, fNumber, lid) VALUES
	(3001234570, 1001, 'AA'),
    (3001234569, 1002, 'AA'),
    (3001234568, 1001, 'AA'),
    (3001234570, 4001, 'EK');
-- Customers on waiting lists for different flights + their respective flights
    
