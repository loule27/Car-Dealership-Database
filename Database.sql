-- Drop and recreate so the script can run multiple times cleanly
DROP DATABASE IF EXISTS dealership_db;
CREATE DATABASE dealership_db;
USE dealership_db;

CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(50),
    address       VARCHAR(50),
    phone         VARCHAR(12)
);

CREATE TABLE vehicles (
    VIN          VARCHAR(17)  PRIMARY KEY,
    year         INT,
    make         VARCHAR(50),
    model        VARCHAR(50),
    vehicle_type VARCHAR(50),
    color        VARCHAR(30),
    odometer     INT,
    price        DECIMAL(10, 2),
    sold         BOOLEAN DEFAULT FALSE
);

CREATE TABLE inventory (
    dealership_id INT,
    VIN           VARCHAR(17),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN)           REFERENCES vehicles(VIN)
);

CREATE TABLE sales_contracts (
    id            INT AUTO_INCREMENT PRIMARY KEY,
    date          VARCHAR(20),
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    VIN           VARCHAR(17),
    sales_tax     DECIMAL(10, 2),
    recording_fee DECIMAL(10, 2),
    processing_fee DECIMAL(10, 2),
    total_price   DECIMAL(10, 2),
    monthly_payment DECIMAL(10, 2),
    finance_option BOOLEAN,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

CREATE TABLE lease_contracts (
    id                   INT AUTO_INCREMENT PRIMARY KEY,
    date                 VARCHAR(20),
    customer_name        VARCHAR(100),
    customer_email       VARCHAR(100),
    VIN                  VARCHAR(17),
    expected_ending_value DECIMAL(10, 2),
    lease_fee            DECIMAL(10, 2),
    total_price          DECIMAL(10, 2),
    monthly_payment      DECIMAL(10, 2),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

INSERT INTO dealerships (name, address, phone)
VALUES
    ('D & B Used Cars',    '111 Old Benbrook Rd',  '817-555-5555'),
    ('Lone Star Motors',   '422 Highway 80',       '214-555-1234'),
    ('Metro Auto Center',  '900 Commerce Street',  '972-555-9876');

INSERT INTO vehicles (VIN, year, make, model, vehicle_type, color, odometer, price, sold)
VALUES
    ('1HGCM82633A123456', 1993, 'Ford',       'Explorer',  'SUV',   'Red',    525123, 995.00,   FALSE),
    ('2T1BURHE0JC543210', 2001, 'Ford',        'Ranger',    'truck', 'Yellow', 172544, 1995.00,  FALSE),
    ('3VWFE21C04M000001', 2012, 'Honda',       'Civic',     'car',   'Gray',   103221, 6995.00,  FALSE),
    ('4T1BF1FK5CU512345', 2018, 'Toyota',      'Camry',     'car',   'White',   45000, 15995.00, FALSE),
    ('5FNRL5H61GB123789', 2015, 'Chevrolet',   'Silverado', 'truck', 'Black',   89000, 22500.00, FALSE),
    ('6G1ZD5ST2KL900123', 2019, 'Honda',       'CR-V',      'SUV',   'Blue',    33000, 24995.00, FALSE),
    ('7JRBR2FM4A1000456', 2010, 'Dodge',       'Caravan',   'van',   'Silver', 142000, 7500.00,  FALSE),
    ('8AFACGEX5K1234567', 2022, 'Toyota',      'Tacoma',    'truck', 'Green',   12000, 34995.00, FALSE),
    ('9BWZZZ377VT004251', 2016, 'Ford',        'Mustang',   'car',   'Red',     67000, 19500.00, TRUE),
    ('JH4KA7650MC123456', 2020, 'Chevrolet',   'Malibu',    'car',   'Black',   28000, 18750.00, FALSE);

-- Dealership 1 has vehicles 1-6
-- Dealership 2 has vehicles 7-8
-- Dealership 3 has vehicles 9-10
INSERT INTO inventory (dealership_id, VIN)
VALUES
    (1, '1HGCM82633A123456'),
    (1, '2T1BURHE0JC543210'),
    (1, '3VWFE21C04M000001'),
    (1, '4T1BF1FK5CU512345'),
    (2, '5FNRL5H61GB123789'),
    (2, '6G1ZD5ST2KL900123'),
    (2, '7JRBR2FM4A1000456'),
    (3, '8AFACGEX5K1234567'),
    (3, '9BWZZZ377VT004251'),
    (3, 'JH4KA7650MC123456');

INSERT INTO sales_contracts (date, customer_name, customer_email, VIN, sales_tax, recording_fee, processing_fee, total_price, monthly_payment, finance_option)
VALUES
    ('20210928', 'Dana Wyatt',    'dana@texas.com', '9BWZZZ377VT004251', 975.00, 100.00, 495.00, 21070.00, 440.32, TRUE),
    ('20220315', 'Marcus Green',  'marcus@mail.com', '1HGCM82633A123456', 49.75, 100.00, 295.00, 1439.75,  0.00,  FALSE);

INSERT INTO lease_contracts (date, customer_name, customer_email, VIN, expected_ending_value, lease_fee, total_price, monthly_payment)
VALUES
    ('20210928', 'Zachary Westly', 'zach@texas.com', '5FNRL5H61GB123789', 11250.00, 1575.00, 12825.00, 356.81);