# DomainDigger

DomainDigger is a Bash script that automates the process of discovering subdomains for a target domain using a wordlist of common subdomain names.

## Usage
To use the script, simply run it with the `./DomainDigger.sh` command and provide the target domain and wordlist file as command-line arguments:
```
./DomainDigger.sh example.com subdomains.txt
```
Replace `example.com` with the target domain you want to brute-force subdomains for, and `subdomains.txt` with the path to a wordlist file containing common subdomain names.

## Options
The script also supports the following options:

-   `-h`, `--help`: Print a help message and exit.
-   `-d`, `--domain`: Specify the target domain to brute-force subdomains for.
-   `-w`, `--wordlist`: Specify the path to the wordlist file containing subdomain names.

To use these options, simply include them before the target domain and wordlist file:

```
./DomainDigger.sh -d example.com -w subdomains.txt
```

## Example Output

When the script runs, it will attempt to resolve each subdomain name in the wordlist to an IP address using the `dig` command. If an IP address is found, the script will print the subdomain name and IP address to the console.

Here's an example of what the output might look like:

```
admin.example.com: 192.0.2.1
mail.example.com: 192.0.2.2
www.example.com: 192.0.2.3
```
## Contributing

If you find any bugs or have suggestions for how to improve this script, please feel free to submit an issue or pull request on GitHub. Contributions are welcome and appreciated!
