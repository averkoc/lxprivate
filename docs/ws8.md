---
title: ""
layout: default
---


## Embedded Linux example - see the related video  

In this workshop, I demonstrate how an embedded Linux computer can receive and send commands using the MQTT publish/subscribe architecture, which is commonly used in IoT systems.  

In the example, my Raspberry Pi with a connected temperature/pressure sensor acts as an MQTT client. It publishes sensor values at regular intervals to an MQTT broker. Other MQTT clients can subscribe to these messages. I use this <a href="https://docs.google.com/presentation/d/e/2PACX-1vQ0Dqzg2L4c-A9gKwSudqxY3XnwaODmyS0ifRemEosUg2tDlqLmk4rF3tCVWUhs9Dlh84nHjvbjUKVu/pub?start=false&loop=false&delayms=60000" target="_blank">slideset</a> to explain the MQTT architecture and the demo configuration.  

You will use Python to build a simulated weather station on your Debian system. This program will use the MQTT library to act as an MQTT client, sending simulated temperature and pressure values to a real MQTT broker. You and others can then view these values in a web browser.  

To report the workshop, submit a screenshot showing:
- your Debian terminal window with the sensor values printed by the Python program (stdout), and  
- your browser window displaying the same values retrieved from the MQTT broker.  


## Prerequisites for python development 

You will modify the ready-made python "wheather-station" `demo.py`  and to do that you must have python development environment in your Debian. You need to install the following Debian packages: `python3`, `python3-pip` and `python3-venv`. You can copy the script below and save it e.g. by name doinstalls.sh and give execute permission to it for your user account. Then you can run it by issuing ./doinstalls.sh



```bash
#!/bin/bash
# Minimal Debian Python development setup script

echo "🔄 Updating package index..."
sudo apt update

echo "📦 Installing Python essentials..."
sudo apt install -y \
    python3 \
    python3-pip \
    python3-venv

echo
echo "✅ Basic setup complete!"
echo "You can now create virtual environments and install Python packages."
echo
echo "Example workflow:"
echo "   python3 -m venv myenv"
echo "   source myenv/bin/activate"
echo "   pip install <package_name>"

# -----------------------------------------------------------
# OPTIONAL: Uncomment the lines below if you plan to work with
# complex packages that require compilation (e.g. lxml, psycopg2).
# -----------------------------------------------------------
# echo "🔧 Installing development tools for compiled extensions..."
# sudo apt install -y build-essential python3-dev   
````

#### 📦 What Each Package Is For

- **`python3`** → The Python interpreter itself. Needed to run Python programs.  Typically this is already installed during Linux installation.
- **`python3-pip`** → Package manager for Python. Lets you install and manage additional Python libraries (`pip3 install <package>`).  
- **`python3-venv`** → Virtual environment support. Allows you to isolate dependencies per project (`python3 -m venv myenv`).  

#### 🔧 Optional (for advanced cases)

- **`build-essential`** → Provides compiler tools (like `gcc`, `make`). Required if you install Python packages that need to compile native C/C++ code.  
- **`python3-dev`** → Development headers for Python. Needed when building or compiling Python modules that interact with C extensions.  

## How to build and execute your demo 
* Copy the `demo.py` program to your home directory:  
  **Windows:** `wget https://averkoc.github.io/lx/demo.py`  
  **macOS:** `curl -O https://averkoc.github.io/lx/demo.py`

* Create virtual environment: `python3 -m venv mydemo`  
* Move the `demo.py` to your `mydemo` directory: `mv demo.py mydemo`  
* Move into `mydemo` directory: `cd mydemo`  
* Activate the virtual environment: `source bin/activate`  
* Install Python MQTT client library: `pip3 install paho-mqtt`  
* Do the changes in `demo.py` (as shown in the video)  
* Start the program: `python3 demo.py`
* Now you and others can use [demo.html](demo.html) to view the messages that your Debian mqtt-client sends to broker.
* After you have taken the required screen clips, exit the demo.py and deactivate the virtual environment by issuing command `deactivate`

<img width="1361" height="873" alt="image" src="https://github.com/user-attachments/assets/a33975e8-189d-444d-ac67-34ee14202147" />


  
  




  


## Links referred in the video  

| Link | Notes |
|------|-------|
| [emq.html](https://averkoc.github.io/lx/emq.html) | Use this to observe my Raspberry Pi live sensor data during a demo session. My Raspberry Pi is active only during the session or when we’ve agreed. |
| [demo.html](https://averkoc.github.io/lx/demo.html) | Used to see your Debian weather station values sent to the MQTT broker. Open in a browser to verify publishing. |
| [demo.py](https://averkoc.github.io/lx/demo.py) | Simulated weather station Python program. Download, modify, and run on Debian to practice with MQTT client code. |
