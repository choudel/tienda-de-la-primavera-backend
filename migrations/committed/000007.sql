--! Previous: sha1:ad4543109257b4018ab7adbb94f12bf91cce4ea5
--! Hash: sha1:c307bdf65040bdd0650bbd67077bf03746f66f18

-- Message : fill image col
UPDATE tienda.items
SET image = CASE
    WHEN row_number = 1 THEN 'bag-mini.png'
    WHEN row_number = 2 THEN 'shirt-mini.png'
    WHEN row_number = 3 THEN 'headphones-mini.jpg'
    END
FROM (SELECT ctid, row_number() OVER (ORDER BY ctid) AS row_number FROM tienda.items LIMIT 3) AS subq
WHERE tienda.items.ctid = subq.ctid;
