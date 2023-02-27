#!/bin/bash

# Define a function to print the usage instructions
print_usage() {
    echo "Usage: $0 [-h] [--domain TARGET_DOMAIN] [--wordlist WORDLIST_FILE]"
    echo "Brute-force subdomains for a target domain using a wordlist."
    echo ""
    echo "Optional arguments:"
    echo "  -h, --help            Print this help message and exit."
    echo "  -d TARGET_DOMAIN, --domain TARGET_DOMAIN"
    echo "                        The target domain to brute-force subdomains for."
    echo "  -w WORDLIST_FILE, --wordlist WORDLIST_FILE"
    echo "                        The path to the wordlist file containing subdomain names."
}

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -h|--help) print_usage; exit 0;;
        -d|--domain) target_domain="$2"; shift;;
        -w|--wordlist) wordlist="$2"; shift;;
        *) echo "Unknown option: $1"; print_usage; exit 1;;
    esac
    shift
done

# Check that both arguments were provided
if [ -z "$target_domain" ] || [ -z "$wordlist" ]; then
    echo "Error: both target_domain and wordlist must be provided."
    echo ""
    print_usage
    exit 1
fi

# Loop through each line in the wordlist file
while read subdomain; do
    # Attempt to resolve the subdomain to an IP address
    ip_address=$(dig +short "$subdomain.$target_domain")
    
    # If an IP address is found, print the subdomain and IP address
    if [ ! -z "$ip_address" ]; then
        echo "$subdomain.$target_domain: $ip_address"
    fi
    
done < "$wordlist"
