Webhooks can be used to send events to OpsDuty using HTTP Post requests. OpsDuty
reads the payload and it is used to construct incidents. The POST payload needs
to be formatted as JSON.

## New Integration

A new webhook integration can be created on the
[integrations](https://opsduty.io/app/organization/integrations) page.

## Configuration

The webhook name can be changed, this is just used as a verbose name to make it
easier identify what the webhook is used for.

The webhook can also be put into a disabled state, data posted to the webhook
while the webhook is disabled will not be processed by OpsDuty.

### Receive Channel

A [receive channel](../event-processing/receive-channels.md) is used to process
incoming JSON payloads.

You can choose either an existing receive channel within your organization or a
template provided by OpsDuty. OpsDuty offers a selection of templates designed
to parse payloads from several well-known services commonly used with OpsDuty.

## Using the Webhook

The webhook configuration specifies how OpsDuty should parse the payload sent to
the webhook endpoint. However, it does not define the service to which the
resulting incident should be assigned.

The webhook URL typically follows this format:
`https://opsduty.io/integrations/webhooks/enque/event/0091d476-cf05-402d-a6bd-1487f74e295f/routing-key`
The placeholder **routing-key** must be replaced with the routing key of the
service that should handle the resulting incident.

The configured receiving channel processes the posted payload, generating an
incident event. This event will either trigger a new incident (if no matching
open incident with the same deduplication identifier exists) or be added to an
existing open incident.
