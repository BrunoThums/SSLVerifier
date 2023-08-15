# SSLVerifier
A tool to check TLS/SSL version. Powered by sslscan.

## Install
- `git clone https://github.com/BrunoThums/SSLVerifier.git; cd SSLVerifier; chmod +x setup.sh; sudo ./setup.sh`
<!-- É possível mudar essa instalação. Baixe a ferramenta no linux/kali, dê permissão de execução para o setup.sh e faça o commit. Assim dará pra mudar para:
git clone https://github.com/BrunoThums/SSLVerifier.git; sudo SSLVerifier/setup.sh 
Só precisa ajustar o "local" do script, dentro dele. Porque senão ele não consegue se apagar
-->
## How to use
- You can pass a URL or a file with URLs without any treatment:
  - No need to pass http:// or https://
  - ~~No need to pass www~~ (coming soon)
  - No port required
  - Don't worry about duplicates
  - Don't worry about directories
- sslverifier file_with_urls.txt
- sslverifier single_URL

## What it can do?
- (Obviously) check TLS/SSL certificates of a single URL or a file of URLs
- Convert URL from http to https (required for sslscan)
- Add https:// to every URL (if there's none)
- Add port 80 and 443 to URL that doesn't contain a port especified
- Check for duplicates in file
- Show, at the end, which URL's have:
  - TLSv1.0 and/or TLSv1.1 enabled
  - TLSv1.2 AND TLSv1.3 disabled

### Other funcionalities
- You can run it anywhere
- Automatically check if sslscan is installed and. If not, then install

## Useful links:
- https://en.wikipedia.org/wiki/ANSI_escape_code#Colors

## TO-DO
- Remove www from URLs
- Optionally put, by argument, the addition of port 80 and 443 at the end of the URL
- Add custom message for host invalid or error
- Check if all protocols are disable (is it even accessible?)]
- Check, by argument, for valid/invalid certificates


