-- create the database
DROP DATABASE IF EXISTS week1_workshop;
CREATE DATABASE week1_workshop;
-- connect via psql
\c week1_workshop

-- database configuration
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;


---
--- CREATE tables
---

CREATE TABLE products (
    product_id SERIAL,
    product_name TEXT NOT NULL,
    discontinued INT NOT NULL,
    supplier_id INT,
    category_id INT,
    PRIMARY KEY(product_id)
);


CREATE TABLE categories (
    category_id SERIAL,
    category_name TEXT NOT NULL,
    category_description TEXT,
    picture TEXT,
    PRIMARY KEY (category_id)
);

-- TODO create more tables here...
CREATE TABLE customers (
    customer_id SERIAL,
    company_name TEXT NOT NULL,
    PRIMARY KEY(customer_id)
);


CREATE TABLE orders (
    order_id SERIAL,
    order_date TIMESTAMP,
    customer_id INT,
    shipper_id INT,
    employee_id INT,
    PRIMARY KEY(customer_id)
);


CREATE TABLE shippers (
    shipper_id SERIAL,
    shipper_name TEXT NOT NULL,
    shipper_phone TEXT,
    PRIMARY KEY (shipper_id)
);


CREATE TABLE employees (
    employee_id SERIAL,
    employee_first_name TEXT NOT NULL,
    employee_last_name TEXT NOT NULL,
    reports_to INT,
    PRIMARY KEY (employee_id)
);

CREATE TABLE suppliers (
    supplier_id SERIAL,
    supplier_name TEXT NOT NULL,
    PRIMARY KEY (supplier_id)
);


CREATE TABLE territories (
    territory_id SERIAL,
    region_id INT  NOT NULL,
    territory_description TEXT NOT NULL,
    PRIMARY KEY (territory_id )
);

CREATE TABLE regions (
    region_id SERIAL,
    region_description TEXT NOT NULL,
    PRIMARY KEY (region_id )
);


CREATE TABLE us_states (
    state_id SERIAL,
    state_name TEXT,
    state_abvr CHARACTER(2) NOT NULL UNIQUE,
    PRIMARY KEY (state_id)
);


CREATE TABLE prod_order(
    order_id INT,
    product_id INT NOT NULL,
    discount NUMERIC NOT NULL,
    quantity INT,
    PRIMARY KEY (product_id, order_id)
);

CREATE TABLE territory_employee(
    employee_id INT NOT NULL,
    territory_id INT NOT NULL,
    PRIMARY KEY (territory_id, employee_id)
);

---
--- Add foreign key constraints
---

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (category_id)
REFERENCES categories;



-- TODO create more constraints here...

ALTER TABLE products
ADD CONSTRAINT fk_products_suppliers
FOREIGN KEY (supplier_id)
REFERENCES suppliers;


ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_employees
FOREIGN KEY (employee_id)
REFERENCES employees;

ALTER TABLE orders
ADD CONSTRAINT fk_orders_shippers
FOREIGN KEY (shipper_id)
REFERENCES shippers;

ALTER TABLE employees
ADD CONSTRAINT fk_employees
FOREIGN KEY (reports_to)
REFERENCES employees;

ALTER TABLE territories
ADD CONSTRAINT fk_territories_regions
FOREIGN KEY (region_id)
REFERENCES regions;