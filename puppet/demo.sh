#!/bin/bash

# Define variables
USER_NAME="demo_user"
USER_HOME="/home/$USER_NAME"
WELCOME_FILE="$USER_HOME/.welcome"
LOG_FILE="/var/log/welcome.log"
WELCOME_CONTENT="Welcome to the Bash-managed system, demo_user!\n"

# Function to check if a user exists
user_exists() {
    id "$1" &>/dev/null
}

# 1. Ensure the user 'demo_user' is present
if ! user_exists "$USER_NAME"; then
    echo "User $USER_NAME does not exist. Creating user..."
    useradd -m -d "$USER_HOME" "$USER_NAME"
    if [[ $? -ne 0 ]]; then
        echo "Error creating user $USER_NAME" >&2
        exit 1
    fi
else
    echo "User $USER_NAME already exists. Skipping user creation."
fi

# 2. Ensure the .welcome file exists with specific content
if [[ -f "$WELCOME_FILE" ]]; then
    CURRENT_CONTENT=$(cat "$WELCOME_FILE")
else
    CURRENT_CONTENT=""
fi

# Check if the content needs to be updated
if [[ "$CURRENT_CONTENT" != "$WELCOME_CONTENT" ]]; then
    echo "Updating the welcome file content..."
    echo -e "$WELCOME_CONTENT" > "$WELCOME_FILE"
    chown "$USER_NAME:$USER_NAME" "$WELCOME_FILE"
    chmod 0644 "$WELCOME_FILE"

    # 3. Notify that the file has been updated
    echo "Welcome file has been updated" >> "$LOG_FILE"
else
    echo "The welcome file is already up to date. Skipping file update."
fi
