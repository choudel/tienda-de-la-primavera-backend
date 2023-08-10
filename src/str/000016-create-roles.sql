--! Previous: sha1:70b21af611c83ff72bb2bb0082f5b3b198938b42
--! Hash: sha1:a32a439e67755efce667c6706a3265adb56de4e0
--! Message: create roles

DROP ROLE IF EXISTS tienda_postgraphile;
CREATE ROLE tienda_postgraphile LOGIN PASSWORD 'secret_password';
DROP ROLE IF EXISTS tienda_anonymous;
CREATE ROLE tienda_anonymous;
GRANT tienda_anonymous TO tienda_postgraphile;
DROP ROLE IF EXISTS tienda_person;
CREATE ROLE tienda_person;
GRANT tienda_person TO tienda_postgraphile;
