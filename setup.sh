#!/bin/bash

echo -e "\033[36m Setup for SSLVerifier commencing \033[0m!"

# Verify if command was used with sudo
if [ "$(id -u)" -ne 0 ]; then
    echo -e "\033[36m Execute again with sudo, please! \033[0m"
    exit 1
fi

# Verify if sslscan is installed. Else, install
if ! command -v sslscan &> /dev/null; then
    echo -e "\033[36m Installing sslscan... \033[0m"
    apt-get update
    apt-get install -y sslscan
    echo -e "\033[36m Installed sslscan. \033[0m"
else
    echo -e "\033[36m sslscan is already installed. \033[0m"
fi

# Download sslverifier.sh
wget "https://raw.githubusercontent.com/BrunoThums/SSLVerifier/main/sslverifier.sh"
# Make the SSLVerifier.sh script executable
chmod +x "sslverifier.sh"

# Move the entire directory to /usr/local/bin
echo -e "\033[36m Moving script to path \033[0m"
mv sslverifier.sh /usr/bin/sslverifier
echo -e "\033[36m Done! \033[0m"
echo -e "\033[36m You can now use sslverifier anywhere :) \033[0m"
echo -e "\033[36m Goodbye! \033[0m"
rm setup.sh
