CREATE DATABASE hotel_management_db;
USE hotel_management_db;
-- Customers
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Rooms
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(50) NOT NULL,
    price_per_night DECIMAL(10,2) CHECK (price_per_night > 0),
    status VARCHAR(20) NOT NULL
);

-- Bookings
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    room_id INT,
    check_in_date DATE,
    check_out_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

-- Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
INSERT INTO Customers VALUES
(1, 'Alice Brown', 'alice@email.com', '111111111'),
(2, 'David Green', 'david@email.com', '222222222');

INSERT INTO Rooms VALUES
(201, 'Single', 60.00, 'Available'),
(202, 'Double', 90.00, 'Available');

INSERT INTO Bookings VALUES
(1, 1, 201, '2026-04-15', '2026-04-18');

INSERT INTO Payments VALUES
(1, 1, 180.00, '2026-04-14', 'Card');
-- JOIN
SELECT c.name, r.room_type, b.check_in_date
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
JOIN Rooms r ON b.room_id = r.room_id;

-- Aggregation
SELECT SUM(amount) AS total_revenue FROM Payments;

-- Filtering
SELECT * FROM Rooms WHERE status = 'Available';