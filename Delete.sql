USE hotel_management_db;
SELECT * FROM Customers;
DELETE FROM Bookings
WHERE customer_id = 3;
DELETE FROM Customers
WHERE customer_id = 3;