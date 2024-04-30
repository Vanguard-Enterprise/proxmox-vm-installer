#!/bin/bash

# Function to display progress message
progress_message() {
    echo "--------------------------------------------------------------"
    echo "$1"
    echo "--------------------------------------------------------------"
}

# Check if pv is installed
if ! command -v pv &> /dev/null; then
    echo "Error: pv command is not installed. Installing pv..."
    sudo apt install -y pv
fi

# Update apt repositories
progress_message "Starting Apt Repo Update"
sudo apt update | pv -pter -s 100 >/dev/null
echo "Apt Repos Updated!"

# Upgrade packages
progress_message "Starting Apt Repo Upgrade"
sudo apt upgrade -y | pv -pter -s 100 >/dev/null
echo "Apt Repos Upgraded!"

# Install QEMU-Guest Agent
progress_message "Starting Install of QEMU-Guest Agent"
sudo apt-get install qemu-guest-agent -y | pv -pter -s 100 >/dev/null
echo "QEMU-Guest Agent Installed!"

# Shutdown the system
echo "Shutting down the system..."
sudo shutdown now