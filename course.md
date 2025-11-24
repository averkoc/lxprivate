<div class="WordSection1">

<span lang="EN-US">[1<span lang="EN-GB" style="font-size:11.0pt;
color:windowtext;font-weight:normal">      </span>Introduction](#_Toc77593356)</span>

<span lang="EN-US">[2<span lang="EN-GB" style="font-size:11.0pt;color:windowtext;font-weight:normal">      </span>IP Networks course - Big picture](#_Toc77593357)</span>

<span lang="EN-US">[3<span lang="EN-GB" style="font-size:11.0pt;color:windowtext;font-weight:normal">      </span>IP Protocol](#_Toc77593358)</span>

<span lang="EN-US">[4<span lang="EN-GB" style="font-size:11.0pt;color:windowtext;font-weight:normal">      </span>IP in Local Area Network](#_Toc77593359)</span>

<span lang="EN-US">[5<span lang="EN-GB" style="font-size:11.0pt;color:windowtext;font-weight:normal">      </span>Domain Name System (DNS)](#_Toc77593360)</span>

<span lang="EN-US">[6<span lang="EN-GB" style="font-size:11.0pt;color:windowtext;font-weight:normal">      </span>Transport Layer - TCP and UDP](#_Toc77593361)</span>

<span lang="EN-US">[7<span lang="EN-GB" style="font-size:11.0pt;color:windowtext;font-weight:normal">      </span>Transport Layer - Network Address Translation (NAT)](#_Toc77593362)</span>

<span lang="EN-US">[8<span lang="EN-GB" style="font-size:11.0pt;color:windowtext;font-weight:normal">      </span>Application layer](#_Toc77593363)</span>

<span lang="EN-US">[9<span lang="EN-GB" style="font-size:11.0pt;color:windowtext;font-weight:normal">      </span>Information Security](#_Toc77593364)</span>

<span lang="EN-US">[10<span lang="EN-GB" style="font-size:11.0pt;color:windowtext;font-weight:normal">        </span>IP Networks Course - Terms and Concepts](#_Toc77593365)</span>

<span lang="EN-US">  
</span>**<span lang="EN-US" style="font-size:16.0pt"> </span>**

# <span id="_Toc77593356"><span lang="EN-US">1<span style="font:7.0pt &quot;Times New Roman&quot;">     </span></span><span lang="EN-US">Introduction</span></span><span lang="EN-US">  
  
</span>

## <span lang="EN-US">1.1<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Why to take this course</span>

<span lang="EN-US"> </span>

<span lang="EN-US">Most of us use **IP-networks** every day in different ways without knowing much of their internal working. Some knowledge of IP networks is beneficial for everyone e.g. to be able to take necessary security measures, configure network related settings, solve problems and select proper communication services. For IT engineers who develop, build and operate systems it is crucial to have a basic understanding of **TCP/IP protocols and architecture**. Today and in the future communication is part of most systems and that happens via IP networks. The **Internet of things** even multiplies the number of nodes connected to IP networks.</span>

<span lang="EN-US"> </span>

## <span lang="EN-US">1.2<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">What you will learn </span>

<span lang="EN-US"> </span>

<span lang="EN-US">You learn IP-networks structure and functioning. You learn that the Internet consists of millions of interconnected IP-networks and computers in those networks. Some of them, servers, run service applications that are available to other computers (clients) that run client applications.</span>

<span lang="EN-US">Basically there are two main categories of IP networks: customer networks where the server and client computers reside and operator networks that route IP packets between customer networks. </span>

<span lang="EN-US"> </span>

## <span lang="EN-US">1.3<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">How you will study in this course</span>

<span lang="EN-US"> </span>

<span lang="EN-US">Engineering students typically like learning by doing. You will get an account at Cisco Networking Academy where you can download a simulator program. Throughout the course you will use the simulator to build and run networks and services. Compared to reading only text and looking at diagrams, the simulator combined to it makes your learning more efficient and much more inspiring experience. You can drag and drop different network elements to build your network configuration, set up services and see step by step how e.g. IP-packets flow through the network. </span>

<span lang="EN-US">  
Course feedback has shown that most students experience this course motivating and useful. You will learn most things by examples and exercises. </span>

<span lang="EN-US"> </span>

## <span lang="EN-US">1.4<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Course contents</span>

<span lang="EN-US"> </span>

<span lang="EN-US">Below is a partial list of main topics that you are going to study in order to achieve the learning goals</span>

<span lang="EN-US"> </span>

<span style="font-family:Symbol;color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-family:&quot;Verdana&quot;,sans-serif;color:black">The structure of IP Networks and Internet</span>

<span style="font-family:Symbol;color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-family:&quot;Verdana&quot;,sans-serif;color:black">IP Protocol</span>

<span style="font-family:Symbol;color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-family:&quot;Verdana&quot;,sans-serif;color:black">What requirements different applications set to networks</span>

<span style="font-family:Symbol;color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-family:&quot;Verdana&quot;,sans-serif;color:black">TCP/IP Architecture</span>

<span style="font-family:Symbol;color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-family:&quot;Verdana&quot;,sans-serif;color:black">The most important TCP/IP related protocols (IP, ICMP, UDP, TCP, ARP, DNS, DHCP)</span>

<span style="font-family:Symbol;color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-family:&quot;Verdana&quot;,sans-serif;color:black">Server applications and protocols (HTTP, FTP, SSH, SCP,)</span>

<span style="font-family:Symbol;color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-family:&quot;Verdana&quot;,sans-serif;color:black">Information Security</span>

<span lang="EN-US" style="color:black">We cover most terms and concepts listed </span><span lang="EN-US">[<span style="color:#31849B">here</span>](#_IP_Networks_Course)<span style="color:black">.</span></span>

<span lang="EN-US" style="font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif"> </span>

## <span lang="EN-US">1.5<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Learning goals</span>

<span lang="EN-US"> </span>

<span lang="EN-US">After completing this course successfully you have foundational competency</span>

<span style="font-family:Symbol;
color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">to configure network connectable devices and software in a proper way.</span>

<span style="font-family:Symbol;
color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">do reasoned decisions when selecting between different network related services and other options </span>

<span style="font-family:Symbol;
color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">understand network related threats and how to protect against them</span>

<span lang="EN-US" style="font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif"> </span>

## <span lang="EN-US">1.6<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Exams</span>

<span lang="EN-US"> </span>

<span lang="EN-US">The exam format may vary between different course realizations. Typically we have a theory exam and a practice exam. You will do the practice with the packet tracer simulation program. </span>

<span lang="EN-US"> </span>

<span style="font-family:Symbol;
color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">The theory exam tests your understanding about the IP network's structure and functioning. That knowledge is needed in IT-professional's work.  
(IP-settings, IP and Local Area Networks, Internet, Domain Name System, Information Security, etc)  
  
</span>

<span style="font-family:
Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">In the practice exam you build a network that fulfils the given requirements. The network typically consists of multiple IP-networks (company LANS with wired and wireless clients and servers. ISP network is preconfigured but may contain some minor configuration tasks. </span>

<span lang="EN-US">Note: From a learning point of view the exercises and examples are the most important thing in this course. By submitting them all on time with an accepted grade you will pass the course even in the case that you fail the final exam for some reason.  
  
</span>

## <span lang="EN-US">1.7<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Visit the sites below  
  
</span>

<span lang="EN-US">Series of [<span style="font-size:11.0pt;
font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">maps</span>](https://www.vox.com/a/internet-maps) that describes how the Internet has evolved from the  **ARPANET** *packet switched test network*.</span>

<span lang="EN-US"> </span>

<span lang="EN-US">Today non-profit [<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">Internet Society</span>](https://www.internetsociety.org/about-internet-society/) sets the organisational framework for the administration and development of the Internet. Look at their website and find answers to questions: who owns the Internet, how it is administered, where are the technical specifications.</span>

<span lang="EN-US"> </span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">  
Here is 3 minutes </span>[<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">video</span>](https://www.youtube.com/watch?v=Dxcc6ycZ73M)<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black"> where Internet pioneer Vint Cerf explains how the Internet works. Vint Cerf jointly with Bob Kahn developed TCP/IP -protocols.</span>

<span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif">  
</span>

<span lang="EN-US"> </span>

# <span id="_Toc77593357"><span lang="EN-US">2<span style="font:7.0pt &quot;Times New Roman&quot;">     </span></span><span lang="EN-US">IP Networks course - Big picture</span></span><span lang="EN-US">  
  
</span>

### <span lang="EN-US">2.1.1<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Description</span>

<span lang="EN-US"> </span>

<span lang="EN-US">The picture below has many aspects that we will learn during this course. It contains two local area networks (**LAN**s) that use **Ethernet Technology**, see the areas highlighted by green color. They are owned by fictitious companies CompanyA and CompanyB. Both companies are Elisa's (Finnish **ISP**-operator) customers. Elisa has granted them **IP-network addresses** that are globally unique and facilitate their communication on the Internet. The companies have also applied **domain names**. Their *registered* domain names are compa.fi and compb.fi. Other people on the Internet can refer to their services by names defined under their domain names e.g. like [<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:#1155CC">www.comb.fi</span>](http://www.comb.fi) to access CompanyB web server.</span>

<span lang="EN-US"> </span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black;border:none windowtext 1.0pt;padding:0cm">![](index_files/image001.jpg)</span>

<span lang="EN-US"> </span>

<span lang="EN-US">From the picture you see that the ISP's network consists of interconnected **routers** that **route** traffic between customer networks. ISP networks are connected to other ISP networks via so-called **Internet** **Exchange** **Points (IXP)** that make global communication possible. </span>

<span lang="EN-US"> </span>

<span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif">  
</span>

<span lang="EN-US"> </span>

## <span lang="EN-US">2.2<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Course exercises and learning goals.</span>

<span lang="EN-US"> </span>

<span lang="EN-US">Table </span><span lang="EN-US">1</span><span lang="EN-US"> Exercises and learning goals</span>

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><span class="underline"><span lang="EN-US">Exercise<span style="color:black"> with simulator</span></span></span></p></td>
<td><p><span class="underline"><span lang="EN-US" style="color:black">What you learn</span></span></p></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="color:black">Build a LAN with Packet Tracer (PT) network simulation program   </span></p></td>
<td><p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">How to use PT-simulation program</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">HW-elements of LAN: end devices, cabling, switches.       </span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Ethernet-LAN: addressing (MAC-addresses), frames.</span></p></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="color:black">Configure IP-settings<br />
(This is done in steps)</span></p></td>
<td><p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">IP-address structure: network-part, host-part</span></p>
<p><span lang="EN-US" style="font-family:&quot;Courier New&quot;">o<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US" style="color:black">Subnet mask</span></p>
<p><span lang="EN-US" style="font-family:&quot;Courier New&quot;">o<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US" style="color:black">Different types of IP-addresses</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Default Gateway and its role</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Domain Name Server</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Static vs. dynamic IP-settings        </span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">DHCP-server </span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Wireless LAN: clients, base station, security</span></p></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="color:black">Traceroute<br />
In this exercise you trace the route that IP-packets take from source computer to the destination computer</span></p></td>
<td><p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Understand how IP-packets are routed via ISP-networks.</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Some aspects of the IP-protocol and traceroute program</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Get a view about global Internet and the roles of different "players"</span></p></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="color:black">Set up web server</span></p></td>
<td><p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">The ideas related to WWW and HTML</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Web server and webpages</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Traffic between client and server</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">HTTP Request/response protocol to access html-documents.</span></p></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="color:black">Domain Name Server example<br />
(handled later in more detail)</span></p></td>
<td><p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">DNS -hierarchy</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">DNS-server tasks</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Define a name/IP-address pair for our web server into our DNS -server's database.</span></p></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="color:black">How to find MAC-address/IP-address correspondence in Local Area Network</span></p></td>
<td><p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Co-operation between IP and Ethernet</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Observe how IP-addresses are mapped to MAC-addresses via ARP (Address Resolution Protocol)</span></p></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="color:black">Taking a look to TCP/UDP traffic </span></p></td>
<td><p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">How different applications in a computer can communicate simultaneously using the same IP -address. Port numbers in TCP/UDP header makes this possible.</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">How TCP adapts to different client/server speeds.</span></p></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="color:black">Public address sharing with multiple computers – typical home user network</span></p></td>
<td><p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">How one IP-address can be shared with many computers. How network address transalation works (NA/PAT)</span></p>
<p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">How to access e.g. a home server that uses private IP-address via port forwarding.</span></p></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="color:black">Configure dynamic routing in Operator's network</span></p></td>
<td><p><span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US" style="color:black">Configure routers to use RIP-routing protocol to automatically update their routing tables</span></p></td>
</tr>
</tbody>
</table>

# <span id="_Toc77593358"><span lang="EN-US">3<span style="font:7.0pt &quot;Times New Roman&quot;">     </span></span><span lang="EN-US">IP Protocol</span></span>

<span lang="EN-US"> </span>

<span lang="EN-US">IP-packets are very much like envelopes with contents in the postal network. The envelope cover must contain a destination address that has a certain format. The sender address is optional. You must put a stamp on the envelope too.</span>

<span lang="EN-US"> </span>

<span lang="EN-US">The envelope content e.g., letter is free form and postal network people, and sorting machines do not take a look at it – that is not needed in the envelope routing from sender to destination.</span>

<span lang="EN-US"> </span>

<span lang="EN-US">An IP-packet has a header and a varying length of content that is called payload. The header must always have a destination's IP-address and sender's IP-address in certain points of the header. Because the IP-packet is handled by computers, routing devices are also computers, everything in the header must be accurately standardized. For the same reason there must be some additional information in the header compared to envelopes that are used in the postal network. No stamp like thing is needed because if there is a payment, it is subscription based like e.g., in your ISP-operator connection.</span>

<span lang="EN-US"> </span>

<span lang="EN-US">  
  
</span>

## <span lang="EN-US">3.1<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Routing</span>

<span lang="EN-US"> </span>

<span lang="EN-US">You saw in the traceroute exercise that data packets, called IP packets, "flow" from source computer to the destination computer through many intermediate nodes which are called routers. The intermediate routers are owned by network operator companies. The IP packets may travel through many individual network operators’ networks. Some of the operators have very large networks that may span many countries, even continents. Some operators are small, and their networks may cover only a limited area eq. one city. A special case is a situation where both the sender and receiver are in the same network e.g. in a company LAN. In that case there are no routers between the sender and receiver. </span>

<span lang="EN-US"> </span>

<span lang="EN-US"> </span>

<span lang="EN-US"> </span>

## <span lang="EN-US">3.2<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">IP -protocol specification</span>

<span lang="EN-US"> </span>

<span lang="EN-US">Take a teacher-led guided review to the [RFC-791](https://datatracker.ietf.org/doc/html/rfc791) document that specifies the IP-protocol. The document explains IP-protocol's two main tasks. The first is: to provide a mechanism to transmit independent blocks of data (IP-packets) from source to destination. Both source and destination are identified by fixed length addresses (IP-addresses). The document also describes how the IP-protocol *module* plays together with other communication software modules inside computers and routers. </span>

<span lang="EN-US">  
To fulfil its task the IP-layer on one computer must cooperate with its peer on another computer. The control information in the packet header makes this possible. Below you see the IP-header content.</span>

<span lang="EN-US"> </span>

<span style="font-size:11.0pt;
font-family:&quot;Arial&quot;,sans-serif;color:black;border:none windowtext 1.0pt;
padding:0cm">![](index_files/image002.jpg)</span>

<span id="_Ref76981883"><span lang="EN-US">Figure </span></span><span lang="EN-US">1</span><span lang="EN-US"> IP-packet header fields. We call the named bytes in certain positions fields. The fields have special meaning that is described in RFC-791</span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black"> </span>

<span lang="EN-US">The IP-packet is just a series of consecutive bytes where the first bytes constitute the [<span style="color:#548DD4">header</span>](https://datatracker.ietf.org/doc/html/rfc791#page-11)<span style="color:#548DD4"> </span>and after that comes the payload bytes that are user data or other protocols messages.  The way to express the header structure in documentation as four bytes per row like in </span><span lang="EN-US">Figure 1</span><span lang="EN-US"> is just a convention. </span>

<span lang="EN-US"> </span>

<span lang="EN-US">For us, the essential header fields are **version**, **time to live**, **protocol**, **source address** and **destination address** and of course the actual **payload data** that is not visible in the picture. Their need is easy to understand after some discussion. We discuss them on the lecture, or you can try to find those reasons yourself.</span>

<span lang="EN-US"> </span>

<span lang="EN-US">  
  
</span>

<span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif">  
</span>

<span lang="EN-US"> </span>

# <span id="_Toc77593359"><span lang="EN-US">4<span style="font:7.0pt &quot;Times New Roman&quot;">     </span></span><span lang="EN-US">IP in Local Area Network</span></span>

 

## <span lang="EN-US">4.1<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Background</span>

<span lang="EN-US"> </span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">Typically, computers reside in Local Area Networks (LAN) like Ethernet or Wi-Fi LANs. LAN standards specify concrete ways to transmit and receive data in local networks. IP Protocol itself is a message format specification and rules for its routing and logical handling - it does not specify the concrete way to transmit the message physically. </span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">In the TCP/IP -architecture figure below you can see that IP-provides network-layer service (routing) and LAN provides Data Link layer services (concrete data transfer between nodes in a LAN).</span>

<span lang="EN-US"> </span>

![](index_files/image003.gif)

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">Figure: TCP/IP Architecture (adapted).</span>

<span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif">  
</span>

**<span lang="EN-US" style="font-size:14.0pt"> </span>**

## <span lang="EN-US">4.2<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">How IP packets are transmitted and received in a LAN</span>

<span lang="EN-US"> </span>

<span lang="EN-US">The messages that computers send and receive in an Ethernet (802.3) Local Area Network are called Ethernet frames. This means that every IP-packet must be carried inside an Ethernet frame in a LAN.  In </span><span lang="EN-US">Figure 2</span><span lang="EN-US"> you see the Ethernet frame's structure. Ethernet addressing is based on six bytes long MAC-addresses. Each computer in an Ethernet LAN has a unique MAC-address that is set into the Ethernet adapter in the factory. Besides unique MAC-addresses Ethernet (802.3) standard defines a broadcast address with all bits one. When a computer sends a frame using broadcast destination address then all computers must read that frame. </span>

<span lang="EN-US"> </span>

<span lang="EN-US">![](index_files/image004.gif)</span>

<span lang="EN-US">Figure </span><span lang="EN-US">2</span><span lang="EN-US"> Ethernet frame</span>

<span lang="EN-US"> </span>

<span lang="EN-US">When Ethernet carries an IP-packet the packet resides in the payload and the two bytes long type field code has a value 0x0800. The receiving computer's Ethernet driver knows from this code that it should give the payload's contents to the IP-layer.</span>

<span lang="EN-US"> </span>

<span lang="EN-US">Figure 3</span><span lang="EN-US"> presents a small Ethernet LAN with visible MAC-addresses. The LAN is configured to be an IP-network 192.168.1.0/24. When users want to connect e.g. to a webserver they specify the destination by its IP-address. Users do not tell the destination's MAC-address. This means that the sending computer must somehow resolve the MAC-address of the destination computer whose IP-address the user has given. In </span><span lang="EN-US">Figure 3</span><span lang="EN-US"> a user has written a destination IP-address 192.168.1.254 into the browser destination address field. To send IP-packets to that address PC0 must first find out what is the MAC-address of the computer whose IP-address is 192.168.1.254. It must do this in order to put the correct destination MAC-address to the frames that will carry the IP-packets to the correct computer.</span>

<span lang="EN-US">![](index_files/image005.gif)</span>

<span id="_Ref77581126"><span lang="EN-US">Figure </span></span><span lang="EN-US">3</span><span lang="EN-US"> Small Ethernet LAN – MAC-address highlighted</span>

## <span lang="EN-US">4.3<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Address Resolution Protocol (ARP)</span>

<span lang="EN-US"> </span>

<span lang="EN-US">We will use the Packet tracer simulation function to see how PC0 finds the MAC-address of the computer whose IP-address is 192.168.1.254.</span>

<span lang="EN-US">The resolving functionality resides between IP-layer and Ethernet layer in the computers, and it has its own messages and rules that is called ARP-protocol. Basically it works in the following way:  
  
</span>

<span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US">First the ARP-"layer" get from the IP-layer a task to send an IP-packet to a certain destination <span style="color:red">IP</span></span>

<span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US">The ARP-layer must first resolve the MAC-address of the computer whose IP-address is the given <span style="color:red">IP</span>. To do that the ARP-"layer" asks Ethernet-layer to send a frame using broadcast address and a payload whose meaning is: If your IP-address is this <span style="color:red">IP</span>, tell me what your MAC-address is. </span>

<span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US">Every computer's Ethernet-layer reads the frame because the destination address is broadcast address. The type-field in the frame (set by sender) shows that the payload contains ARP-message. That is why each computer gives the frame's payload to the ARP-layer that will analyze the message.</span>

<span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US">The computer whose ARP-layer recognizes that the message contains this computer's IP-address, answers the question by asking its Ethernet-layer to send an answer message to the questioning computer. </span>

<span lang="EN-US" style="font-family:Symbol">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span lang="EN-US">The questioning computer's Ethernet layer receives the answer frame and due the type-field value (ARP-type) gives it to the ARP-layer that will now compete the original task by asking Ethernet layer to send the IP-packet using the MAC-address that was got in the ARP-answer. </span>

<span lang="EN-US"> </span>

<span lang="EN-US">ARP-layer saves the answer to limited time cache memory so that it does not need to repeat the process for subsequent IP-packets to the same destination.</span>

<span lang="EN-US">  
PT-simulation shows the above steps illustratively and helps you understand the address resolution process. Basically it is one question from the sending computer to all other computers in the LAN and one answer from the intended destination computer to the question sender, see </span><span lang="EN-US">Figure 4</span>

<span lang="EN-US"> </span>

<span lang="EN-US">![](index_files/image006.gif)</span>

<span id="_Ref77604445"><span lang="EN-US">Figure </span></span><span lang="EN-US">4</span><span lang="EN-US"> ARP-process - simplified presentation</span>

<span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif">  
</span>

<span lang="EN-US"> </span>

# <span id="_Toc77593360"><span lang="EN-US">5<span style="font:7.0pt &quot;Times New Roman&quot;">     </span></span><span lang="EN-US">Domain Name System (DNS)</span></span>

<span lang="EN-US"> </span>

## <span lang="EN-US">5.1<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Overview</span>

<span lang="EN-US"> </span>

<span lang="EN-US">Application can send an IP-packet only if it knows the destination's IP-address. For application users it is difficult to remember numbers and that's why the Domain Name System has been developed. It makes it possible to use symbolic names instead of IP-addresses. To make this possible, two things must exist: worldwide name administration and lookup service available to computers.</span>

<span lang="EN-US">  
**I**nternet **C**orporation for **N**ames and **N**umbers (ICANN) coordinates the hierarchical name system that is called Domain Name System. The highest name level visible to users is called **T**op **L**evel **D**omain (TLD). For example com, org, edu are top level domain names. The actual registering of names under top level domains is delegated to registrar-companies.</span>

<span lang="EN-US">  
The lookup service that supports Domain Name Queries for computers consists of hierarchical name server systems. Every organisation that has registered a domain name must provide the IP-address of a name server that knows IP-addresses for names defined under their registered domain and IP-addresses that the name presents. E.g. Centria who has registered name centria.fi must provide the IP-address of a server that knows IP-addresses of names defined under centria.fi - e.g. [<span style="font-size:
11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">www.centria.fi</span>](http://www.centria.fi), research.centria.fi.  The name server's own IP-addresses are registered to the upper level name server's database. To guarantee uninterrupted availability of name servers there must be at least two name servers for a domain. The highest-level name server is called root name server - you find its database contents [<span style="font-size:11.0pt;
font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">here</span>](https://www.iana.org/domains/root/db).</span>

<span lang="EN-US"> </span>

## <span lang="EN-US">5.2<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">How do nameservers play together – handled during lecture</span>

<span lang="EN-US"> </span>

<span lang="EN-US">In the picture below, the user tells the destination by symbolic name: www.compb.fi. During the lecture we first study the responsibilities of different level name servers after which you are capable of ordering the sequence of events in this example.</span>

<span lang="EN-US">  
  
</span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black;border:none windowtext 1.0pt;padding:0cm">![](index_files/image007.jpg)</span>

<span lang="EN-US">  
  
  
</span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black;border:none windowtext 1.0pt;padding:0cm">![](index_files/image008.jpg)</span>

<span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif">  
</span>

<span lang="EN-US"> </span>

# <span id="_Toc77593361"><span lang="EN-US">6<span style="font:7.0pt &quot;Times New Roman&quot;">     </span></span><span lang="EN-US">Transport Layer - TCP and UDP</span></span>

<span lang="EN-US"> </span>

## <span lang="EN-US">6.1<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Why is IP not enough for applications?</span>

<span lang="EN-US"> </span>

<span lang="EN-US">Let's assume that client and server applications would use IP directly to send and receive data. We would encounter two problems:  
  
  
</span>

<span style="font-family:Symbol;
color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">Many applications can simultaneously be active in a computer - how the IP Layer would know to which of them it should give the data inside the IP-packet that has arrived from local or remote IP-network.</span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black"> </span>

<span style="font-family:Symbol;
color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">IP has intentionally designed to be a best effort delivery service. It means it doesn't guarantee that the data arrives at the destination or that it is not corrupted. Even when the data arrives without errors to destination the correct order of packets is not guaranteed.</span>

<span lang="EN-US" style="font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif"> </span>

## <span lang="EN-US">6.2<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">How does the Transport layer complement IP?</span>

<span lang="EN-US"> </span>

<span lang="EN-US">Transport layer protocols TCP (Transport Control Protocol) and UDP (User Datagram Protocol) solves the first problem by port-numbers. Destination port number and source port number identifies the communication applications.</span>

<span lang="EN-US"> </span>

<span style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;
color:black;border:none windowtext 1.0pt;padding:0cm">![](index_files/image009.jpg)</span>

<span lang="EN-US" style="font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;
color:black">Figure: Examples of TCP-message (called TCP-segment) and UDP-message (called UDP-datagram). </span><span lang="EN-US" style="font-size:11.0pt;
font-family:&quot;Arial&quot;,sans-serif;color:black">  
  
  
</span>

<span lang="EN-US" style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">TCP also solves the second problem - reliability -  by error detection, sequence numbers,  automatic retransmission and acknowledgement mechanism. UDP instead is a lightweight transport protocol that solves only the application addressing problem.  It could be e.g. the choice for applications when communication between client and server is just one short request and one short response. </span>

<span lang="EN-US"> </span>

<span lang="EN-US" style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">TCP also has a flow control mechanism that helps to adapt to different communication channel speeds and variations in client and server data processing capabilities. </span>

<span lang="EN-US"> </span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black"> </span>

<span lang="EN-US"> </span>

## <span lang="EN-US">6.3<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">TCP Session</span>

<span lang="EN-US"> </span>

<span lang="EN-US">To make its features possible TCP uses sessions. Session concept means that the communication can be in different states. E.g. to establish communication the client needs to ask the server to accept session creation with some parameter values. Server can accept it and suggest its own session related parameters. If a client accepts them then the session is established. Flag-field bits SYN and ACK are related to session setup.</span>

<span lang="EN-US"> </span>

<span lang="EN-US">The session concept makes it possible for parties to be aware of the amount and order of bytes received and transferred during the session - this information is visible in TCP header's sequence number and acknowledgement number fields. The acknowledgement of received data happens by telling in the acknowledgement number field what byte number the receiver is expecting next. If the sender doesn't get acknowledgement within a certain time it resends data. </span>

<span lang="EN-US"> </span>

<span lang="EN-US">TCP implements flow control by window mechanism. Both parties tell in the TCP header what is the maximum number of bytes  (window) the other party can send without getting an acknowledgement. </span>

<span lang="EN-US"> </span>

## <span lang="EN-US">6.4<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Packet Tracer Simulation</span>

<span lang="EN-US"> </span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">We use PT simulation in the following scenarios:</span>

<span style="font-family:Symbol;
color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">User connects with the browser to a www-server. In this scenario we see that the browser and www-server use the TCP-transport layer in their communication. We also see what port numbers they use.</span>

<span style="font-family:Symbol;
color:black">·<span style="font:7.0pt &quot;Times New Roman&quot;">        </span></span><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">User pings the target computer using its domain name. In this scenario we see that DNS-queries and answers are sent using UDP-transport layer protocol</span>

<span lang="EN-US" style="font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif"> </span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">Server applications use so-called well-known port numbers that make it possible for client application developers to use those port numbers as default destination port numbers so that application users don't need to tell the server application port number in the user interface.</span>

<span lang="EN-US"> </span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">In the first scenario it is also possible to see TCP-session setup between client and server if you look at the FLAGS-field. That is however difficult because the individual FLAGS-field bits are not named in the simulator trace. The figure below helps you understand the role that SYN-bit and ACK-bit plays in a session setup.  
  
<span style="border:none windowtext 1.0pt;padding:0cm">![](index_files/image010.jpg)</span>   
Firewalls use this information to protect home network in the following way: if an IP-packet coming from Internet carries TCP and the TCP has SYN-bit set (without ACK-bit) it rejects this packet because it means that someone is trying to setup a session with a device in your home network. This kind of protection is typically the default configured behaviour for home firewalls.</span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black"> </span>

*<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">Advanced: In the first PT-scenario you can see also the initial window-sizes that client and server suggest for the session. The ACKs in session setup means also that the ACK-sender accepts the other party's suggested windows-size for the session. In our PT simulation Client TCP suggested 65535 bytes window-size and Server TCP suggested 16384 bytes window-size. What does this mean in practice?</span>*

<span lang="EN-US">  
  
  
  
  
</span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">  
  
  
  
</span>

<span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif">  
</span>

<span style="font-family:&quot;Times New Roman&quot;,serif"> </span>

# <span id="_Toc77593362"><span lang="EN-US">7<span style="font:7.0pt &quot;Times New Roman&quot;">     </span></span><span lang="EN-US">Network Address Translation (NAT)</span></span>

<span lang="EN-US"> </span>

<span lang="EN-US"> </span>

## <span lang="EN-US">7.1<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">What is NAT and why it is used</span>

<span lang="EN-US"> </span>

<span lang="EN-US">The picture below represents a home or small office network. IPV4 address space is limited and ISP customers often get only one public IP address. In the picture it is 150.10.48.17. </span>

<span lang="EN-US"> </span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black;border:none windowtext 1.0pt;padding:0cm">![](index_files/image011.jpg)</span>

<span lang="EN-US">The computers in the home network (192.168.1.0/24) have private addresses that can't be used for Internet connections. Network address translation and sharing mechanism in the home router makes it possible to "loan" the valid public address to computers in the home lan for outside connections. This means that e.q. When a user in PC 192.168.1.2 surfs to www-server 195.10.20.35 the home router (with NAT-function) replaces its source IP address 192.168.1.2 to home router ISP-interface address 150.10.48.17. The responses coming from the server have a destination IP-address 150.10.48.17. The home router (with NAT-function) will replace it with 192.168.1.2 using the information it stored when it sent IP-packets to the server. The stored information that makes the reverse address replacement possible contains IP-addresses and port-numbers.  
  
  
</span>

<span lang="EN-US">We will use the packet tracer to build a NAT-example that helps you to understand what NAT is and how it works.</span>

<span lang="EN-US">  
  
</span>

<span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif">  
</span>

<span lang="EN-US"> </span>

# <span id="_Toc77593363"><span lang="EN-US">8<span style="font:7.0pt &quot;Times New Roman&quot;">     </span></span><span lang="EN-US">Application layer</span></span>

<span lang="EN-US"> </span>

<span lang="EN-US">Application layer standards give application developers a common base to develop compatible applications for certain types of needs. Different companies can develop client and server parts and due to the standards, the applications play together without problems. Web browsers and web-server applications are good examples of this. The common base is the http application protocol.</span>

<span lang="EN-US"> </span>

<span lang="EN-US">The picture below helps you to understand the application layer role in the TCP/IP -architecture. The rounded rectangles represent different client and server applications that make use of the standardised application layer message types and handling rules - presented in colored rectangles in the picture. E.g. Web browser and web server exchange messages that are defined in http application layer standard - the yellow rectangle in the picture. </span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black;border:none windowtext 1.0pt;padding:0cm">![](index_files/image012.jpg)</span><span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">  
**Figure:** Client and server applications exchange messages that are defined in the respective application layer standards</span>

<span lang="EN-US"> </span>

<span lang="EN-US">As examples you will study HTTP and MQTT application layers in more detail in exercises. The original goal of the HTTP application layer protocol was to make it possible for client applications to retrieve HTML-documents from a server. MQTT is a lightweight IoT-protocol that defines how clients can publish and subscribe e.g. sensor values. Clients do publishing and subscription via MQTT-broker - this architecture detaches the clients from each other.</span>

<span lang="EN-US">  
  
  
  
  
  
</span>

<span lang="EN-US" style="font-size:10.0pt;font-family:&quot;Verdana&quot;,sans-serif">  
</span>

<span lang="EN-US"> </span>

# <span id="_Toc77593364"><span lang="EN-US">9<span style="font:7.0pt &quot;Times New Roman&quot;">     </span></span><span lang="EN-US">Information Security</span></span>

<span lang="EN-US"> </span>

<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;
color:black">Read first this document (</span>[<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">link</span>](https://www.us-cert.gov/sites/default/files/publications/infosecuritybasics.pdf)<span style="font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">) about information security basics and answer the questions below.</span>

### <span lang="EN-US">9.1.1<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span>**<span lang="EN-US" style="font-family:&quot;Arial&quot;,sans-serif;
color:#434343">Questions</span>**

<span lang="EN-US">  
  
</span>

<span lang="EN-US">1.<span style="font:7.0pt &quot;Times New Roman&quot;">    </span></span><span lang="EN-US">Explain with examples the following concepts: Confidentiality, Integrity and Availability. </span>

<span lang="EN-US">  
  
  
</span>

<span lang="EN-US">2.<span style="font:7.0pt &quot;Times New Roman&quot;">    </span></span><span lang="EN-US">Why are authentication and authorization often needed to guarantee information confidentiality?</span>

<span lang="EN-US">  
  
  
</span>

<span lang="EN-US">3.<span style="font:7.0pt &quot;Times New Roman&quot;">    </span></span><span lang="EN-US">Does IP protocol guarantee data confidentiality? Argument your answer.</span>

<span lang="EN-US">  
  
</span>

<span lang="EN-US">4.<span style="font:7.0pt &quot;Times New Roman&quot;">    </span></span><span lang="EN-US">Does IP protocol guarantee data integrity? Argument your answer.</span>

<span lang="EN-US">  
  
</span>

<span lang="EN-US">5.<span style="font:7.0pt &quot;Times New Roman&quot;">    </span></span><span lang="EN-US">To which of the three essential security concepts TCP checksum, acknowledgements and automatic retransmission are most closely related.</span>

<span lang="EN-US">  
  
</span>

<span lang="EN-US">6.<span style="font:7.0pt &quot;Times New Roman&quot;">    </span></span><span lang="EN-US">Why is it important to take care of your computer security even though you think that you have nothing confidential or important data in your computer?  
  
</span>

<span lang="EN-US">7.<span style="font:7.0pt &quot;Times New Roman&quot;">    </span></span><span lang="EN-US"> A) What are the two most common information security related programs that you need in your home computer to be protected against security risks (the programs may be packaged as a one application)?  
  
B) Which one of these two requires more knowledge from the user? Argument your answer.</span>

<span lang="EN-US">  
  
  
</span>

## <span lang="EN-US">9.2<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">Some technical means to increase security </span>

<span lang="EN-US"> </span>

<span lang="EN-US">We will do a PT -demonstration that introduces virtual LAN -technology (VLAN). VLANs make it possible to isolate different user groups' traffic in a one physical LAN. In the same demo we take a look at firewall rules that can be configured to routers/switches to restrict traffic. </span>

<span lang="EN-US"> </span>

<span lang="EN-US">Another demo shows typical firewall and intrusion prevention measures in Linux servers. The firewall rules allow traffic only to webserver and SSH-server (daemon). The SSH-server facilitates secure key-based login and encrypted traffic. This makes it possible to manage the server remotely in a secure way.</span>

<span lang="EN-US">The intrusion prevention software recognizes repeated illegal login attempts and blocks the originating IP for a certain time.</span>

<span lang="EN-US">  
  
</span>

# <span id="_Toc77593365"></span><span id="_IP_Networks_Course"></span><span lang="EN-US">10<span style="font:7.0pt &quot;Times New Roman&quot;">   </span></span><span lang="EN-US">IP Networks Course - Terms and Concepts</span>

<span lang="EN-US"> </span>

<span lang="EN-US"> </span>

<span lang="EN-US"> </span>

<span lang="EN-US">Table </span><span lang="EN-US">2</span><span lang="EN-US"> Terms and Concepts</span>

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong><span class="underline"><span lang="EN-US" style="font-size:12.0pt">Term</span></span></strong></p></td>
<td><p><strong><span class="underline"><span lang="EN-US" style="font-size:12.0pt;color:black">Description</span></span></strong></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Computer Network </span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A computer network makes it possible for a set of computers to exchange messages with each other via hardware and software that adhere to common standards.</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">IP Network</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A network where computers use IP-protocol to communicate with each other.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Internet</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">“...  system of interconnected computer networks that use the TCP/IP protocol suite  to link devices worldwide” ~[wikipedia]</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black"><br />
Link:</span><span lang="EN-US" style="color:black"><a href="https://www.internetsociety.org/internet/"><span style="font-size:11.0pt">Who takes care of It?</span></a></span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Host</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A computer that is connected to an IP-Network. Must have an IP-address and support IP-protocol. <br />
Discussion: server and client applications.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">IP Address</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A four byte address that has a network and host part.<br />
<br />
The four bytes are typically presented in so called dotted decimal notation (DDN).<br />
<br />
Example: 195.100.110.4</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black"><br />
Later: general address related concepts - unicast, multicast, broadcast, anycast.</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">IP Address network part</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Identifies the IP-network.<br />
Public IP-network addresses are globally unique for each IP-network and they are registered.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black"><br />
Some network address ranges are reserved for private network addresses. Whoever can use these network addresses freely inside their own networks. They can’t be used in outside communication.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt"> </span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">Example: 192.168.0.0 - 192.168.255.255 is a private range and addresses in this range are free to use inside isolated networks. Typically many home network has address that belong to this range.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">IP Address host part</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Identifies a host inside a given IP-network.</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Subnet Mask</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Defines the boundary between network and host parts.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt"> </span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">Example<br />
If we have e.g. the following IP settings:<br />
IP Address: 195.140.230.6<br />
Subnet Mask: 255.255.255.0<br />
<br />
<br />
</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">We know that IP-network part is 195.140.230 and the host part is 6.  The IP-network address is 195.140.230.0</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Static IP address</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">IP address that is assigned to host permanently by operator or organizations administrator.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black"><br />
Example usage: hosts that execute server applications should have static IP-address.</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Dynamic IP address</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">IP address that is dynamically assigned to the computer and may change from time to time.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt"> </span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">Example usage: operators prefer to grant dynamic addresses to home users because in this way they don’t need to reserve a unique address for each subscriber.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Static IP Settings</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">IP Settings are configured to host by administrator.<br />
<br />
Operating systems like Windows and Linux offer to the user the option to select either static or dynamic IP settings mechanism. </span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Dynamic IP Settings</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Host acquires IP settings automatically using DHCP-protocol.<br />
<br />
This is the default IP Settings mechanism in most host operating systems.<br />
<br />
Note: Dynamic IP settings require the presence of DHCP-service (DHCP-server) in the network. DHCP-server sends IP-settings to the client host after the client has first asked for them.<br />
<br />
<br />
</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Router</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Routes traffic between IP-networks.</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Default Gateway</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A router connected directly to an IP network. Hosts in IP networks send outgoing IP packets to the default gateway and receive packets sent from other networks via default gateway.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">LAN</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">Local Area Network</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A network that covers a limited area e.g. a single room, building or campus.<br />
<br />
<br />
</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">802.3 Wired Ethernet and 802.11 Wireless (WiFi) are the most common LAN technologies.</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">VLAN<br />
Virtual LAN</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">An extension to 802.3 Ethernet standard that makes it possible to have logically separated LANs in one physical Ethernet LAN. </span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">WAN</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">Wide Area Network</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A network that extends over large geographical area. Telecom operators typically offers customers connections to WAN by subscription basis. Some companies may invest to their own WAN’s.<br />
<br />
Underlying technologies: Frame Relay, 4G broadband, optical (OTN), </span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Wired Network</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Network elements are connected by metallic or optical media.<br />
Example: 802.3 “Ethernet” Local Area Networks.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Wireless Network</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Network elements communicate via RF.<br />
Example: 802.11 Wireless LANs (WLAN) (WiFi)</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">TCP/IP Architecture</span></p></td>
<td><p><span lang="EN-US" style="color:black"><a href="https://www.digitalocean.com/community/tutorials/an-introduction-to-networking-terminology-interfaces-and-protocols"><span style="font-size:11.0pt">Introductory Article</span></a></span><span lang="EN-US" style="font-size:11.0pt;color:black"> (Digitalocean)</span></p>
<p><span lang="EN-US" style="color:black"><a href="https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.zos.v2r3.hala001/itctcpipcon.htm"><span style="font-size:11.0pt">TCP/IP Protocol Stack Overview</span></a></span><span lang="EN-US" style="font-size:11.0pt;color:black"> (IBM)</span></p>
<p><span lang="EN-US" style="color:black"><a href="https://tools.ietf.org/html/rfc1122"><span style="font-size:11.0pt">RFC 1122</span></a></span><span lang="EN-US" style="font-size:11.0pt;color:black"> (IETF) (Official source)</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Protocol</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Set of rules and definitions that state how communication between parties should happen.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt"> </span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">E.g defines the message structures that can be sent between parties. Typically the message includes header part and “payload” part. The header part contains different fields that parties use to perform the required behavior.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">IP</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">Internet Protocol</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Network layer protocol that is used in IP-networks.<br />
Discussion: IPv4 and IPv6</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">TCP<br />
Transport Control Protocol</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Session based reliable transport-layer protocol that is used by most applications. Destination and source applications are addressed by port numbers</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">UDP</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">User Datagram Protocol</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Sessionless lightweight transport-layer protocol. Suitable e.g. for use cases that consists of one request message and one response message.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black"><br />
Destination and source applications are addressed by port numbers<br />
<br />
<br />
</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">Example usage: DNS-query and response.</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">ARP<br />
Address Resolution Protocol</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A protocol that is used to find matching<br />
a) destination computer’s MAC-address when the sending host knows destination’s IP-address but does not know its MAC-address.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">b) if the destination IP is not in the same IP-network than the client host. Then the client uses ARP to find default gateway’s MAC-address.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">DHCP<br />
Dynamic Host Control Protocol</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A protocol that is used between DHCP-client and DHCP-server. When a computer is configured to use “Dynamic IP settings” it uses this protocol to send requests to DHCP-servers to get IP-settings from one of them.</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">DNS<br />
Domain Name System</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Domain Name System makes it possible for users to refer to other hosts with names instead of IP-addresses. The system consists of a) administrative part with name registration and administration responsibilities that guarantees that names are globally unique.  b) technical implementation of a global name server hierarchy where each name server contains the name/IP pairs related to names registered directly under the domain owners name.<br />
<br />
DNS related terms: root name server, top level domain names (TLD). </span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black"><br />
Example name:  web.centria.fi <br />
centria domain is registered under fi top level domain. Fi-name server contains the address of the name server that centria has given during the centria.fi name registration. That name server called authoritative name server must know the name web.centria.fi because it is under centria.fi -domain.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">The corresponding IP-address is: 192.130.183.146</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Root name server</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">The database of this server contains TLD name servers addresses. See its contents here: </span><span lang="EN-US" style="color:black"><a href="https://www.iana.org/domains/root/db"><span style="font-size:11.0pt">https://www.iana.org/domains/root/db</span></a></span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Recursive resolver</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A name server used by end users devices. Its IP-address is defined in IP-settings. It relieves the task of querying multiple different level name servers from the user's computer.<br />
<br />
We have an exercise that describes DNS-system's functioning in an understandable way. </span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Application Protocol(s)</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Application protocol defines the rules and message types so that client and server applications can communicate with each other in a standard way. This makes it possible that applications written by different vendors can interoperate with each other. </span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">Many application protocols exist for various needs. Some examples are http, ssh, sftp</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td></td>
<td></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">HTTP<br />
Hypertext Transfer Protocol</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">An application protocol that makes it possible for client applications to get (hypertext) documents from server application. </span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">SSH<br />
Secure Shell</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">This application protocol makes it possible to write secure remote terminal client/server applications. E.g. Unix/Linux administrators typically use SSH-client to administer remote server.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">SFTP<br />
Secure File Transfer Protocol</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Applications based on SFTP-application protocol facilitates secure file transfer between server and client applications.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt"> </span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">Example usage: a user can update her/his files in web-server using SFTP-client application. </span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">TELNET</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Remote terminal application protocol that was originally developed without security features need today. SSH has mostly replaced telnet in remote terminal applications.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">FTP<br />
File Transfer Protocol</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Comments like in Telnet. SFTP has mostly replaced FTP in file transfer applications.</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">IoT<br />
Internet of Things</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">"</span><span lang="EN-US" style="color:black"><a href="https://ietf.org/topics/iot/"><span style="font-size:11.0pt">The Internet of Things</span></a></span><span lang="EN-US" style="font-size:11.0pt;color:black"> is the network of physical objects or "things" embedded with electronics, software, sensors, and connectivity to enable objects to exchange data with the manufacturer, operator and/or other connected devices."</span></p></td>
<td></td>
</tr>
<tr class="even">
<td></td>
<td></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Information Security</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Read </span><span lang="EN-US" style="color:black"><a href="https://www.us-cert.gov/security-publications/introduction-information-security"><span style="font-size:11.0pt">Introduction to information security</span></a></span><span lang="EN-US" style="font-size:11.0pt;color:black"><br />
site: www.us-cert.gov</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">“CIA Principle”</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Easy way to remember the basics security concept terms: Confidentiality, Integrity and Availability.</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Confidentiality</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Only persons (actors) who are authorized so should be able to access or modify the data.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt"> </span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">Loss of confidentiality example: non-encrypted passwords are visible during transmission to operator personnel and local network admins.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Integrity</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A guarantee that data is not modified in an unexpected way during storing, transmission or operations.<br />
<br />
Loss of integrity example: Some bits in the received IP-packet have changed during transmission.</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Availability</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">The data is available for use in an orderly way.<br />
<br />
Loss of availability example: a server is inaccessible due to denial-of-service attack.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Authentication</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A way to verify the identity (authenticity) of the party or parties of communications. </span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Authorization</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Ensuring that the user has the right to do the intended action.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black"><br />
Example: a user is allowed to modify data only if he is granted access to do so. Authorization requires that the user is first authenticated which facilitates the checking of his/her rights for different operations on data.</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Vulnerability</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A weakness in the system that can be used in security breach by attacker<br />
<br />
</span><span lang="EN-US" style="color:black"><a href="https://cwe.mitre.org/about/faq.html#A.2"><span style="font-size:11.0pt">FAQ related to vulnerability database</span></a></span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Threat</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">“Possible danger that might exploit a vulnerability to breach security and therefore cause possible harm.” [wikipedia]</span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Firewall</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">A device (or integrated software) that protects the trusted network or device (e.g. organizations local network or personal computer) from possible security violation attempts that originate from untrusted networks (outside networks).</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black">The firewall operation is based on rules that can be configured by administrators. </span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black"><br />
Testing: e.g. port scanning</span></p></td>
<td></td>
</tr>
<tr class="odd">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Encryption</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">“... encryption is the process of encoding a message or information in such a way that only authorized parties can access it and those who are not authorized cannot.” [wikipedia]</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black"><br />
Demo: </span><span lang="EN-US" style="color:black"><a href="http://des.online-domain-tools.com/"><span style="font-size:11.0pt">encrypt/decrypt</span></a></span></p></td>
<td></td>
</tr>
<tr class="even">
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">VPN</span></p></td>
<td><p><span lang="EN-US" style="font-size:11.0pt;color:black">Virtual Private Network (VPN) is an encrypted and authenticated connection from a device/network through public Internet to another network. There are different types of VPNs.</span></p>
<p><span lang="EN-US" style="font-size:11.0pt;color:black"><br />
See: </span><span lang="EN-US" style="color:black"><a href="https://www.top10vpn.com/what-is-a-vpn/vpn-types/"><span style="font-size:11.0pt">VPN types</span></a></span></p></td>
<td></td>
</tr>
</tbody>
</table>

<span lang="EN-US"> </span>

</div>
