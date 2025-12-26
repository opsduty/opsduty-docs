# Command-line interface

## Installation

The preferred way to install the OpsDuty CLI is to use
`pipx install opsduty-python`, but it can also be installed using
`pip install -U opsduty-python`.

## Using the CLI

The CLI is available as a executable called `opsduty` after it is installed.

```bash
$ opsduty
Usage: opsduty [OPTIONS] COMMAND [ARGS]...

Options:
  --log-format [json|logfmt|console]
                                  [default: console]
  --log-level [error|warning|info|debug]
                                  [default: info]
  --base-url TEXT                 Base URL for API requests to OpsDuty.
  --timeout INTEGER               API request timeout to OpsDuty.  [required]
  --access-token TEXT             Set the bearer token used to communicate
                                  with OpsDuty.  [env var:
                                  OPSDUTY_ACCESS_TOKEN]
  --version                       Show the version and exit.
  -h, --help                      Show this message and exit.

Commands:
  heartbeats  Commands for managing and monitoring heartbeats.
  schedules   Commands for accessing schedules.

  Command-line utility for interfacing with OpsDuty.
```

## Authentication

The CLI's API relies on OAuth2 for authentication. However, the CLI does not
currently provide a built-in method for obtaining an OAuth2 access token. To
acquire an access token, follow the steps outlined in the
[API OAuth2 documentation](../api/oauth2.md).
