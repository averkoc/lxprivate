```bash 
#!/bin/bash
# Define the directory under which the group directories are created
BASE_DIR="/var/www/html"
USER_FILE="users"

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 basename max_members"
    exit 1
fi

# Assign arguments to variables
BASENAME=$1
MAX_MEMBERS=$2

# Validate inputs
if [ "$MAX_MEMBERS" -lt 1 ]; then
    echo "Error: max_members must be at least 1"
    exit 1
fi

if [ ! -f "$USER_FILE" ]; then
    echo "Error: User file '$USER_FILE' not found"
    exit 1
fi

if [ ! -d "$BASE_DIR" ]; then
    echo "Error: Base directory '$BASE_DIR' does not exist"
    exit 1
fi

echo "Creating groups with basename $BASENAME and group directories under directory $BASE_DIR"
echo "Users are taken from file $USER_FILE"
read -p "Do you want to proceed? (y/n) " -n 1 -r
echo    # move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
   echo "Aborted."
   exit 1
fi

# Initialize a counter for the group number
GROUP_NUM=1
# Initialize a counter for the number of users in the current group
COUNT=0

# Read the user file
while IFS= read -r USER || [ -n "$USER" ]; do
    # Skip empty lines and comments
    [[ -z "$USER" || "$USER" =~ ^[[:space:]]*# ]] && continue
    
    # Check if user exists
    if ! id "$USER" &>/dev/null; then
        echo "Warning: User '$USER' does not exist, skipping"
        continue
    fi
    
    # Get the user's UID
    uid=$(id -u "$USER")
    
    # Check that UID accounts under 1001 are not affected
    if [ "$uid" -gt 1000 ]; then
        # If the current group is full, increment the group number and reset the count
        if [ "$COUNT" -ge "$MAX_MEMBERS" ]; then
            GROUP_NUM=$((GROUP_NUM + 1))
            COUNT=0
        fi
        
        GROUP_NAME="$BASENAME$GROUP_NUM"
        DIR_PATH="$BASE_DIR/${BASENAME}${GROUP_NUM}files"
        
        # Create the group and directory if they don't exist (atomic operation)
        if ! getent group "$GROUP_NAME" >/dev/null; then
            groupadd "$GROUP_NAME"
            # Create directory immediately after group creation
            mkdir -p "$DIR_PATH"
            chown :"$GROUP_NAME" "$DIR_PATH"
            chmod 2775 "$DIR_PATH"  # SGID only (consider if sticky bit is needed)
            echo "Created group $GROUP_NAME and directory $DIR_PATH"
        fi
        
        # Add the user to the group
        usermod -aG "$GROUP_NAME" "$USER"
        echo "Added $USER to $GROUP_NAME"
        
        # Increment the count of users in the current group
        COUNT=$((COUNT + 1))
    fi
done < "$USER_FILE"

echo "Done!"
echo "You can delete the groups by: for i in {1..$GROUP_NUM}; do sudo delgroup ${BASENAME}\$i; done"
echo "You can delete the dirs by: for i in {1..$GROUP_NUM}; do sudo rm -r \"$BASE_DIR/${BASENAME}\${i}files\"; done"
exit 0
````





