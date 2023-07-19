--! Previous: sha1:03c55a624666f04352cdef6fb0da9804439c716d
--! Hash: sha1:9fceb8f3841ae386d867d39c0f649312470d08ac

-- Enter migration here
--! Message: create person account

create table tienda_private.user_account(
    person_id integer PRIMARY KEY REFERENCES tienda.user(id) ON DELETE CASCADE,
    email text NOT NULL UNIQUE CHECK (email ~* '^.+@.+\..+$'),
    password_hash text NOT NULL
);

create index user_account_email_idx ON tienda_private.user_account (email);

create table tienda_private.refresh_tokens(
    token text,
    person_id integer PRIMARY KEY REFERENCES tienda.user(id) ON DELETE CASCADE,
    expires_at text 
);
