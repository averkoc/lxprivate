# Classification of Suspicious Access Log Paths
Pick from access.log `awk '$9 ~ /4[0-9]{2}/ {print $0}' access.log | grep '"GET [^"]*"'`  
`awk '$9 ~ /4[0-9]{2}/ {print $0}' access.log | grep -o '"GET [^"]*"'`  
`awk '$9 ~ /4[0-9]{2}/ {print $0}' access.log | grep -o '"GET [^"]*"' |sort |uniq`  


## 🔐 Credential & Secret Files
Attackers searching for exposed credentials, API keys, and authentication tokens.

- `.env*` variants - Environment configuration files containing database passwords, API keys, secrets
- `.aws/credentials*` - AWS access keys and secret keys
- `.git/config`, `.git/credentials` - Git repository credentials
- `.passwd-s3fs`, `.s3cfg`, `s3cmd.ini` - S3 storage credentials
- `sendgrid.env` - Email service API keys
- `config/filesystems.php`, `config/mail.php`, `config/services.php` - PHP configuration with credentials
- `assets/credentials.json` - Generic credential storage
- `appsettings.json` - .NET application settings with connection strings

## 💉 PHPUnit RCE Vulnerability (CVE-2017-9841)
Exploiting old PHPUnit versions to execute arbitrary PHP code.

- `/vendor/phpunit/phpunit/src/Util/PHP/eval-stdin.php` - Direct code execution endpoint
- Multiple path variations trying different installation locations (lib, public, admin, api, etc.)

## 🐛 PHP Remote Code Execution Attempts
Various PHP exploitation techniques.

- `index.php?s=/index/\\think\\app/invokefunction` - ThinkPHP framework RCE
- `index.php?lang=../../../../../../../../tmp/` - Local file inclusion (LFI)
- `?XDEBUG_SESSION_START=phpstorm` - Debug mode exploitation
- `?phpinfo=-1`, `/phpinfo.php*`, `/info.php` - Information disclosure
- `*.php` files (1.php, i.php, temp.php, upl.php, password.php) - Webshells

## 🪟 Cisco VPN Exploits
Targeting Cisco SSL VPN vulnerabilities.

- `/+CSCOE+/logon_forms.js`, `/+CSCOE+/transfer.js` - Path traversal (CVE-2018-0296)
- `/+CSCOL+/*.jar` - Java applet vulnerabilities

## 📧 Microsoft Exchange Exploits
Probing for Exchange/Outlook Web Access vulnerabilities.

- `/owa/*` - Outlook Web Access endpoints
- `/autodiscover/autodiscover.json?@zdi/Powershell` - ProxyShell/ProxyLogon exploits
- `/remote/login?lang=en` - Remote access authentication

## 🌐 WordPress Reconnaissance
Identifying WordPress installations and vulnerabilities.

- `/wp-includes/wlwmanifest.xml` - WordPress Live Writer manifest (version detection)
- `/xmlrpc.php` - WordPress XML-RPC (brute force, DDoS vector)
- `/wp-json` - WordPress REST API
- `/wp-config.php*` - WordPress configuration with database credentials
- `/wp-content/w3tc-config/*` - W3 Total Cache plugin config

## ☕ Spring Boot & Java Exploitation
Targeting Spring Boot actuator endpoints and Java vulnerabilities.

- `/actuator/health`, `/actuator/gateway/routes` - Spring Boot management endpoints
- `/geoserver/web/` - GeoServer admin console
- `/aspera/faspex/` - Aspera file transfer vulnerabilities

## 🐳 Container & CI/CD Information Disclosure
Exposing deployment and build configurations.

- `docker-compose.yml` - Docker container configurations
- `.gitlab-ci.yml`, `bitbucket-pipelines.yml` - CI/CD pipeline definitions
- `.github/workflows/*.yml` - GitHub Actions workflows
- `/containers/json` - Docker API exposure

## 📊 Application Mapping & APIs
Discovering application structure and API endpoints.

- `/swagger`, `/api/swagger` - API documentation
- `/mcp`, `/v1/mcp`, `/api/mcp` - MCP (Model Context Protocol) endpoints
- `/models`, `/v1/models` - AI/ML model endpoints
- `/_profiler*` - Symfony profiler (debug info)
- `/ReportServer` - SQL Server Reporting Services

## 🦠 Malware Deployment
Active malware download and execution attempts.

- `/shell?cd+/tmp;rm+-rf+*;wget+...Mozi.a` - Mozi botnet dropper command

## 📁 Information Gathering
Standard reconnaissance for site structure.

- `/robots.txt`, `/sitemap.xml` - Site structure
- `/.well-known/security.txt` - Security contact info
- `/favicon.ico` - Site identification
- `/license.txt` - Software version detection
- JavaScript files (`main.js`, `bundle.js`, `config.js`) - Client-side code analysis

## 🔧 Framework-Specific Probes
Detecting specific web frameworks and their configs.

- `/config/environments/*.rb` - Ruby on Rails configurations
- `/developmentserver/metadatauploader` - SharePoint vulnerabilities
- `/SDK/webLanguage` - VMware vCenter vulnerabilities
- `/geoip/` - GeoIP database access
