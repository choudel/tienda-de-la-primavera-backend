--! Previous: sha1:65e0e632d92a11a4f70f9597c5ac9d62401043c3
--! Hash: sha1:d28040e5a25f3171eb3387071d8c542a77d32097
--! Message: create roles

DROP ROLE IF EXISTS tienda_postgraphile;
CREATE ROLE tienda_postgraphile LOGIN PASSWORD 'secret_password';
DROP ROLE IF EXISTS tienda_anonymous;
CREATE ROLE tienda_anonymous;
GRANT tienda_anonymous TO tienda_postgraphile;
DROP ROLE IF EXISTS tienda_person;
CREATE ROLE tienda_person;
GRANT tienda_person TO tienda_postgraphile;
