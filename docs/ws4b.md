---
title: ""
layout: default
---

## IDS/IPS Workshop Instructions - Supports the related video.


### 🛡️ Layered protection

This workshop helps you understand why **layered protection** is used to provide system security. Another commonly used term for this approach to security is **Defense in Depth**.

For example, a **firewall** can be configured to block all incoming Internet traffic except for specific, approved applications. However, even this allowed traffic can still include hacking attempts, such as password guessing by unauthorized users.

To detect and stop these unwanted activities, we need another layer of defense — an **Intrusion Detection and Prevention System (IDPS).**   

A third important layer involves **secure configuration of the actual services and the operating system**, ensuring they are properly hardened and kept up to date. For example, the system can be configured to **enforce strong password policies**, and **in the case of SSH, to disable password-based authentication and require key-based login instead**

The security measures used across these layers can be categorized as **prevention**, **detection/reaction**, and **vulnerability reduction**.  

_The actual workshop is described in the session recording. The following sections are provided for your reference._

---

### Layer 1: Network Perimeter (Boundary) Control  - The Firewall

| Component | Example Tools | Role | Security Focus |
| :--- | :--- | :--- | :--- |
| **Firewall** | `iptables`, `firewalld`, `ufw` | **Prevention.** Limits the attack surface by explicitly defining the permissible paths (ports). | **Access Vector Reduction** |
| **Action** | Allows only **SSH (22)** and **HTTP(S) (80/443)**. | This layer stops attacks targeting unauthorized services. |

* **Key Concept:** The firewall addresses the **"OS Open Ports"** attack vector by only exposing *required* ports.

---

### Layer 2: Intrusion Detection & Prevention - IDS/IPS

| Component | Example Tools | Role | Security Focus |
| :--- | :--- | :--- | :--- |
| **IDS/IPS/Blocker** | `Fail2ban`, `PortSentry`, Suricata | **Detection & Reaction.** Monitors *allowed* traffic for malicious **attack patterns** and dynamically blocks source IPs. | **Attack Mitigation** |
| **Action** | Observes anomalous behavior, such as a high rate of failed login attempts (**password guessing**), and blocks the attacker's IP. |

* **Key Concept:** This layer is critical because it monitors the traffic passing through the firewall and stops e.g. the actual **"SSH Password Guessing" attack**.

---

### Layer 3: Host/Service Hardening - e.g Authentication Policy

| Component | Example Policy | Role | Security Focus |
| :--- | :--- | :--- | :--- |
| **Authentication** | Strong Password Rules (e.g., minimum 16 characters, complexity, no dictionary words). | **Vulnerability Reduction.** Directly addresses the flaw that allows the attack to succeed. | **Vulnerability Remediation** |
| **Action** | Makes a successful brute-force or dictionary attack exponentially less likely, even if the attacker bypasses the IPS temporarily. |

* **Key Concept:** This layer addresses the underlying **vulnerability** introduced by **"SSH Password based authentication"** being configured with poor policy.

---

### Conclusion: Defense-in-Depth Illustrated

Your workshop successfully demonstrates that a single security control is not enough.

| Scenario | Weakness | Result |
| :--- | :--- | :--- |
| No **Firewall** | Full exposure of all services. | High risk of compromise. |
| No **IDS/IPS** | Attacker can endlessly attempt passwords. | Attack is slow, but persistent. |
| Poor **Passwords** | Single, lucky guess can succeed. | All other layers are bypassed. |

The combined effect of these three independent layers provides **resilience** and is a textbook example of modern security architecture. 💯

---- 

### 🛠️ Linux Hardening Command Summary

This cheat sheet covers the most essential commands for configuring the **UFW** (Uncomplicated Firewall) and **Fail2ban** (Intrusion Prevention) layers of protection.

---
<a id="ufw"></a>
#### 🛡️ UFW (Uncomplicated Firewall)

UFW controls network access to the server, implementing the **Network Perimeter** layer.

| Task | Command | Description |
| :--- | :--- | :--- |
| **Install UFW** | `sudo apt install ufw` | Installs the firewall on Debian/Ubuntu systems. |
| **Set Default Policy** | `sudo ufw default deny incoming` | **Crucial:** Denies all incoming traffic unless explicitly allowed. |
| **Allow SSH** | `sudo ufw allow ssh` OR `sudo ufw allow 22/tcp` | Allows necessary SSH access on port 22. |
| **Allow Web** | `sudo ufw allow http` / `sudo ufw allow https` | Allows web traffic on ports 80 and 443. |
| **Allow from Specific IP** | `sudo ufw allow from 192.168.1.100 to any port 22 proto tcp` | Allow SSH access only from a specific administration IP source address. |
| **Enable Firewall** | `sudo ufw enable` | **WARNING:** Do this *last* after allowing SSH! |
| **View Status** | `sudo ufw status verbose` | Shows active rules, default policies, and current status. |

---
<a id="fail2ban"></a>
#### 🚨 Fail2ban (Intrusion Prevention)

Fail2ban monitors logs for attack patterns (like password guessing) and dynamically blocks malicious IPs using the firewall (UFW), implementing the **Detection & Reaction** layer.

| Task | Command | Description |
| :--- | :--- | :--- |
| **Install Fail2ban** | `sudo apt install fail2ban` | Installs the Fail2ban package. |
| **Start/Enable** | `sudo systemctl enable --now fail2ban` | Starts the service immediately and ensures it starts on boot. |
| **View Global Status** | `sudo fail2ban-client status` | Lists all active "jails" (services being monitored, like `sshd`). |
| **View Banned IPs** | `sudo fail2ban-client status sshd` | Shows the current list of banned IPs for the SSH service. |
| **Manually Unban** | `sudo fail2ban-client unban <IP_ADDRESS>` | Immediately removes a specified IP address from the ban list. |
| **Tail Logs** | `sudo tail -f /var/log/fail2ban.log` | Monitors Fail2ban's activity and bans in real-time. |

**Configuration Reference:**

* The main configuration file is typically `/etc/fail2ban/jail.conf`, but you should use **`/etc/fail2ban/jail.local`** for any custom overrides (like changing the `bantime` or `maxretry`) to avoid issues during software updates.

--- 
#### Defence-in-Depth Example 
<img width="902" height="950" alt="image" src="https://github.com/user-attachments/assets/b39df6ca-dee4-445f-bada-b0690508f0de" />



