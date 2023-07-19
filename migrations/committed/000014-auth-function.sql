--! Previous: sha1:b59649a4b0ad27be4e9e496ec9a52641dee89d87
--! Hash: sha1:65e0e632d92a11a4f70f9597c5ac9d62401043c3
--! Message: auth function

CREATE FUNCTION tienda.authenticate (email text, password text)
  RETURNS tienda.jwt
  AS $$
DECLARE
  account tienda_private.user_account;
BEGIN
  SELECT
    * INTO account
  FROM
    tienda_private.user_account
  WHERE
    user_account.email = authenticate.email;
  IF account.password_hash = crypt(password, account.password_hash) THEN
    RETURN ('tienda_person',
      account.person_id,
      extract(epoch FROM (now() + interval '30 days')))::tienda.jwt;
  ELSE
    RETURN NULL;
  END IF;
END;
$$
LANGUAGE plpgsql
STRICT
SECURITY DEFINER;
