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
### Using and updating the existin OVA-file  
* Update OVA-file: 1) import current OVA 2) upgrade according to [this](https://wiki.alpinelinux.org/wiki/Upgrading_Alpine_Linux_to_a_new_release_branch) 3) export to OVA
* The OVA contains gedit and .profile should contain setxkbmap fi  (because the XFCE's keyboard layout may not change layout even FI layout is added)
* Centria background is [here](../images/centria_alpine.png) for xfce desktop. Put to `/usr/share/backgrounds/xfce`. 
* Here are the [instructions](https://wiki.alpinelinux.org/wiki/VirtualBox_guest_additions), if someone wants to add guest additions.

### Installing from installation media 
Download the image targeted to [VMs ](https://www.alpinelinux.org/downloads/). Define VM and boot. Login as root and run setup-alpine after that run setup-desktop and select xfce-desktop.  
Shutdown, change boot-order and boot. Install setxkbmap, gedit and nano. Edit .profile by adding setxkbmap fi. Desktop bakcgrounds are in `/usr/share/backgrounds/xfce`.  

## Misc
The VM-icons in VirtualBox can be changed - they are embedded in the .vbox file (the machine row ... icon="base64 coded 128x128 or 256x256 png-file with lines" 
In my home directory is a Powershell script `.\makevmicon.ps1 cnt.png` that makes 128x128 and 256x256 png files from the input file and also base64 versions of them. The 128x128 base64 can be used as virtual machine icon in VirtuaBox UI.




