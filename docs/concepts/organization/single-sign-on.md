!!! note "Only available on the Standard billing plan"

    The Single Sign-On (SSO) feature is exclusively available on the Standard billing plan.
    It is not included in the Free or Starter plans. To access SSO and SCIM user and team
    provisioning, please consider upgrading your plan.

The SSO and provisioning settings can be found on the
[Single Sign-On](https://opsduty.io/app/organization/sso) settings page.

## Authentication

OpsDuty currently offers two external authentication methods: Google and SAML
authentication. Google authentication is straightforward to set up but may not
be ideal if you have more complex access requirements.

### Google Authentication

Google authentication allows users from a Google Workspace domain to log in to
OpsDuty. You can choose to either manually create user accounts before they
authenticate or enable OpsDuty to automatically create accounts when a user logs
in for the first time, provided no matching email address is found.

Your users can use the `Login with Google` button on the
[login](https://opsduty.io/auth/login/) page when this is enabled.

#### Configuration

1.  Enable the `Enable Google authentication` checkbox.
2.  Provide your Google Workspace domain.
3.  Enable `Register unknown accounts` if you want OpsDuty to create any missing
    user account on first user login if no account already exists.

    !!! danger

         OpsDuty will create any missing user account on successful authentication
         attempts when `Register unknown accounts` is enabled. It is advisable to enable this
         only if you have complete trust in all members in your Google organization. If disabled,
         users need an invite before login with Google is available.

4.  Save the form to apply your changes.

### SAML Authentication

SAML authentication allows you to use the Security Assertion Markup Language
(SAML) standard to authenticate users in OpsDuty. Any SAML-compliant
authentication provider can be integrated with OpsDuty, making it ideal for
platforms like Okta or OneLogin to manage user authentication.

Your users can use the `Login with SAML` button on the
[login](https://opsduty.io/auth/login/) page when this is enabled. Users simply
need to provide their organization’s domain in OpsDuty, after which OpsDuty will
redirect them to the SAML provider for authentication.

### Configuration

1.  Enable the `Enable SAML2 authentication` checkbox.
2.  Set up an entity in your SAML-compatible authentication provider. The
    OpsDuty ACS and Metadata URL can be seen above the form.

    OpsDuty requires the payload received from the authentication provider
    during user authentication to include the attributes `email`, `firstName`,
    and `lastName`. These attributes are used to match the SAML session with
    users in OpsDuty.

3.  Configure the `Metadata URL`, which can be obtained from your authentication
    provider.
4.  Save the form to apply your changes.

## Provisioning

SAML and Google authentication enable users to verify their identities, but
users must first be invited and registered before these authentication methods
can be utilized. The SCIM2 protocol simplifies user and team provisioning by
allowing third-party systems to automate the process. This protocol is widely
supported by most major authentication providers.

### SCIM2

The SCIM2 protocol can be used to provision users and teams in OpsDuty.

#### Configuration

1. Enable the `Enable SCIM2 provisioning` checkbox.
2. Select a default role to apply to all new members added by the SCIM2
   connector. The user roles can be changed later in by admins.
3. [OPTIONAL] Enable the `Regenerate credentials on save` switch to generate new
   SCIM2 API credentials. The credentials is used by the authentication provider
   to access the SCIM2 provisioning API in OpsDuty.
4. Save the form to apply your changes.
5. The `SCIM connector base URL`, `Basic auth username`, and
   `Basic auth password` is now visible above the form. Use it to configure the
   SCIM2 connector.
