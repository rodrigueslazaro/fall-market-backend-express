-- Create the "merchants" table
CREATE TABLE merchants (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL
);

-- Create the "products" table with a foreign key to "merchants"
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price NUMERIC(10, 2) NOT NULL,
  stock INTEGER NOT NULL,
  owner INTEGER REFERENCES merchants(id)
);

-- Insert data into the "merchants" table
INSERT INTO merchants (name, title) VALUES
  ('banana_guy', 'Banan Seller'),
  ('apple_guy', 'Apple Seller'),
  ('blue_guy', 'Blueberry Seller');

-- Insert data into the "products" table
INSERT INTO products (name, price, stock, owner) VALUES
  ('banana', 3.00, 10, 1), -- '1' refers to 'banana_guy'
  ('apple', 2.00, 23, 2), -- '2' refers to 'apple_guy'
  ('blueberry', 1.00, 102, 3); -- '3' refers to 'blue_guy'

