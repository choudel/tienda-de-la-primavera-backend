--! Previous: sha1:f5725bdec04c093895fdb7b138dbdb338158dd76
--! Hash: sha1:10730d6d8b482a405ad325283401d66ce832103a
--! Message: role grants

ALTER DEFAULT privileges REVOKE EXECUTE ON functions FROM public;

GRANT usage ON SCHEMA tienda TO tienda_anonymous, tienda_person;

GRANT EXECUTE ON FUNCTION tienda.register_user (text,text,text) TO tienda_anonymous;
GRANT EXECUTE ON FUNCTION tienda.authenticate (text, text) TO tienda_anonymous, tienda_person;


GRANT ALL privileges ON TABLE tienda.user TO tienda_person;
GRANT SELECT, INSERT, UPDATE ( id, item, lot, arrival_date, out_of_stock_date, price, sell_text) ON TABLE tienda.items TO tienda_person;
