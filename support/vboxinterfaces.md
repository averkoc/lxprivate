
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

