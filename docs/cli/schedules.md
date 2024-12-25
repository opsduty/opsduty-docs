# Schedules

In OpsDuty, schedules determine who is responsible for a service at any given
time. The CLI provides tools to manage and interact with schedules.

```bash
$ opsduty schedules --help
Usage: opsduty schedules [OPTIONS] COMMAND [ARGS]...

  Commands for accesing schedules.

Options:
  -h, --help  Show this message and exit.

Commands:
  shifts  Commands for accesing shifts in a schedule.
```

## Shifts

### List shifts in a month

```bash
$ opsduty schedules shifts --schedule-id 1 list --month 12-2024 --timezone Europe/Oslo

schedule_id: 1
shifts:
- end: '2024-12-01T09:00:00Z'
  start: '2024-11-30T09:00:00Z'
  users:
  - ...
...
```
