import time
import paho.mqtt.client as mqtt
from bmp280 import BMP280
import RPi.GPIO as GPIO

broker = "broker.emqx.io"
port = 1883
topictemperature = f"/lxweather/temperature"
topicpressure = f"/lxweather/pressure"
client = mqtt.Client()
client.connect(broker, port)

GPIO.setmode(GPIO.BOARD)
GPIO.setup(16, GPIO.OUT, initial=GPIO.LOW)

try:
    from smbus2 import SMBus
except ImportError:
    from smbus import SMBus

bus = SMBus(1)
bmp280 = BMP280(i2c_dev=bus)

while True:
    # Read temperature and pressure
    temperature = bmp280.get_temperature()
    format_temp = "{:.2f}".format(temperature)
    pressure = bmp280.get_pressure()
    format_press = "{:.2f}".format(pressure)

    # Print formatted values
    print(f"Temperature: {format_temp} °C")
    print(f"Pressure: {format_press} hPa")

    # Publish sensor values
    client.publish(topictemperature, format_temp)
    client.publish(topicpressure, format_press)

    # Wait for 5 seconds
    time.sleep(5)
