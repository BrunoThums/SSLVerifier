#!/bin/bash

echo "Setup for SSLVerifier commencing!"

# Verify if command was used with sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "Execute again with sudo, please!"
    exit 1
fi

# Verify if sslscan is installed. Else, install
if ! command -v sslscan &> /dev/null; then
    echo "Installing sslscan..."
    apt-get update
    apt-get install -y sslscan
    echo "Installed sslscan."
else
    echo "sslscan is already installed."
fi

# Obtain the directory of the script
script_dir=$(dirname "$0")

# Add script directory to PATH
echo "Adding script directory to PATH"
echo "export PATH=\"$script_dir:\$PATH\"" >> ~/.bashrc
source ~/.bashrc

echo "Giving execute permission to SSLVerifier.sh"
chmod +x SSLVerifier.sh
echo "Done!"

echo "You can now use SSLVerifier anywhere :)"
echo "Goodbye!"
