#!/usr/bin/env bash
# --------------------------------------------------------------------
# explain_sbits_color.sh
# Pedagogical tool to visualize and explain setuid, setgid, and sticky bits.
# Aware of fs.protected_regular (values 0,1,2) and parent sticky directories.
# Added --verbose flag for side-by-side inspection.
# --------------------------------------------------------------------

# Colors and styles
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

VERBOSE=0
args=()

# Parse options
for arg in "$@"; do
    if [[ "$arg" == "--verbose" ]]; then
        VERBOSE=1
    else
        args+=("$arg")
    fi
done

set -- "${args[@]}"

# Check fs.protected_regular setting
if [[ -r /proc/sys/fs/protected_regular ]]; then
    PROT_REG=$(< /proc/sys/fs/protected_regular)
else
    PROT_REG="unknown"
fi

printf "${CYAN}──────────────────────────────────────────────${NC}\n"
printf " Kernel setting: ${BOLD}fs.protected_regular=${PROT_REG}${NC}\n"
case "$PROT_REG" in
    0)
        printf " → ${YELLOW}Classic sticky-bit behavior (no extra protection)${NC}\n"
        printf "   Non-owners may modify writable files even in sticky directories.\n"
        ;;
    1)
        printf " → ${GREEN}Hardened sticky-bit behavior is active${NC}\n"
        printf "   Non-owners cannot modify or truncate others' files in sticky directories.\n"
        ;;
    2)
        printf " → ${RED}${BOLD}Strict (Debian/Ubuntu extension) protection mode${NC}\n"
        printf "   Modification and truncation blocked for non-owners — even ${BOLD}root${NC} is restricted.\n"
        ;;
    *)
        printf " → ${YELLOW}Unknown or unsupported fs.protected_regular value${NC}\n"
        ;;
esac
printf "${CYAN}──────────────────────────────────────────────${NC}\n"

