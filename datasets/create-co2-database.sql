CREATE DATABASE CO2;
GO

CREATE TABLE locations (
  id INT PRIMARY KEY,
  value NVARCHAR 11
);
GO

CREATE TABLE treatments (
  id INT PRIMARY KEY,
  value NVARCHAR 10
);
GO

CREATE TABLE plants (
  id INT PRIMARY KEY,
  value NCHAR 3,
  location_id INT,
  treatment_id INT
);
GO

CREATE TABLE measurements (
  id INT PRIMARY KEY,
  plant NCHAR 3,
  conc INT,
  uptake FLOAT
);
GO
