CREATE DATABASE E_commerce_website;
USE E_commerce_website;

CREATE TABLE IF NOT EXISTS supplier(
supp_id INT UNSIGNED PRIMARY KEY,
supp_name VARCHAR(50) NOT NULL,
supp_city VARCHAR(50) NOT NULL,
supp_phone VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer(
cus_id INT UNSIGNED PRIMARY KEY,
cus_name VARCHAR(50) NOT NULL,
cus_phone VARCHAR(12) NOT NULL,
cus_city VARCHAR(50) NOT NULL,
cus_gender ENUM('M', 'F') NOT NULL ,
cus_email VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS category(
cat_id INT UNSIGNED PRIMARY KEY,
cat_name VARCHAR(50) NOT NULL,
parent_cat_id INT UNSIGNED,
FOREIGN KEY(parent_cat_id) REFERENCES category(cat_id)
);

CREATE TABLE IF NOT EXISTS product(
pro_id INT UNSIGNED PRIMARY KEY,
pro_name VARCHAR(50) NOT NULL DEFAULT "dummy",
por_desc VARCHAR(50) NOT NULL,
cat_id INT UNSIGNED NOT NULL,
FOREIGN KEY (cat_id) REFERENCES category(cat_id)
);

CREATE TABLE IF NOT EXISTS supplier_pricing(
pricing_id INT UNSIGNED PRIMARY KEY,
pro_id INT UNSIGNED,
supp_id INT UNSIGNED,
supp_price INT DEFAULT 0,
FOREIGN KEY (pro_id) REFERENCES product(pro_id),
FOREIGN KEY(supp_id) REFERENCES supplier(supp_id)
);



CREATE TABLE IF NOT EXISTS `order`(
order_id INT UNSIGNED PRIMARY KEY,
amount INT UNSIGNED NOT NULL,
ord_date DATE NOT NULL,
cus_id INT UNSIGNED,
pricing_id INT UNSIGNED,
FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
FOREIGN KEY(pricing_id) REFERENCES supplier_pricing(pricing_id)
);

CREATE TABLE IF NOT EXISTS rating(
rating_id INT UNSIGNED PRIMARY KEY,
order_id INT UNSIGNED,
rat_ratstars INT UNSIGNED NOT NULL,
FOREIGN KEY (order_id) REFERENCES `order`(order_id)
);


INSERT INTO supplier VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO supplier VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO supplier VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO supplier VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO supplier VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO customer VALUES(1,"AAKASH",'9999999999',"DELHI",'M','aakash@gmail.com');
INSERT INTO customer VALUES(2,"AMAN",'9785463215',"NOIDA",'M', 'aman@gmail.com');
INSERT INTO customer VALUES(3,"NEHA",'9999999999',"MUMBAI",'F', 'neha@gmail.com');
INSERT INTO customer VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F', 'megha@gmail.com');
INSERT INTO customer VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M', 'pulkit@gmail.com');

INSERT INTO category VALUES( 1,"BOOKS", 1);
INSERT INTO category VALUES(2,"GAMES", 2);
INSERT INTO category VALUES(3,"GROCERIES", 3);
INSERT INTO category VALUES (4,"ELECTRONICS", 4);
INSERT INTO category VALUES(5,"CLOTHES", 5);

INSERT INTO product VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO product VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO product VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen i7 processor 1TB SSD",4);
INSERT INTO product VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO product VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO product VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO product VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO product VALUES(8,"Jeans","Stretchable Denim Jeans with varioussizesandcolor",5);
INSERT INTO product VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO product VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO product VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO product VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);


SELECT * FROM supplier;
SELECT * FROM customer;
SELECT * FROM category;
SELECT * FROM product;
SELECT * FROM supplier_pricing;
SELECT * FROM `order`;
SELECT * FROM rating;


-- Querry 1 , question 3 --
-- Question :	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000. --

-- Solution --

SELECT  c.cus_gender AS Customer_Gender, COUNT(*) AS Order_Count, SUM(o.amount) AS Order_amount FROM customer 
AS c INNER JOIN `order` AS o ON o.cus_id = c.cus_id WHERE amount >= 3000 GROUP BY c.cus_gender;

-- Querry 2 , question 4 --
-- Question : 	Display all the orders along with product name ordered by a customer having Customer_Id=2 --

-- Solution --

SELECT  `order`.* ,product.pro_name FROM product, supplier_pricing, `order`
 WHERE `order`.pricing_id = supplier_pricing.pricing_id AND supplier_pricing.pro_id = product.pro_id AND `order`.cus_id = 2;
 
 
-- Querry 3 , question 5 --
-- Question : 	Display the Supplier details who can supply more than one product --

-- Solution --

 SELECT supplier.* FROM supplier WHERE supplier.supp_id IN
(SELECT supp_id FROM supplier_pricing GROUP BY supp_id HAVING COUNT(supp_id)>1) GROUP BY supplier.supp_id;

-- Querry 4 , question 6--
-- Question : Find the least expensive product from each category and print the table  --
             --  with category id, name, product name and price of the product --

-- Solution --

SELECT category.cat_id AS category_id, category.cat_name AS category_name, product.pro_name AS product_name, 
 MIN(supplier_pricing.supp_price) AS price_of_product
FROM  supplier_pricing  LEFT JOIN product ON supplier_pricing.pro_id = product.pro_id
LEFT JOIN category ON product.cat_id = category.cat_id GROUP BY  category.cat_id ORDER BY category.cat_id ASC ; 

-- Query 5, question 7 --
-- Question : 	Display the Id and Name of the Product ordered after “2021-10-05” --

-- Solution --

SELECT product.pro_id AS product_id, product.pro_name AS product_name, `order`.ord_date AS order_date
FROM product, `order`, supplier_pricing
WHERE supplier_pricing.pro_id = product.pro_id AND `order`.pricing_id = supplier_pricing.pricing_id
AND `order`.ord_date >'2021-10-05';

-- Querry 6 , question 8 --
-- Question : Display customer name and gender whose names start or end with character 'A' --

-- Solution --

SELECT customer.cus_name,customer.cus_gender FROM customer WHERE customer.cus_name LIKE 'A%' OR customer.cus_name LIKE '%A';

-- Query 7 , question 9 --
-- Question : 	Create a stored procedure to display supplier id, name, rating and Type_of_Service -- 
               -- For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, --
               -- If rating >2 print “Average Service” else print “Poor Service” --
 
-- Solution --

-- reating the stored procedure--

DELIMITER &&
CREATE PROCEDURE TypeOfServiceForSupplier()
BEGIN
SELECT supplier.supp_id AS supplier_id, supplier.supp_name AS supplier_name, AVG(rating.rat_ratstars) AS average_rating,
CASE
WHEN AVG(rating.rat_ratstars) = 5 THEN 'EXCELLENT SERVICE'
WHEN AVG(rating.rat_ratstars) > 4 THEN 'GOOD SERVICE'
WHEN AVG(rating.rat_ratstars) > 2 THEN 'AVERAGE SERVICE'
ELSE 'POOR SERVICE'
END AS Type_Of_Service
FROM supplier, rating, supplier_pricing, `order`
WHERE rating.order_id = `order`.order_id AND `order`.pricing_id = supplier_pricing.pricing_id
AND supplier_pricing.supp_id = supplier.supp_id
GROUP BY supplier.supp_id
ORDER BY supplier.supp_id ASC;
END&&
DELIMITER ;


-- CALLING THE STORED PROCEDURE --
  
  CALL TypeOfServiceForSupplier();
  
  
  