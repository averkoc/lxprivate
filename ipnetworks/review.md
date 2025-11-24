## Review session related material  

[Review network](reviewnetwork.md)   
[Terms](https://lxcentria.westeurope.cloudapp.azure.com/courses/ipnetworks/#_Toc77593365)  <br><br>
## Network Technologies underlying IP Networks
- Local Area Networks
  - Ethernet 802.3 (Wired)
  - WiFi (802.11) Wireless
- Operator (ISP) Networks based on different technologies


## IP Settings
- **Manual settings**
  - IP address  
    - note: addresses with host-bits all zeros or all ones have special meanings and can't be assigned to devices.
  - Subnet mask
  - Default Gateway
  - DNS Server (recursive DNS server)

- **Dynamic settings**
  - IP settings got from DHCP-server
  - _DHCP-server configuration example_

## Domain Name System
- Administrative aspects
- Technical Infrastructure

## Network Address Translation (NAT)
- public IP address sharing for computers in private IP-network

## Transport Layer
- TCP
  - application processes identification by port numbers
  - automatic error recovery: checksums, sequence numbers, acknowledgements
  - flow control: window sizes, acknowledgements
  - session concept: both parties need to accept the session initiation before data transfer can start
- UDP
  - application processes identification by port numbers
  - no session concept
 
## Application layer
- In simplified terms, application protocols define the command and answer messages structures that client and server application developers use to implement applications functionalities
- Examples: http, ftp, ssh, mqtt

## Information Security  
- Basic concepts
  - **Confidentiality**: Ensuring that information is accessible only to authorized individuals, entities, or processes. Think of it as preventing unauthorized disclosure.
  - **Integrity**: Maintaining the accuracy and completeness of information and ensuring that it hasn't been altered or tampered with in an unauthorized manner. This includes protecting against both intentional and accidental modifications.
  - **Availability**: Ensuring that authorized users have reliable and timely access to information and related assets when they need them. This involves maintaining operational systems and networks, and having recovery plans in place.
 
-----

## Other topics
- Internet of Things - IoT: demonstrated in the context of application layers (temperature monitoring system based on mqtt-application protocol)
- Virtual Lans (VLANs) - A PT-demo that showed how the same physical LAN could be separated to isolated logical LANs using VLAN-technology
- Address Resolution protocol - Computers in a LAN send IP-packets to other computers in the LAN via Ethernet/WiFi frames. To find the destination MAC address computers use ARP-protocol. If the destination's IP is not in the same IP-network then computer sends the IP packet via Ethernet/WiFi frame to default gateway.
<br><br>
[Review network](reviewnetwork.md)   
[Terms](https://lxcentria.westeurope.cloudapp.azure.com/courses/ipnetworks/#_Toc77593365)  

