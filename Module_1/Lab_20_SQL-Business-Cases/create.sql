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

ALTER TABLE Cars
ADD PRIMARY KEY (ID);
ALTER TABLE Customers
ADD PRIMARY KEY (ID);
ALTER TABLE Invoices
ADD PRIMARY KEY (ID);
ALTER TABLE Salespersons
ADD PRIMARY KEY (ID);

ALTER TABLE Invoices
ADD FOREIGN KEY (CarID) REFERENCES Cars (ID);
ALTER TABLE Invoices
ADD FOREIGN KEY (CustomerID) REFERENCES Customers (ID);
ALTER TABLE Invoices
ADD FOREIGN KEY (Sales_personID) REFERENCES Salespersons (ID);