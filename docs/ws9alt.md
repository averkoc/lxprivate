---
title: ""
layout: default
---

# Scripting Workshop
**📹 This page supports the workshop video** - Use it to follow along and reference code examples.

---

## Why Learn Scripting?

Scripting turns repetitive tasks into reliable, repeatable workflows:
- **System administrators** use scripts for backups, user management, and monitoring
- **Developers and analysts** automate builds, tests, and data preparation  
- **Power users** speed up everyday tasks

**⚠️ Important safety note:** Scripts run with administrative rights can change or destroy large parts of a system in seconds. Always review and test scripts, especially those using `sudo`, even on your personal system.

**In this workshop:** You'll observe short, safe examples and experiment with small scripts to gain insight into what scripting can do.

---

## Example 1: Automate mqtt-demo Execution
**Video timestamp: [00:00]**

### The Manual Process
To run our simulated weather station, we needed these commands:
```bash
cd ~/mydemo
source bin/activate
python3 demo.py
deactivate
```

### The Scripted Solution
Put these commands in a script to make starting easier:

```bash
#!/bin/bash
cd ~/mydemo
source bin/activate
python3 demo.py
```

<div class="accordion">
  <input type="checkbox" id="accordion1" class="accordion-toggle">
  <label for="accordion1" class="accordion-header" tabindex="0">
    📄 Enhanced demo.py with signal handling
  </label>
  <div class="accordion-content" markdown="1">

```python
import time  
import random  
import signal  
import sys  
import paho.mqtt.client as mqtt  

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
```

  </div>
</div>

**💬 Discussion points covered in video:**
- Q1: Why is `deactivate` not needed?
- Q2: Why use `cd ~/mydemo` instead of `cd mydemo`?
- Q3: Where should we place the script?

---

## Example 2: Create Shared Project Directories
**Video timestamp: [00:00]**

### The Task
Create a script called `createteamdir` that:
- Creates a shared directory for a student team
- Sets appropriate permissions (standard or confidential)
- Handles group creation if needed

**Usage:** `createteamdir --default teamname` or `createteamdir --confidential teamname`

### Approach: Using AI to Generate Scripts
We'll use Claude AI to create two versions and compare the approaches.

<div class="accordion">
  <input type="checkbox" id="accordion2" class="accordion-toggle">
  <label for="accordion2" class="accordion-header" tabindex="0">
    📄 Version 1: Quick and dirty script
  </label>
  <div class="accordion-content" markdown="1">

**Prompt:** "Write a quick bash script to create team directories"

```bash
#!/bin/bash
set -eu
[ $# -ne 2 ] && { echo "Usage: $0 <--default|--conf> <teamname>" >&2; exit 1; }
[ "$EUID" -ne 0 ] && { echo "Run as root" >&2; exit 1; }
MODE=$1 TEAM=$2 DIR="/var/projects/team${TEAM}files"
[[ $MODE == --default ]] && PERM=2775 || [[ $MODE == --conf ]] && PERM=2770 || { echo "Invalid mode" >&2; exit 1; }
[[ $TEAM =~ ^[a-zA-Z0-9_-]+$ ]] || { echo "Invalid team name" >&2; exit 1; }
[ -d "$DIR" ] && { echo "Directory exists" >&2; exit 1; }
getent group "$TEAM" >/dev/null || { read -p "Create group $TEAM? (y/n): " && [[ $REPLY =~ ^[Yy]$ ]] && groupadd "$TEAM" || exit 1; }
mkdir -p "$DIR"
chown :"$TEAM" "$DIR"
chmod "$PERM" "$DIR"
echo "✓ Created $DIR with permissions $PERM" 
```

**Characteristics:** Compact, harder to read, but functional.

  </div>
</div>

<div class="accordion">
  <input type="checkbox" id="accordion3" class="accordion-toggle">
  <label for="accordion3" class="accordion-header" tabindex="0">
    📄 Version 2: Production-ready script with comments
  </label>
  <div class="accordion-content" markdown="1">

