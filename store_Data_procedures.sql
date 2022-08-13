

USE sql_store
GO

CREATE TABLE order_statuses (
  order_status_id tinyint NOT NULL,
  name varchar(50) NOT NULL,
  PRIMARY KEY (order_status_id)
) ;

CREATE TABLE shippers (
  shipper_id smallint NOT NULL,
  name varchar(50) NOT NULL,
  PRIMARY KEY (shipper_id)
) ;

CREATE TABLE customers (
  customer_id int NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  birth_date date DEFAULT NULL,
  phone varchar(50) DEFAULT NULL,
  address varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  state char(2) NOT NULL,
  points int NOT NULL DEFAULT '0',
  PRIMARY KEY (customer_id)
) ; 

CREATE TABLE orders (
  order_id int NOT NULL,
  customer_id int NOT NULL,
  order_date date NOT NULL,
  status tinyint NOT NULL DEFAULT '1',
  comments varchar(2000) DEFAULT NULL,
  shipped_date date DEFAULT NULL,
  shipper_id smallint DEFAULT NULL,
  PRIMARY KEY (order_id),
  CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON UPDATE CASCADE,
  CONSTRAINT fk_orders_order_statuses FOREIGN KEY (status) REFERENCES order_statuses (order_status_id) ON UPDATE CASCADE,
  CONSTRAINT fk_orders_shippers FOREIGN KEY (shipper_id) REFERENCES shippers (shipper_id) ON UPDATE CASCADE
) ;

CREATE TABLE products (
  product_id int NOT NULL,
  name varchar(50) NOT NULL,
  quantity_in_stock int NOT NULL,
  unit_price decimal(4,2) NOT NULL,
  PRIMARY KEY (product_id)
);

CREATE TABLE order_items (
  order_id int NOT NULL,
  product_id int NOT NULL,
  quantity int NOT NULL,
  unit_price decimal(4,2) NOT NULL,
  PRIMARY KEY (order_id,product_id),
  CONSTRAINT fk_order_items_orders FOREIGN KEY (order_id) REFERENCES orders (order_id) ON UPDATE CASCADE,
  CONSTRAINT fk_order_items_products FOREIGN KEY (product_id) REFERENCES products (product_id) ON UPDATE CASCADE
) ; 

USE sql_store;
DELETE FROM order_items;
DELETE FROM products;
DELETE FROM orders;
DELETE FROM customers;
DELETE FROM shippers;
DELETE FROM order_statuses;

INSERT INTO order_statuses VALUES (1,'Processed');
INSERT INTO order_statuses VALUES (2,'Shipped');
INSERT INTO order_statuses VALUES (3,'Delivered');

INSERT INTO shippers VALUES (1,'Hettinger LLC');
INSERT INTO shippers VALUES (2,'Schinner-Predovic');
INSERT INTO shippers VALUES (3,'Satterfield LLC');
INSERT INTO shippers VALUES (4,'Mraz, Renner and Nolan');
INSERT INTO shippers VALUES (5,'Waters, Mayert and Prohaska');

INSERT INTO customers VALUES (1,'Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA',2273);
INSERT INTO customers VALUES (2,'Ines','Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA',947);
INSERT INTO customers VALUES (3,'Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO',2967);
INSERT INTO customers VALUES (4,'Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL',457);
INSERT INTO customers VALUES (5,'Clemmie','Betchley','1973-11-07',NULL,'5 Spohn Circle','Arlington','TX',3675);
INSERT INTO customers VALUES (6,'Elka','Twiddell','1991-09-04','312-480-8498','7 Manley Drive','Chicago','IL',3073);
INSERT INTO customers VALUES (7,'Ilene','Dowson','1964-08-30','615-641-4759','50 Lillian Crossing','Nashville','TN',1672);
INSERT INTO customers VALUES (8,'Thacher','Naseby','1993-07-17','941-527-3977','538 Mosinee Center','Sarasota','FL',205);
INSERT INTO customers VALUES (9,'Romola','Rumgay','1992-05-23','559-181-3744','3520 Ohio Trail','Visalia','CA',1486);
INSERT INTO customers VALUES (10,'Levy','Mynett','1969-10-13','404-246-3370','68 Lawn Avenue','Atlanta','GA',796);

