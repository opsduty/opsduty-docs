Routing rules allow you to direct incidents to OpsDuty without directly
assigning them to a specific service in OpsDuty. These rules let you decide
which service should handle an incident based on the provided criteria.

Routing rules cannot be used to modify incoming data; they are only used to
determine which service an incident should be assigned to.

Routing rules can evaluate both the current time and the incoming data to
determine the appropriate service destination.

## Default Service

Each routing rule must have a default service configured. If no rule matches the
incoming payload, the incident will be assigned to this default service.

## Rules

Routing rules consist of a set of ordered rules. These rules are evaluated
sequentially, and the first rule that matches the incoming payload will assign
the incident to its associated service.

Rules can also be disabled. Disabled rules are not evaluated.

### Conditions

Rule conditions are applied to incoming payloads and determine whether the rule
matches the payload or not.

#### Condition Operator

If a rule contains multiple conditions, a condition operator is used to combine
them. The operator can be one of the following:

- **`OR`**: The rule matches the payload if at least one condition is satisfied.
- **`AND`**: The rule matches the payload only if all conditions are satisfied.

#### Available Conditions

A rule can be configured with several types of conditions:

- **Match All**: Always returns a match.
- **DateTime Range**: Matches if the current time is within a specified time
  range.
- **Weekly Schedule**: Matches if the current time falls within a specified time
  range and on one of the defined weekdays.
- **Filter Condition**: Matches if the incoming data satisfies the configured
  condition.

##### Filter Condition

The filter condition is the most advanced type of condition. It evaluates either
the raw data received or the data parsed by the receive channel.

You need to select a field that the condition should evaluate. Two variables are
available:

- **`payload`**: Contains the raw data received by OpsDuty before processing by
  the receive channel.
- **`event`**: Contains the data parsed by the receive channel.

The filter condition also requires an operation, which is executed on the
selected field. The available operations are:

- **Does not exist**: Matches if the selected field does not exist.
- **Does not match**: Matches if the selected field is not equal to the
  specified value.
- **Does not match part**: Matches if the selected field does not contain the
  specified value.
- **Does not match regex**: Matches if the specified regex does not match the
  selected field.
- **Exists**: Matches if the selected field exists.
- **Jinja Expression**: Matches if the Jinja template returns a truthy value
  (e.g., `y`, `yes`, `true`, `on`, `1`, `ok`). The selected field is available
  as the `field` variable.
- **Matches**: Matches if the selected field is equal to the specified value.
- **Matches part**: Matches if the selected field contains the specified value.
- **Matches regex**: Matches if the specified regex matches the selected field.