**Prompt:** "Write a well-documented, production-ready version"

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
fi
```

**Characteristics:** Clear structure, well-commented, easier to maintain and understand.

  </div>
</div>

**💬 Video discusses:** Comparing both approaches - when to use each style, readability vs. brevity trade-offs.

---

## Example 3: Safe Directory Cleanup with Backup
**Video timestamp: [00:00]**

### The Task  
Safely remove team project directories with optional backup before deletion.

**Why this matters:** Prevents accidental data loss while cleaning up completed projects.

<div class="accordion">
  <input type="checkbox" id="accordion4" class="accordion-toggle">
  <label for="accordion4" class="accordion-header" tabindex="0">
    📄 Complete deleteteamdir script
  </label>
  <div class="accordion-content" markdown="1">

```bash
#!/bin/bash
# Script: deleteteamdir
# Purpose: Safely delete team project directories and optionally remove groups

set -e  # Exit on any error
set -u  # Exit on undefined variables

# Check if team name argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <teamname>" >&2
    exit 1
fi

TEAMNAME="$1"
GROUPNAME="$TEAMNAME"
BASE_DIR="/var/projects"
PROJECT_DIR="${BASE_DIR}/team${TEAMNAME}files"
ARCHIVE_DIR="/var/backups/team-archives"

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

# Check if directory exists
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Warning: Directory '$PROJECT_DIR' does not exist" >&2
    DIRECTORY_EXISTS=false
else
    DIRECTORY_EXISTS=true
fi

# Check if group exists
if ! getent group "$GROUPNAME" >/dev/null 2>&1; then
    echo "Warning: Group '$GROUPNAME' does not exist" >&2
    GROUP_EXISTS=false
else
    GROUP_EXISTS=true
fi

# If neither exists, exit
if [ "$DIRECTORY_EXISTS" = false ] && [ "$GROUP_EXISTS" = false ]; then
    echo "Error: Neither directory nor group exists for team '$TEAMNAME'" >&2
    exit 1
fi

# Show what will be deleted
echo "========================================="
echo "TEAM CLEANUP SUMMARY"
echo "========================================="
echo "Team name: $TEAMNAME"
echo ""

if [ "$DIRECTORY_EXISTS" = true ]; then
    echo "Directory to delete: $PROJECT_DIR"
    DIR_SIZE=$(du -sh "$PROJECT_DIR" 2>/dev/null | cut -f1)
    FILE_COUNT=$(find "$PROJECT_DIR" -type f 2>/dev/null | wc -l)
    echo "  Size: $DIR_SIZE"
    echo "  Files: $FILE_COUNT"
    echo ""
fi

if [ "$GROUP_EXISTS" = true ]; then
    echo "Group to consider: $GROUPNAME"
    GROUP_MEMBERS=$(getent group "$GROUPNAME" | cut -d: -f4)
    if [ -n "$GROUP_MEMBERS" ]; then
        echo "  ⚠ WARNING: Group has members: $GROUP_MEMBERS"
    else
        echo "  Group has no members"
    fi
    
    PRIMARY_USERS=$(awk -F: -v gid="$(getent group "$GROUPNAME" | cut -d: -f3)" '$4 == gid {print $1}' /etc/passwd)
    if [ -n "$PRIMARY_USERS" ]; then
        echo "  ⚠ WARNING: This is the primary group for: $PRIMARY_USERS"
    fi
    echo ""
fi

echo "========================================="

