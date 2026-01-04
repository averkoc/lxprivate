--- 
layout: default
title: ""
--- 

## Debian 

### Networking  
prepare OVA-file with
* two NAT adapters (students will change after importing the latter to **Bridged**/(Hostonly is errorprone but last resort in some VPN,802.1X environments)
* /etc/network/interfaces -file contens:
  
```bash
auto lo
iface lo inet loopback

allow-hotplug enp0s3
iface enp0s3 inet dhcp

allow-hotplug enp0s8
iface enp0s8 inet dhcp

# The first adapter automatically gets better metrics e.g. when both have Internet access
````

### Packages
* sudo  
* rsyslog  
* (avahi-daemon)

## Alpine  
* Update OVA-file: 1) import current OVA 2) upgrade according to [this](https://wiki.alpinelinux.org/wiki/Upgrading_Alpine_Linux_to_a_new_release_branch) 3) export to OVA
* The OVA contains gedit and .profile should contain setxkbmap fi  (because the XFCE's keyboard layout may not change layout even FI layout is added)

## Misc
The VM-icons in VirtualBox can be changed - they are embedded in the .vbox file (the machine row ... icon="base64 coded 128x128 or 256x256 png-file with lines" 



