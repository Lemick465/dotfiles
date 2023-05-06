#!/usr/bin/env sh

# Update the package list
sudo apt update -y

# Install packages from the list
sudo xargs apt install -y <"$HOME/.utils/packages"

# Update and clean up the system
sudo apt upgrade -y && sudo apt autoremove -y
