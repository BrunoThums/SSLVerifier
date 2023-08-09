# SSLVerifier
A tool to check TLS/SSL certificates. Powered by sslscan.

# What it can do?
- (Obviously) check TLS/SSL certificates of a single URL or a file of URLs
- Convert URL from http to https (required for sslscan)
- Add port 80 and 443 to URL that doesn't contain a port especified
- Check for duplicates in file
- Show, at the end, which URL's have:
  - TLSv1.0 and/or TLSv1.1 enabled
  - TLSv1.2 AND TLSv1.3 disabled

# Useful links:
- https://en.wikipedia.org/wiki/ANSI_escape_code#Colors

# TO-DO
- Remove www from URLs
- Optionally put, by argument, the addition of port 80 and 443 at the end of the URL
- Adjust execution without arguments (leads to error)
- Add custom message for host invalid or error

# Install
- git clone https://github.com/BrunoThums/SSLVerifier.git; cd SSLVerifier; chmod +x SSLVerifier.sh
- wget https://github.com/BrunoThums/SSLVerifier/blob/main/SSLVerifier.sh; chmod +x SSLVerifier.sh

# How to use
You can pass a URL or a file with URLs without any treatment:
  - Doesn't need to pass http:// or https://
  - ~~Doen't need to pass www~~ (coming soon)
  - Doens't need to inform a port
  - Don't worry about duplicates
  - Don't worry about directories
- ./SSLVerifier.sh file_with_urls.txt
- ./SSLVerifier.sh single_URL
