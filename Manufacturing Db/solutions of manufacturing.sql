Use [Manufacturing]

Select * from Manufacturers
Select * from Products


-- 1.1 Select the names of all the products in the store.

Select distinct Productname from Products


-- 1.2 Select the names and the prices of all the products in the store.

Select Productname, Price from Products

-- 1.3 Select the name of the products with a price less than or equal to $200.

Select Productname from Products where Price <=200

-- 1.4 Select all the products with a price between $60 and $120.

Select Productname  from Products where Price between 60 and 120

-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).

Select Productname, Price*100 as Price_in_cents from products

-- 1.6 Compute the average price of all the products.

Select AVG(Price) from products

-- 1.7 Compute the average price of all products with manufacturer code equal to 2.

Select AVG(Price) from products where manufacturer = 2

-- 1.8 Compute the number of products with a price larger than or equal to $180.

Select Count(*) from Products where Price >= 180


-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
Select Productname, Price from Products where Price >= 180  order by Price desc, Productname ASC

-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.

Select P.*, m.manufacturername from Manufacturers m, Products p where m.code = p.manufacturer


-- 1.11 Select the product name, price, and manufacturer name of all the products.

Select p.productname, p.price, m.manufacturername from Manufacturers m, Products p where m.code = p.manufacturer

-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
 
Select  m.manufacturername, AVG(p.Price) from Manufacturers m, Products p where m.code = p.manufacturer group by m.manufacturername

-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.

Select AVG(Price), manufacturer from Products group by manufacturer

-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.

Select * from manufacturers
Select * from Products

Select AVG(p.price) from [dbo].[Manufacturers] m Join products p on m.code = p.manufacturer group by manufacturername having AVG(p.price) >= 150 

-- 1.15 Select the name and price of the cheapest product.
Select * from manufacturers
Select * from Products

Select Productname, Price from products where price= ( Select Min(Price) from products)

-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.

SELECT p.*, m.manufacturername
FROM [dbo].[Manufacturers] m, Products p
   WHERE p.manufacturer = m.code
     AND P.price =
     (
       SELECT MAX(P.price)
         FROM products P
         WHERE p.manufacturer = m.code
     )
	 order by m.code ASC

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
insert into Products values (11, 'Loudspeakers', 70, 2);
-- 1.18 Update the name of product 8 to "Laser Printer".
update products
set name = 'Laser Printer'
where code=8;
-- 1.19 Apply a 10% discount to all products.
update products
set price=price*0.9;
-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
update products
set price=price*0.9
where price>=120