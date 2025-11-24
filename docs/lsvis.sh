#!/usr/bin/env bash

# Role-based color codes
OWNER_COLOR='\033[0;36m'   # Cyan for owner
GROUP_COLOR='\033[0;33m'   # Yellow for group
OTHER_COLOR='\033[0;35m'   # Magenta for others
NC='\033[0m'               # Reset
echo -e "\033[1m🔍 lsvis.sh – permissions visualizer for ${OWNER_COLOR}Owner (u) ${GROUP_COLOR}Group (g) ${OTHER_COLOR}Others (o)\033[0m"

# Help message
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Usage: $0 [file|directory|pattern ...]"
    echo "Visualizes file permissions with color-coded roles:"
    echo "  - Cyan for owner"
    echo "  - Yellow for group"
    echo "  - Magenta for others"
    exit 0
fi

# Default to current directory if no args
TARGETS=("$@")
if [[ ${#TARGETS[@]} -eq 0 ]]; then
    TARGETS=(".")
fi

for target in "${TARGETS[@]}"; do
    if [[ ! -e "$target" ]]; then
        echo "No such file or directory: $target"
        continue
    fi

    # Read raw `ls -l` output into an array
    if [[ -d "$target" ]]; then
        mapfile -t lines < <(ls -l --color=never "$target" | tail -n +2)
    else
        mapfile -t lines < <(ls -l --color=never "$target")
    fi

    # Compute max visible widths for owner and group
    owner_max=0
    group_max=0
    for line in "${lines[@]}"; do
        owner=$(awk '{print $3}' <<< "$line")
        group=$(awk '{print $4}' <<< "$line")
        (( ${#owner} > owner_max )) && owner_max=${#owner}
        (( ${#group} > group_max )) && group_max=${#group}
    done

    # Print each line with manual padding
    for line in "${lines[@]}"; do
        perms=$(awk '{print $1}'     <<< "$line")
        owner=$(awk '{print $3}'     <<< "$line")
        group=$(awk '{print $4}'     <<< "$line")
        rest=$(cut -d' ' -f5-        <<< "$line")

        # Extract bit-triplets
        user_bits="${perms:1:3}"
        group_bits="${perms:4:3}"
        other_bits="${perms:7:3}"

        # Colorize permission bits
        colored_perms="${perms:0:1}"\
"${OWNER_COLOR}${user_bits}${NC}"\
"${GROUP_COLOR}${group_bits}${NC}"\
"${OTHER_COLOR}${other_bits}${NC}"

        # Calculate padding for visible text
        pad_owner=$(printf '%*s' $((owner_max - ${#owner})) '')
        pad_group=$(printf '%*s' $((group_max - ${#group})) '')

        # Colorize names and append padding
        colored_owner="${OWNER_COLOR}${owner}${NC}${pad_owner}"
        colored_group="${GROUP_COLOR}${group}${NC}${pad_group}"

        # Final aligned, colorized output
        echo -e "${colored_perms} ${colored_owner} ${colored_group} ${rest}"
    done
done
