# LX Weather MQTT Publisher

A Raspberry Pi service that publishes BMP280 temperature and pressure sensor readings to an MQTT broker. Optimized for long-term operation as a systemd service with minimal SD card wear.

## Features

- ✅ Publishes temperature and pressure readings every 5 seconds
- ✅ Automatic MQTT reconnection with exponential backoff
- ✅ Graceful shutdown handling (SIGTERM/SIGINT)
- ✅ Minimal SD card writes (RAM-based logging)
- ✅ systemd service integration
- ✅ Error recovery and resilience

## Hardware Requirements

- Raspberry Pi (tested on Pi 3/4)
- BMP280 temperature and pressure sensor (I2C)
- Internet connection

## Wiring

Connect BMP280 to Raspberry Pi I2C bus:

```
BMP280    Raspberry Pi
------    ------------
VCC   ->  3.3V (Pin 1)
GND   ->  GND (Pin 6)
SCL   ->  SCL (Pin 5)
SDA   ->  SDA (Pin 3)
```

## Installation

### 1. Enable I2C

```bash
sudo raspi-config
# Navigate to: Interface Options -> I2C -> Enable
sudo reboot
```

### 2. Clone Repository

```bash
cd ~
git clone https://github.com/yourusername/lxweather.git
cd lxweather
```

### 3. Install Dependencies

```bash
sudo apt-get update
sudo apt-get install -y python3-pip python3-smbus i2c-tools
pip3 install -r requirements.txt
```

### 4. Test Sensor Connection

```bash
# Should show device at address 0x76 or 0x77
sudo i2cdetect -y 1

# Test the script manually
python3 mqtt_publisher.py
# Press Ctrl-C to stop
```

### 5. Configure systemd Journal (Minimize SD Card Writes)

```bash
# Backup original config
sudo cp /etc/systemd/journald.conf /etc/systemd/journald.conf.backup

# Copy provided config
sudo cp journald.conf /etc/systemd/journald.conf

# Restart journald
sudo systemctl restart systemd-journald

# Verify logs are in RAM (should show /run/log/journal)
sudo journalctl --disk-usage
```

### 6. Install Service

```bash
# Copy service file
sudo cp lxweather.service /etc/systemd/system/

# Reload systemd
sudo systemctl daemon-reload

# Enable service to start on boot
sudo systemctl enable lxweather

# Start service
sudo systemctl start lxweather
```

## Usage

### Check Service Status

```bash
sudo systemctl status lxweather
```

### View Logs

```bash
# Live log tail
sudo journalctl -u lxweather -f

# Last 50 lines
sudo journalctl -u lxweather -n 50

# Logs from last boot
sudo journalctl -u lxweather -b
```

### Monitor MQTT Messages

```bash
# Install mosquitto clients
sudo apt-get install mosquitto-clients

# Subscribe to topics
mosquitto_sub -h broker.emqx.io -t "/lxweather/#" -v
```

### Control Service

```bash
# Stop service
sudo systemctl stop lxweather

# Restart service
sudo systemctl restart lxweather

# Disable service (won't start on boot)
sudo systemctl disable lxweather
```

## Configuration

Edit `mqtt_publisher.py` to customize:

```python
# MQTT Configuration
BROKER = "broker.emqx.io"           # Your MQTT broker
PORT = 1883                          # MQTT port
TOPIC_TEMP = "/lxweather/temperature"
TOPIC_PRESS = "/lxweather/pressure"
PUBLISH_INTERVAL = 5                 # Seconds between readings
```

## MQTT Topics

The service publishes to these topics:

- `/lxweather/temperature` - Temperature in Celsius (format: `"23.45"`)
- `/lxweather/pressure` - Pressure in hPa (format: `"1013.25"`)

## SD Card Wear Optimization

This project is optimized to minimize SD card writes:

1. **Minimal logging** - Only logs startup, shutdown, and errors
2. **Volatile journal** - systemd logs stored in RAM only (`/run/log/journal`)
3. **Error rate limiting** - Repeated errors logged once per hour
4. **No file operations** - All data sent via MQTT, nothing written to disk

Expected writes: **~10-20 per day** (vs. 17,280 with verbose logging)

## Troubleshooting

### Service won't start

```bash
# Check for Python errors
python3 mqtt_publisher.py

# Check service logs
sudo journalctl -u lxweather -n 100 --no-pager
```

### Sensor not detected

```bash
# Check I2C is enabled
ls /dev/i2c-*

# Scan for devices
sudo i2cdetect -y 1

# Check permissions
sudo usermod -a -G i2c,gpio pi
```

### MQTT connection fails

```bash
# Test broker connectivity
ping broker.emqx.io

# Check firewall
sudo iptables -L

# Try different broker
# Edit BROKER variable in mqtt_publisher.py
```

### High SD card writes

```bash
# Verify journal is volatile
sudo journalctl --disk-usage
# Should show: "Archived and active journals take up ... at /run/log/journal"

# Check if persistent journal exists
ls -la /var/log/journal/
# This directory should NOT exist or be empty
```

## Client Integration

Your HTML/JavaScript MQTT client can subscribe to the topics:

```javascript
const client = mqtt.connect('ws://broker.emqx.io:8083/mqtt');

client.on('connect', () => {
    client.subscribe('/lxweather/temperature');
    client.subscribe('/lxweather/pressure');
});

client.on('message', (topic, message) => {
    const value = message.toString();
    if (topic === '/lxweather/temperature') {
        console.log('Temperature:', value, '°C');
    } else if (topic === '/lxweather/pressure') {
        console.log('Pressure:', value, 'hPa');
    }
});
```

## License

MIT License - feel free to use and modify

## Contributing

Pull requests are welcome! Please ensure:
- Code follows existing style
- SD card write minimization is maintained
- Service remains compatible with existing MQTT clients

## Author

SM 

## Acknowledgments

- [paho-mqtt](https://github.com/eclipse/paho.mqtt.python) - MQTT client library
- [pimoroni/bmp280-python](https://github.com/pimoroni/bmp280-python) - BMP280 sensor library
