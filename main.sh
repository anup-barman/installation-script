#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "--- Updating package list (Update Only) ---"
sudo apt update

echo "--- Installing Build-Essential ---"
sudo apt install -y build-essential

echo "--- Installing Code::Blocks ---"
sudo apt install -y codeblocks codeblocks-contrib

echo "--- Preparing for External Repositories (VS Code & Sublime) ---"
sudo apt install -y wget gpg apt-transport-https

# --- Visual Studio Code Setup ---
echo "--- Adding VS Code Repository ---"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# --- Sublime Text 4 Setup ---
echo "--- Adding Sublime Text Repository ---"
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/keyrings/sublimehq-archive.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/sublimehq-archive.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

echo "--- Final Update and Installation ---"
sudo apt update
sudo apt install -y code sublime-text

echo "----------------------------------------------"
echo "Installation Complete!"
echo "Installed: build-essential, codeblocks, vscode, sublime-text"
echo "----------------------------------------------"
