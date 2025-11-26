## mqtt_weathersation.py 

```python
#!/usr/bin/env python3
"""
LX Weather MQTT Publisher
Publishes BMP280 temperature and pressure readings to MQTT broker
Optimized for Raspberry Pi systemd service with minimal SD card writes
"""

import time
import signal
import sys
import paho.mqtt.client as mqtt
from bmp280 import BMP280
import RPi.GPIO as GPIO

# MQTT Configuration
BROKER = "broker.emqx.io"
PORT = 1883
TOPIC_TEMP = "/lxweather/temperature"
TOPIC_PRESS = "/lxweather/pressure"
PUBLISH_INTERVAL = 5  # seconds
MAX_CONNECT_ATTEMPTS = 10

# Global state
mqtt_connected = False
running = True
startup_complete = False

# Signal handlers for graceful shutdown
def signal_handler(signum, frame):
    """Handle SIGTERM and SIGINT for graceful shutdown"""
    global running
    running = False
    print("Shutdown signal received", flush=True)

signal.signal(signal.SIGTERM, signal_handler)
signal.signal(signal.SIGINT, signal_handler)

# MQTT callbacks
def on_connect(client, userdata, flags, rc):
    """Handle MQTT connection events"""
    global mqtt_connected, startup_complete
    mqtt_connected = (rc == 0)
    # Only log during startup to minimize SD card writes
    if not startup_complete:
        print(f"MQTT connection: {'success' if rc == 0 else f'failed (rc={rc})'}", flush=True)

def on_disconnect(client, userdata, rc):
    """Handle MQTT disconnection events"""
    global mqtt_connected
    was_connected = mqtt_connected
    mqtt_connected = False
    # Only log unexpected disconnects
    if rc != 0 and was_connected:
        print(f"MQTT disconnected unexpectedly (rc={rc})", flush=True)

# Initialize I2C bus and BMP280 sensor
try:
    from smbus2 import SMBus
except ImportError:
    from smbus import SMBus

try:
    bus = SMBus(1)
    bmp280 = BMP280(i2c_dev=bus)
    print("BMP280 sensor initialized", flush=True)
except Exception as e:
    print(f"CRITICAL: BMP280 initialization failed: {e}", flush=True)
    sys.exit(1)

# Initialize MQTT client
client = mqtt.Client()
client.on_connect = on_connect
client.on_disconnect = on_disconnect

# Initial connection with retry logic
attempt = 0
while attempt < MAX_CONNECT_ATTEMPTS and running:
    try:
        client.connect(BROKER, PORT, keepalive=60)
        break
    except Exception as e:
        print(f"Connection attempt {attempt+1}/{MAX_CONNECT_ATTEMPTS} failed: {e}", flush=True)
        attempt += 1
        if attempt >= MAX_CONNECT_ATTEMPTS:
            print("CRITICAL: Max connection attempts reached. Exiting.", flush=True)
            sys.exit(1)
        time.sleep(5)

# Start MQTT network loop in background thread
client.loop_start()

# Wait for initial connection (with timeout)
wait_time = 0
while not mqtt_connected and wait_time < 10 and running:
    time.sleep(0.5)
    wait_time += 0.5

startup_complete = True
print("Service started successfully", flush=True)

# Notify systemd that service is ready (optional - requires python3-systemd)
try:
    import systemd.daemon
    systemd.daemon.notify('READY=1')
except ImportError:
    pass  # systemd notification not available, continue anyway

# Main loop - runs silently to minimize SD card writes
consecutive_errors = 0
try:
    while running:
        try:
            # Read sensor data
            temperature = bmp280.get_temperature()
            pressure = bmp280.get_pressure()
            
            # Format as strings (compatible with existing HTML client)
            format_temp = f"{temperature:.2f}"
            format_press = f"{pressure:.2f}"
            
            # Publish to MQTT if connected
            if mqtt_connected:
                client.publish(TOPIC_TEMP, format_temp)
                client.publish(TOPIC_PRESS, format_press)
                consecutive_errors = 0
                
        except OSError as e:
            # Sensor I2C communication error
            consecutive_errors += 1
            # Only log first error and then every hour (720 * 5s = 3600s)
            if consecutive_errors == 1 or consecutive_errors % 720 == 0:
                print(f"Sensor error (count: {consecutive_errors}): {e}", flush=True)
                
        except Exception as e:
            # Unexpected error
            consecutive_errors += 1
            if consecutive_errors == 1 or consecutive_errors % 720 == 0:
                print(f"Unexpected error (count: {consecutive_errors}): {e}", flush=True)
        
        # Sleep in small intervals to allow responsive shutdown
        for _ in range(PUBLISH_INTERVAL * 2):
            if not running:
                break
            time.sleep(0.5)
            
except Exception as e:
    print(f"CRITICAL: Fatal error in main loop: {e}", flush=True)
    sys.exit(1)
    
finally:
    # Cleanup on exit
    print("Cleaning up resources...", flush=True)
    client.loop_stop()
    client.disconnect()
    GPIO.cleanup()
    print("Service stopped", flush=True)
````
## requirements.txt  
```bash  
paho-mqtt>=1.6.1
bmp280>=0.0.4
RPi.GPIO>=0.7.1
smbus2>=0.4.2
````

## lxweather.service  
```bash
[Unit]
Description=LX Weather MQTT Publisher
Documentation=https://github.com/yourusername/lxweather
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=pi
Group=pi
WorkingDirectory=/home/pi/lxweather
ExecStart=/usr/bin/python3 /home/pi/lxweather/mqtt_publisher.py

# Restart policy
Restart=on-failure
RestartSec=10

# Logging - output goes to systemd journal (configured as volatile/RAM-only)
StandardOutput=journal
StandardError=journal
SyslogIdentifier=lxweather

# Security hardening (optional)
NoNewPrivileges=true
PrivateTmp=true

[Install]
WantedBy=multi-user.target
````
## journald.conf
```bash
# /etc/systemd/journald.conf
# Configuration for systemd journal to use RAM-only storage
# This prevents SD card wear on Raspberry Pi

[Journal]
# Store logs in RAM only (/run/log/journal), not on SD card
Storage=volatile

# Limit RAM usage for logs
RuntimeMaxUse=20M
RuntimeMaxFileSize=2M

# Keep logs for 1 hour only
MaxRetentionSec=3600

# Don't forward to syslog (reduces duplicate logging)
ForwardToSyslog=no

# Compression can be enabled to save RAM
#Compress=yes

# Rate limiting to prevent log storms
RateLimitIntervalSec=30s
RateLimitBurst=1000
````

