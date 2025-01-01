# Concepts

Incident Management consists of multiple steps, everyting from start to finish,
including initial signals, responder notifications, and post-incident
evaluations can be done in OpsDuty.

## Signals

OpsDuty needs to be notified when a problem occour in your system. Signals can
be sent to OpsDuty using one of our integrations.

- [Webhooks](integrations/webhooks.md) is the most dynamic way to ingest signals
  into OpsDuty, OpsDuty can parse payloads from any system as long as the
  payload is formatted as JSON.
- [Slack](integrations/slack.md) integration can be used to manage incidents
  directly from your organizations Slack workspace.
- [Incoming Calls](integrations/incoming-calls.md) lets you use OpsDuty to route
  incoming phone calls to the desired person, this is a great way to handle
  incidents in real time.

## Event Processing

Not all systems that generate events relevant to your incident management will
send data to OpsDuty in a structured or standardized format. To address this,
OpsDuty introduces the concept of
[Receive Channels](event-processing/receive-channels.md). These channels provide
a method to parse JSON payloads from third-party applications into a format that
OpsDuty can process and understand.

[Routing Rules](event-processing/routing-rules.md) enable you to dynamically
direct events to specific services based on the received data, simplifying event
management. With this feature, there's no need to configure multiple webhook
endpoints in third-party systems - OpsDuty handles the routing of events to the
appropriate services.

You might also want to explore how events are processed in OpsDuty.
[Event Orchestrations](event-processing/event-orchestrations.md) allow you to
dynamically adjust event processing based on the received data or other factors,
such as the time of day.

## Responder Notifications and Escalations

In OpsDuty, [incidents](incidents.md) are assigned to a
[service](escalations/services.md), which can represent a technical component in
your infrastructure or a business unit.

[Services](escalations/services.md) are associated with a
[Team](users/teams.md), which is used to manage access controls.

[Escalation Policies](escalations/escalation-policies.md) determine how OpsDuty
engages individuals during an incident. For OpsDuty to involve people in a new
incident, the associated service must have a connected escalation policy.

[Schedules](escalations/schedules.md) provide a more detailed way to assign
responsibility based on time and date. They are used within escalation policies
when a static assignment to a specific person is insufficient.

## Post-incident Evaluations

A crucial aspect of incident management is understanding the root causes of
incidents to prevent unnecessary occurrences in the future.

[Analytics](analytics.md) can help identify the areas in your infrastructure
with the highest concentration of issues.
