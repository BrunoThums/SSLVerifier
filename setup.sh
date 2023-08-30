#!/bin/bash

echo "\e[36mSetup for SSLVerifier commencing\e[0m!"

# Verify if command was used with sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "\e[36mExecute again with sudo, please!\e[0m"
    exit 1
fi

# Verify if sslscan is installed. Else, install
if ! command -v sslscan &> /dev/null; then
    echo "\e[36mInstalling sslscan...\e[0m"
    apt-get update
    apt-get install -y sslscan
    echo "\e[36mInstalled sslscan.\e[0m"
else
    echo "\e[36msslscan is already installed.\e[0m"
fi

# Download sslverifier.sh
wget "https://raw.githubusercontent.com/BrunoThums/SSLVerifier/main/sslverifier.sh"
# Make the SSLVerifier.sh script executable
chmod +x "sslverifier.sh"

# Move the entire directory to /usr/local/bin
echo "\e[36mMoving script to path\e[0m"
mv sslverifier.sh /usr/bin/sslverifier
echo "\e[36mDone!\e[0m"
echo "\e[36mYou can now use sslverifier anywhere :)\e[0m"
echo "\e[36mGoodbye!\e[0m"
rm setup.sh
