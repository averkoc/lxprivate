
## Practice configuration - practice.pkt

Download practice.pkt from ItsLearning

### CompanyA
- IP-settings for CompanyA network (IP-network address: 196.5.5.0/24)
  - wired computers should use static IP-settings
  - wireless computers should use DHCP and get their settings from DHCP-server starting from host address 196.5.5.100
  - remember to configure the router's interface to LAN (it will be the default gateway)
    
 
### CompanyC  
- IP-settings for CompanyC network (IP-network address: 200.10.10.0/24)
  - computers should have static IP-settings.
  - the web-server's host part address should be .254
 
### Home2
- static puplic address for the home2-routers outgoing interface should be 200.10.20.2
- the router's interface to home2-router should have ip address 200.10.20.1
- configure port-forwarding so that homeserver is accessible from Interet.
- the computers behind the home2-router use private ip-settings PC5 should use DHCP and homeserver should have static IP-settings

### Home1
- all computers use DHCP
- home1-router gets outgoing interface's IP-settings automatically from ISP-router

### Other 
- configure wireless security: each access-point should have unique ssid and wpa2 password
- use 200.50.50.254 as DNS-server setting (resolving server) even though DNS actually doesn't work in this configuration.

  

### Tests  
- **Use only ip-addresses when doing tests - names are not working**. You can use the ping icon to do pings in an easier way.  

- ping from PC1 to `www.compa.fi`
- ping from tablet1 to `www.compa.fi`
- ping from PC1 to `www.compb.fi`
- ping from PC1 to `www.compc.fi`
- try to connect with PC1 browser to homeserver
- connect with PC7 browser to `www.compb.fi`
**When pinging remote targets you may need to do ping a few times before it succeeds.**

  


 
  

  
 
    
  




![image](https://github.com/user-attachments/assets/e30dcad2-fd8f-470b-9463-6d73171aa92b)