if [[ $# -eq 0 ]]; then
    printf "${YELLOW}Usage:${NC} $0 [--verbose] <file-or-directory> [...]\n"
    exit 1
fi

for target in "$@"; do
    printf "\n${CYAN}──────────────────────────────────────────────${NC}\n"
    if [[ ! -e "$target" ]]; then
        printf "${RED}Error:${NC} '%s' does not exist.\n" "$target"
        continue
    fi

    perms=$(stat -c "%A" "$target")
    owner=$(stat -c "%U" "$target")
    group=$(stat -c "%G" "$target")
    type=${perms:0:1}

    # Colorize permission string
    colorized="$perms"
    colorized="${colorized//s/${GREEN}s${NC}}"
    colorized="${colorized//S/${YELLOW}S${NC}}"
    colorized="${colorized//t/${GREEN}t${NC}}"
    colorized="${colorized//T/${YELLOW}T${NC}}"

    printf "${CYAN}Inspecting:${NC} %s\n" "$target"
    printf "Permissions : %b\n" "$colorized"
    printf "Owner       : %s\n" "$owner"
    printf "Group       : %s\n\n" "$group"

    # Verbose mode: display extended ACL and attributes
    if (( VERBOSE )); then
        printf "${CYAN}Extended attributes and ACL:${NC}\n"
        getfacl_output=$(getfacl -p "$target" 2>/dev/null | grep -v '^#')
        if [[ -n "$getfacl_output" ]]; then
            printf "%s\n" "$getfacl_output"
        else
            printf "  (no extended ACL entries)\n"
        fi
        lsattr_output=$(lsattr -d "$target" 2>/dev/null)
        if [[ -n "$lsattr_output" ]]; then
            printf "Attributes : %s\n" "$lsattr_output"
        fi
        printf "\n"
    fi

    # --- USER SETID (setuid, u+s or u+S) ---
    if [[ "${perms:3:1}" =~ [sS] ]]; then
        if [[ "${perms:3:1}" == "s" ]]; then
            if [[ "$type" == "d" ]]; then
                printf "${GREEN}${BOLD}User set-ID (setuid) bit on a directory:${NC}\n"
                printf "  → Ignored on Linux; directories do not support user-ID inheritance.\n"
            else
                printf "${GREEN}${BOLD}User set-ID (setuid) bit on a file:${NC}\n"
                printf "  → When executed, this program runs with the ${BOLD}user ID of the file’s owner (%s)${NC}.\n" "$owner"
                printf "  → Example: ${BOLD}/usr/bin/passwd${NC} runs as root even when executed by a normal user.\n"
            fi
        else
            printf "${YELLOW}${BOLD}Warning:${NC} User set-ID (setuid) bit is set (${YELLOW}S${NC}) but user execute (u+x) is missing.\n"
            printf "  → The file cannot be executed, so the setuid flag has no effect.\n"
        fi
        printf "\n"
    fi

    # --- GROUP SETID (setgid, g+s or g+S) ---
    if [[ "${perms:6:1}" =~ [sS] ]]; then
        if [[ "${perms:6:1}" == "s" ]]; then
            if [[ "$type" == "d" ]]; then
                printf "${GREEN}${BOLD}Group set-ID (setgid) bit on a directory:${NC}\n"
                printf "  → New files and subdirectories inherit the directory’s ${BOLD}group (%s)${NC}.\n" "$group"
                printf "  → Common for shared project or collaboration directories.\n"
            else
                printf "${GREEN}${BOLD}Group set-ID (setgid) bit on a file:${NC}\n"
                printf "  → When executed, this program runs with the ${BOLD}group ID of '%s'${NC}.\n" "$group"
                printf "  → Used by programs needing special group privileges (e.g., mail utilities).\n"
            fi
        else
            printf "${YELLOW}${BOLD}Warning:${NC} Group set-ID (setgid) bit is set (${YELLOW}S${NC}) but group execute (g+x) is missing.\n"
            printf "  → The setgid flag has no effect unless the file is executable.\n"
        fi
        printf "\n"
    fi

    # --- STICKY BIT (others t/T) ---
    if [[ "${perms:9:1}" =~ [tT] ]]; then
        if [[ "${perms:9:1}" == "t" ]]; then
            if [[ "$type" == "d" ]]; then
                printf "${GREEN}${BOLD}Sticky bit on a directory:${NC}\n"
                printf "  → Only a file’s owner (or root) can delete or rename it inside this directory.\n"
                printf "  → Typical example: ${BOLD}/tmp${NC}\n"
                if [[ "$PROT_REG" == "1" || "$PROT_REG" == "2" ]]; then
                    printf "  → Additionally, due to the kernel parameter ${BOLD}fs.protected_regular=${PROT_REG}${NC},\n"
                    if [[ "$PROT_REG" == "1" ]]; then
                        printf "    non-owners cannot modify or truncate others' files in this directory.\n"
                    else
                        printf "    even ${BOLD}root${NC} cannot modify or truncate others' files unless ownership matches.\n"
                    fi
                fi
            else
                printf "${GREEN}${BOLD}Sticky bit on a file:${NC}\n"
                printf "  → Historical: kept the program in swap for faster reuse.\n"
                printf "  → Obsolete and ignored on modern Linux systems.\n"
            fi
        else
            printf "${YELLOW}${BOLD}Warning:${NC} Sticky bit is set (${YELLOW}T${NC}) but others execute (o+x) is missing.\n"
            printf "  → The sticky flag has no effect unless the directory is world-executable.\n"
        fi
        printf "\n"
    fi

    # --- FILE INSIDE STICKY DIRECTORY CHECK ---
    if [[ "$type" != "d" ]]; then
        parent_dir=$(dirname "$target")
        parent_perms=$(stat -c "%A" "$parent_dir")
        if [[ "${parent_perms:9:1}" =~ [tT] ]]; then
            printf "${CYAN}Parent directory:${NC} %s\n" "$parent_dir"
            printf "Permissions     : %s\n" "$parent_perms"

            if (( VERBOSE )); then
                printf "${CYAN}Parent directory ACL:${NC}\n"
                parent_acl=$(getfacl -p "$parent_dir" 2>/dev/null | grep -v '^#')
                if [[ -n "$parent_acl" ]]; then
                    printf "%s\n" "$parent_acl"
                else
                    printf "  (no extended ACL entries)\n"
                fi
                printf "\n"
            fi

            printf "${GREEN}${BOLD}Effect:${NC} This file resides in a sticky directory.\n"
            printf "  → Only its owner (or root) can delete or rename it.\n"
            if [[ "$PROT_REG" == "1" || "$PROT_REG" == "2" ]]; then
                printf "  → Additionally, because of the kernel parameter ${BOLD}fs.protected_regular=${PROT_REG}${NC},\n"
                if [[ "$PROT_REG" == "1" ]]; then
                    printf "    non-owners cannot modify or truncate this file even if write permissions allow it.\n"
                else
                    printf "    even ${BOLD}root${NC} cannot modify or truncate this file unless they own it.\n"
                fi
            fi
            printf "\n"
        fi
    fi

    # --- If no special bits ---
    if [[ ! "${perms}" =~ [sStT] ]]; then
        printf "${CYAN}No special (s/t) bits set.${NC}\n\n"
    fi
done

printf "${CYAN}──────────────────────────────────────────────${NC}\n"
