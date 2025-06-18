-- Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    Price DECIMAL(5,2)
);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    BookID INT,
    OrderDate DATE
);

-- Insert sample books
INSERT INTO Books VALUES (1, 'Cyber Laws', 'Alex Ray', 15.99);
INSERT INTO Books VALUES (2, 'Html Coding', 'Sam Knight', 12.50);
INSERT INTO Books VALUES (3, 'Java for Beginners', 'Luna White', 20.00);

-- Insert sample customers
INSERT INTO Customers VALUES (101, 'Ghanesh Kalloo', 'ghanesh@email.com');
INSERT INTO Customers VALUES (102, 'Avi kalloo', 'avi@email.com');

-- Insert sample orders
INSERT INTO Orders VALUES (1001, 101, 1, '2024-03-10');
INSERT INTO Orders VALUES (1002, 102, 3, '2024-03-12');
INSERT INTO Orders VALUES (1003, 101, 2, '2024-03-15');

-- View all books
SELECT * FROM Books;

-- Show customer orders with book titles
SELECT Customers.Name, Books.Title, Orders.OrderDate
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Books ON Orders.BookID = Books.BookID;

-- Show how many times each book was ordered
SELECT Books.Title, COUNT(Orders.OrderID) AS TimesOrdered
FROM Orders
JOIN Books ON Orders.BookID = Books.BookID
GROUP BY Books.Title;

-- Update a book price
UPDATE Books SET Price = 13.99 WHERE BookID = 2;

-- Delete an order
DELETE FROM Orders WHERE OrderID = 1002;
