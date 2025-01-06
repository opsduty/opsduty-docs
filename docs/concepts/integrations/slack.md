The Slack integration enables you to interact with OpsDuty directly within your
Slack workspace. Additionally, OpsDuty can send notifications to specified
channels whenever a new incident is triggered.

## New Integration

A new Slack integration can be created on the
[integrations](https://opsduty.io/app/organization/integrations) page.

## Configuration

The Slack integration can be set up to send notifications to a default Slack
channel whenever a new incident is triggered in OpsDuty.

Additionally, each service in OpsDuty can specify its own Slack channel for
incident notifications. This customization can be configured in the **Settings**
tab on the respective service's page.

!!! info "The OpsDuty App in Slack needs to be added to the selected channel"

    The OpsDuty Slack App must be manually invited to the chosen notification channel, as it cannot be added automatically.

    1. Open the selected channel in Slack.
    2. Type `/invite`.
    3. Click on `Add apps to this channel`.
    4. Find OpsDuty in the list, and click `Add`.

## Using Slack Commands

Users need to connect their Slack identity with their OpsDuty account. This step
is required for OpsDuty to provide access to the resources you are authorized to
view.

Type `/opsduty account link` to link your account.

### Slash Commands

The Slack integration provides a set of slash commands for your workspace. Type
`/opsduty help` in Slack to see a complete list of available commands.

### Message Shortcuts

With the Slack integration, you can use a message shortcut to trigger a new
incident in OpsDuty directly from a message in a Slack channel.

### Shortcuts

#### Who is On-Call?

Type `/who` in Slack to access the "Who is on-call?" shortcut. This allows you
to quickly find the responsible responder for a specific service.

#### Trigger Incident

Type `/trigger` in Slack to access the "Trigger New Incident" shortcut. This
feature enables you to initiate a new incident directly from Slack.
