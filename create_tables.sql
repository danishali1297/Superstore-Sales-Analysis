create database superstore;
use superstore;
-- Customers Table
CREATE TABLE customers (
    CustomerID VARCHAR(20) PRIMARY KEY,
    CustomerName VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    Region VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50)
);

-- Products Table
CREATE TABLE products (
    ProductID VARCHAR(20) PRIMARY KEY,
    ProductName VARCHAR(150),
    Category VARCHAR(50),
    SubCategory VARCHAR(50)
);

-- Orders Table
CREATE TABLE orders (
    OrderID VARCHAR(20),
    OrderDate DATE,
    CustomerID VARCHAR(20),
    ProductID VARCHAR(20),
    Sales DECIMAL(10,4),
    Quantity INT,
    Discount DECIMAL(4,4),
    Profit DECIMAL(10,6),
    ShippingCost DECIMAL(10,6),
    ShipDate DATE,
    ShipMode VARCHAR(50),
    OrderPriority VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);



