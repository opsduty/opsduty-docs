The user settings page can be found
[here](https://opsduty.io/app/user/settings).

## Update Profile

Your first and last name can be changed on the user settings page.

## Change Email

Your Email can be changed on the user settings page. OpsDuty is going to send an
Email message to your new Email to verify it.

## Delete User

Your user can be deleted on the user settings page.

!!! danger "This operation cannot be undone."

!!! note "Sole owners of the organization cannot be deleted."

    Your account cannot be deleted if you are the only remaining owner of the organization. The you either have to promote someone else to owner, or consider closing the organization.

## Notifications

Your notification policy can be changed on the Notifications tab on the user
settings page.

### Notification Policy

The notification policy define how OpsDuty is going to notify you when an
escalation policy wants to send you a notification, this happens when an
incident goes into the triggered state.

There is two notification policies, one for high urgency alerts, and one for low
urgency alerts. OpsDuty comes with a default notification policy for both
urgencies.

### Phone Number

The phone number is used if you have configured OpsDuty to send you
notifications using voice or SMS in the notification policy, or if you are
responsible for a service exposed in the incoming call integration.

### Push Devices

This is a list of devices where you have logged into your account in the OpsDuty
mobile app. Each device can be deactivated or activated, deactivated devices
will not receive push notifications.

The device menu also contains a test push message button, this can be used to
test how the device will behave when a push message is sent to it.

### Mobile App Settings

The mobile app settings is documented bellow the
[apps section](../../apps/notifications.md).

## Security

### Change Password

Your password can be changed on the Security tab on the user settings page.

!!! note "Changing the password would invalidate all sessions."

    Changing the password will make all active sessions invalid, and you have to login again on all devices.

### Sign Out of All Devices

It may be needed to sign out of all of your devices, this can be done by
clicking on "Sign out of all devices".
