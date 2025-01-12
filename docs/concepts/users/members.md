You can manage users in your organization on the
[Members](https://opsduty.io/app/members) page.

## Inviting Users to the Organization

To join the organization, users must be invited. Invitations are sent via email,
and the recipient must accept the invitation by registering an account.

- **Invitation Validity**: Invitations are valid for 7 days. If an invitation
  expires, you will need to create a new one.
- **Deleting Invitations**: Invitations can be deleted. Once deleted, the
  recipient will no longer be able to use the invitation.

## Changing a User's Role

Users with the "Owner" role have the ability to change the roles of other users.
The available roles are:

- **Member**: A regular member of the organization. Members can access resources
  associated with the teams they belong to.
- **Stakeholder**: Functions like a regular member in terms of resource access.
  However, stakeholders:

      - Do not receive incident notifications.
      - Are not included in the seat count for the standard billing plan.

- **Owner**: Has full visibility of all teams and resources in the organization.
  Owners can manage user roles and settings. There must always be at least one
  owner in the organization.

## Deleting a User

When a user is deleted, all personally identifiable information associated with
them is removed from OpsDuty. This action is permanent and cannot be undone.

!!! note "The last remaining user in the organization cannot be deleted."

    To remove this user, the organization must first be closed. See [Closing the Organization](../organization/settings.md#closing-the-organization) for details.
