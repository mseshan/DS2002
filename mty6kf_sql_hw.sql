#WorldBase Data Questions - Easy:
SELECT Name FROM country WHERE Region = 'South America';
SELECT Population FROM country WHERE country.Code = 'DEU';
SELECT Name FROM city WHERE CountryCode = 'JPN';

#WorldBase Data Questions - Medium:
SELECT population FROM country WHERE Continent = "Africa" ORDER BY Population DESC LIMIT 3;
SELECT country.Name, LifeExpectancy FROM country WHERE Population > 1000000 AND Population < 5000000;
SELECT country.Name FROM country JOIN countrylanguage ON country.Code = countrylanguage.CountryCode WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';


#Chinook Database Questions - Easy (this was done under the Chinook_AutoIncrement Database, so USE Chinook_AutoIncrement; was not used):
#SELECT Album.Title FROM Album JOIN Artist ON Album.ArtistId = Artist.ArtistId WHERE Artist.Name = 'AC/DC';
#SELECT FirstName, LastName, Email FROM Customer WHERE Country = 'Brazil';
#SELECT Name FROM Playlist;

#Chinook Database Questions - Medium:
#SELECT COUNT(*) FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId WHERE Genre.Name = 'Rock';
#SELECT FirstName, LastName FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' AND LastName ='Edwards');
#SELECT Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSales FROM Invoice JOIN Customer ON Invoice.CustomerId = Customer.CustomerId GROUP BY Customer.CustomerId;




#Design Database- Bakery with Hollywood actors as customers

#Create Tables
CREATE TABLE Product (ProductID INT AUTO_INCREMENT PRIMARY KEY, ProductName VARCHAR(100), Category VARCHAR(50),Price DECIMAL(10, 2));
CREATE TABLE Customer (CustomerID INT AUTO_INCREMENT PRIMARY KEY,FirstName VARCHAR(50),LastName VARCHAR(50),Email VARCHAR(100));
CREATE TABLE `Order` (OrderID INT AUTO_INCREMENT PRIMARY KEY,CustomerID INT,ProductID INT, Quantity INT, OrderDate DATE, FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),FOREIGN KEY (ProductID) REFERENCES Product(ProductID));

#Insert Data
INSERT INTO Product (ProductName, Category, Price) VALUES
('Chocolate Chip Cookie', 'Cookie', 2.50),
('Croissant', 'Pastry', 3.50),
('Cranberry Orange Bread', 'Bread', 4.50),
('Macaron', 'Pastry', 2.10),
('Pumpkin Bread', 'Bread', 4.50);


INSERT INTO Customer (FirstName, LastName, Email) VALUES
('Hugh', 'Jackman', 'hughjackman@hollywood.com'),
('Chris', 'Hemsworth', 'chrishemsworth@hollywood.com'),
('Scarlett', 'Johansson', 'scarjo@hollywood.com'),
('Orlando', 'Bloom', 'orlandobloom@hollywood.com'),
('Anne', 'Hathaway', 'annehathway@hollywood.com');

INSERT INTO `Order` (CustomerID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 1, '2024-09-08'),
(2, 3, 2, '2024-09-08'),
(3, 4, 3, '2024-09-08'),
(4, 2, 4, '2024-09-08'),
(5, 5, 1, '2024-09-08');

#Write Queries
SELECT O.OrderID, P.ProductName, O.Quantity, O.OrderDate
FROM `Order` O
JOIN Customer C ON O.CustomerID = C.CustomerID
JOIN Product P ON O.ProductID = P.ProductID
WHERE C.FirstName = 'Hugh' AND C.LastName = 'Jackman';

SELECT P.ProductName, SUM(O.Quantity) AS TotalQuantitySold
FROM `Order` O
JOIN Product P ON O.ProductID = P.ProductID
GROUP BY P.ProductName;

SELECT O.OrderID, C.FirstName, C.LastName, P.ProductName, O.Quantity
FROM `Order` O
JOIN Customer C ON O.CustomerID = C.CustomerID
JOIN Product P ON O.ProductID = P.ProductID
WHERE O.OrderDate = '2024-09-08';