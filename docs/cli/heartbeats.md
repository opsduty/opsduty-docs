# Heartbeats

Heartbeats in OpsDuty can be used to monitor periodic or Cron jobs in your
infrastructure.

```bash
$ opsduty heartbeats --help
Usage: opsduty heartbeats [OPTIONS] COMMAND [ARGS]...

  Commands for managing and monitoring heartbeats.

Options:
  -h, --help  Show this message and exit.

Commands:
  checkin  Send a heartbeat checkin to OpsDuty.
  export   Export heartbeats from OpsDuty to definition file containing...
  import   Import heartbeats from a definition file containing heartbeat...
```

## Checkin

The check-in command can be used to report a successful job check-in. This is
useful in periodic bash scripts, etc.

## Export / Import

Some systems rely heavily on periodic and Cron jobs, and managing them in the
OpsDuty web application can be a tedious task. The import and export commands
enable you to create tools for automating heartbeat management.
