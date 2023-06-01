--! Previous: sha1:4dfb707554648c5e2364188d88ebc7d862b52896
--! Hash: sha1:7050b22684afc27bf266447c02eb333730504d33
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
