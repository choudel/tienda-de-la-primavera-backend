--! Previous: sha1:736e7ed19f10e0e445ed8a5acd92c4d4e6513027
--! Hash: sha1:bb3e9ca8bb46958f517434abd10bde5f6e10008f
--! Message: create roles

DROP ROLE IF EXISTS tienda_postgraphile;
CREATE ROLE tienda_postgraphile LOGIN PASSWORD 'secret_password';
DROP ROLE IF EXISTS tienda_anonymous;
CREATE ROLE tienda_anonymous;
GRANT tienda_anonymous TO tienda_postgraphile;
DROP ROLE IF EXISTS tienda_person;
CREATE ROLE tienda_person;
GRANT tienda_person TO tienda_postgraphile;
