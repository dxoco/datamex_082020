/*---## code to set up the database and make some tables ##---*/

/*create database mysql_lab*/
/* USE mysql_lab*/
/*
CREATE TABLE cars
(vin varchar(20),
manufacturer VARCHAR(20),
model VARCHAR(20),
year YEAR,
color VARCHAR(20)
)
*/
/*
CREATE TABLE customers (
    cid VARCHAR(20),
    full_name VARCHAR(35),
    phone VARCHAR(20),
    email VARCHAR(30),
    address VARCHAR(50),
	city VARCHAR(15),
	state VARCHAR(15),
	country VARCHAR(20),
	postal INT(5)
)
*/
/*
CREATE TABLE salespersons
(sin varchar(20),
full_name VARCHAR(35),
store VARCHAR(20)
)
*/
/*
CREATE TABLE invoices
(
    iin VARCHAR(20),
    year DATE,
    vin VARCHAR(20),
    cid VARCHAR(20),
    sin VARCHAR(20)
)
*/

/*---## code to populate(seed) the tabkes ##---*/
/*table names: cars customers salespersons invoices*/
/*
INSERT INTO cars
(vin, manufacturer, model, year,color)
VALUES
('K096I98581DHSNUP','Volkswagen','Tiguan','2019','Blue'),
('ZM8G7BEUQZ97IH46V','Peugeot','Rifter','2019','Red'),
('RKXVNNIHLVVZOUB4M','Ford','Fusion','2019','White'),
('HKNDGS7CU31E9Z7JW','Toyota','RAV4','2019','Silver'),
('DAM41UDN3CHU2WVF6','Volvo','V60','2019','Gray'),
('DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country','2019','Gray')
*/
/*
INSERT INTO customers
(cid,full_name,phone,email,address,city,state,country,postal)
VALUES
('10001','Pablo Picasso','+34 636 17 63 82','-','Paseo de la Chopera, 14','Madrid',	'Madrid','Spain','28045'),
('20001','Abraham Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States','33130'),
('30001','Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France',	'75008')
*/
/*
INSERT INTO salespersons
(sin,full_name,store)
VALUES
('00001','Petey Cruiser','Madrid'),
('00002','Anna Sthesia','Barcelona'),
('00003','Paul Molive','Berlin'),
('00004','Gail Forcewind','Paris'),
('00005','Paige Turner','Mimia'),
('00006','Bob Frapples','Mexico City'),
('00007','Walter Melon','Amsterdam'),
('00008','Shonda Leer','São Paulo')
*/

/*SELECT year FROM invoices DATE_FORMAT( year , '%m/%d/%Y')  AS year; not working */

/*
INSERT INTO invoices
(iin,year,vin,cid,sin)
VALUES
('852399038','2018-08-22','0','1','3'),
('731166526','2018-12-31','3','0','5'),
('271135104','2019-01-22','2','2','7')
*/
