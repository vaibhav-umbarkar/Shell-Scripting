# User Management Script

A simple Bash script to automate user management tasks such as creating, deleting, and modifying users and their permissions.

---

## Author

**Vaibhav Umbarkar**
Version: v1.0

---

## Description

`user_mgmt.sh` allows system administrators to perform common user management operations with ease:

* Create new users with optional group and shell assignment
* Delete users (with or without their home directories)
* Reset user passwords
* Lock and unlock accounts
* Add users to one or more groups
* View detailed user information

This script is useful for administrators who want a quick and reliable way to manage user accounts directly from the terminal.

---

## Usage

```bash
sudo ./user_mgmt.sh [command] [options]
```

### Commands

* **add**: Create a new user
* **del**: Delete a user
* **passwd**: Set or reset user password
* **lock**: Lock a user account
* **unlock**: Unlock a user account
* **groups**: Add user to groups
* **info**: Show user info

### Examples

```bash
# Add a user with default shell (/bin/bash)
sudo ./user_mgmt.sh add -u alice

# Add a user with group "devs" and custom shell
sudo ./user_mgmt.sh add -u bob -g devs -s /bin/zsh

# Delete a user (keep home directory)
sudo ./user_mgmt.sh del -u alice

# Delete a user and their home directory
sudo ./user_mgmt.sh del -u bob -r

# Reset a user's password
sudo ./user_mgmt.sh passwd -u alice

# Lock and unlock a user account
sudo ./user_mgmt.sh lock -u alice
sudo ./user_mgmt.sh unlock -u alice

# Add a user to multiple groups
sudo ./user_mgmt.sh groups -u alice -g docker,sudo

# Show user info
sudo ./user_mgmt.sh info -u alice
```

---
