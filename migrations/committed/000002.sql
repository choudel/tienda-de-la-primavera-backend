--! Previous: sha1:6b5d035b0c1d194bd1202817733887d5ae2a2169
--! Hash: sha1:2177106c6aa657d01df9560481b2bac434c24185

-- Enter migration here
--! Message: create user table

CREATE TABLE tienda.user (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  password TEXT NOT NULL,
  email TEXT NOT NULL
);
