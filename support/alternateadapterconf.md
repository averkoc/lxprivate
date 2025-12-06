# VM Server Networking alternatives for Windows hosts

## NAT + host-only 
* Pros: Functionality doesn't depend whether students have wired or wireless adapter in their pc
* Cons: If VirtualBox host-only adapter gets failed - difficult to clear
  * **Cons-resolve: Change host-only adapter to bridged** - no need to edit interfaces file.

VM /etc/network/interfaces 
```bash
# part omitted
# The secondary network interface
allow-hotplug enp0s8
iface enp0s8 inet dhcp
````
The change in  interfaces file come into effect on next boot. You can also issue command sudo `systemctl restart networking.service` to apply it immediately.


## NAT + Bridged with static IP 
issue command `print route -4` in Windows cmd. Check the first row: Interface column contains your PC IP-address.  
VM /etc/network/interfaces 
```bash
# part omitted
# The secondary network interface
allow-hotplug enp0s8
iface enp0s8 inet static
   address x.x.x.y # where the first x's are the same as in your PC's IP-address and the y e.g. 200
````
The change in  interfaces file come into effect on next boot. You can also issue command sudo `systemctl restart networking.service` to apply it immediately. 