# Offer to create backup archive
ARCHIVE_CREATED=false
if [ "$DIRECTORY_EXISTS" = true ]; then
    echo ""
    echo "BACKUP OPTIONS"
    echo "1) Create tar.gz archive (Linux-friendly, compressed)"
    echo "2) Create zip archive (Windows-compatible)"
    echo "3) Skip backup and proceed to deletion"
    echo ""
    read -p "Choose option (1/2/3): " -r BACKUP_CHOICE
    
    if [ "$BACKUP_CHOICE" = "1" ] || [ "$BACKUP_CHOICE" = "2" ]; then
        mkdir -p "$ARCHIVE_DIR"
        TIMESTAMP=$(date +%Y%m%d_%H%M%S)
        
        if [ "$BACKUP_CHOICE" = "1" ]; then
            ARCHIVE_FILE="${ARCHIVE_DIR}/team${TEAMNAME}_${TIMESTAMP}.tar.gz"
            echo ""
            echo "Creating tar.gz archive..."
            tar -czf "$ARCHIVE_FILE" -C "$BASE_DIR" "team${TEAMNAME}files"
            ARCHIVE_TYPE="tar.gz"
        else
            ARCHIVE_FILE="${ARCHIVE_DIR}/team${TEAMNAME}_${TIMESTAMP}.zip"
            echo ""
            echo "Creating zip archive..."
            
            if ! command -v zip &> /dev/null; then
                echo "Error: 'zip' command not found. Install it with: apt install zip" >&2
                exit 1
            fi
            
            (cd "$BASE_DIR" && zip -r -q "$ARCHIVE_FILE" "team${TEAMNAME}files")
            ARCHIVE_TYPE="zip"
        fi
        
        ARCHIVE_SIZE=$(du -sh "$ARCHIVE_FILE" | cut -f1)
        
        echo "✓ Archive created: $ARCHIVE_FILE"
        echo "  Size: $ARCHIVE_SIZE"
        ARCHIVE_CREATED=true
        
        chmod 644 "$ARCHIVE_FILE"
        echo "  Permissions set to 644 (readable by all)"
        echo ""
    elif [ "$BACKUP_CHOICE" = "3" ]; then
        echo ""
        echo "⚠ Skipping backup - data will be permanently deleted!"
    else
        echo "Invalid choice. Aborting." >&2
        exit 1
    fi
fi

# Confirmation for deletion
if [ "$DIRECTORY_EXISTS" = true ]; then
    echo "========================================="
    if [ "$ARCHIVE_CREATED" = true ]; then
        read -p "Archive created. Delete directory '$PROJECT_DIR' and ALL its contents? (type 'yes' to confirm): " -r
    else
        read -p "⚠ NO BACKUP - Delete directory '$PROJECT_DIR' and ALL its contents PERMANENTLY? (type 'yes' to confirm): " -r
    fi
    
    if [ "$REPLY" != "yes" ]; then
        echo "Directory deletion cancelled."
        if [ "$ARCHIVE_CREATED" = true ]; then
            echo "Archive kept at: $ARCHIVE_FILE"
        fi
        exit 0
    fi
    
    rm -rf "$PROJECT_DIR"
    echo "✓ Directory deleted: $PROJECT_DIR"
fi

# Second confirmation - delete group
if [ "$GROUP_EXISTS" = true ]; then
    echo ""
    read -p "Also delete group '$GROUPNAME'? (type 'yes' to confirm): " -r
    if [ "$REPLY" = "yes" ]; then
        if [ -n "${PRIMARY_USERS:-}" ]; then
            echo "✗ Cannot delete group - it is the primary group for: $PRIMARY_USERS" >&2
            echo "  Remove these users first or change their primary group." >&2
            exit 1
        fi
        
        groupdel "$GROUPNAME"
        echo "✓ Group deleted: $GROUPNAME"
        
        if [ -n "${GROUP_MEMBERS:-}" ]; then
            echo "  Note: Users were in this group: $GROUP_MEMBERS"
        fi
    else
        echo "Group '$GROUPNAME' kept (not deleted)."
    fi
fi

echo ""
echo "========================================="
echo "Cleanup complete for team '$TEAMNAME'"
if [ "$ARCHIVE_CREATED" = true ]; then
    echo ""
    echo "Archive location: $ARCHIVE_FILE"
    echo "Archive type: $ARCHIVE_TYPE"
fi
echo "========================================="
```

  </div>
</div>

**💬 Video covers:** Safety considerations, confirmation prompts, backup strategies, and error handling.

---

## 🎯 Key Takeaways

**From this workshop you learned:**
- How to convert repetitive command sequences into scripts
- Using AI tools to generate and refine scripts
- Comparing quick-and-dirty vs. production-ready approaches
- Safety features: validation, confirmation prompts, and backups
- Best practices for maintainable scripts

**Next steps:**
- Try modifying these scripts for your own needs
- Experiment with adding features (logging, dry-run mode, etc.)
- Review the teaching guide (link if you have one) for deeper understanding of language elements
