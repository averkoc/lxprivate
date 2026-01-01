```bash  
#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo "Checking Python environment..."

# Check Python 3
if command_exists python3; then
    PYTHON_VER=$(python3 --version 2>&1)
    echo "Python 3 is installed: $PYTHON_VER"
else
    echo "Python 3 is NOT installed."
    read -p "Do you want to install Python 3? [y/N]: " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        sudo apt update
        sudo apt install -y python3
    else
        echo "Python 3 is required. Exiting."
        exit 1
    fi
fi

# Check pip3
if command_exists pip3; then
    PIP_VER=$(pip3 --version 2>&1)
    echo "pip3 is installed: $PIP_VER"
else
    echo "pip3 is NOT installed."
    read -p "Do you want to install pip3? [y/N]: " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        sudo apt update
        sudo apt install -y python3-pip
    else
        echo "pip3 is required for package installation. Exiting."
        exit 1
    fi
fi

# Check venv module
python3 -m venv test_venv 2>/dev/null
if [ $? -eq 0 ]; then
    echo "python3-venv module is installed."
    rm -rf test_venv
else
    echo "python3-venv module is NOT installed."
    read -p "Do you want to install python3-venv? [y/N]: " choice
    if [[ "$choice" =~ ^[Yy]$ ]]; then
        sudo apt update
        sudo apt install -y python3-venv
    else
        echo "python3-venv is required for virtual environments. Exiting."
        exit 1
    fi
fi

echo
echo "✅ Your system is ready to create virtual environments and install Python packages!"
echo "Example:"
echo "   python3 -m venv myenv"
echo "   source myenv/bin/activate"
echo "   pip install <package_name>"  

````

