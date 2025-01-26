Event orchestrations can be used to control how OpsDuty processes events and
triggers new incidents. Each event orchestration is connected to a service and
is utilized when the service receives new events.

Event orchestrations allow for the configuration of transformations, which
dictate how OpsDuty processes incoming events.

A routing rule generally applies to a service but can be limited to a specific
routing rule. Event orchestration will only be used if the routing rule directs
the event to the associated event orchestration service. This provides a way to
restrict the use of event orchestrations.

## Conditions

Conditions determine whether the transformations within an event orchestration
should be applied. Event orchestrations use the same condition rules as routing
rules. For more details, refer to the
[routing rules documentation](./routing-rules.md#conditions).

## Transformations

Transformations dictate how OpsDuty processes and handles incoming events. By
default, all transformations are disabled. You need to manually select and
enable the transformations you wish to apply.

### Escalate Incident

Choose whether to force OpsDuty to apply the escalation policy or to bypass it
entirely.

### Escalation Policy

Override the default escalation policy used when an event is received.

### Notify Users

Select users to page directly, bypassing the normal escalation policy.

### Silence Incident

Configure OpsDuty to silence the resulting incident for a specified duration (in
minutes).

### Incident Urgency

Override the default incident urgency when creating an incident.

### Acknowledge Timeout

Set an acknowledgment timeout. If the incident remains in the acknowledged state
beyond this timeout, it will automatically return to the triggered state.

### Incident Note

Add a custom note to the incident during event processing.

### Acknowledge Incident

Automatically acknowledge the incident when an event is processed.

### Resolve Incident

Automatically resolve the incident when an event is processed.

### Allow Auto Resolve

Enable or disable automatic resolution of incidents upon consumption.
