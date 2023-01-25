INSERT INTO Cars 
(ID, VIN, Manufacturer, Model, Year, Color)
VALUES (0, "3K096I98581DHSNUP", "Volkswagen", "Tiguan", 2019, "Blue"),
(1, "ZM8G7BEUQZ97IH46V", "Peugeot", "Rifter", 2019, "RED"),
(2, "RKXVNNIHLVVZOUB4M", "Ford", "Fusion", 2018, "WHITE"),
(3, "HKNDGS7CU31E9Z7JW", "Toyota", "RAV4", 2018, "SILVER"),
(4, "DAM41UDN3CHU2WVF6", "Volvo", "V60", 2019, "GRAY"),
(5, "DAM41UDN3CHU2WVF6", "Volvo", "V60 Cross Country", 2019, "GRAY");

INSERT INTO Customers 
(ID,CustomerID,Name,Phone,Email,Address,City,State_Province,Country,Postal)
VALUES (0, 10001, "Pablo Picasso", "+34 636 17 63 82", "-", "Paseo de la Chopera, 14", "Madrid", "Madrid", "Spain", 28045),
(1, 20001, "Abraham Lincoln	", "+1 305 907 7086", "-", "120 SW 8th St", "Miami", "Florida", "United States	", 33130),
(2, 30001, "Napoléon Bonaparte", "+33 1 79 75 40 00", "-", "40 Rue du Colisée", "Paris", "Île-de-France	", "France", 75008);

INSERT INTO Invoices 
(ID,Invoice_number,Date,CarID,CustomerID,Sales_personID)
VALUES (0, 852399038, '2018-08-22', 0, 1, 3),
(1, 731166526, '2018-12-31', 3, 0,5),
(2, 271135104, '2019-01-22', 2, 2,7);


-- INSERT for SALESPERSONS done via table data import wizzard
-- accented characters edited

UPDATE Salespersons
SET Store = 'São Paulo'
WHERE ID = 7;

