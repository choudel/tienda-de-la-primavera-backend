--! Previous: sha1:de7777e16d090d88c36f43b7cafc998b20265f4d
--! Hash: sha1:fe64b734fdb6f4a7be195be22f9f7d65d81984a6
--! Message: create items table

CREATE TABLE tienda.items (
  id SERIAL PRIMARY KEY,
  item TEXT NOT NULL,
  lot TEXT NOT NULL,
  arrival_date DATE NOT NULL,
  out_of_stock_date DATE,
  price NUMERIC NOT NULL,
  sell_text TEXT NOT NULL
);
