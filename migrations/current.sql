--! Message: add policy 
ALTER TABLE tienda.items enable ROW level SECURITY;

CREATE policy update_item ON tienda.items FOR UPDATE TO tienda_person USING (id = nullif(current_setting('jwt.claims.person_id',TRUE),'')::integer);

CREATE policy insert_item ON tienda.items FOR INSERT TO tienda_person WITH CHECK (id = nullif(current_setting('jwt.claims.person_id',TRUE),'')::integer);