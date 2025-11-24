> Give a bash script that creates 5 users with names from April to August (small initial) and with the same passwords as names.

````bash
#!/bin/bash

# Array of usernames
usernames=("april" "may" "june" "july" "august")

# Loop through each username
for username in "${usernames[@]}"; do
    # Create the user
    sudo adduser --disabled-password --gecos "" "$username"

    # Set the password to be the same as the username
    echo "$username:$username" | sudo chpasswd

    echo "User $username created with password $username"
done
````

> And give a script that removes the created users and their home dirs
````bash
#!/bin/bash

# Array of usernames
usernames=("april" "may" "june" "july" "august")

for username in "${usernames[@]}"; do
    # Delete user files
    # sudo find / -user "$username" -exec rm -rf {} \;

    # Delete the user account and home directory
    sudo userdel -r "$username"

    echo "User $username and home/$username have been deleted"
done
