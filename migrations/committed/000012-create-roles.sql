--! Previous: sha1:7050b22684afc27bf266447c02eb333730504d33
--! Hash: sha1:1862a798ed7175dd64eae42b7f504083a09201c8
--! Message: create roles

DROP ROLE IF EXISTS tienda_postgraphile;
CREATE ROLE tienda_postgraphile LOGIN PASSWORD 'secret_password';
DROP ROLE IF EXISTS tienda_anonymous;
CREATE ROLE tienda_anonymous;
GRANT tienda_anonymous TO tienda_postgraphile;
DROP ROLE IF EXISTS tienda_person;
CREATE ROLE tienda_person;
GRANT tienda_person TO tienda_postgraphile;
