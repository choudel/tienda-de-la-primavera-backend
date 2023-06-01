--! Previous: sha1:56a3d087d2a289c381573359c30ccc9e873b107d
--! Hash: sha1:23df5bed39757f4c37b69fbd8522f6a24b611c11
--! Message: add images urls

UPDATE tienda.items
SET image = CASE
    WHEN row_number = 1 THEN 'headphones-mini.jpg'
    WHEN row_number = 2 THEN 'bag-mini.png'
    WHEN row_number = 3 THEN 'shirt-mini.png'
    END
FROM (SELECT ctid, row_number() OVER (ORDER BY ctid) AS row_number FROM tienda.items LIMIT 3) AS subq
WHERE tienda.items.ctid = subq.ctid;
