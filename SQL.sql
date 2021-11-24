CREATE TABLE CUSTOMER(
	customer_id CHAR(50),
	first_name CHAR(50),
	last_name CHAR(50),
	age FLOAT(2),
	house_type CHAR(50),
	county CHAR(50),
	CONSTRAINT customer_key PRIMARY KEY (customer_id),
	CONSTRAINT customer_unique UNIQUE (first_name, last_name, age, house_type, county)
);


SELECT * FROM CUSTOMER;

/* How to give permission to import from CSV Excel file 
1. Right click the CSV file
2. Click Properties
3. In the CSV file's properties window, select Security tab
4. Click the Edit button
5. In the "Permission for the folder" window that opened, click the Add... button.
6. Type "Everyone" into the "Enter the object names to select" text area box.
7. Click OK and the window will close.
8. Verify that the default "Read & Execute" permissions were set to Allow via the check checkbox in the previous window.
9. Click OK and the window will close
10. Click the Apply button in the CSV file Properties window.

Then use the COPY command like below */

COPY CUSTOMER FROM 'C:\Users\jonsk\Documents\SQL\Project 1\customer_table.csv' WITH CSV HEADER;

CREATE TABLE ORDER_ (
	order_id CHAR(50),
	customer_id CHAR(50),
	product_id CHAR(50),
	time TIME,
	date DATE,
	CONSTRAINT order_key PRIMARY KEY (order_id),
	CONSTRAINT order_unique UNIQUE (customer_id, product_id, time, date)
);

SELECT * FROM ORDER_;
COPY ORDER_ FROM 'C:\Users\jonsk\Documents\SQL\Project 1\order_table.csv' WITH CSV HEADER;

CREATE TABLE PRODUCT (
	product_id CHAR(50),
	quantity FLOAT(5),
	total_price NUMERIC(12,2),
	CONSTRAINT product_key PRIMARY KEY (product_id),
	CONSTRAINT product_unique UNIQUE (quantity, total_price)
);


SELECT * FROM PRODUCT;
COPY PRODUCT FROM 'C:\Users\jonsk\Documents\SQL\Project 1\product_table.csv' WITH CSV HEADER;

CREATE TABLE VEHICLE (
	vehicle_id CHAR(50),
	customer_id CHAR(50),
	type CHAR(50),
	brand CHAR(50),
	colour CHAR(50),
	CONSTRAINT vehicle_key PRIMARY KEY (vehicle_id),
	CONSTRAINT vehicle_unique UNIQUE (customer_id, type, brand, colour)
);

SELECT * FROM VEHICLE;
COPY VEHICLE FROM 'C:\Users\jonsk\Documents\SQL\Project 1\vehicle_table.csv' WITH CSV HEADER;

/* relational model part */

SELECT 	CUSTOMER.first_name,
		CUSTOMER.last_name,
		CUSTOMER.age,
		ORDER_.order_id,
		ORDER_.product_id,
		ORDER_.time
FROM CUSTOMER JOIN ORDER_
ON CUSTOMER.customer_id = ORDER_.customer_id; /* the tables have now been linked as a relational model of 2 tables*/

SELECT CUSTOMER.first_name, CUSTOMER.last_name, CUSTOMER.county, ORDER_.order_id, ORDER_.time, ORDER_.date, PRODUCT.product_id, PRODUCT.quantity, PRODUCT.total_price, VEHICLE.vehicle_id, VEHICLE.type, VEHICLE.brand
FROM CUSTOMER JOIN ORDER_
ON CUSTOMER.customer_id = ORDER_.customer_id
JOIN PRODUCT 
ON ORDER_.product_id = PRODUCT.product_id
JOIN VEHICLE
ON CUSTOMER.customer_id = VEHICLE.customer_id;
/* all relevant information is in this relational model */