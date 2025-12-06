# VM Server Networking alternatives for Windows hosts

## NAT + host-only 
* Pros: Functionality doesn't depend whether students have wired or wireless adapter in their pc
* Cons: If VirtualBox host-only adapter gets failed - difficult to clear
  * Cons-resolve: Change host-only adapter to bridged

VM /etc/network/interfaces 
```bash
# part omitted
# The secondary network interface
allow-hotplug enp0s8
iface enp0s8 inet dhcp
````


## NAT + Bridged with static IP 
issue command `print route -4` in Windows cmd. Check the first row: Interface column contains your PC IP-address.  
VM /etc/network/interfaces 
```bash
# part omitted
# The secondary network interface
allow-hotplug enp0s8
iface enp0s8 inet static
   ipad
````



