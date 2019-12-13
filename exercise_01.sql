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
