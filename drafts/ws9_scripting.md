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
