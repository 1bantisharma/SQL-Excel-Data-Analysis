
-- Create Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    location VARCHAR(50),
    signup_date DATE
);

-- Create Products Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

-- Create Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    total_amount DECIMAL(10,2)
);

-- Create Sales Table
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    revenue DECIMAL(10,2)
);

-- Insert Sample Customers
INSERT INTO customers (name, email, location, signup_date) VALUES
('Alice Johnson', 'alice@example.com', 'New York', '2023-01-10'),
('Bob Smith', 'bob@example.com', 'Los Angeles', '2023-02-15'),
('Charlie Davis', 'charlie@example.com', 'Chicago', '2023-03-20');

-- Insert Sample Products
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Laptop', 'Electronics', 999.99, 50),
('Smartphone', 'Electronics', 699.99, 100),
('Headphones', 'Accessories', 199.99, 200);

-- Insert Sample Orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2024-03-01', 1699.98),
(2, '2024-03-05', 999.99),
(3, '2024-03-10', 199.99);

-- Insert Sample Sales Data
INSERT INTO sales (order_id, product_id, quantity, revenue) VALUES
(1, 1, 1, 999.99),
(1, 2, 1, 699.99),
(2, 1, 1, 999.99),
(3, 3, 1, 199.99);
