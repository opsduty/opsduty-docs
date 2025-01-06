OpsDuty can be configured to receive incoming phone calls. This is useful if you
want to create a system where users can call the responsible person for a
system. Incoming calls follow the same escalation policies and schedules as
other integrations in OpsDuty to determine the responsible person.

!!! info "Voice and SMS for notifications"

    An active incoming call integration also enable your organization to use voice
    and SMS for notifications when a new incident is triggered.

The incoming call integration in OpsDuty uses Twilio for voice and SMS
processing. You are required to create a Twilio account to use the incoming call
integration.

!!! warning "Direct billing"

    Usage is billed directly to your Twilio account, and not through
    OpsDuty. Purchasing a number in OpsDuty is going to affect the balance in your Twilio account.

## New Integration

A new incoming call integration can be created on the
[integrations](https://opsduty.io/app/organization/integrations) page.

## Configuration

### Addresses

An address is required by Twilio to purchase a number due to regulatory
requirements. If you are an individual, use your personal address, or if you are
a business, use your business address.

### Numbers

You can purchase one or more numbers. Just one number is required if you only
need voice and SMS notifications when new incidents are triggered.

!!! note "Billing plan limitations"

    Your billing plan may limit the number of active numbers in your
    account.

#### Purchase a New Number

1. Click "Purchase Number".
2. Select a country and number type, scroll down, and click "Search".
3. You will see a list of available numbers along with their monthly prices.
4. Click "Purchase Number". This step will affect your Twilio account balance.
5. The new number will now appear in your list of numbers.

#### Configure a Phone Number

1.  Open the number menu and click on "Configure Phone Number".
2.  You are now on the number configuration page, where you can set how OpsDuty
    uses this number.

    !!! note "Notifications"

        The "SMS Notifications" and "Voice Notifications" switches control whether
        OpsDuty is allowed to use this number for notifications.

3.  Configure Destinations:

    A destination represents a digit the caller can select, which will connect
    them to the responsible person for the selected destination service. If only
    one destination is configured, the caller will not be presented with
    alternative options.
