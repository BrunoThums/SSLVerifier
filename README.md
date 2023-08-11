# SSLVerifier
A tool to check TLS/SSL certificates. Powered by sslscan.

## Install
There are two options:
- `git clone https://github.com/BrunoThums/SSLVerifier.git; cd SSLVerifier; chmod +x setup.sh; sudo ./setup.sh`

## How to use
- You can pass a URL or a file with URLs without any treatment:
  - No need to pass http:// or https://
  - ~~No need to pass www~~ (coming soon)
  - No port required
  - Don't worry about duplicates
  - Don't worry about directories
- SSLVerifier file_with_urls.txt
- SSLVerifier single_URL

## What it can do?
- (Obviously) check TLS/SSL certificates of a single URL or a file of URLs
- Convert URL from http to https (required for sslscan)
- Add https:// to every URL (if there's none)
- Add port 80 and 443 to URL that doesn't contain a port especified
- Check for duplicates in file
- Show, at the end, which URL's have:
  - TLSv1.0 and/or TLSv1.1 enabled
  - TLSv1.2 AND TLSv1.3 disabled

## Useful links:
- https://en.wikipedia.org/wiki/ANSI_escape_code#Colors

## TO-DO
- Remove www from URLs
- Optionally put, by argument, the addition of port 80 and 443 at the end of the URL
- Add custom message for host invalid or error
- Check if all protocols are disable (is it even accessible?)]
- Check if sslscan is installed and if not, automatically install
- Put into path, so it can be run anywhere
- Check, by argument, for valid/invalid certificates


