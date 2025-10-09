# User & Group Management Script

A simple Bash script to manage local Linux users and groups — create/delete users and groups, and add/remove users from groups.

---

## Description

This script (`user_mgmt.sh`) provides straightforward commands to perform common user/group administration tasks from the terminal:

* Create a new user (with home directory and default `/bin/bash` shell)
* Delete a user and their home directory
* Create and delete groups
* Add a user to a group
* Remove a user from a group

The script is intended for system administrators and should be run with root privileges.

---

## Usage

```bash
sudo ./user_mgmt.sh <action> [options]
```

### Actions & Options

* `add -u <username>`

  * Create a new user (home directory and `/bin/bash`)

* `del -u <username>`

  * Delete an existing user (removes home directory)

* `addgroup -g <groupname>`

  * Create a new group

* `delgroup -g <groupname>`

  * Delete an existing group

* `usr_add_grp -u <username> -g <groupname>`

  * Add an existing user to an existing group

* `usr_delete_grp -u <username> -g <groupname>`

  * Remove a user from a group

---

## Examples

```bash
# Create a user named 'alice'
sudo ./user_mgmt.sh add -u alice

# Delete user 'alice' and her home directory
sudo ./user_mgmt.sh del -u alice

# Create a group named 'devs'
sudo ./user_mgmt.sh addgroup -g devs

# Delete group 'devs'
sudo ./user_mgmt.sh delgroup -g devs

# Add user 'bob' to group 'devs'
sudo ./user_mgmt.sh usr_add_grp -u bob -g devs

# Remove user 'bob' from group 'devs'
sudo ./user_mgmt.sh usr_delete_grp -u bob -g devs
```

---

## Requirements & Notes

* **Run as root**: the script must be run with `sudo` or as root since it calls `useradd`, `userdel`, `groupadd`, `groupdel`, `usermod`, and `gpasswd`.
* The script performs basic existence checks for users/groups before acting.
* Test changes in a non-production VM before running on production systems — deleting users/groups is destructive.
