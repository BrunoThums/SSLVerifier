#!/bin/bash

# Function to show logo
show_logo(){
    base64 -d <<<"H4sIAAAAAAAAA61Q2w3EMAj7Zwov0LIQUjoIwx+GvO5ynyWKBTZYIWgMdERFy9tWnPkXIwrWhQ5P
E++nOLZZ+nZmz0sVw3Ndd+Gvi0cHUaGT2fSlSo7DCs+3eDKKyThwqqLGfTrSny+MDUYV/VFy2sfG
I1+qGOd0Q/6R7ZxH6TZy/FMFb8RLLvIB+BvODzECAAA=" | gunzip
}

# Function to show report
print_report(){
    echo -e "\e[35m" "Report:" "\e[0m"
    for site_info in "${report[@]}"; do
        echo "$site_info"
    done
}

# Function to remove duplicates and check if sites don't start with http:// or http://
# OBS: sslscan only accept https or site:port or https://site:port, never http://whatever
file_url_adjuster(){
    # Array para armazenar os URLs processados
    cleaned_array=()

    while read -r url; do
        # If has http, turn into https; else add https. If has https does nothing (important to not duplicate)
        if [[ $url =~ ^(http://|https://) ]]; then
            url="${url/http:/https:}"
        # add https:// if doesn't have it
        else
            url="https://$url"
        fi
        
        # Remove directories
        domain=$(echo "$url" | awk -F/ '{print $1 "//" $3}')
        # Check if the URL contains a port. If dont, add 80 and 443
        if [[ ! $domain =~ :[0-9]+$ ]]; then
            url1="${domain}:80"
            url2="${domain}:443"
            cleaned_array+=("$url1")
            cleaned_array+=("$url2")
        else
            cleaned_array+=("$domain")
        fi
    # is used to redirect input to a command or loop from a file (not from a list like "<<<")
    done < "$filename"

    # Removendo duplicados da lista de URLs
    cleaned_list=$(echo "${cleaned_array[@]}" | tr ' ' '\n' | sort -u)
    
    #echo "$cleaned_list"
}

# Function to check TLS protocols
check_tls() {
    local site="$1"
    local tls10_enable=0
    local tls11_enable=0
    local tls12_enable=1
    local tls13_enable=1

    echo -e "\e[33m" "$site_final" "\e[0m"
    output=$(sslscan "$site_final" | grep -A6 "SSL/TLS Protocols")
    echo "$output"
    
    if echo "$output" | grep -q "TLSv1.0.*enabled"; then
        tls10_enable=1
    fi
    
    if echo "$output" | grep -q "TLSv1.1.*enabled"; then
        tls11_enable=1
    fi
    
    if echo "$output" | grep -q "TLSv1.2.*disabled"; then
        tls12_enable=0
    fi
    
    if echo "$output" | grep -q "TLSv1.3.*disabled"; then
        tls13_enable=0
    fi
    
    # 1.1 and 1.2 enabled?
    if [ $tls10_enable -eq 1 ] && [ $tls11_enable -eq 1 ]; then
        report+=("$site_final has TLSv1.0 and TLSv1.1 enabled.")
    
    # Only 1.0 enabled?
    elif [ $tls10_enable -eq 1 ]; then
        report+=("$site_final has TLSv1.0 enabled.")
    
    # Only 1.1 enabled?        
    elif [ $tls11_enable -eq 1 ]; then
        report+=("$site_final has TLSv1.1 enabled.")
    fi
    
    # 1.2 e 1.3 disabled?
    if [ $tls12_enable -eq 0 ] && [ $tls13_enable -eq 0 ]; then
        report+=("$site_final has TLSv1.2 and TLSv1.3 disabled.")
    fi
    
    # Divider
    echo -e "\e[36m" "\n|════════════════════════════════════|" "\e[0m"
}

run_4_file(){
    file_url_adjuster
    while read -r site_final; do
        check_tls "$site_final"
    # <<< is used to pass a string as input to a command or loop (from a list, not from a file like "<")
    done <<< "$cleaned_list"
    print_report
}

run_4_URL(){
    # If has http, turn into https; else add https. If has https does nothing (important to not duplicate)
    if [[ $url =~ ^(http://|https://) ]]; then
            url="${url/http:/https:}"
        # add https:// if doesn't have it
        else
            url="https://$url"
        fi
    # Extract domain from URL (cuts directories)
    domain=$(echo "$url" | awk -F/ '{print $1 "//" $3}')
    if [[ ! $domain =~ :[0-9]+$ ]]; then
        site_final="${domain}:80"
        check_tls "$site_final"
        site_final="${domain}:443"
        check_tls "$site_final"
    else
        site_final="${domain}"
        check_tls "$site_final"
    fi
    print_report
}

# Show usage message if no arguments passed
if [ $# -eq 0 ]; then
    echo -e "Use:\nsslverifier file_with_urls.txt\nsslverifier single_URL"
    exit 1
fi

show_logo

# Checks if first argument is file or URL
# If file:
if [ -f "$1" ]; then
    filename="$1"
    run_4_file
# If URL
else
    url=$1
    run_4_URL
fi
