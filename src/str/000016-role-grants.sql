--! Previous: sha1:bb3e9ca8bb46958f517434abd10bde5f6e10008f
--! Hash: sha1:caa34ae106d1bb7173fab40875d44ab1975a80e6
--! Message: role grants

ALTER DEFAULT privileges REVOKE EXECUTE ON functions FROM public;

GRANT usage ON SCHEMA tienda TO tienda_anonymous, tienda_person;

GRANT EXECUTE ON FUNCTION tienda.register_user (text,text,text) TO tienda_anonymous;
GRANT EXECUTE ON FUNCTION tienda.authenticate (text, text) TO tienda_anonymous, tienda_person;


GRANT ALL privileges ON TABLE tienda.user TO tienda_person;
GRANT SELECT, INSERT, UPDATE ( id, item, lot, arrival_date, out_of_stock_date, price, sell_text) ON TABLE tienda.items TO tienda_person;
