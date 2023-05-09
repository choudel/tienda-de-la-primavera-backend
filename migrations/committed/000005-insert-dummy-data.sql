--! Previous: sha1:fe64b734fdb6f4a7be195be22f9f7d65d81984a6
--! Hash: sha1:5b8adba8c15201dae90cfa755bf65cf19958ad3e
--! Message: insert dummy data

INSERT INTO tienda.items (item, lot, arrival_date, out_of_stock_date, price, sell_text)
VALUES
  ('item1', 'lot1', '2022-01-01', '2022-01-31', 10.99, 'sell text 1'),
  ('item2', 'lot2', '2022-02-01', '2022-02-28', 20.99, 'sell text 2'),
  ('item3', 'lot3', '2022-03-01', NULL, 30.99, 'sell text 3');
