
create table emp( sales_personid int primary key ,sale_personname varchar(10));

#Each car can only be sold by one salesperson.
#	There are multiple manufacturers’ cars sold.
#	Each car has the following characteristics:
#	Manufacturer
#	Model name
#	Serial number
#	Weight
#	Price

create table car(model_name varchar(10) NOT NULL ,sales_personid int NOT NULL UNIQUE,car_manufacturer VARCHAR(10) NOT NULL, weight int NOT NULL, price int NOT NULL, serial_num INT PRIMARY KEY, FOREIGN KEY (sales_personid) references emp(sales_personid));

#Customer Name
#	Customer Phone
#	Salesperson
#	Characteristics of car sold

create table sales(date DATE NOT NULL, sales_personid int NOT NULL, cust_name varchar(10) NOT NULL, price int, Customer_phone VARCHAR(10) NOT NULL, serial_num INT, FOREIGN KEY (serial_num) references car(serial_num), FOREIGN KEY (sales_personid) references emp(sales_personid));
