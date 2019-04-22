DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS order_detail;
DROP TABLE IF EXISTS product;

CREATE TABLE customer (
    CustomerID SERIAL NOT null ,
    CompanyName character varying(40) NOT NULL,
    ContactName character varying(30),
    ContactTitle character varying(30),
    Address character varying(60),
    City character varying(15),
    Region character varying(15),
    PostalCode character varying(10),
    Country character varying(15),
    Phone character varying(24),
    Fax character varying(24)
);

CREATE TABLE orders (
    OrderID SERIAL NOT NULL,
    CustomerID bpchar,
    EmployeeID smallint,
    OrderDate date,
    RequiredDate date,
    ShippedDate date,
    ShipVia smallint,
    Freight real,
    ShipName character varying(40),
    ShipAddress character varying(60),
    ShipCity character varying(15),
    ShipRegion character varying(15),
    ShipPostalCode character varying(10),
    ShipCountry character varying(15)
);

CREATE TABLE order_detail (
    OrderID SERIAL NOT NULL,
    ProductID smallint NOT NULL,
    UnitPrice real NOT NULL,
    Quantity smallint NOT NULL,
    Discount real NOT NULL
);

CREATE TABLE product (
    ProductID SERIAL NOT NULL,
    ProductName character varying(40) NOT NULL,
    SupplierID smallint,
    CategoryID smallint,
    QuantityPerUnit character varying(20),
    UnitPrice real,
    UnitsInStock smallint,
    UnitsOnOrder smallint,
    ReorderLevel smallint,
    Discontinued integer
);

ALTER TABLE ONLY customer
	ADD CONSTRAINT pk_customer PRIMARY KEY (CustomerID);

ALTER TABLE ONLY orders
    ADD CONSTRAINT pk_order PRIMARY KEY (OrderID);

ALTER TABLE ONLY order_detail
    ADD CONSTRAINT pk_order_detail PRIMARY KEY (OrderID,ProductID);
   
ALTER TABLE ONLY product
    ADD CONSTRAINT pk_product PRIMARY KEY (ProductID);