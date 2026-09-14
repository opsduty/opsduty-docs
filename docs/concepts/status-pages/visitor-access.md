Status pages are public by default: anyone who knows the address can see them.
Some pages are not meant for everyone, like an internal status page for your own
staff or a page meant only for your customers. For these, you can require
visitors to sign in before they see the page.

Visitor access is configured in the `Visitor access` section of a status page's
`Settings` tab, on the [status pages](https://opsduty.io/app/statuspages) page.

## Access modes

Each status page has one of three access modes:

- **Public**: Anyone with the link can see the page. This is the default.
- **OpsDuty members**: Visitors sign in with their OpsDuty account. Anyone in
  your organization can see the page.
- **Custom backend**: Visitors sign in through your own login system, which
  sends them back to the status page with a signed token.

A status page behind a sign-in is always hidden from search engines, and does
not offer RSS or Atom feeds, since feed readers cannot sign in.

## OpsDuty members

This is the simplest way to make a page private, and suits internal status
pages. There is nothing to set up besides choosing the mode.

When a visitor opens the page, OpsDuty asks them to log in if they are not
already logged in, then sends them back to the page they asked for. A sign-in
lasts for 12 hours.

Every member of your organization can see the page, whatever teams they belong
to. Stakeholders can see it too, if your organization allows stakeholder
accounts.

!!! note

    Only a page that is published on a verified domain can be signed in to.

## Custom backend

A custom backend lets you decide who can see the page with your own login
system, for instance to show a status page only to your customers. OpsDuty never
talks to your identity provider. It only checks that your backend signed the
token it sends visitors back with.

### How it works

1.  A visitor who has not signed in opens the status page.
2.  OpsDuty sends them to your `Sign-in URL`, and adds the page they asked for
    in a `location` query parameter, for example
    `https://example.com/status-login?location=/incident/42/`.
3.  Your backend signs the visitor in however you like.
4.  Your backend signs a token with the page's signing key, and sends the
    visitor back to the status page with the token in a `jwt_token` query
    parameter, for example
    `https://status.example.com/incident/42/?jwt_token=<token>`.
5.  OpsDuty checks the token, signs the visitor in, and shows them the page.

### Configuration

1.  Choose `Custom backend` as the access mode.
2.  Enter the `Sign-in URL` visitors are sent to. It must be an `https://`
    address.
3.  Save the form. OpsDuty generates a signing key for the page.
4.  Copy the signing key and give it to your backend. Treat it like a password.

### The token

The token is a JSON Web Token (JWT), and must:

- Be signed with the page's signing key, using the `HS256` algorithm.
- Contain an `iat` (issued at) claim.
- Contain an `exp` (expiry) claim.

Visitors stay signed in until the token expires, and for at most 7 days,
whatever expiry you choose. A token that is invalid or has expired shows an
error page instead of sending the visitor to sign in again.

=== "Node.js"

    ```javascript
    import * as jose from 'jose';

    // After your own sign-in has succeeded:
    const token = await new jose.SignJWT({})
      .setProtectedHeader({ alg: 'HS256' })
      .setIssuedAt()
      .setExpirationTime('2h')
      .sign(new TextEncoder().encode(process.env.STATUS_PAGE_SIGNING_KEY));

    // Only ever send visitors back to the status page.
    const page = 'https://status.example.com';
    let url = new URL(req.query.location ?? '/', page);
    if (url.origin !== page) url = new URL('/', page);
    url.searchParams.set('jwt_token', token);
    res.redirect(url.toString());
    ```

=== "Python"

    ```python
    import os
    from datetime import datetime, timedelta, timezone
    from urllib.parse import urlencode, urljoin, urlsplit

    import jwt

    PAGE = "https://status.example.com"

    # After your own sign-in has succeeded:
    now = datetime.now(timezone.utc)
    token = jwt.encode(
        {"iat": now, "exp": now + timedelta(hours=2)},
        os.environ["STATUS_PAGE_SIGNING_KEY"],
        algorithm="HS256",
    )

    # Only ever send visitors back to the status page.
    url = urljoin(PAGE, request.args.get("location", "/"))
    if urlsplit(url).netloc != urlsplit(PAGE).netloc:
        url = f"{PAGE}/"
    separator = "&" if "?" in url else "?"
    return redirect(f"{url}{separator}{urlencode({'jwt_token': token})}")
    ```

!!! danger

    Always check the `location` parameter before sending a visitor to it.
    Otherwise anyone can use your sign-in to send your users to a site of their
    choosing.

### Reading the API from your server

The status page has a JSON API, for instance to show the current status inside
your own product. On a page behind a sign-in, your server can read it without a
visitor by sending a token in an `Authorization: Bearer` header:

- `GET /api/status`: component groups, components, and the most recent
  incidents.
- `GET /api/incidents/<id>`: a single incident with its full timeline.
- `GET /api/openapi.json`: the OpenAPI schema describing both.

Sign the token the same way as for visitors. Keep it short-lived, and sign a new
one when it expires: a token that expires more than 7 days after it is sent is
rejected. A request without a valid token gets a `401` response, and so does
every other address under `/api/`.

=== "curl"

    ```bash
    curl https://status.example.com/api/status \
      -H "Authorization: Bearer $TOKEN"
    ```

=== "Node.js"

    ```javascript
    import * as jose from 'jose';

    const token = await new jose.SignJWT({})
      .setProtectedHeader({ alg: 'HS256' })
      .setIssuedAt()
      .setExpirationTime('5m')
      .sign(new TextEncoder().encode(process.env.STATUS_PAGE_SIGNING_KEY));

    const response = await fetch('https://status.example.com/api/status', {
      headers: { Authorization: `Bearer ${token}` },
    });
    const status = await response.json();
    ```

=== "Python"

    ```python
    import os
    from datetime import datetime, timedelta, timezone

    import jwt
    import requests

    now = datetime.now(timezone.utc)
    token = jwt.encode(
        {"iat": now, "exp": now + timedelta(minutes=5)},
        os.environ["STATUS_PAGE_SIGNING_KEY"],
        algorithm="HS256",
    )

    response = requests.get(
        "https://status.example.com/api/status",
        headers={"Authorization": f"Bearer {token}"},
    )
    status = response.json()
    ```

!!! warning

    Only send these requests from your server. Never put the signing key or a
    token signed for the API in a browser or mobile app, where anyone can read
    it.

The API on a public page needs no token. A page for OpsDuty members does not
show its signing key, so its API can only be read by visitors signed in to the
page.

### Signing out

Send visitors to `/~auth/logout/` on the status page, for example
`https://status.example.com/~auth/logout/`, to sign them out of the status page.
This does not sign them out of your own login system.

### Regenerating the signing key

If the signing key has leaked, use `Regenerate` next to the key. Every visitor
is signed out at once, and nobody can sign in until your backend signs tokens
with the new key.

On a page for OpsDuty members, the same action is called `Sign everyone out`.
