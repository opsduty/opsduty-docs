The organization settings page can be found
[here](https://opsduty.io/app/organization/settings).

## Account Settings

OpsDuty allows you to change your organization verbose name.

The organization domain cannot be changed directly in the organization settings,
please contact [support@opsduty.io](mailto:support@opsduty.io) you want to
change that. The organization domain is used when users authenticate together
with their username and password.

## Incident Archivation

Incident archiving allows you to hide old incidents, making them no longer
visible in the incident browser.

You can archive incidents that occurred before a specified date and time. The
archive date can also be modified, even to an earlier date than the current one.

When incidents are archived, any open incidents created before the archive date
and time will be closed, and ongoing escalations will be halted.

## Diagnostics

The diagnostics component helps identify potential issues in your organization's
configuration.

It alerts you to any invalid or missing critical configurations, which can be
particularly useful in preventing missed notifications in certain situations.

## Closing the organization

If you no longer wish to use OpsDuty, you have the option to close your
organization. Please note that this is an **irreversible action**. Once closed,
the organization cannot be restored.

You can close your organization by visiting this
[link](https://opsduty.io/app/organization/close-organization).

Closing the organization consist in multiple steps:

1.  Complying with the close organization prerequisite tests.

    Click "Run Prerequisite Tests" to run the tests. This step is there to make
    sure the organization is prepared for closing and can be deleted.

2.  Follow our [Account deletion policy](https://opsduty.io/account-deletion/)
    to delete the account.
