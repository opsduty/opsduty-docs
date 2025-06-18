# OAuth2

The OpsDuty API `https://opsduty.io/api/v1/` uses OAuth2 for authentication and
the Authorization Code Flow to issue tokens.

An OAuth2 application needs to be created in OpsDuty before the platform can
issue tokens to your app. OAuth2 applications can be created on the
[Developer Settings](https://opsduty.io/app/organization/developer-settings)
page.

## Access tokens

Access tokens are personal tokens that are issued on behalf of your user. The
access token will receive the same access rights as your user.

### Access token scopes

The access token scopes define which APIs the access token is allowed to access.
The following scopes are currently available:

- **api** - Allow access to our GraphQL API.
- **api:v1** - Allow access to our REST API v1.

The scopes are requested when the token is generated.

### Access token expiry

Access tokens are valid for 2 years. After expiry, the token must be refreshed
using a refresh token to maintain access, or a new access token must be
requested through the OAuth2 flow.

When a token expires, the system automatically removes it and returns a HTTP 401
Unauthorized status code for any API requests using that token. Refresh tokens
are valid for 2 years and can be used to obtain new access tokens without
requiring user re-authentication.

## Acquiring an access token via your terminal

1. Install [oauth2c](https://github.com/cloudentity/oauth2c)

```bash
brew install cloudentity/tap/oauth2c
```

2. Create a new
   [oAuth2 application](https://opsduty.io/app/organization/developer-settings)
   in OpsDuty

Use the redirect url `http://localhost:9876/callback`

3. Copy the new client secret to clipboard

4. Get an access token

```bash
oauth2c https://opsduty.io \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --authorization-endpoint https://opsduty.io/oauth2/authorize/ \
  --token-endpoint https://opsduty.io/oauth2/token/ \
  --response-types code \
  --response-mode query \
  --grant-type authorization_code \
  --auth-method client_secret_basic \
  --pkce
```
