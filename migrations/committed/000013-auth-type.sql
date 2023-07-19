--! Previous: sha1:8f6677f70259d6a7898525ab44963e373338c4c3
--! Hash: sha1:b59649a4b0ad27be4e9e496ec9a52641dee89d87
--! Message: auth type

CREATE TYPE tienda.authenticate_result AS (
  jwt tienda.jwt,
  refreshToken text
);
