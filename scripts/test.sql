---- Create the "merchants" table
--CREATE TABLE merchants (
--  id SERIAL PRIMARY KEY,
--  name VARCHAR(255) NOT NULL,
--  title VARCHAR(255) NOT NULL
--);
--
---- Create the "products" table with a foreign key to "merchants"
--CREATE TABLE products (
--  id SERIAL PRIMARY KEY,
--  name VARCHAR(255) NOT NULL,
--  price NUMERIC(10, 2) NOT NULL,
--  stock INTEGER NOT NULL,
--  owner INTEGER REFERENCES merchants(id)
--);

-- Insert data into the "merchants" table
--INSERT INTO merchants (name, title) VALUES
--  ('blue_guy', 'Blueberry Seller');

-- Insert data into the "products" table
INSERT INTO products (name, price, stock, owner) VALUES
  ('ruby', 2, 3, 1),
  ('bat_ear', 2, 3, 1),
  ('emerald', 2, 3, 1),
  ('amethyst', 2, 3, 1),
  ('baluk_eye', 2, 3, 1),
  ('baluk_fur', 2, 3, 1),
  ('zonkie_eye', 2, 3, 1),
  ('harienir_fur', 2, 3, 1),
  ('lapis_lazuli', 2, 3, 1),
  ('silvian_blood', 2, 3, 1),
  ('potion_of_sleep', 2, 3, 1),
  ('potion_of_hunger', 2, 3, 1);


