# OpsDuty Incidents

An **incident** is the most important resource in OpsDuty. It describes an event
that requires attention from one or more users.

## Incident States

An incident can exist in one of the following states:

- **Triggered**: An incident is in the triggered state until someone reacts to
  it. It inherits the escalation policy from the associated service, and OpsDuty
  begins executing this policy when the incident is triggered. The escalation
  policy execution stops automatically when the incident transitions to another
  state.
- **Acknowledged**: A user can acknowledge an incident, indicating that they
  have started investigating the issue and are working on a resolution.
- **Silenced**: The incident is silenced and not actively being worked on.
- **Resolved**: A resolved incident indicates that the issue is no longer
  ongoing.

OpsDuty creates incidents based on incoming events. It determines whether to
create a new incident or append the event to an existing one based on a
**deduplication identifier**.

## Silence

An incident can be silenced for a specific period. When silenced, OpsDuty pauses
the escalation policy execution. If the incident is not acknowledged or resolved
before the silence period ends, it will transition back to the triggered state.

## Reassign

Incidents can be reassigned to a different escalation policy. When reassigned,
OpsDuty replaces the current escalation policy and restarts the process with the
newly selected policy.

## Direct Paging

The **direct paging** feature allows users to directly notify a user or team
without modifying the escalation policy. This is useful for sending
notifications directly to an individual or all members of a team.

## Attached Incidents

Open incidents can be attached to one another. This is helpful when dealing with
duplicate incidents or related incidents where maintaining the state of a single
root incident is preferred.

## Incident Grouping and Deduplication Identifier

OpsDuty uses a **deduplication identifier** to group related events. A group of
events becomes an incident in OpsDuty. If no deduplication identifier is
provided, OpsDuty assigns one randomly to incoming events.

Incoming events with the same deduplication identifier are appended to any open
incident when received and processed by OpsDuty.

## Events

Incidents are created or updated based on incoming events received by OpsDuty
through its configured integrations. Events are constructed from parsed data
from [receive channels](./event-processing/receive-channels.md) and include the
raw data received by OpsDuty.

Key event fields include:

- **Summary**
- **Description**
- **Source URL**

Certain fields also control the incident lifecycle:

- **Acknowledge signal**: Marks the incident as acknowledged when such an event
  is added.
- **Resolve signal**: Marks the incident as resolved when a resolve event is
  added.

## Notes

OpsDuty allows users to collect **notes** to provide additional context
throughout the incident lifecycle. These notes are helpful for creating
post-mortems or documenting lessons learned after the incident is resolved.

## Log

Each incident includes a **log** that records all operations performed by
OpsDuty on the incident.
