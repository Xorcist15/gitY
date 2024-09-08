#!/bin/bash	

# Updates package manager
echo "Updating package manager"
sudo pacman -Sy

# Installs desired programs
echo "Installing Git and Github CLI"
sudo pacman -S git github-cli

echo "Email and name are required to configure git"

echo "Enter your name "
read -r NAME

echo "Enter your email address "
read -r EMAIL 

echo "Choose default editor (ensure it is installed), code, nvim:  "
read -r EDITOR 

echo "Configuring Git ..."
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global core.editor "$EDITOR"
git config --global color.ui auto

# Display the current configuration
echo "Git configuration complete. Use \"git config --list\" to see the current configuration."

# List the current git configuration
git config --list

# Starts auth process for github-cli on browser
echo "Starting authentication process for Github CLI..."
gh auth login
	
# Sets the default editor for the CLI
gh config set editor "$EDITOR --wait"

echo "Setup complete. You can use 'gh auth status' to check the Github CLI authentication status."
