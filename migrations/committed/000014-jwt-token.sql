--! Previous: sha1:c3c09cf04a61551e461083676520007eea26f37f
--! Hash: sha1:616b705803f23ead7db83f5eb0cba3e9cd0e0562
--! Message: jwt-token

create table tienda_private.refresh_tokens(
    token text,
    person_id integer PRIMARY KEY REFERENCES tienda.user(id) ON DELETE CASCADE,
    expires_at bigint
);
create table tienda_private.jwt_tokens(
    person_id integer PRIMARY KEY REFERENCES tienda.user(id) ON DELETE CASCADE,
    jwt text
);
