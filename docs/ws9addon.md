---
title: ""
layout: default
---

# Teaching Guide: Understanding Shell Scripts
## Using `createteamdir` as an Example

I asked Claude AI to generate a teaching guide that uses  the `createteamdir.sh` script as a means  to teach fundamental shell scripting concepts and best practices for students. Here is the result.  

---

## Part 1: Language Elements in Shell Scripts

### 1. The Shebang Line
```bash
#!/bin/bash
```
**Purpose**: Tells the system which interpreter to use (bash in this case)
**Teaching point**: Always start scripts with a shebang. Without it, the script runs in the default shell, which might not be bash.

### 2. Comments
```bash
# Script: createteamdir
# Purpose: Create shared directories for student projects
```
**Purpose**: Document what the script does
**Teaching point**: Good scripts include header comments explaining purpose, usage, and author information.

### 3. Variables
```bash
MODE="$1"           # Positional parameter (first argument)
TEAMNAME="$2"       # Positional parameter (second argument)
GROUPNAME="$TEAMNAME"  # Variable assignment from another variable
BASE_DIR="/var/projects"  # String literal
PROJECT_DIR="${BASE_DIR}/team${TEAMNAME}files"  # Variable expansion with braces
```

**Key concepts**:
- `$1`, `$2` = positional parameters (command-line arguments)
- `$#` = number of arguments passed
- `$0` = name of the script itself
- `${VAR}` = safer variable expansion (prevents ambiguity)
- Quote variables to handle spaces: `"$VAR"` not `$VAR`

### 4. Conditional Statements (if/then/else)
```bash
if [ $# -ne 2 ]; then
    echo "Usage: $0 <--default|--conf> <teamname>" >&2
    exit 1
fi
```

**Test operators demonstrated**:
- `[ $# -ne 2 ]` - numeric comparison (not equal)
- `[ -d "$PROJECT_DIR" ]` - file test (directory exists?)
- `[ "$EUID" -ne 0 ]` - numeric comparison
- `[[ $REPLY =~ ^[Yy]$ ]]` - pattern matching with regex

**Common test operators**:
- Numeric: `-eq`, `-ne`, `-lt`, `-gt`, `-le`, `-ge`
- String: `=`, `!=`, `-z` (empty), `-n` (not empty)
- File: `-f` (file exists), `-d` (directory), `-r` (readable), `-w` (writable), `-x` (executable)

### 5. Case Statement
```bash
case "$MODE" in
    --default)
        PERMS="2775"
        PERMS_DESC="rwxrwsr-x (standard)"
        ;;
    --conf)
        PERMS="2770"
        PERMS_DESC="rwxrws--- (confidential)"
        ;;
    *)
        echo "Error: Invalid mode" >&2
        exit 1
        ;;
esac
```

**Purpose**: Cleaner than multiple if/elif statements for pattern matching
**Structure**: `case VARIABLE in pattern) commands ;; esac`
**Teaching point**: The `*)` is the default case (like "else")

### 6. Pattern Matching with Regular Expressions
```bash
if ! [[ "$TEAMNAME" =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo "Error: Invalid team name" >&2
    exit 1
fi
```

**Regex breakdown**:
- `^` = start of string
- `[a-zA-Z0-9_-]+` = one or more letters, numbers, underscores, or hyphens
- `$` = end of string
- `!` = negation (if NOT matching)

### 7. Input/Output Redirection
```bash
echo "Error message" >&2      # Redirect to stderr
getent group "$GROUPNAME" >/dev/null 2>&1  # Suppress all output
```

**File descriptors**:
- `0` = stdin (standard input)
- `1` = stdout (standard output) 
- `2` = stderr (standard error)

**Operators**:
- `>` = redirect output (overwrites)
- `>>` = redirect output (appends)
- `2>&1` = redirect stderr to stdout
- `>/dev/null` = discard output

### 8. Exit Codes
```bash
exit 1    # Exit with error status
exit 0    # Exit with success status (implicit if not specified)
```

**Concept**: Every command returns an exit code (0 = success, non-zero = failure)
**Use**: Scripts should exit with appropriate codes so they can be used in pipelines or automation

### 9. Command Execution and Testing
```bash
if ! getent group "$GROUPNAME" >/dev/null 2>&1; then
    # Group doesn't exist
fi
```

**Pattern**: `if ! command; then` = "if command fails, then..."
**Teaching point**: Commands themselves can be test conditions

### 10. User Interaction
```bash
read -p "Group '$GROUPNAME' does not exist. Create it? (y/n): " -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    groupadd "$GROUPNAME"
fi
```

