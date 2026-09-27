use upgrade;




CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(10)
);

INSERT INTO Customers (first_name, last_name, email, phone, address, city, state, zip_code) VALUES
('Alice', 'Smith', 'alice.smith@example.com', '123-456-7890', '123 Main St', 'Anytown', 'CA', '90210'),
('Bob', 'Johnson', 'bob.johnson@example.com', '987-654-3210', '456 Oak Ave', 'Sometown', 'NY', '10001'),
('Charlie', 'Brown', 'charlie.brown@example.com', '555-123-4567', '789 Pine Ln', 'Otherville', 'TX', '75001'),
('Diana', 'Prince', 'diana.prince@example.com', '111-222-3333', '101 Royal Rd', 'Wonderland', 'GA', '30303'),
('Eve', 'Davis', 'eve.davis@example.com', '444-555-6666', '202 Market St', 'Biztown', 'FL', '33101');


CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

INSERT INTO Products (product_name, category, price, stock_quantity) VALUES
('Laptop Pro X', 'Electronics', 1200.00, 50),
('Mechanical Keyboard', 'Accessories', 75.00, 200),
('Wireless Mouse', 'Accessories', 25.00, 300),
('4K Monitor', 'Electronics', 450.00, 80),
('USB-C Hub', 'Accessories', 35.00, 150),
('External SSD 1TB', 'Storage', 150.00, 100),
('Webcam HD', 'Peripherals', 60.00, 120);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
INSERT INTO Orders (customer_id, order_date, product_id, quantity, total_price) VALUES
(1, '2024-01-15', 1, 1, 1200.00), -- Alice bought Laptop Pro X
(1, '2024-01-15', 3, 2, 50.00),  -- Alice bought Wireless Mouse (2 units)
(2, '2024-02-20', 2, 1, 75.00),  -- Bob bought Mechanical Keyboard
(3, '2024-03-10', 4, 1, 450.00), -- Charlie bought 4K Monitor
(4, '2024-04-01', 1, 1, 1200.00),-- Diana bought Laptop Pro X
(4, '2024-04-01', 5, 3, 105.00), -- Diana bought USB-C Hub (3 units)
(5, '2024-05-05', 6, 1, 150.00), -- Eve bought External SSD 1TB
(2, '2024-05-10', 3, 1, 25.00),  -- Bob bought Wireless Mouse
(1, '2024-06-01', 7, 1, 60.00);  -- Alice bought Webcam HD





select 