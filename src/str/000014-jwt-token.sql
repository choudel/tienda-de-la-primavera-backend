--! Previous: sha1:b59649a4b0ad27be4e9e496ec9a52641dee89d87
--! Hash: sha1:b95d684ab0cdd3dd6c8f2703b52a78beeb52ffa8
--! Message: jwt-token

create table tienda_private.refresh_tokens(
    token text,
    person_id integer PRIMARY KEY REFERENCES tienda.user(id) ON DELETE CASCADE,
    expires_at bigint
);
create table tienda_private.jwt_tokens(
    person_id integer PRIMARY KEY REFERENCES tienda.user(id) ON DELETE CASCADE,
    jwt tienda.jwt
);
