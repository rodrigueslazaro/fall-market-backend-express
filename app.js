const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');

const app = express();

//const corsOptions = {
//  origin: 'http://localhost:4200',
//  methods: 'POST, GET', // You can specify other HTTP methods as needed.
//};

app.use(cors({
  "origin": "*",
  "methods": "GET,HEAD,PUT,PATCH,POST,DELETE",
}));

const pool = new Pool({
  user: 'fm_admin',
  host: '127.0.0.1',
  database: 'fm_products',
  password: 'mgdhcz8dt',
  port: 5432,
});

app.get('/api/items', (req, res) => {
  // Connect to the PostgreSQL database
  pool.connect((err, client, done) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      res.status(500).json({ error: 'Database connection error' });
      return;
    }

    // Query to fetch data from a table (replace 'your_table' with your table name)
    const query = 'SELECT * FROM public.products';

    // Execute the query
    client.query(query, (err, result) => {
      done(); // Release the client back to the pool

      if (err) {
        console.error('Error fetching data:', err);
        res.status(500).json({ error: 'An error occurred' });
        return;
      }

      const data = result.rows; // Assuming the result is an array of objects
      res.json(data);
    });
  });
});

app.post('/api/items', (req, res) => {
  console.log(req.body);
  const newItem = req.body;

  pool.connect((err, client, done) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      res.status(500).json({ error: 'Database connection error' });
      return;
    }

    const query = 'INSERT INTO products (name, price, stock, owner) VALUES ($1, $2, $3, $4)';
    const values = [newItem.name, newItem.price, newItem.stock, newItem.owner];

    client.query(query, values, (err, result) => {
      done(); // Release the client back to the pool

      if (err) {
        console.error('Error inserting data:', err);
        res.status(500).json({ error: 'Item could not be added to the database' });
      } else {
        res.status(201).json({ message: 'Item added successfully' });
      }
    });
  });
});

//app.use((req, res, next) => {
//  res.header('Access-Control-Allow-Origin', 'http://localhost:3000');
//  res.header('Access-Control-Allow-Methods', 'POST, GET'); // You can specify other methods.
//  res.header('Access-Control-Allow-Headers', 'Content-Type');
//  next();
//});

const port = 3000; // You can change the port as needed
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
