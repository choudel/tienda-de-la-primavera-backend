--! Previous: sha1:b2b5d4773914f880acc65e60c2cec28ce50bdfe1
--! Hash: sha1:8f6677f70259d6a7898525ab44963e373338c4c3
--! Message: jwt type

CREATE TYPE tienda.jwt AS (
    role text,
    person_id integer,
    exp bigint
);
