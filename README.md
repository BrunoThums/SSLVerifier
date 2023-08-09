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
- remove www from URLs
- optionally put, by argument, the addition of port 80 and 443 at the end of the URL
