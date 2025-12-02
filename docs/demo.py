
import time
import random
import paho.mqtt.client as mqtt

#broker = "test.mosquitto.org"
#port = 1883
broker = "broker.emqx.io"
port = 1883

topictemp = f"/lx/sakari/temperature"
topicpressure = f"/lx/sakari/pressure"


client = mqtt.Client()

def publish_temperature():
    while True:
        temperature = random.uniform(20.0, 30.0)
        client.publish(topictemp, f"{temperature:.2f}")
        print(f"Published: {temperature:.2f} to topic {topictemp}")
        pressure = random.uniform(1020.0, 1030.0)
        client.publish(topicpressure, f"{pressure:.2f}")
        print(f"Published: {pressure:.2f} to topic {topicpressure}")
        time.sleep(5)

client.connect(broker, port)
publish_temperature()
