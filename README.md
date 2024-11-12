# rec03n

## rec03n is a bash script for Subdomain Enumeration. It uses somes tools:

- [Sublist3r](https://github.com/aboul3la/Sublist3r) - Fast subdomains enumeration tool for penetration testers
- [Amass](https://github.com/OWASP/Amass) - In-depth Attack Surface Mapping and Asset Discovery
- [massdns](https://github.com/blechschmidt/massdns) - A high-performance DNS stub resolver for bulk lookups and reconnaissance (subdomain enumeration)
- [Findomain](https://github.com/Findomain/Findomain) - The fastest and cross-platform subdomain enumerator, do not waste your time.
- [Sudomy](https://github.com/Screetsec/Sudomy) - Sudomy is a subdomain enumeration tool to collect subdomains and analyzing domains performing automated reconnaissance (recon) for bug hunting / pentesting
- [chaos-client](https://github.com/projectdiscovery/chaos-client) - Go client to communicate with Chaos DNS API.
- [dnsx](https://github.com/projectdiscovery/dnsx) - Dnsx is a fast and multi-purpose DNS toolkit allow to run multiple DNS queries of your choice with a list of user-supplied resolvers.
- [subfinder](https://github.com/projectdiscovery/subfinder) - Subfinder is a subdomain discovery tool that discovers valid subdomains for websites.

## Post Installation
```
You need to replace at lines : 68 ; 184 
"full_path_here" with your installation path of massdns.
You need to replace at lines : 126 ; 190
"full_path_here" with your installation path of sudomy.

You need to replace at lines : 71 ; 186
"your_api_key_here" with your chaos api.
```
You can get your chaos API key by either signing up or logging in at [cloud.projectdiscovery.io](https://cloud.projectdiscovery.io?ref=api_key)

### Thanks!
Thanks for checking out rec03n, it's been a fun project to help me learn more about bash scripting.  If you find any issues or have any questions please feel free to create an Issue !
