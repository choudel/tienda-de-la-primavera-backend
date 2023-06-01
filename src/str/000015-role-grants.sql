--! Previous: sha1:b61e4cf0169a649a2a83955a7c905afcf9574135
--! Hash: sha1:504166a00190321571a888d0be2281e484a0b3c0
--! Message: role grants

ALTER DEFAULT privileges REVOKE EXECUTE ON functions FROM public;

GRANT usage ON SCHEMA tienda TO tienda_anonymous, tienda_person;

GRANT EXECUTE ON FUNCTION tienda.register_user (text,text,text) TO tienda_anonymous;
GRANT EXECUTE ON FUNCTION tienda.authenticate (text, text) TO tienda_anonymous, tienda_person;


GRANT ALL privileges ON TABLE tienda.user TO tienda_person;
GRANT SELECT, INSERT, UPDATE ( id, item, lot, arrival_date, out_of_stock_date, price, sell_text) ON TABLE tienda.items TO tienda_person;
