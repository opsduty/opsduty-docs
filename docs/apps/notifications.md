# Notifications

OpsDuty’s notification settings can be customized, allowing you to adjust the
volume, sound, and whether the notification should bypass Do Not Disturb mode.

Notifications settings can be adjusted under `Mobile app settings` on the
[Notifications](https://opsduty.io/app/user/notifications) page in OpsDuty.

## Configuring Notifications

OpsDuty provides two notification policies: one for high-urgency alerts and
another for low-urgency alerts. The push settings allow you to customize the
sound and volume for each notification type, enabling you to tailor alerts to
suit your preferences.

1.  **Sound**

    The OpsDuty app comes with a few different sounds. The best way to find a
    sound you like is to save the moble app settings form after changing the
    sound and then send a test push message.
    [See Limitations for Android.](notifications.md#android)

2.  **Override volume**

    You can override the sound volume for notifications received on your device,
    allowing you to control the volume independently of your device’s settings.
    [See Limitations for iOS.](notifications.md#ios)

3.  **Bypass the Do Not Disturb mode**

    Notifications can be delivered to your device with sound and vibration even
    when Do Not Disturb mode is enabled. This ensures you receive OpsDuty alerts
    and stay aware of them while ignoring notifications from other apps.

## Send Test Notifications

Your device is listed bellow the `Push devices` section on the
[Notifications](https://opsduty.io/app/user/notifications) page in OpsDuty after
you have downloaded the App and logged in.

You can send a test push message to the devices by pressing "Send test
notification with high urgency" or "Send test notification with low urgency" in
the device menu.

## Limitations

### Android

The OpsDuty Android app creates one notification channel for "High", "Low", and
"Info" messages.

The Android operating system does not allow apps to change the notification
sound on existing notification channels. This basically means that changing the
sound on the notification page in OpsDuty after you have received a notification
on the given notification channel has no effect.

Go to the notification settings on your device instead to change the sound.

### iOS

On the iOS platform, notifications cannot override the volume setting unless Do
Not Disturb mode is bypassed.
