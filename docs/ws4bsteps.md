---
title: ""
layout: default
---

# WS4b IDS/IPS workshop steps - Supports the related Video


### Preparation

**Update the system**   
```bash
sudo apt update
sudo apt upgrade
````  

**Install UFW Firewall and Fail2Ban IDS/IPS**  
```bash
sudo apt install ufw
sudo apt install fail2ban
````

**Configure UFW  - see [reference](ws4b.md#ufw)**  
**Configure Fail2Ban - see [reference](ws4b.md#fail2ban)**  

### Fail2Ban demonstration  
1. john2 logs in via SSH, first entering an incorrect password and then the correct one. john2 then logs out.

2. Log in as student via SSH and **take a screenshot showing john2’s logins** in /var/log/auth.log. Then log out.
   
`sudo grep -a --color "john2" /var/log/auth.log`   
<img width="1596" height="73" alt="image" src="images/88b885da8d0a.png" />


4. john2 attempts to log in via SSH but repeatedly enters the wrong password. The IP address becomes blocked, and the server no longer responds to requests from this IP.

5. Log in as student from the Debian console. Use an appropriate fail2ban-client command to view the currently blocked IP address(es). **Take a screenshot**.  
<img width="626" height="272" alt="image" src="images/bb9c1a3e696c.png" />


6. Use the proper fail2ban-client command to unblock the blocked IP address. Then log out from the Debian console.

7. Log in again as student via SSH and **take a screenshot of fail2ban.log showing the IP ban and its release**.  
<img width="1574" height="202" alt="image" src="images/a68f3b04ac5b.png" />

