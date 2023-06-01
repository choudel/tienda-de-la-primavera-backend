--! Previous: sha1:764ab5428cbb65f4f76500ecf84c91a5f2588d8e
--! Hash: sha1:30b424fd08e33a60386fa4a1933d013eb682f902
--! Message: insert dummy data

INSERT INTO tienda.items (item, lot, arrival_date, out_of_stock_date, price, sell_text)
VALUES
  ('Headphones', 'lot1', '2022-01-01', '2022-01-31', 10.99, 'best headphones'),
  ('Bag', 'lot2', '2022-02-01', '2022-02-28', 20.99, 'Ecologic bags'),
  ('Shirt', 'lot3', '2022-03-01', NULL, 30.99, 'Shirts with cashmir');
