
# VirtualBox Networking Setup (For Students)

This configuration works on almost all laptops, even with unstable Wi-Fi.

## ✔ Step 1 — VirtualBox Network Settings

Your VM must have **two** network adapters enabled:

### Adapter 1: NAT
- Used for **Internet access**
- Default setting → do not change

### Adapter 2: Host-Only Adapter
- Used for **connecting between your laptop ↔ VM**
- Leave all settings at defaults

## ✔ Step 2 — Debian Network Configuration

Open this file inside the VM:  
`sudo nano /etc/network/interfaces`

Add this if it is not already present:

```ini
allow-hotplug enp0s8
iface enp0s8 inet dhcp
````
after that  
```bash
# reboot or issue the command below to apply the change  
sudo systemctl restart networking.service
```` 
## ✔ Step 3 — Test Your Connection in server  
```bash
ping -c1 192.168.56.1    # VM → host
ping -c1 8.8.8.8         # Internet connectivity
````


## ❗ If Something Breaks later (or in the beginning)

Sometimes VirtualBox “Host-Only” networking fails on laptops.  
Do not reinstall VirtualBox.  

Quick Fix (works in 99% of cases)

**Change Adapter 2 from Host-Only → Bridged Adapter.**

Do NOT change Adapter 1 (NAT).

Reboot the VM and try again.

## 

---

Put this into separet md-page and give link in faq to it  
# 🧩 **2. One-Page Troubleshooting Guide**

```markdown
# Quick Troubleshooting Guide

Use this only if things stop working.

---

## ❗ Problem: I cannot reach the VM from my host

Try this in order:

1. Reboot the VM  
2. Reboot VirtualBox  
3. If still broken → change Adapter 2:
   - Host-Only → **Bridged Adapter**

This fixes almost all problems.

---

## ❗ Problem: My VM has no Internet

Check:

1. Adapter 1 *must* be **NAT**
2. Test:

