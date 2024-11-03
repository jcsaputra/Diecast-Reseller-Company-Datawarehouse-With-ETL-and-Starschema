Project Overview
This repository contains files and scripts to manage the ETL process and analysis of sales data, utilizing a data warehouse approach. The project includes dimensions for time, customer, and product, and an OLAP cube for querying sales information. The purpose is to enable sales tracking by analyzing purchase patterns for each customer, product, and time frame.

Repository Structure
The repository contains the following files and folders:
XML File: Defines the dimensions and cube structure for the data warehouse.
Time Dimension: Consists of Year, Quarter, Month, and Day hierarchies, stored in a "Time" table with OrderDate as the primary key.
Customer Dimension: Contains CustomerName and CustomerID hierarchies, stored in the "Customer" table with CustomerID as the primary key.
Product Dimension: Contains ProductName and ProductID hierarchies, stored in the "Product" table with ProductID as the primary key.
Sales Cube: A cube named "Sales" includes measures such as TotalAmount, with aggregation by summing values. It connects to the dimensions through foreign keys.
JSP File: A JSP script for querying the Sales Cube, allowing retrieval of sales information by CustomerID, ProductID, and ProductName, with TotalAmount as the metric.

ETL Process:
ETL 1: Loads CSV input into the database and looks up OrderDate from the stream, outputting data to a specific table.
ETL 2: Loads CSV input into the database, performs lookups for AmountID, TotalAmount, and QuantitySold, and outputs data to a table named "Paymentinfo".
Kettle Job (KJB): Manages the ETL jobs and schema setup.
Runs ETL1, ETL2, and star schema transformations in sequence to populate the database.
Usage
Database Setup: Ensure database tables for time, customer, product, and sales cube are created.
ETL Execution: Run the ETL jobs to load data from CSV files into the database.
OLAP Analysis: Use the Sales Cube to analyze customer purchase data by querying sales metrics.
Output
The OLAP cube enables tracking of each customer's purchase patterns, for example, showing that a customer purchased a specific product (e.g., "Maisto Ford GT"), allowing the company to analyze popular products and customer behavior.
