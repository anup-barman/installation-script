#!/bin/bash

set -e

echo "Updating package lists..."
sudo apt update

echo "Installing prerequisites..."
sudo apt install -y wget gpg software-properties-common apt-transport-https

echo "Adding VS Code repository..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/packages.microsoft.gpg > /dev/null

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | \
sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

echo "Adding Sublime Text repository..."
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/sublimehq.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/sublimehq.gpg] https://download.sublimetext.com/ apt/stable/" | \
sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null

echo "Updating package lists again..."
sudo apt update

echo "Installing packages..."
sudo apt install -y build-essential codeblocks sublime-text code

echo "Done."
