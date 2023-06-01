--! Previous: sha1:262edea54dd1f47d9bb5a7efc6588cd69c69196c
--! Hash: sha1:b61e4cf0169a649a2a83955a7c905afcf9574135
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
