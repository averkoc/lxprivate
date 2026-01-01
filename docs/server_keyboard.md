---
title: ""
layout: default
---


### Here is an example if you want to change the server's console keyboard layout  


Note: When you SSH into your server, the keyboard layout is automatically set correctly. However, this instruction will guide you on how to change the keyboard layout used in the console connection. Console is a terminal that is directly connected to a server - the window you get when starting a VM. Normally you don't use it - instead you connect via ssh to the server.

To change the keyboard layout in the console, you can use the dpkg-reconfigure command.  

* Issue first the following command:
````bash
student@debian:~$ sudo dpkg-reconfigure keyboard-configuration
````  
* Select your correct alternatives in the menus:

<img src="https://user-images.githubusercontent.com/8930773/215145388-417a4ec7-30e8-4712-ae0d-3a6c878e76af.png" width="800">


<img src="https://user-images.githubusercontent.com/8930773/215145246-c3968e80-01ca-4c05-9efe-db5c6fda2cc5.png" width="800">

<img src="https://user-images.githubusercontent.com/8930773/215145680-2fa5ef80-c038-4d3c-b303-f4f72cea5a90.png" width="800">

<img src="https://user-images.githubusercontent.com/8930773/215146035-76d91e99-5164-4eb2-8f00-f8d6fea563b3.png" width="800">

<img src="https://user-images.githubusercontent.com/8930773/215146162-35e99b62-9e92-4287-92c9-057d96183509.png" width="800">

* If you want to apply before rebooting:
````bash
sudo setupcon
````
* reboot  
````bash
student@debian:~$ sudo reboot
````
