--! Previous: sha1:d28040e5a25f3171eb3387071d8c542a77d32097
--! Hash: sha1:7bec4e8c80757760a54e93c67c1124ff5818ac77
--! Message: role grants

ALTER DEFAULT privileges REVOKE EXECUTE ON functions FROM public;

GRANT usage ON SCHEMA tienda TO tienda_anonymous, tienda_person;

GRANT EXECUTE ON FUNCTION tienda.register_user (text,text,text) TO tienda_anonymous;
GRANT EXECUTE ON FUNCTION tienda.authenticate (text, text) TO tienda_anonymous, tienda_person;


GRANT ALL privileges ON TABLE tienda.user TO tienda_person;
GRANT SELECT, INSERT, UPDATE ( id, item, lot, arrival_date, out_of_stock_date, price, sell_text) ON TABLE tienda.items TO tienda_person;
