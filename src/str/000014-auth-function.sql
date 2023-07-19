--! Previous: sha1:b59649a4b0ad27be4e9e496ec9a52641dee89d87
--! Hash: sha1:736e7ed19f10e0e445ed8a5acd92c4d4e6513027
--! Message: auth function

CREATE FUNCTION tienda.authenticate (email text, password text)
  RETURNS tienda.authenticate_result
  AS $$
DECLARE
  account tienda_private.user_account;
  refresh_token text;
BEGIN
  SELECT
    * INTO account
  FROM
    tienda_private.user_account
  WHERE
    user_account.email = authenticate.email;
  IF account.password_hash = crypt(password, account.password_hash) THEN
    -- Generate a secure random refresh token
    refresh_token := gen_random_uuid();
    -- Store the refresh token in the database along with its expiration date
    INSERT INTO tienda_private.refresh_tokens (token, person_id, expires_at)
      VALUES (refresh_token, account.person_id, now() + interval '30 days');
    -- Return the JWT token along with the refresh token
    RETURN (ROW(
      ('tienda_person',
        account.person_id,
        extract(epoch FROM (now() + interval '30 days')))::tienda.jwt,
      refresh_token)::tienda.authenticate_result);
  ELSE
    RETURN NULL;
  END IF;
END;
$$
LANGUAGE plpgsql
STRICT
SECURITY DEFINER;
