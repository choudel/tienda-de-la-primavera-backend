--! Previous: sha1:7050b22684afc27bf266447c02eb333730504d33
--! Hash: sha1:14d9c217ee74078bfdf6a53c370f17bfb2dda7eb
--! Message: jwt type

CREATE TYPE tienda.jwt AS (
    role text,
    person_id integer,
    exp bigint
);
