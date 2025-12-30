---
title: ""
layout: default
---  

# Debian Server Installation

### Installation Media
Find [installation media](https://cdimage.debian.org/debian-cd/current/) for different architectures.

### Download the Correct Installation Media (ISO File)
- **Windows and Intel-based Mac users:**  
  Download from the [Debian site](https://www.debian.org/).
- **Mac M1–M3 users:**  
  Use this link: [Installation media for Mac M1–M3](https://cdimage.debian.org/debian-cd/current/arm64/iso-cd/) and look for the `debian‑<version>‑arm64‑netinst.iso
` file in the bottom. In the place of the `<version>` there is the currect version/release number.
- **Verify the download:**  
  Check the ISO file using [hash.html](https://averkoc.github.io/lx/hash).

### Create a New Virtual Machine
- **Windows:** Use VirtualBox  
- **Mac:** Use UTM
- Settings: 2 GB memory, 20 GB disk, 2 CPUs
- Attach the downloaded ISO file to the VM’s CD drive.
- Start the VM.
- Follow the installation instructions video.  
  *Note: The video uses the Mac UTM app. For VirtualBox, see screen clips below for the correct initial settings.*

----

#### VirtualBox Settings (Windows Users)
<mark>Remember to check "Skip Unattended Installation!"</mark>  

<img src="images/0f924e5579a4.png" width="50%" />  
<br><br>
<img src="images/fefbd7206fdf.png" width="50%" />  
<br><br>
<img src="images/13da26fe4676.png" width="50%" />
<br><br>

# Post-Installation Configuration
This can be done later in our online session.  
*Note: If you have the wrong keyboard layout in the console, see this [instruction](https://averkoc.github.io/lx/server_keyboard).*

### The sudo Program
Avoid logging in as root to prevent accidental system changes. Instead, grant the 'student' user root privileges via sudo.

- Log in as root.
- Install sudo: `apt install sudo`
- Add 'student' to sudo: `usermod -a -G sudo student`
- Add 'student' to adm: `usermod -a -G adm student`
- Log out.

**You no longer need to log in as root to run system management commands.**

### UFW Firewall Frontend
Install UFW to manage the firewall (iptables):

- Log in as 'student'.
- Install UFW: `sudo apt install ufw`

Restrict OpenSSH access to the local network:
- `sudo ufw allow from 192.168.0.0/16 to any port 22 proto tcp`

To allow local users to connect to the future web server:
- `sudo ufw allow from 192.168.0.0/16 to any port 80 proto tcp`

### Web Server
To install the Apache2 web server (needed for the first workshop):

- `sudo apt install apache2`

### Logging System
Add rsyslog in addition to the existing journald logging system:

- `sudo apt install rsyslog`

### Intrusion Detection/Prevention Software (fail2ban)
This will be installed and configured later.

### Bash Configuration Files (.bashrc, .bash_aliases)
When you log in, Bash automatically executes commands from files in your home directory, such as .profile, .bashrc, and .bash_aliases. Customizing these files lets you personalize your shell environment.
