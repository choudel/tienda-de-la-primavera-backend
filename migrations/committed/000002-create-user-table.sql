--! Previous: sha1:0af3a178f148a0bb5db1472181ca1858d973b6b1
--! Hash: sha1:12d0e4c820d3ccad22926a78090585b736a15dee
--! Message: create user table

CREATE TABLE tienda.user (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT 
);
