### emqdemo.py - this is the current version runnin in raspberry (like all other defs in this page)
````python
import time
import paho.mqtt.client as mqtt
from bmp280 import BMP280
import RPi.GPIO as GPIO

# MQTT settings
broker = "broker.emqx.io"
port = 1883
topictemperature = "/lxweather/temperature"
topicpressure = "/lxweather/pressure"

# GPIO setup
GPIO.setmode(GPIO.BOARD)
GPIO.setup(16, GPIO.OUT, initial=GPIO.LOW)

# Try to import SMBus
try:
    from smbus2 import SMBus
except ImportError:
    from smbus import SMBus

bus = SMBus(1)
bmp280 = BMP280(i2c_dev=bus)


# ---------------- MQTT CALLBACKS ---------------- #

def on_connect(client, userdata, flags, rc):
    print(f"[MQTT] Connected (rc={rc})")

def on_disconnect(client, userdata, rc):
    print("[MQTT] Disconnected → retrying in 5 seconds…")
    time.sleep(5)


# Create MQTT client
client = mqtt.Client()
client.on_connect = on_connect
client.on_disconnect = on_disconnect


# Keep trying initial connection until success
while True:
    try:
        print(f"[MQTT] Connecting to {broker}:{port}…")
        client.connect(broker, port, keepalive=60)
        break
    except Exception as e:
        print("[MQTT] Connect failed:", e)
        time.sleep(5)

# Start loop thread so reconnect works
client.loop_start()


# ---------------- MAIN LOOP ---------------- #

try:
    while True:
        try:
            # Read sensor
            temperature = bmp280.get_temperature()
            pressure = bmp280.get_pressure()

            format_temp = f"{temperature:.2f}"
            format_press = f"{pressure:.2f}"

            # Print to terminal
            print(f"Temperature: {format_temp} °C | Pressure: {format_press} hPa")

            # Publish MQTT
            client.publish(topictemperature, format_temp)
            client.publish(topicpressure, format_press)

        except Exception as err:
            print("[ERROR] Sensor or MQTT publish error:", err)

        time.sleep(5)

except KeyboardInterrupt:
    print("Stopping (Ctrl-C)…")

finally:
    client.loop_stop()
    GPIO.cleanup()
    print("Cleanup done. Exit.")
````

## service definition file - /etc/systemd/system/mqtt-sensor.service
```bash
[Unit]
Description=MQTT Sensor Publisher
After=network-online.target
Wants=network-online.target

# Prevent rapid restarts
StartLimitIntervalSec=60
StartLimitBurst=5

[Service]
User=weatheruser
Group=weatheruser
WorkingDirectory=/home/weatheruser/station

# Python inside the virtual environment
ExecStart=/home/weatheruser/station/bin/python /home/weatheruser/station/emqdemo.py

# Restart if it crashes
Restart=always
RestartSec=5

# Logging
StandardOutput=journal
StandardError=journal

# Minimal hardening that doesn’t break venv execution
PrivateTmp=yes          # separate /tmp
ProtectHome=yes          # prevents access to other users’ home directories

# Avoid ProtectSystem=full / NoNewPrivileges=true for now — these break the Python venv
# Can be added later if a more complex venv setup is used

[Install]
WantedBy=multi-user.target
````

### systemctl commands   
```bash
sudo systemctl daemon-reload # When there is need to reread service files
sudo systemctl status mqtt-sensor.service
sudo systemctl enable mqtt-sensor.service 
sudo systemctl start mqtt-sensor.service
````

### Hardening suggestions  
```bash
[Service]
User=weatheruser
Group=weatheruser
WorkingDirectory=/home/weatheruser/station
ExecStart=/home/weatheruser/station/bin/python /home/weatheruser/station/emqdemo.py

Restart=always
RestartSec=5
StandardOutput=journal
StandardError=journal

# Harden the service
NoNewPrivileges=true          # prevents gaining new privileges
ProtectSystem=full            # makes /usr and /boot read-only
ProtectHome=yes               # limits access to other users' home dirs
PrivateTmp=yes                # gives a private /tmp
StartLimitBurst=5
StartLimitIntervalSec=60
````

