Heartbeat monitoring enables you to use OpsDuty to monitor periodic jobs running
at intervals or on a defined CRON schedule. Configuration for heartbeat
monitoring can be managed on the [heartbeats](https://opsduty.io/app/heartbeats)
page.

## Heartbeat Overview

A heartbeat in OpsDuty is associated with a service, which can represent either
a technical component of your infrastructure or a business unit.

Each heartbeat requires the following:

- **Name**: A unique identifier for the heartbeat.
- **Metadata**: Additional information such as a description and link can be
  provided.
- **Incident Urgency**: Configures the urgency level of incidents created when
  the job misses a check-in.
- **Labels**: Heartbeats can be tagged with labels for categorization.

## Environments

Heartbeats do not define the job's actual schedule or execution details.
Instead, this information is configured in **heartbeat environments**. A
heartbeat can have multiple environments, each with its own schedule, typically
representing different infrastructure environments or tenants.

### Environment Configuration

Each heartbeat environment includes the following settings:

- **Name**: The environment's name, typically `prod`, `staging`, or a specific
  identifier like `prod:eu` for regional configurations.
- **Type**: The job's schedule type. `cron` for jobs running on a CRON schedule.
  `interval` for jobs running at constant intervals.
- **Timeout**: The expected duration of the job. Alerts are generated if no
  check-in is reported before the next scheduled execution time plus the
  timeout. Adding a buffer to the timeout helps avoid overly sensitive alerts.
- **Muted**: A muted environment will not generate alerts.
- **Resolve Incidents**: Resolves any open incidents created by the same
  environment when the job successfully checks in again.

### Creating and Updating Heartbeat Environments

OpsDuty allows bulk creation and updating of environments. When updating an
environment, you can apply changes across all existing environments by selecting
the option:
`Copy heartbeat and alerting configuration to all existing environments`.

## Registering Check-Ins

Periodic jobs must be configured to send a ping (check-in) to OpsDuty upon
successful execution. This is done by sending an HTTP GET request to the
environment-specific check-in URL, which can be copied from the environment menu
under `Copy checkin URL...`.

- **Authentication**: The check-in URL does not require authentication.

## Programmatic Management of Heartbeats and Environments

Managing numerous Heartbeats and Environments manually can be tedious. OpsDuty
provides tools for automation:

- **API**: The OpsDuty API enables you to programmatically configure Heartbeats
  and Environments.
- **CLI**: Use the OpsDuty CLI to
  [import and export](../cli/heartbeats.md#export-import) Heartbeats and
  Environments for streamlined management.
