#!/bin/bash

echo "Setup for SSLVerifier commencing!"

# Verify if command was used with sudo
if [[ $EUID -ne 0 ]]; then
    echo "Execute again with sudo, please!"
    exit 1
fi

# Verify if sslscan is installed. Else, install
echo "Verifying if sslscan is installed"
if ! command -v sslscan &>/dev/null; then
    echo "Installing sslscan..."
    apt-get update
    apt-get install -y sslscan
    echo "Done!"
else
    echo "sslscan is already installed"
fi

echo "Giving execute permission to SSLVerifier.sh"
chmod +x SSLVerifier.sh
echo "Done!"

echo "Adding SSLVerifier to path"
# No need to verify if is already in path, let it overwrite
mv ./SSLVerifier /usr/bin/SSLVerifier
echo "Done!"

echo "You can now use SSLVerifier anywhere :)"
echo "Goodbye!"