INSERT INTO orders VALUES (1,6,'2019-01-30',1,NULL,NULL,NULL);
INSERT INTO orders VALUES (2,7,'2018-08-02',2,NULL,'2018-08-03',4);
INSERT INTO orders VALUES (3,8,'2017-12-01',1,NULL,NULL,NULL);
INSERT INTO orders VALUES (4,2,'2017-01-22',1,NULL,NULL,NULL);
INSERT INTO orders VALUES (5,5,'2017-08-25',2,'','2017-08-26',3);
INSERT INTO orders VALUES (6,10,'2018-11-18',1,'Aliquam erat volutpat. In congue.',NULL,NULL);
INSERT INTO orders VALUES (7,2,'2018-09-22',2,NULL,'2018-09-23',4);
INSERT INTO orders VALUES (8,5,'2018-06-08',1,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',NULL,NULL);
INSERT INTO orders VALUES (9,10,'2017-07-05',2,'Nulla mollis molestie lorem. Quisque ut erat.','2017-07-06',1);
INSERT INTO orders VALUES (10,6,'2018-04-22',2,NULL,'2018-04-23',2);

INSERT INTO products VALUES (1,'Foam Dinner Plate',70,1.21);
INSERT INTO products VALUES (2,'Pork - Bacon,back Peameal',49,4.65);
INSERT INTO products VALUES (3,'Lettuce - Romaine, Heart',38,3.35);
INSERT INTO products VALUES (4,'Brocolinni - Gaylan, Chinese',90,4.53);
INSERT INTO products VALUES (5,'Sauce - Ranch Dressing',94,1.63);
INSERT INTO products VALUES (6,'Petit Baguette',14,2.39);
INSERT INTO products VALUES (7,'Sweet Pea Sprouts',98,3.29);
INSERT INTO products VALUES (8,'Island Oasis - Raspberry',26,0.74);
INSERT INTO products VALUES (9,'Longan',67,2.26);
INSERT INTO products VALUES (10,'Broom - Push',6,1.09);


INSERT INTO order_items VALUES (1,4,4,3.74);
INSERT INTO order_items VALUES (2,1,2,9.10);
INSERT INTO order_items VALUES (2,4,4,1.66);
INSERT INTO order_items VALUES (2,6,2,2.94);
INSERT INTO order_items VALUES (3,3,10,9.12);
INSERT INTO order_items VALUES (4,3,7,6.99);
INSERT INTO order_items VALUES (4,10,7,6.40);
INSERT INTO order_items VALUES (5,2,3,9.89);
INSERT INTO order_items VALUES (6,1,4,8.65);
INSERT INTO order_items VALUES (6,2,4,3.28);
INSERT INTO order_items VALUES (6,3,4,7.46);
INSERT INTO order_items VALUES (6,5,1,3.45);
INSERT INTO order_items VALUES (7,3,7,9.17);
INSERT INTO order_items VALUES (8,5,2,6.94);
INSERT INTO order_items VALUES (8,8,2,8.59);
INSERT INTO order_items VALUES (9,6,5,7.28);
INSERT INTO order_items VALUES (10,1,10,6.01);
INSERT INTO order_items VALUES (10,9,9,4.28);



create procedure EF;1
as
select name,quantity_in_stock from products
GO

exec EF;1


create proc EF;2 @telephone varchar(50)
as
select last_name, address from customers
where phone = @telephone
GO


EXEC EF;2 '804-427-9456'



create proc EF;3  (@nom varchar(50) , @prenom varchar(50))
as
select * from customers
where last_name = @nom and first_name = @prenom
GO

EXEC EF;3 'MacCaffrey','Babara'


create proc EF;4 @id int
as
select points from customers
where customer_id = @id
GO

EXEC EF;4 @id =5


create procedure ##ProcGlobale
as
select * from customers
where customer_id = 7
GO

exec  ##ProcGlobale


create procedure #ProcLocale
as
select points from customers
where customer_id = 10
GO

exec  #ProcLocale


ALTER procedure EF;1
as
select name,quantity_in_stock,unit_price from products
GO

exec EF;1


create view commandes_clients
as
select c.customer_id,c.first_name,o.order_id
from customers c LEFT JOIN orders o on c.customer_id = o.customer_id
GO

SELECT*FROM commandes_clients


create view clients_commandes_expediteurs
as
select c.customer_id,c.first_name,o.order_id,s.shipper_id
from orders o 
RIGHT JOIN customers c on o.customer_id = c.customer_id
LEFT JOIN shippers s on  o.shipper_id = s.shipper_id 
GO

SELECT*FROM clients_commandes_expediteurs


create view clients_commandes_expediteurs_status
as
select c.customer_id,c.first_name,o.order_id,s.shipper_id,os.name
from orders o 
RIGHT JOIN customers c on o.customer_id = c.customer_id
LEFT JOIN shippers s on  o.shipper_id = s.shipper_id 
LEFT JOIN order_statuses os on  o.status = os.order_status_id
GO

SELECT*FROM clients_commandes_expediteurs_status

