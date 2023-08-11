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

# Make the SSLVerifier.sh script executable
chmod +x "sslverifier.sh"

# Move the entire directory to /usr/local/bin
echo "Moving script to path"
mv sslverifier.sh /usr/bin/sslverifier
echo "Done!"
echo "You can now use sslverifier anywhere :)"
echo "Goodbye!"
cd ..
rm -rf SSLVerifier
