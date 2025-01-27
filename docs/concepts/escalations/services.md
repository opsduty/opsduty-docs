A service is a component, microservice, or part of an application or
infrastructure that a team operates and monitors. It is typically something that
requires consistent stability.

Services are owned by a team, and team members can view the services managed by
their team.

## Service Types

Services can be categorized into two types:

- **TECHNICAL**: Represents a technical component within your infrastructure,
  such as an API or similar service.
- **BUSINESS**: Represents a business unit within your organization, such as a
  group of people managing a business process.

## Routing Key

In OpsDuty, each service is assigned a unique routing key. This key is used to
direct incident data to the appropriate service.
[Routing rules](../event-processing/routing-rules.md) use the same routing key
concept. This allows you to select the destination service in OpsDuty using
rules, rather than configuring the destination service at the source of the
incident data.

Currently, the routing key is only utilized by the webhook integration. To
enable a service to process data, replace the `<routing-key>` portion of the URL
with the specific routing key for that service.

Example Webhook URL:
`https://opsduty.io/integrations/webhooks/enque/event/<webhook-integration-key>/<routing-key>`

## Escalation Policy

An [escalation policy](./escalation-policies.md) is used to notify users when a
new incident enters the triggered state. Incidents assigned to a service without
an escalation policy will not send any notifications upon creation.

You can only select an escalation policy that belongs to the same team as the
service.

## Maintenance

A service can be placed into maintenance mode. There are two types of
maintenance modes:

- **Debug**: The system will automatically pause escalations and will not
  escalate incidents while in debug maintenance mode.
- **Maintenance**: The system will create a "Maintenance Incident." Any open or
  newly created incidents during the maintenance period will be added as child
  incidents to the maintenance incident.

You must define a duration for the maintenance mode. The system will
automatically disable the maintenance mode once the selected duration has
elapsed.

## Event Orchestrations

The service detail page provides an overview of
[event orchestrations](../event-processing/event-orchestrations.md) relevant to
the service. Event orchestrations control how OpsDuty processes event data.

## Slack Integration

OpsDuty can automatically post messages to Slack when a new incident is created.
The Slack message will be updated throughout the incident's lifecycle.

You can select a Slack channel for OpsDuty to use on the service settings page.
This setting will override the default Slack integration if configured.
