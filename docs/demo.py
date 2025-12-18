import time
import random
import signal
import sys
import paho.mqtt.client as mqtt

# ---------------------------------------------------------------------------
# MQTT configuration
# ---------------------------------------------------------------------------

BROKER = "broker.emqx.io"
PORT = 1883
TOPIC_TEMP = "/lx/sakari/temperature"
TOPIC_PRESSURE = "/lx/sakari/pressure"

# Fixed log file
LOG_FILE = "demo.log"

# ---------------------------------------------------------------------------
# MQTT client setup
# ---------------------------------------------------------------------------

client = mqtt.Client()
client.connect(BROKER, PORT)
client.loop_start()

# ---------------------------------------------------------------------------
# Signal handling
# ---------------------------------------------------------------------------

def handle_signal(signum, frame):
    print(f"\nReceived signal {signum}, shutting down gracefully...")
    client.disconnect()
    sys.exit(0)

signal.signal(signal.SIGINT, handle_signal)
signal.signal(signal.SIGTERM, handle_signal)

# ---------------------------------------------------------------------------
# Publish loop
# ---------------------------------------------------------------------------

try:
    while True:
        temperature = random.uniform(20.0, 30.0)
        pressure = random.uniform(1020.0, 1030.0)

        client.publish(TOPIC_TEMP, f"{temperature:.2f}")
        client.publish(TOPIC_PRESSURE, f"{pressure:.2f}")

        # Append message to demo.log
        with open(LOG_FILE, "a") as f:
            f.write(f"Published temperature={temperature:.2f} to {TOPIC_TEMP}, "
                    f"pressure={pressure:.2f} to {TOPIC_PRESSURE}\n")

        print(f"Published temperature={temperature:.2f}, pressure={pressure:.2f}")
        time.sleep(5)

except KeyboardInterrupt:
    # Fallback in case signal is missed
    handle_signal(signal.SIGINT, None)
