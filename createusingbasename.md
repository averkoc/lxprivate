#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <basename> <number_of_accounts>"
    exit 1
fi

basename=$1
num_accounts=$2

for i in $(seq 1 $num_accounts); do
    username="${basename}${i}"
    
    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User $username already exists."
        continue
    fi
    
    # Create the user with the same password as the username
    useradd -m -k /etc/skel -s /bin/bash "$username"
    echo "$username:$username" | chpasswd
    
    # Set proper ownership and permissions for the home directory
    chown -R "$username:$username" "/home/$username"
    chmod 700 "/home/$username"
    
    echo "User $username created successfully."
done
