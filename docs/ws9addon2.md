
 Here's a weather-station startup script that addresses the questions about error handling, extending functionality, and basic monitoring: 
 ```bash
#!/bin/bash

# Check if already running
if [ -f ~/mydemo/weather.pid ]; then
    PID=$(cat ~/mydemo/weather.pid)
    if ps -p $PID > /dev/null 2>&1; then
        echo "Error: Weather station is already running (PID: $PID)"
        exit 1
    else
        echo "Warning: Stale PID file found, removing it"
        rm ~/mydemo/weather.pid
    fi
fi

# Check if directory exists
if [ ! -d ~/mydemo ]; then
    echo "Error: mydemo directory not found at ~/mydemo"
    exit 1
fi

cd ~/mydemo

# Check if virtual environment exists
if [ ! -f bin/activate ]; then
    echo "Error: virtual environment not found (bin/activate missing)"
    exit 1
fi

# Record start time and PID
START_TIME=$(date +%s)
echo "Starting weather station at $(date)"

source bin/activate

# Store PID for single-instance check
echo $$ > weather.pid

# Run the Python script
python3 demo.py

# Cleanup and show runtime when it exits
rm -f weather.pid
END_TIME=$(date +%s)
RUNTIME=$((END_TIME - START_TIME))
echo "Weather station stopped at $(date)"
echo "Total runtime: $RUNTIME seconds"
````
