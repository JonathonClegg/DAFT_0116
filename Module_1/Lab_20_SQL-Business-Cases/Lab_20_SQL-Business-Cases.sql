CREATE DATABASE IF NOT EXISTS lab_20_mysql;
USE lab_20_mysql;
CREATE TABLE IF NOT EXISTS Cars (
	ID int,
    VIN varchar(255),
    Manufacturer varchar(255),
    Model varchar(255),
    Year YEAR,
    Color varchar(255)
);
CREATE TABLE IF NOT EXISTS Customers (
	ID int,
    CustomerID int,
    Name varchar(255),
    Phone varchar(255),
    Email varchar(255),
    Address varchar(255),
    City varchar(255),
    State_Province varchar(255),
    Country varchar(255),
    Postal int
);
CREATE TABLE IF NOT EXISTS Salespersons (
	ID int,
    StaffID int,
    Name varchar(255),
    Store varchar(255)
);
CREATE TABLE IF NOT EXISTS Invoices (
	ID int,
    Invoice_number int,
    Date DATE,
    CarID int,
    CustomerID int,
    Sales_personID int
);

INSERT INTO Cars 
(ID, VIN, Manufacturer, Model, Year, Color)
VALUES (0, "3K096I98581DHSNUP", "Volkswagen", "Tiguan", 2019, "Blue"),
(1, "ZM8G7BEUQZ97IH46V", "Peugeot", "Rifter", 2019, "RED"),
(2, "RKXVNNIHLVVZOUB4M", "Ford", "Fusion", 2018, "WHITE"),
(3, "HKNDGS7CU31E9Z7JW", "Toyota", "RAV4", 2018, "SILVER"),
(4, "DAM41UDN3CHU2WVF6", "Volvo", "V60", 2019, "GRAY"),
(5, "DAM41UDN3CHU2WVF6", "Volvo", "V60 Cross Country", 2019, "GRAY");

ALTER TABLE Cars
ADD PRIMARY KEY (ID);
ALTER TABLE Customers
ADD PRIMARY KEY (ID);
ALTER TABLE Invoices
ADD PRIMARY KEY (ID);
ALTER TABLE Salespersons
ADD PRIMARY KEY (ID);

INSERT INTO Customers 
(ID,CustomerID,Name,Phone,Email,Address,City,State_Province,Country,Postal)
VALUES (0, 10001, "Pablo Picasso", "+34 636 17 63 82", "-", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", 28045),
(1, 20001, "Abraham Lincoln	", "+1 305 907 7086", "-", "120 SW 8th St", "Miami", "Florida", "United States	", 33130),
(2, 30001, "Napoléon Bonaparte", "+33 1 79 75 40 00", "-", "40 Rue du Colisée", "Paris", "Île-de-France	", "France", 75008);

ALTER TABLE Invoices
ADD FOREIGN KEY (CarID) REFERENCES Cars (ID);
ALTER TABLE Invoices
ADD FOREIGN KEY (CustomerID) REFERENCES Customers (ID);
ALTER TABLE Invoices
ADD FOREIGN KEY (Sales_personID) REFERENCES Salespersons (ID);

INSERT INTO Invoices 
(ID,Invoice_number,Date,CarID,CustomerID,Sales_personID)
VALUES (0, 852399038, '2018-08-22', 0, 1, 3),
(1, 731166526, '2018-12-31', 3, 0,5),
(2, 271135104, '2019-01-22', 2, 2,7);

UPDATE Salespersons
SET Store = 'São Paulo'
WHERE ID = 7;

UPDATE Customers
SET Email = 'ppicasso@gmail.com'
WHERE ID = 0;
UPDATE Customers
SET Email = 'lincoln@us.gov'
WHERE ID = 1;
UPDATE Customers
SET Email = 'hello@napoleon.me'
WHERE ID = 2;

