-- 1.1 Select the names of all the products in the store. done
SELECT name FROM Products;

-- 1.2 Select the names and the prices of all the products in the store. done
SELECT Name, Price FROM Products;

-- 1.3 Select the name of the products with a price less than or equal to $200. done
select Name from Products
where Price < 200;

-- 1.4 Select all the products with a price between $60 and $120. done
select * from Products
where Price BETWEEN 60 and 120;

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT Name, Price*100 FROM Products;

-- 1.6 Compute the average price of all the products. done
SELECT sum(Price)/count(Price) FROM Products;

-- 1.7 Compute the average price of all products with manufacturer code equal to 2. done
SELECT sum(Products.Price)/count(Products.Price) FROM Products
WHERE Manufacturer = 2;

-- 1.8 Compute the number of products with a price larger than or equal to $180. done
SELECT count(*) FROM Products
WHERE Price >= 180;

-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT Name, Price FROM Products
WHERE Price >= 180
ORDER BY Price desc;

SELECT Name, Price FROM Products
WHERE Price >= 180
ORDER BY Name ASC;

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
SELECT * FROM Products
JOIN Manufacturers on Products.Manufacturer = Manufacturers.Code;

-- 1.11 Select the product name, price, and manufacturer name of all the products.
SELECT Products.Name, Products.Price, Manufacturers.name FROM Products
JOIN Manufacturers on Products.Manufacturer = Manufacturers.Code;

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT avg(Price), Manufacturer FROM Products
GROUP BY Manufacturer;

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT avg(Products.Price), Manufacturers.Name FROM Products
JOIN Manufacturers on Products.Manufacturer = Manufacturers.Code
GROUP BY Manufacturers.Name;

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT Manufacturers.Name FROM Manufacturers
JOIN Products on Products.Manufacturer = Manufacturers.Code
WHERE Products.Price >= 150;

-- 1.15 Select the name and price of the cheapest product.
SELECT Name, Price FROM Products
ORDER BY Price ASC
Limit 1;

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.
SELECT Products.Name, Products.Price, Manufacturers.Name FROM Products
JOIN Manufacturers on Products.Manufacturer = Manufacturers.Code
ORDER BY Products.Price DESC
LIMIT 1;

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
INSERT INTO Products (Name, Price, Manufacturer)
VALUES ('Loudspeakers', 70, 2);

-- 1.18 Update the name of product 8 to "Laser Printer".
UPDATE Products
SET Name = 'Laser Printer'
WHERE Code = 8;
-- 1.19 Apply a 10% discount to all products.
UPDATE Products
SET Price = (Price - Price*0.1);
-- or
UPDATE Products
SET Price = Price*0.9;

-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
UPDATE Products
SET Price = Price*0.9
WHERE Price >= 120;
