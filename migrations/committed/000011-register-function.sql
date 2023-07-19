--! Previous: sha1:c8533e318f77689a1f3aa1192fa449188c92ac49
--! Hash: sha1:b2b5d4773914f880acc65e60c2cec28ce50bdfe1
--! Message: register function

create function tienda.register_user (name text, email text,password text)
RETURNS tienda.user 
AS $$
DECLARE
person tienda.user;
BEGIN
INSERT INTO tienda.user (name,email)
VALUES(name,email)
RETURNING
* INTO person;
INSERT INTO tienda_private.user_account(person_id, email, password_hash) VALUES (person.id , email, crypt(password,gen_salt('bf')));
RETURN person;
END;
$$
LANGUAGE plpgsql
STRICT
SECURITY DEFINER;
