--! Previous: sha1:14d9c217ee74078bfdf6a53c370f17bfb2dda7eb
--! Hash: sha1:c3c09cf04a61551e461083676520007eea26f37f
--! Message: auth type

CREATE TYPE tienda.authenticate_result AS (
  jwt tienda.jwt,
  refreshToken text
);
