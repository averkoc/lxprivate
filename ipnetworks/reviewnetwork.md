# Practical Skills Review with Cisco Packet Tracer

You can  use the following network to practice and deepen your understanding of IP Networks.  In practical exam you are given a network like this either partially or completely presented but without configuration. You will get personal IP-network settings that you will use to configure the network according to given requirements.
<br><br>
 

![image](https://github.com/user-attachments/assets/5fb927c0-c1be-4009-8e0e-f3d9e1803607)
    


## Overview description

Company A, Company B, and Company C received their IP network addresses when they subscribed to internet connection service from the ISP.  

The home or small office networks marked with yellow are using internally private IP-network addresses and share one public IP-address via NAT. The left hand customer has static public IP-address and the right hand customer a dynamic public IP-address.

The ISP offers a recursive DNS resolver that customers can configure in their computer's IP settings if they choose.  
The picture also shows the authoratative  name server for domains compa.fi and compb.fi.  


## Configuration - CompanyA
Company A's network is based on wired Ethernet (IEEE 802.3) and wireless WiFi (IEEE 802.11) LAN technologies. The Ethernet LAN consists of switch(es), cabling, and end devices that support the Ethernet standard. The wireless LAN includes Access Point that contain bridging functionality, making the WiFi and Ethernet LANs appear as a single logical network for connected devices.

We configure the Company A network to be an IP network by assigning IP settings to all end devices connected to the LAN. These IP settings consist of an IP address, subnet mask, default gateway IP address, and <abbr title="This should be a recursive resolving server">DNS server</abbr> IP address(es). The default gateway is the IP address of the ISP router's interface that connects to Company A's LAN. The default gateway handles routing IP packets into and out of Company A's IP network.  

We assign the IP-settings manually (static settings) to wired computers and dynammically to wireless computers.  

To support dynamic IP-settings we need to configure the DHCP-service, see the example below:  
![image](https://github.com/user-attachments/assets/31f4afd2-322f-4256-829d-c1f0b7580b61)



## Configuration - Home1 (default for most home subscribers)
This is a typical home user network. Operator's router provides DHCP-service that configures the home-router's ISP-connection dynamically. Users don't need to configure the home router.

The home router is an integrated box that contains switch, access point and NAT-router. With it's default settings it provides DHCP-service for the local LAN and provides IP-addresses from private 192.168.0.0/24 network. The one public IP-address (assigned to the homebox outgoing interface) is shared via NAT-function.

## Configuration - Home2  
Here the customer has ordered a static public IP-address from the ISP and the user must configure the router's outgoing interface according to the information got from the ISP.  


The internal network is just like in home1 configuration.   


**Home server access from Internet - Port forwarding**  
The home2 router is configured to forward TCP connection trials from Internet to computer with IP-address 192.168.0.254. This makes it possible to connect from Internet to the homeserver.  
![image](https://github.com/user-attachments/assets/b35dc9ee-4288-4ba2-b55f-fbab2bb16903)


