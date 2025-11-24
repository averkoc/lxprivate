# VirtualBox Networking Alternatives

## Overview
This is a teacher-led demonstration focusing on the various networking options available in VirtualBox. Guest tools and VM cloning are also briefly presented. Note that other virtualization software offer similar functionalities.

## Networking Alternatives in VirtualBox
The following networking alternatives in VirtualBox will be demonstrated:

- **NAT (Network Address Translation)**: The NAT adapter is the simplest way to access external networks from a VM. It allows the VM to access the internet and other external networks while preventing other computers and VMs accessing it. A VM with NAT adapter can access also VMs that has Host-only adapter.
- **Host-Only Networking**: The Host-Only adapter creates a network that is only accessible between the host and the VMs with a host-only adapter. This is useful for creating isolated test environments.
- **Bridged Networking**: The Bridged adapter connects the VM directly to the physical network, making it appear as a separate physical device on the network.

## Additional VirtualBox Functionalities
The following useful VirtualBox functionalities are also demonstrated:

- **Cloning a VM**: Creating an exact copy of a virtual machine, which is useful for testing or backup purposes.
- **Guest Additions**: Enable easy file transfer and copy/paste between the host and VM.

## Before the Demonstration
- Present the slide set `VM_NETWORKING_ALTERNATIVES.pptx` that explains the differences between networking alternatives. The best practice from a security viewpoint is to use alternatives that offer just enough connectivity – not more. Each of the alternatives is demonstrated later.
- For demonstration purposes, set up a server that shows the following information about the client: IP address, operating system, and browser brand.

## Steps to Create the Demonstration Server
1. Clone the Debian VM and set the network adapter to bridged mode. This makes the demonstration server appear as an independent physical computer on the local LAN.
2. Change the hostname to be different using the command `sudo hostnamectl set-hostname demodeb`.
3. Check that the server is accessible via its name. This succeeds because both Windows and Linux can support mDNS.
4. Start the Python program that shows the required client information.
5. Demonstrate the `myip` alias and `startdemo.sh` script.
6. Connect from Windows to `demodeb:5000` to see what information it shows about the client.

## Adapter-Type Demonstrations
- **NAT** (using AlpineDT with a NAT adapter as a demonstration client):
  - Can access servers in the local network and the internet.
  - Connect to a server in the local LAN: 1) connect to `demodep:80` 2) connect to `demodeb:5000`.
  - Connect to a server on the internet: 1) connect to `https://lxcentria.westeurope.cloudapp.azure.com/myip.html` (demonstrate guest tools copy/paste by pasting the URL from Windows).
  - Can access a server in the internal host-only network because Windows is a member of that network too. Observe the client’s IP address. Note: Start the demonstration application in the Debian VM too.
  - Cannot access other NAT VMs.
  - No other VM or host can access a VM with a NAT adapter. Try it to see.

- **Host-Only** (using Debian with a host-only adapter as a demonstration client/host):
  - Can access Windows and other VMs with host-only adapters (in the same IP network). Ping the Windows IP.
  - Windows can access the host-only VM, and the NAT VM can access it (source address is Windows’ IP address).
  - Other VMs in the host-only network can access each other.

- **Bridged**:
  - Acts like a physical computer in the local LAN.
  - Gets IP settings from the home router like the Windows PC.

> See [VirtualBox networking](https://docs.oracle.com/en/virtualization/virtualbox/7.0/user/networkingdetails.html) for a more detailed explanation about the different networking options. The table 6-1 in the document summarizes the connectivity differencies between different networking options.


## Course Solution
- **AlpineDT with NAT adapter**: Can access others but cannot be accessed by others.
- **Debian with host-only and NAT adapters**: Accessible from VMs with NAT and host-only adapters. Can access all others.


----

## Some screenclips - try to "guess" the configuration  

Local LAN's IP-network address is: 192.168.10.0/24  

![image](https://github.com/user-attachments/assets/c5572068-346f-4c39-aa11-d2c7f6f86c31)



![image](https://github.com/user-attachments/assets/50ed956f-95cb-45d1-87b7-499c0df91c6d)

