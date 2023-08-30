#!/bin/bash

echo -e "\e[36m Setup for SSLVerifier commencing \e[0m!"

# Verify if command was used with sudo
if [ "$(id -u)" -ne 0 ]; then
    echo -e "\e[36m Execute again with sudo, please! \e[0m"
    exit 1
fi

# Verify if sslscan is installed. Else, install
if ! command -v sslscan &> /dev/null; then
    echo -e "\e[36m Installing sslscan... \e[0m"
    apt-get update
    apt-get install -y sslscan
    echo -e "\e[36m Installed sslscan. \e[0m"
else
    echo -e "\e[36m sslscan is already installed. \e[0m"
fi

# Download sslverifier.sh
wget "https://raw.githubusercontent.com/BrunoThums/SSLVerifier/main/sslverifier.sh"
# Make the SSLVerifier.sh script executable
chmod +x "sslverifier.sh"

# Move the entire directory to /usr/local/bin
echo -e "\e[36m Moving script to path \e[0m"
mv sslverifier.sh /usr/bin/sslverifier
echo -e "\e[36m Done! \e[0m"
echo -e "\e[36m You can now use sslverifier anywhere :) \e[0m"
echo -e "\e[36m Goodbye! \e[0m"
rm setup.sh
