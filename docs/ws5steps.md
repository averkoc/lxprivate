
>  **View the related video for more detailed information and answering instructions.**




# 🛠️ Logging Workshop Demo

This guide walks through some log-files usage examples: Apache configuration errors, SSH access auditing, and web access log analysis using GoAccess.

---

## 🔧 Preparations

Add your user to the `sudo` group:

```bash
sudo usermod -aG sudo firstname
```


## 🧪 Demo 1: Apache Misconfiguration & Logging
### 🐣 Problem Setup  
1. Confirm Apache is working via browser.
2. SSH into the server:
   `ssh firstname@<server-ip>`
3. Backup and edit Apache configuraion:  
`sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.bak`  
`sudo nano /etc/apache2/sites-available/000-default.conf`
4. Modify the DocumentRoot line:  
DocumentRoot /var/www/htm
5. Reload Apache configuration: `sudo systemctl reload apache2.service`
6. Check with browser again — **error should appear**

### 🛠️ Problem Resolution  
1. Monitor live requests while you are accessing the web site with browser. The code 404 tells that page is not found.
`sudo tail -f /var/log/apache2/access.log`  # exit this with ctrl-c  
take a screen clip that shows the unsuccessful page request:  
`firstname@debian:~$ sudo tail -n5 /var/log/apache2/access.log` # **paste output including the command row to answer box**

2. View error logs: `firstname@debian:~$ sudo journalctl -u apache2 -n10`  
   **paste output including the command row to answer box**

3. Fix the DocumentRoot path in config.
4. Relaoad Apache: `sudo systemctl reload apache2.service`
5. Confirm correct operation by browser


## 🕵️‍♂️ Audit Config Changes  
Check who modified .conf files:   
`sudo journalctl _COMM=sudo | grep "\.conf"`  
**Paste the output that shows who have edited apache configuration files to answer box**

## 🔐 Demo 2: SSH Access Audit  
Check if your account was used from unknown IPs  
`sudo journalctl -u ssh | grep 'Accepted publickey for <USERNAME>' | grep -v 'from <TRUSTED_IP>'`  
or   
`sudo journalctl -u ssh | grep 'Accepted password for <USERNAME> ' | grep -v 'from <TRUSTED_IP>'`  
**Paste the output including the command row that shows whether your account is used successfully from some other ip-address than your windows or mac**

## 📊 Demo 3: Web Access Log Analysis with GoAccess  
### 📁 What is access.log?  
Each line includes:  
* IP address
* Timestamp
* HTTP method and resource
* Status code (e.g., 200, 404)
* Bytes sent
* Referrer
* User agent (may reveal OS, browser, and hardware architecture — though this info is self-reported and not always reliable)  
 

Useful for analyzing traffic, behavior, and issues.  

### ⚙️ Using GoAccess  
Install GoAccess: `sudo apt install goaccess` 
Generate HTML report: 
`goaccess /var/log/apache2/access.log -o report.html --log-format=COMBINED`  
Live terminal view:  
`sudo goaccess /var/log/apache2/access.log --log-format=COMBINED`

## ✅ Summary  
This workshop demonstrated Linux logging using the following examples:
* Diagnosing Apache config errors (`sudo apache2ctl configtest` should be run after config modifications`)
* Auditing SSH access logs
* Analyzing traffic with GoAccess
  
