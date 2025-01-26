OpsDuty processes data received from various systems using integrations like
Webhooks. To make this data meaningful, it is parsed and processed according to
configurations in OpsDuty. The platform is designed for flexibility, allowing
you to receive data from any system through configurable "Receive Channels."

OpsDuty provides both pre-made templates for common systems and the option to
create custom configurations to suit your specific needs.

## Receive Channel Usage

### Webhooks

- Receive channels are used to parse incoming JSON payloads from HTTP POST
  requests.

## Jinja Templating Language

Receive channels utilize the
[Jinja2](https://jinja.palletsprojects.com/en/stable/) templating language to
extract and manipulate data from incoming payloads.

Jinja expressions allow you to:

- Extract relevant data.
- Control the structure and format of the data stored in OpsDuty.

### Sandbox Environment

The Jinja expressions in OpsDuty run within a sandboxed environment, which
includes utility functions to simplify data parsing.

### Functions

- **`datetime_format`**: Formats a datetime using `strftime`.
- **`iso8601_to_time`**: Parses an ISO8601 timestamp into a datetime.
- **`json_dumps`**: Serializes an object as JSON.
- **`regex_match`**: Checks if there is an exact match at the start of a string.
- **`regex_replace`**: Replaces parts of a string using regex.
- **`regex_search`**: Checks if a regex match exists anywhere in the string.
- **`time`**: Retrieves the current time as a datetime object.
- **`tojson_pretty`**: Serializes an object as JSON and formats it in a
  human-readable style.

### Fields

- **`payload`**: Contains the data received by OpsDuty.

## Receive Channel Templates

Creating receive channels can be tedious, so OpsDuty includes pre-made templates
for commonly used systems. These templates can be customized or used as-is. If a
template is overridden, removing the overridden value will revert the
configuration to the default template.

### Included Templates:

- Prometheus AlertManager
- Checkly
- Dead Man's Snitch
- Sentry

Templates can be selected and adjusted on the receive channel settings page.

## Debugger

The receive channel page includes a **Debugger** tool. It allows you to test
data parsing by providing a raw example payload. This ensures the configurations
are correctly extracting and formatting the required data.
