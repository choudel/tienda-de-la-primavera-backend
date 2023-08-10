--! Previous: sha1:a32a439e67755efce667c6706a3265adb56de4e0
--! Hash: sha1:e7c81fda4a16776ed85e092c8bf3f268b945f060
--! Message: role grants

ALTER DEFAULT privileges REVOKE EXECUTE ON functions FROM public;

GRANT usage ON SCHEMA tienda TO tienda_anonymous, tienda_person;

GRANT EXECUTE ON FUNCTION tienda.register_user (text,text,text) TO tienda_anonymous;
GRANT EXECUTE ON FUNCTION tienda.authenticate (text, text) TO tienda_anonymous, tienda_person;


GRANT ALL privileges ON TABLE tienda.user TO tienda_person;
GRANT SELECT, INSERT, UPDATE ( id, item, lot, arrival_date, out_of_stock_date, price, sell_text) ON TABLE tienda.items TO tienda_person;
