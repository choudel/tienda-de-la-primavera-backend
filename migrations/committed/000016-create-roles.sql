--! Previous: sha1:b87efea205b3208a52e61bd5824e6c652794ea86
--! Hash: sha1:426cbf3d57e2981334f12fd27c9d8ebbd6aa69c1
--! Message: create roles

DROP ROLE IF EXISTS tienda_postgraphile;
CREATE ROLE tienda_postgraphile LOGIN PASSWORD 'secret_password';
DROP ROLE IF EXISTS tienda_anonymous;
CREATE ROLE tienda_anonymous;
GRANT tienda_anonymous TO tienda_postgraphile;
DROP ROLE IF EXISTS tienda_person;
CREATE ROLE tienda_person;
GRANT tienda_person TO tienda_postgraphile;