**read options**:
- `-p` = prompt string
- `-r` = raw input (don't interpret backslashes)
- Result stored in `$REPLY` variable (default) or specified variable

---

## Part 2: Best Practices Demonstrated

### 1. Error Handling with `set` Options
```bash
set -e  # Exit immediately if any command fails
set -u  # Treat unset variables as errors
```

**Why this matters**:
- Without `set -e`: Script continues after errors, potentially causing cascading failures
- Without `set -u`: Typos in variable names go unnoticed (`$TAEMNAME` silently becomes empty string)

**Alternative**: `set -euo pipefail` for even stricter error handling

### 2. Argument Validation
```bash
if [ $# -ne 2 ]; then
    echo "Usage: $0 <--default|--conf> <teamname>" >&2
    exit 1
fi
```

**Best practice**: Always validate input early
- Check number of arguments
- Provide helpful usage message
- Exit with error code if validation fails

### 3. Input Sanitization
```bash
if ! [[ "$TEAMNAME" =~ ^[a-zA-Z0-9_-]+$ ]]; then
    echo "Error: Team name must contain only letters, numbers, underscores, and hyphens" >&2
    exit 1
fi
```

**Security concern**: Prevents command injection and filesystem issues
**Example attack**: Without validation, team name `"; rm -rf /"` could be dangerous

### 4. Privilege Checking
```bash
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root or with sudo" >&2
    exit 1
fi
```

**Why**: Failing late (after starting work) is worse than failing early
**Teaching point**: Check prerequisites before attempting operations

### 5. Defensive Programming - Check Before Creating
```bash
if [ -d "$PROJECT_DIR" ]; then
    echo "Error: Directory '$PROJECT_DIR' already exists" >&2
    exit 1
fi
```

**Principle**: Prevent unintended consequences
**Alternative approach**: Could use `-p` with mkdir, but explicit checking provides better error messages

### 6. Clear Error Messages
```bash
echo "Error: Invalid mode '$MODE'" >&2
echo "Must be either --default or --conf" >&2
```

**Good error messages include**:
- What went wrong
- What was expected
- How to fix it
- Sent to stderr (>&2) not stdout

### 7. Safe Directory Creation
```bash
mkdir -p "$PROJECT_DIR"
```

**The `-p` flag**:
- Creates parent directories if needed
- Doesn't fail if directory exists (though we already checked)
- Makes scripts more robust

### 8. Quoting Variables
```bash
chown :"$GROUPNAME" "$PROJECT_DIR"   # GOOD
chown :$GROUPNAME $PROJECT_DIR       # BAD (breaks with spaces)
```

**Rule**: Always quote variables unless you specifically want word splitting
**Exception**: In `[[ ]]` double brackets, quoting is less critical

### 9. Meaningful Variable Names
```bash
PROJECT_DIR="${BASE_DIR}/team${TEAMNAME}files"  # Clear and descriptive
PERMS="2775"                                    # Abbreviated but contextual
```

**Balance**: Long enough to be clear, short enough to be readable

### 10. User Feedback
```bash
echo "✓ Directory created: $PROJECT_DIR"
echo "✓ Group owner: $GROUPNAME"
echo "✓ Permissions: $PERMS_DESC"
```

**Best practice**: Confirm what actions were taken
**Benefit**: Users can verify correct operation; useful for troubleshooting

### 11. Grouping Related Commands
```bash
# Create the directory (with parents)
mkdir -p "$PROJECT_DIR"

# Set group ownership
chown :"$GROUPNAME" "$PROJECT_DIR"

# Set permissions
chmod "$PERMS" "$PROJECT_DIR"
```

**Organization**: Logical blocks with comments make scripts maintainable

### 12. Graceful Degradation - Interactive Decisions
```bash
if ! getent group "$GROUPNAME" >/dev/null 2>&1; then
    read -p "Group '$GROUPNAME' does not exist. Create it? (y/n): " -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        groupadd "$GROUPNAME"
    else
        echo "Aborted: Group must exist to proceed" >&2
        exit 1
    fi
fi
```

**Pattern**: Don't fail silently; give users options when possible

---

## Common Pitfalls to Discuss

### 1. Unquoted Variables
```bash
DIR="/tmp/my files"
cd $DIR        # WRONG: changes to /tmp/my, ignores files
cd "$DIR"      # CORRECT: treats as single path
```

### 2. Not Checking Command Success
```bash
cd /important/directory
rm -rf *       # DANGEROUS if cd failed!

# BETTER:
cd /important/directory || exit 1
rm -rf *
```

### 3. Forgetting to Make Scripts Executable
```bash
chmod +x createteamdir    # Required before running ./createteamdir
```

### 4. Hardcoding Paths
```bash
BASE_DIR="/var/projects"  # OK for admin scripts
# For portable scripts, consider using $HOME or configurable variables
```

### 5. Not Using `set -u`
```bash
TAEMNAME="typo"           # Typo in variable name
echo "Team: $TEAMNAME"    # Prints "Team: " (empty) without error!
```

---

## Hands-On Exercises for Students

1. **Modify the script**: Add a `--help` option that displays usage information
2. **Add logging**: Make the script log all actions to `/var/log/createteamdir.log`
3. **Dry run mode**: Add a `--dry-run` option that shows what would happen without actually doing it
4. **Error recovery**: Add a rollback mechanism if group creation succeeds but directory creation fails
5. **Validation**: Add a check to ensure the team name isn't a system group name

---

## Discussion Questions

1. Why use `[[ ]]` instead of `[ ]` for pattern matching?
2. What happens if someone runs this script twice with the same team name?
3. Why redirect error messages to stderr instead of stdout?
4. What would happen without the `set -e` flag if `mkdir` failed?
5. How could you make this script work for both Linux and macOS?

---

## Key Takeaways

**For writing good scripts**:
1. Validate input early and fail fast
2. Use `set -e` and `set -u` for safety
3. Quote your variables
4. Check prerequisites before starting work
5. Provide clear error messages
6. Test edge cases (empty input, special characters, etc.)
7. Document your code with comments
8. Give users feedback about what's happening
9. Make scripts _Repeat-safe_ when possible (safe to run multiple times)
10. Think about security - especially with user input and elevated privileges
