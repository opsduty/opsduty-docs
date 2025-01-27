Schedules are used to control when individuals are on duty. A schedule consists
of layers and overrides. Together, these generate a final schedule detailing
which individuals are on duty.

## Timezone

Each schedule requires a configured timezone. The timezone is used when
calculating shifts and should align with the local timezone of most individuals
in the schedule.

## Layers

Schedule layers are prioritized, with higher-priority layers overwriting
lower-priority ones.

Changes to schedules do not affect shifts that have already occurred. OpsDuty
enforces this to ensure historical shift data can be used to track on-duty time.

### Layer Configuration

Schedule layer configuration can be complex due to recurring event calculations.

#### Step 1 - Select Users

First, select users to include in the schedule layer and choose a rotation type:

- **Rolling users**: Cycles through the user groups one by one for each
  recurrence, controlled by the recurring event frequency.
- **Plain**: Keeps the same group of users for every shift.

User selection varies depending on the chosen rotation type.

#### Step 2 - Select Rotation

Next, configure the event frequency:

- **No recurring events**: The shift starts at the specified time and lasts for
  the configured duration.
- **Daily**: Assigns a new group of responders daily.
- **Weekly**: Assigns a new group of responders weekly.
- **Monthly**: Assigns a new group of responders monthly.

Additionally, configure the shift length, which determines how long each shift
instance lasts.

##### Configuration for Repeated Shifts

If **Daily**, **Weekly**, or **Monthly** event frequency is selected, the
following options are available:

- **Frequency interval**: Determines how often new shifts start (e.g., a daily
  frequency with an interval of 1 starts shifts every day; a weekly frequency
  with an interval of 3 starts shifts every three weeks).
- **Handoff time**: Specifies when a recurring shift begins.
- **Repeat shifts until**: Optionally sets an end date for generating shifts.
- **Repeat on days**: Available for **Weekly** or **Monthly** frequencies.
  Allows shifts to be created on selected days without assigning new responder
  groups. Useful for managing different shifts on weekdays and weekends.

#### Step 3 - Select Start Time

Set the start time for the layer. The start time must be in the future, as the
schedule layer does not generate shifts retroactively.

## Overrides

Overrides are applied on top of schedule layers. Each override has a start and
end time. Overlapping overrides are merged, combining users into one shift for
the overlapping period.

Changes to overrides do not affect past time periods. This ensures historical
shift data remains accurate for tracking on-duty time.

## Timeline

The timeline displays past shifts from up to 60 days ago and upcoming shifts for
the next 60 days.

## Calendar Feeds

OpsDuty provides a webcal feed to integrate schedule shifts into a calendar
application. Two types of webcal feeds are available.

### Schedule Calendar

This feed includes all shifts in the schedule.

### Schedule Calendar with Your Shifts

This feed includes only shifts that the current authenticated user is assigned
to.
