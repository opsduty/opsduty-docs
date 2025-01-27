# Escalation Policies in OpsDuty

Escalation policies define how OpsDuty notifies individuals when a new incident
enters the triggered state. These policies determine **who** should be notified
and how long OpsDuty should wait before escalating to another set of
individuals. However, they do not configure **how** individuals are
notified—that is managed by their personal
[notification settings](../users/settings.md#notifications).

## Escalation Policy Steps

An escalation policy can include one or more steps, which OpsDuty executes in
the order they are defined. The following types of steps are available:

- **Notify**: Notify specific individuals, team members, or people from an
  active shift in a schedule. You can also configure the notification channel to
  be used for sending notifications.
- **Notify if number of events in time window**: Pause the execution of the
  escalation policy unless a certain number of incident events occur within a
  specified time window.
- **Notify if time**: Continue executing the escalation policy step if the
  current time falls within the specified time window. If the time is outside
  the window, the policy execution pauses.
- **Repeat escalation**: Return to the first step of the escalation policy. This
  step can repeat up to five times. If the policy has already looped through
  five cycles, this step becomes a no-op.
- **Resolve**: Automatically resolve the incident when this step is executed.
- **Wait**: Pause for a specified number of minutes before executing the next
  step in the escalation policy.

The two most commonly used types are the **Notify** and **Wait** policy steps.
