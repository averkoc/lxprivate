## This contains YAML file ideas that could be used to define checks for workshops 
To check workshop's status automatically in a user's VM the pass criterias should be defined. One idea is to use e.g YAML domain specific language to define checks. These YAML files could be saved in central server and the checking program running in students VM would retrieve the YAML when the checking is done. 
Checking process could be triggered e.g. by a user or systemd timer. Things to be checked: 1) directory/file existence and related ownerships/permissions/contents 2) Accounts/Group existence and memberships. For user generated directories files all before mentioned checks are relevant. For system files content checks are relevant. 
To keeps things managable for reviewing purposes user's accounts names follow rule based on student's firstname: firstname (sudo-rights), firstname1, firstname2, firstname3, firstname4, firstname5, firstname6.  

```yaml
# Workshop Check Specification v1.0
# Linux Essentials Course - Automated Workshop Validation
#
# Purpose: Define pass criteria for automated checking of student workshop results
# Usage: Checker program retrieves this YAML from central server and validates student's VM
# Trigger: Manual execution or systemd timer
#
# Design Principles:
# 1. Teacher-friendly: Minimal redundancy, clear structure, easy to maintain
# 2. Parser-friendly: Consistent types, predictable structure, simple implementation
# 3. Pattern-based: Leverage student naming convention (firstname, firstname1-6)
# 4. Compact: Use defaults and patterns to avoid repetition

# ============================================================================
# METADATA SECTION (Optional but recommended)
# ============================================================================
workshop:
  id: "ws3"
  title: "Shared directories for project groups"
  description: "Verify group collaboration setup with proper permissions"
  version: "1.0"
  author: "Instructor Name"
  created: "2024-12-08"

# ============================================================================
# EXECUTION CONFIGURATION (Optional)
# ============================================================================
execution:
  trigger_mode: "manual"              # manual | systemd_timer | both
  timeout: 300                        # Maximum execution time in seconds
  systemd_timer:                      # Only if trigger_mode includes systemd_timer
    schedule: "daily"
    time: "23:00"

# ============================================================================
# DEFAULTS SECTION - Reduces redundancy across all checks
# ============================================================================
defaults:
  # Variable substitution patterns
  # {account} = student's firstname (e.g., "alice")
  # {suffix} = user number suffix (e.g., "1", "2", "3")
  # {letter} = file letter suffix (e.g., "a", "b")
  base_user: "{account}"
  
  # Default permissions
  file_perms: "0644"                  # Default for regular files
  dir_perms: "0755"                   # Default for directories
  
  # Auto-infer owner from filename pattern
  # When owner_pattern is omitted, parser extracts expected owner from filename_pattern
  # Example: "alice1filea" with pattern "{account}{suffix}file{letter}" → owner "alice1"
  # Note: Actual file owner is ALWAYS validated against expected owner
  auto_infer_owner: true
  
  # Content checking defaults
  case_sensitive: true                # Content matching case sensitivity
  encoding: "utf-8"                   # File encoding for content checks
  
  # Check behavior
  required: true                      # All checks required by default (fail if missing)

# ============================================================================
# CHECKS SECTION - Main validation logic
# ============================================================================
# Each check must have:
#   - name: Human-readable description (for reporting)
#   - type: Check type (determines validation logic)
#   - required: true/false (optional, uses default if omitted)
#   - type-specific fields (see examples below)
#
# Check types:
#   - user: Verify user accounts exist
#   - group: Verify groups exist
#   - user_groups: Verify user group memberships
#   - directory: Verify directories with permissions/ownership
#   - file: Verify files with permissions/ownership/content

checks:
  
  # --------------------------------------------------------------------------
  # USER CHECKS - Verify user accounts exist
  # --------------------------------------------------------------------------
  # Validates that required user accounts have been created
  # Uses naming convention: firstname (sudo), firstname1-6 (regular users)
  
  - name: "workshop user accounts exist"
    type: user
    users:                            # List of users to check
      - "{account}"                   # Main sudo account (firstname)
      - "{account}1"                  # firstname1
      - "{account}2"                  # firstname2
      - "{account}3"                  # firstname3
      - "{account}4"                  # firstname4
      - "{account}5"                  # firstname5
      - "{account}6"                  # firstname6

  # --------------------------------------------------------------------------
  # GROUP CHECKS - Verify groups exist
  # --------------------------------------------------------------------------
  # Validates that required groups have been created
  
  - name: "project groups exist"
    type: group
    groups:                           # List of groups to check
      - teampub
      - teamsec
      - developers

  # Alternative: Single group check
  - name: "admin group exists"
    type: group
    group: admins                     # Single group (not a list)

  # --------------------------------------------------------------------------
  # USER_GROUPS CHECKS - Verify group memberships
  # --------------------------------------------------------------------------
  # Validates that users belong to required groups
  
  - name: "sudo user in collaboration groups"
    type: user_groups
    user: "{account}"                 # User to check (firstname)
    groups:                           # Groups user should belong to
      - teampub
      - teamsec
    mode: "all"                       # "all" = must be in ALL groups
                                      # "any" = must be in at least ONE group

  - name: "sudo user has admin privileges"
    type: user_groups
    user: "{account}"
    groups:
      - sudo
      - wheel
    mode: "any"                       # User must be in sudo OR wheel

  # Check multiple users' memberships
  - name: "users in teampub group"
    type: user_groups
    users:                            # Check multiple users (plural)
      - "{account}1"
      - "{account}2"
      - "{account}3"
    group: teampub                    # All must be in this group
    mode: "all"

  # --------------------------------------------------------------------------
  # DIRECTORY CHECKS - Verify directories with permissions/ownership
  # --------------------------------------------------------------------------
  
  # Single directory check
  - name: "teampub shared directory"
    type: directory
    path: "/shared/teampub"
    owner: "root"
    group: "teampub"
    perms: "2775"                     # SGID bit set (2000) + rwxrwxr-x

  # Multiple related directories
  - name: "shared project directories"
    type: directory
    items:
      - path: "/shared/teampub"
        owner: "root"
        group: "teampub"
        perms: "2775"                 # SGID for group inheritance
      
      - path: "/shared/teamsec"
        owner: "root"
        group: "teamsec"
        perms: "2770"                 # SGID, no world access
      
      - path: "/shared/public"
        owner: "root"
        group: "users"
        perms: "0755"

  # Pattern-based directory checks (most compact)
  - name: "user home directories"
    type: directory
    path_pattern: "/home/{account}{suffix}"
    owner_pattern: "{account}{suffix}"
    group_pattern: "{account}{suffix}"
    perms: "0750"
    suffixes: ["1", "2", "3", "4", "5", "6"]

  # --------------------------------------------------------------------------
  # FILE CHECKS - Verify files with permissions/ownership/content
  # --------------------------------------------------------------------------
  
  # Single file with full specification
  - name: "system configuration file"
    type: file
    scope: system                     # Optional label: system | user
    path: "/etc/sysctl.conf"
    owner: "root"
    group: "root"
    perms: "0644"
    matches:                          # Regex patterns (all must match)
      - "net\\.ipv4\\.ip_forward\\s*=\\s*1"
      - "kernel\\.hostname"
    not_matches:                      # These patterns must NOT match
      - "FIXME"
      - "TODO"
    min_size: 100                     # Minimum file size in bytes

  # Multiple similar files - items list approach
  - name: "team collaboration files"
    type: file
    scope: user
    base_path: "/shared/teampub"
    owner_prefix: "{account}"         # Owner: {account}{suffix}
    group: "teampub"
    items:
      - suffix: "1"                   # Creates: /shared/teampub/1file
        perms: "0664"
        contains:                     # Simple string search (all must exist)
          - "team collaboration"
          - "project alpha"
        min_size: 100
      
      - suffix: "2"
        perms: "0644"
        matches:                      # Regex patterns
          - "meeting.*notes"
          - "\\d{4}-\\d{2}-\\d{2}"   # Date format YYYY-MM-DD
      
      - suffix: "3"
        perms: "0666"

  # Pattern-based file checks with letter suffixes (MOST COMPACT)
  # This is optimal for student naming convention: firstname1filea, firstname1fileb
  - name: "user project files"
    type: file
    base_path: "/var/projects/teampubfiles"
    filename_pattern: "{account}{suffix}file{letter}"
    # owner_pattern omitted → auto-inferred as {account}{suffix}
    group: "teampub"
    perms: "0664"
    suffixes: ["1", "2", "3", "4", "5", "6"]
    letters: ["a", "b"]
    # This generates 12 file checks:
    # firstname1filea, firstname1fileb, firstname2filea, firstname2fileb, etc.

  # Advanced content validation
  - name: "application log file"
    type: file
    path: "/var/log/myapp/app.log"
    owner: "{account}"
    group: "adm"
    perms: "0640"
    matches:
      - "^\\[\\d{4}-\\d{2}-\\d{2}\\]"  # Lines start with [YYYY-MM-DD]
      - "Application started"
      - "Configuration loaded"
    min_size: 500
    min_lines: 20                     # File must have at least 20 lines
    max_age: 86400                    # File modified within 24 hours (seconds)

  # Bash history validation (common workshop requirement)
  - name: "required commands in bash history"
    type: file
    path: "/home/{account}/.bash_history"
    owner: "{account}"
    group: "{account}"
    perms: "0600"
    matches:
      - "sudo\\s+groupadd\\s+teampub"
      - "sudo\\s+mkdir.*shared"
      - "chmod\\s+2775"
      - "chgrp\\s+teamsec"
    case_sensitive: false             # Override default

  # Files that must NOT exist (cleanup verification)
  - name: "temporary files cleaned up"
    type: file
    must_not_exist: true
    paths:
      - "/tmp/workshop_temp.txt"
      - "/home/{account}/.backup"
      - "/home/{account}/temp.txt"

  # Content checks with both contains and not_contains
  - name: "secure configuration file"
    type: file
    path: "/etc/myapp/secure.conf"
    owner: "root"
    group: "root"
    perms: "0600"
    contains:
      - "encryption_enabled=true"
      - "security_level=high"
    not_contains:
      - "password="                   # No plaintext passwords
      - "debug_mode=true"
      - "INSECURE"

# ============================================================================
# IMPLEMENTATION NOTES FOR PARSER
# ============================================================================
#
# Check Type Dispatch:
#   1. Read check['type']
#   2. Call appropriate handler:
#      - "user"       → checkUsers()
#      - "group"      → checkGroups()
#      - "user_groups"→ checkUserGroups()
#      - "directory"  → checkDirectory()
#      - "file"       → checkFile()
#
# Variable Substitution (pre-processing):
#   - Replace {account} with student's firstname
#   - Replace {suffix} with user number (1-6)
#   - Replace {letter} with file letter (a, b, c, etc.)
#   - Simple string replacement, no complex templating
#
# Pattern Expansion:
#   For checks with suffixes/letters, generate individual checks:
#   - suffixes: ["1", "2"] → creates 2 checks
#   - letters: ["a", "b"] → creates 2 checks
#   - Both combined → creates 4 checks (1a, 1b, 2a, 2b)
#
# Auto-Infer Owner:
#   When owner_pattern omitted and auto_infer_owner is true:
#   1. Extract {account} and {suffix} from filename_pattern
#   2. Construct expected owner: "{account}{suffix}"
#   3. Validate actual file owner matches expected owner
#   4. Fail check if mismatch
#
# Check Variants per Type:
#   Each check type supports three patterns:
#   - Single: Direct specification (path, user, group)
#   - Multiple: items[] list
#   - Pattern: path_pattern + suffixes[] (most compact)
#
# Validation Order:
#   1. Parse YAML structure
#   2. Validate required fields per check type
#   3. Merge with defaults
#   4. Substitute variables ({account}, {suffix}, {letter})
#   5. Expand patterns into individual checks
#   6. Execute checks sequentially
#   7. Collect and report results
#
# Error Handling:
#   - Missing required fields → fail at parse time
#   - File/directory not found → fail check (unless must_not_exist)
#   - Permission mismatch → fail check
#   - Content not matching → fail check
#   - Group/user not found → fail check
#
# Complexity: O(n) where n = total expanded checks
# No recursion, no complex nesting, straightforward linear processing
#
# Estimated Parser Size:
#   - Core logic: ~200 lines
#   - Check handlers: ~150 lines
#   - Helpers: ~50 lines
#   - Total: ~400 lines (Go or Python)
#
# ============================================================================

# ============================================================================
# COMPLETE REALISTIC EXAMPLE
# ============================================================================
#
# workshop:
#   id: "ws3"
#   title: "Shared Project Directories"
#
# defaults:
#   base_user: "{account}"
#   auto_infer_owner: true
#
# checks:
#   # User accounts
#   - name: "users created"
#     type: user
#     users: ["{account}", "{account}1", "{account}2", "{account}3"]
#   
#   # Groups
#   - name: "groups created"
#     type: group
#     groups: ["teampub", "teamsec"]
#   
#   # Memberships
#   - name: "user memberships"
#     type: user_groups
#     user: "{account}"
#     groups: ["teampub", "teamsec"]
#     mode: "all"
#   
#   # Shared directories
#   - name: "shared directories"
#     type: directory
#     items:
#       - path: "/shared/teampub"
#         group: "teampub"
#         perms: "2775"
#       - path: "/shared/teamsec"
#         group: "teamsec"
#         perms: "2770"
#   
#   # User files with naming convention
#   - name: "team files"
#     type: file
#     base_path: "/var/projects/teampubfiles"
#     filename_pattern: "{account}{suffix}file{letter}"
#     group: "teampub"
#     perms: "0664"
#     suffixes: ["1", "2", "3"]
#     letters: ["a", "b"]
#     # Generates: firstname1filea, firstname1fileb, firstname2filea, etc.
#
# ============================================================================
````
