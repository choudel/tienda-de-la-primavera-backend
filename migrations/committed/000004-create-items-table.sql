--! Previous: sha1:fc7681b7fa2911398487608571b31eea16a071f0
--! Hash: sha1:764ab5428cbb65f4f76500ecf84c91a5f2588d8e
--! Message: create items table

CREATE TABLE tienda.items (
  id SERIAL PRIMARY KEY,
  item TEXT NOT NULL,
  lot TEXT,
  arrival_date DATE,
  out_of_stock_date DATE,
  price NUMERIC NOT NULL,
  sell_text TEXT NOT NULL
);
