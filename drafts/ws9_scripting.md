## Scripting

### Activity - Automate mqtt-demo demo.py execution  
Motivation: difficult to remember the steps if used seldom.  

* cd ~/mydemo
* source bin/activate
* python3 demo.py
* deactivate

**Make a script startdemo.sh**  
```bash
#!/bin/bash
cd ~/mydemo
source bin/activate
python3 demo.py # demo2.py to handle ctrl-c nicely
````
> Q1: Why is deactivate not needed? Q2: Why should I use `cd ~/mydemo` instead of `cd mydemo` Q3: Where to place the script ?

**Add signal handling to demo.py -> demo2.py to interrupt nicely**  

```python
import time
import random
import signal
import sys
import paho.mqtt.client as mqtt

#broker = "test.mosquitto.org"
#port = 1883
broker = "broker.emqx.io"
port = 1883
topictemp = f"/lx/sakari/temperature"
topicpressure = f"/lx/sakari/pressure"

client = mqtt.Client()

def signal_handler(sig, frame):
    print('\nShutting down gracefully...')
    client.disconnect()
    sys.exit(0)

signal.signal(signal.SIGINT, signal_handler)

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
````

### Create shared directory for a student project group 
```bash
#!/bin/bash
# Script: createteamdir
# Purpose: Create shared directories for student projects under /var/projects/

set -e  # Exit on any error
set -u  # Exit on undefined variables

# Check if we have exactly 2 arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <--default|--conf> <teamname>" >&2
    echo "  --default  Standard permissions (rwxrwsr-x / 2775)" >&2
    echo "  --conf     Confidential permissions (rwxrws--- / 2770)" >&2
    exit 1
fi

MODE="$1"
TEAMNAME="$2"
GROUPNAME="$TEAMNAME"
BASE_DIR="/var/projects"
PROJECT_DIR="${BASE_DIR}/team${TEAMNAME}files"

# Validate mode and set permissions
case "$MODE" in
    --default)
        PERMS="2775"
        PERMS_DESC="rwxrwsr-x (standard - others can read/list)"
        ;;
    --conf)
        PERMS="2770"
        PERMS_DESC="rwxrws--- (confidential - group only)"
        ;;
    *)
        echo "Error: Invalid mode '$MODE'" >&2
        echo "Must be either --default or --conf" >&2
        exit 1
        ;;
esac

# Validate team name (alphanumeric, underscore, hyphen only)
if ! [[ "$TEAMNAME" =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo "Error: Team name must contain only letters, numbers, underscores, and hyphens" >&2
    exit 1
fi

# Check if running as root or with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root or with sudo" >&2
    exit 1
fi

# Check if directory already exists
if [ -d "$PROJECT_DIR" ]; then
    echo "Error: Directory '$PROJECT_DIR' already exists" >&2
    exit 1
fi

# Check if group exists, if not prompt to create
if ! getent group "$GROUPNAME" >/dev/null 2>&1; then
    read -p "Group '$GROUPNAME' does not exist. Create it? (y/n): " -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        groupadd "$GROUPNAME"
        echo "Group '$GROUPNAME' created."
    else
        echo "Aborted: Group must exist to proceed" >&2
        exit 1
    fi
fi

# Create the directory (with parents)
mkdir -p "$PROJECT_DIR"

# Set group ownership
chown :"$GROUPNAME" "$PROJECT_DIR"

# Set permissions
chmod "$PERMS" "$PROJECT_DIR"

echo "✓ Directory created: $PROJECT_DIR"
echo "✓ Group owner: $GROUPNAME"
echo "✓ Permissions: $PERMS_DESC"
echo ""
if [ "$MODE" = "--conf" ]; then
    echo "⚠ CONFIDENTIAL directory - only group members can access."
else
    echo "Students in group '$GROUPNAME' can collaborate. Others can view contents."
fi````





### Linux course mgmt-scripts 
* accounts creation
* emailing accounts/passwords
* checking exam results
  
### Other
checkt that www-folder ownerships and permissions are safe


### Example  
```bash  
#!/bin/bash
#
# create-labgroup1-dir.sh
#
# This script creates a shared directory for group 'labgroup1'
# under /var/labs/. It must be run with sudo because /var/labs
# is a protected part of the filesystem.
#

# The group name we want to set ownership for
GROUP="labgroup1"

# The target directory to create
TARGET_DIR="/var/labs/labgroup1files"

# Check if the group exists
if ! getent group "$GROUP" > /dev/null; then
    echo "Error: Group '$GROUP' does not exist."
    exit 1
fi

# Create the base directory /var/labs if it does not exist
if [ ! -d /var/labs ]; then
    echo "Creating /var/labs ..."
    sudo mkdir -p /var/labs || { echo "Failed to create /var/labs"; exit 1; }
fi

# Create the shared directory
if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating directory $TARGET_DIR ..."
    sudo mkdir -p "$TARGET_DIR" || { echo "Failed to create $TARGET_DIR"; exit 1; }
else
    echo "Directory $TARGET_DIR already exists."
fi

# Set group ownership
echo "Setting group ownership to $GROUP ..."
sudo chgrp "$GROUP" "$TARGET_DIR"

# Set permissions: group members can read, write, create files
echo "Setting permissions ..."
sudo chmod 2770 "$TARGET_DIR"

echo "Done. Shared directory created at $TARGET_DIR"

````
