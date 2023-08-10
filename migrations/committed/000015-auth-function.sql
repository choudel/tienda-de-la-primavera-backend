--! Previous: sha1:616b705803f23ead7db83f5eb0cba3e9cd0e0562
--! Hash: sha1:b87efea205b3208a52e61bd5824e6c652794ea86
--! Message: auth function

CREATE OR REPLACE FUNCTION tienda.authenticate (email text, password text)
  RETURNS tienda.authenticate_result
  AS $$
DECLARE
  account tienda_private.user_account;
  refresh_token text;
  jwt_token text;
BEGIN
  SELECT
    * INTO account
  FROM
    tienda_private.user_account
  WHERE
    user_account.email = authenticate.email;
  IF account.password_hash = crypt(password, account.password_hash) THEN
    -- Check if a JWT already exists for the user
    SELECT jwt INTO jwt_token FROM tienda_private.jwt_tokens WHERE person_id = account.person_id;
    SELECT token INTO refresh_token FROM tienda_private.refresh_tokens WHERE person_id = account.person_id;
    IF NOT FOUND THEN
      -- Generate a secure random refresh token
      refresh_token := gen_random_uuid();
      -- Store the refresh token in the database along with its expiration date
      INSERT INTO tienda_private.refresh_tokens (token, person_id, expires_at)
        VALUES (refresh_token, account.person_id, extract(epoch FROM (now() + interval '30 days')));
      -- Generate a new JWT token and store it in the database
      jwt_token := ('tienda_person', account.person_id, extract(epoch FROM (now() + interval '30 days')))::tienda.jwt;
      INSERT INTO tienda_private.jwt_tokens (jwt, person_id) VALUES (jwt_token, account.person_id);
    END IF;
    -- Return the JWT token along with the refresh token
    RETURN (ROW(jwt_token, refresh_token)::tienda.authenticate_result);
  ELSE
    RETURN NULL;
  END IF;
END;
$$
LANGUAGE plpgsql
STRICT
SECURITY DEFINER;
