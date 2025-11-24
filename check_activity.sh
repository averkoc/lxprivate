#!/bin/bash

# Make the required reference input file using a command like the find below (use sudo if needed)
# where the path points to path that contains reference answer.
# When run against student given input file use "sed 's/sakari/studentfirstname/g'" input.txt
# find /var/projects/  -exec stat -c %F %U %G %a %n {} \; > input.txt

# Check if input file exists
input_file="input.txt"
if [ ! -f "$input_file" ]; then
    if [ $verbose -eq 1 ]; then
        echo "Input file $input_file not found!"
    fi
    exit 1
fi

# Parse options
verbose=0
while getopts "v" opt; do
    case $opt in
        v)
            verbose=1
            ;;
        *)
            echo "Usage: $0 [-v]"
            exit 1
            ;;
    esac
done

# Function to check if a directory exists
check_directory() {
    if [ -d "$1" ]; then
        if [ $verbose -eq 1 ]; then
            echo "Directory $1 exists."
        fi
        return 0
    else
        if [ $verbose -eq 1 ]; then
            echo "Directory $1 does not exist."
        fi
        return 1
    fi
}

# Function to check if a file exists
check_file() {
    if [ -f "$1" ]; then
        if [ $verbose -eq 1 ]; then
            echo "File $1 exists."
        fi
        return 0
    else
        if [ $verbose -eq 1 ]; then
            echo "File $1 does not exist."
        fi
        return 1
    fi
}

# Function to check ownership
check_ownership() {
    owner=$(stat -c '%U' "$1")
    group=$(stat -c '%G' "$1")
    if [ "$owner" == "$2" ] && [ "$group" == "$3" ]; then
        if [ $verbose -eq 1 ]; then
            echo "$1 is owned by $2:$3."
        fi
        return 0
    else
        if [ $verbose -eq 1 ]; then
            echo "$1 is not owned by $2:$3. Current owner: $owner:$group"
        fi
        return 1
    fi
}

# Function to check permissions
check_permissions() {
    perms=$(stat -c '%a' "$1")
    if [ "$perms" == "$2" ]; then
        if [ $verbose -eq 1 ]; then
            echo "$1 has permissions $2."
        fi
        return 0
    else
        if [ $verbose -eq 1 ]; then
            echo "$1 does not have permissions $2. Current permissions: $perms"
        fi
        return 1
    fi
}

# Read input file and perform checks
all_passed=1
while IFS= read -r line; do
    # Use regex to parse the line
    if [[ $line =~ ^(directory|regular\ file|regular\ empty\ file)\ ([^ ]+)\ ([^ ]+)\ ([0-7]{3})\ (.+)/?([^/]*)$ ]]; then
        type="${BASH_REMATCH[1]}"
        owner="${BASH_REMATCH[2]}"
        group="${BASH_REMATCH[3]}"
        perms="${BASH_REMATCH[4]}"
        path="${BASH_REMATCH[5]}"
        name="${BASH_REMATCH[6]}"

        if [ -z "$name" ]; then
            full_path="$path"
        else
            full_path="$path/$name"
        fi

        case "$type" in
            "directory")
                check_directory "$full_path" || all_passed=0
                ;;
            "regular file"|"regular empty file")
                check_file "$full_path" || all_passed=0
                ;;
        esac

        check_ownership "$full_path" "$owner" "$group" || all_passed=0
        check_permissions "$full_path" "$perms" || all_passed=0
    else
        if [ $verbose -eq 1 ]; then
            echo "Invalid line format: $line"
        fi
        all_passed=0
    fi
done < "$input_file"

# Summary of checks
if [ $all_passed -eq 1 ]; then
    echo "All checks passed."
else
    echo "Some checks failed."
fi
