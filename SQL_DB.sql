create table SALESPERSONS( sales_personid int UNIQUE PRIMARY KEY ,sale_personname varchar(10));

#Each car can only be sold by one salesperson.
#There are multiple manufacturers’ cars sold.


create table CAR(model_name varchar(10) NOT NULL UNIQUE,sales_personid int NOT NULL UNIQUE PRIMARY KEY,car_manufacturer VARCHAR(10) NOT NULL, FOREIGN KEY (sales_personid) references SALESPERSONS(sales_personid));

#Customer Name
#	Customer Phone
#	Salesperson
#	Characteristics of car sold
#	Manufacturer
#	Model name
#	Serial number
#	Weight
#	Price

create table sales(date DATE NOT NULL,model_name varchar(10) NOT NULL,  car_manufacturer VARCHAR(10) NOT NULL, sales_personid int NOT NULL, customer_name varchar(10) NOT NULL, price int NOT NULL, Customer_phone VARCHAR(10) NOT NULL UNIQUE, serial_num INT PRIMARY KEY, FOREIGN KEY (model_name) references CAR(model_name), FOREIGN KEY (sales_personid) references SALESPERSONS(sales_personid));
