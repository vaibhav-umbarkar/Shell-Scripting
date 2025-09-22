#!/bin/bash

#####################################################################################################
# Author: Vaibhav Umbarkar
# Version: v1.0
# Description: Simple script for create user, group, delete user & group, add/remove user from group
#####################################################################################################


# Function to check if the script is run as root
check_root(){
    if [[ $EUID -ne 0 ]]
    then
        echo "This script must be run as root/sudo"
        exit 1
    fi
}

# Function to display usage instructions
show_usage(){
    echo "Usage: sudo $0 <action> [options]"
    echo ""
    echo "Actions:"
    echo "  add -u <username>         : Create a new user"
    echo "  del -u <username>         : Delete an existing user"
    echo "  addgroup -g <groupname>   : Create a new group"
    echo "  delgroup -g <groupname>   : Delete an existing group"
    echo "  usr_add_grp -u <username> -g <group> : Add a user to a group"
    echo "  usr_delete_grp -u <username> -g <group> : Remove a user from a group"
    echo ""
    exit 1
}

# Function to create a new user
create_user(){
    local username=$1
    if id "$usename" &>/dev/null
    then
        echo "Error: User '$username' already exists."
        exit 1
    fi
    
    # Command for create new user with default bash shell env
    useradd -m "$username" -s /bin/bash
    if [[ $? -eq 0 ]]
    then
        echo "User '$username' created successfully"
    else
        echo "Error: Failed to create user '$username'!"
        exit 1
    fi
}

# Function for delete an existing user
delete_user(){
    local username=$1
    if ! id "$username" &>/dev/null
    then
        echo "Error: User '$username' does not exist"
        exit 1
    fi

    # Command for delete existing user and its home dir
    userdel -r "$username"
    if [[ $? -eq 0 ]]
    then
        echo "User '$username' and home dir deleted successfully"
    else
        echo "Error: Failed to delete user '$username'!"
        exit 1
    fi
}

# Fucntion for create new group
create_group(){
    local groupname=$1
    if getent group "$groupname" &>/dev/null
    then
        echo "Error: Group '$groupname' already exist"
        exit 1
    fi

    # Command for create new group
    groupadd "$groupname"
    if [[ $? -eq 0 ]]
    then
        echo "Group '$groupname' created successfully"
    else
        echo "Error: Failed to create '$groupname' Group!"
        exit 1
    fi
}

# Function for delete existing group
del_group(){
    local groupname=$1
    if ! getent group "$groupname" &>/dev/null
    then
        echo "Error: Group '$groupname' does not exist!"
        exit 1
    fi

    # Command for delete group
    groupdel "$groupname"
    if [[ $? -eq 0 ]]
    then
        echo "Group '$groupname' deleted successfully"
    else
        echo "Error: Failed to delete '$groupname' Group!"
        exit 1
    fi
}

# Function for add user to group
add_user_to_group(){
    local username=$1
    local groupname=$2
    if ! id "$username" &>/dev/null
    then
        echo "Error: User '$username' does not exist!"
        exit 1
    fi

    if ! getent group "$groupname" &>/dev/null
    then
        echo "Error: Group '$groupname' does not exist!"
        exit 1
    fi

    # Command for add user to group
    usermod -aG "$groupname" "$username"
    if [[ $? -eq 0 ]]
    then
        echo "User '$username' added in group '$groupname' successefully"
    else
        echo "Error: Failed to add user '$username' to group '$groupname'!"
        exit 1
    fi
}

# Function for delete user from group
del_user_from_group(){
    local username=$1
    local groupname=$2
    if ! id "$username" &>/dev/null
    then
        echo "Error: User '$username' dose not exist!"
        exit 1
    fi
    if ! getent group "$groupname" &>/dev/null
    then
        echo "Error: Group '$groupname' does not exist!"
        exit 1
    fi

    # Cammand for delete user from group
    gpasswd -d "$username" "$groupname"
    if [[ $? -eq 0 ]]
    then
        echo "User '$username' removed from group '$groupname' successfully"
    else
        echo "Error: Failed to remove user '$username' from group '$groupname'!"
        exit 1
    fi
}

# Check if at least one argument is provided by user
if [[ $# -eq 0 ]]
then
    show_usage
fi

action=$1
shift

case "$action" in
    add)
        while [[ $# -gt 0 ]]
        do
            case "$1" in
                -u)
                    username=$2
                    shift 2
                    create_user "$username"
                    ;;
                *)
                    show_usage
                    ;;
            esac
        done
        ;;
    
    del)
        while [[ $# -gt 0 ]]
        do
            case "$1" in
                -u)
                    username=$2
                    shift 2
                    delete_user "$username"
                    ;;
                *)
                    show_usage
                    ;;
            esac
        done
        ;;

    addgroup)
        while [[ $# -gt 0 ]]
        do
            case "$1" in
                -g)
                    groupname=$2
                    shift 2
                    create_group "$groupname"
                    ;;
                *)
                    show_usage
                    ;;
            esac
        done
        ;;

    delgroup)
        while [[ $# -gt 0 ]]
        do
            case "$1" in
                -g)
                    groupname=$2
                    shift 2
                    del_group "$groupname"
                    ;;
                *)
                    show_usage
                    ;;
            esac
        done
        ;;

    usr_add_grp)
        while [[ $# -gt 0 ]]
        do
            case "$1" in
                -u)
                    username=$2
                    shift 2
                    ;;
                -g)
                    groupname=$2
                    shift 2
                    ;;
                *)
                    show_usage
                    ;;
            esac
        done
        if [[ -n "$username" && -n "$groupname" ]]
        then
            add_user_to_group "$username" "$groupname"
        else
            show_usage
        fi
        ;;

    usr_delete_grp)
        while [[ $# -gt 0 ]]
        do
            case "$1" in
                -u)
                    username=$2
                    shift 2
                    ;;
                -g)
                    groupname=$2
                    shift 2
                    ;;
                *)
                    show_usage
                    ;;
            esac
        done
        if [[ -n "$username" && -n "$groupname" ]]
        then
            del_user_from_group "$username" "$groupname"
        else
            show_usage
        fi
        ;;
    *)
        show_usage
        ;;
esac
