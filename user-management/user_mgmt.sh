#!/usr/bin/env bash
# user_mgmt.sh - Simple User Management Automation
# Author: Vaibhav
# Run as root (sudo)

set -euo pipefail

PROG="$(basename "$0")"

usage() {
  cat <<EOF
Usage: $PROG [command] [options]

Commands:
  add     -u USER [-g GROUP] [-s SHELL] [-h]   Create a new user
  del     -u USER [-r]                         Delete a user (-r remove home)
  passwd  -u USER                              Set/reset user password
  lock    -u USER                              Lock user account
  unlock  -u USER                              Unlock user account
  groups  -u USER -g GROUPS                    Add user to groups (comma sep)
  info    -u USER                              Show user info
  help                                         Show this help

Examples:
  $PROG add -u alice -g developers -s /bin/bash
  $PROG del -u alice -r
  $PROG passwd -u alice
  $PROG groups -u alice -g sudo,docker
EOF
  exit 1
}

require_root() {
  if [[ $EUID -ne 0 ]]; then
    echo "❌ Must run as root (use sudo)." >&2
    exit 1
  fi
}

# ---- Parse Subcommands ----
cmd="${1:-}"
shift || true

[[ -z "$cmd" ]] && usage

USER=""
GROUPS=""
SHELL="/bin/bash"
REMOVE_HOME=0

while getopts "u:g:s:r" opt; do
  case $opt in
    u) USER="$OPTARG" ;;
    g) GROUPS="$OPTARG" ;;
    s) SHELL="$OPTARG" ;;
    r) REMOVE_HOME=1 ;;
    *) usage ;;
  esac
done

require_root

case "$cmd" in
  add)
    if id "$USER" &>/dev/null; then
      echo "⚠️ User '$USER' already exists."
      exit 1
    fi
    if [[ -n "$GROUPS" ]]; then
      groupadd -f "$GROUPS"
      useradd -m -s "$SHELL" -G "$GROUPS" "$USER"
    else
      useradd -m -s "$SHELL" "$USER"
    fi
    echo "✅ User '$USER' created."
    ;;
  del)
    if ! id "$USER" &>/dev/null; then
      echo "⚠️ User '$USER' does not exist."
      exit 1
    fi
    if (( REMOVE_HOME )); then
      userdel -r "$USER"
      echo "🗑 User '$USER' and home directory deleted."
    else
      userdel "$USER"
      echo "🗑 User '$USER' deleted (home preserved)."
    fi
    ;;
  passwd)
    if ! id "$USER" &>/dev/null; then
      echo "⚠️ User '$USER' does not exist."
      exit 1
    fi
    passwd "$USER"
    ;;
  lock)
    passwd -l "$USER" && echo "🔒 User '$USER' locked."
    ;;
  unlock)
    passwd -u "$USER" && echo "🔓 User '$USER' unlocked."
    ;;
  groups)
    if [[ -z "$GROUPS" ]]; then
      echo "❌ Groups required with -g" >&2
      exit 1
    fi
    usermod -aG "$GROUPS" "$USER"
    echo "✅ User '$USER' added to groups: $GROUPS"
    ;;
  info)
    id "$USER"
    getent passwd "$USER"
    ;;
  help|*)
    usage
    ;;
esac
