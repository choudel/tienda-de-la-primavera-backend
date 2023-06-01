--! Previous: sha1:1862a798ed7175dd64eae42b7f504083a09201c8
--! Hash: sha1:262edea54dd1f47d9bb5a7efc6588cd69c69196c
--! Message: jwt type

CREATE TYPE tienda.jwt AS (
    role text,
    person_id integer,
    exp bigint
);
