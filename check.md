
````yaml
# This is check definitions for "ws3 shared directories for project groups "sudo .\check account" uses this
# with hardcoded name expected_projects.yaml  
projects:
  teampubfiles:
    group: "teampub"
    files:
      - name: "1file"
        ownerSuffix: "1"
        group: "teampub"
        permissions: "0664"
  teamsecfiles:
    group: "teamsec"
    files:
      - name: "4file"
        ownerSuffix: "4"
        group: "teamsec"
        permissions: "0664"
````


```yaml
# Example how requirement that file contains strings could be presented  
projects:
  teampubfiles:
    group: "teampub"
    files:
      - name: "1file"
        ownerSuffix: "1"
        group: "teampub"
        permissions: "0664"
        contains:
          - "Successfully completed"
          - "User login"
````

Claude enhancement ideas

```yaml
ws3_shared_directories:
  groups:
    - name: teampub
    - name: teamsec
  
  directories:
    - path: /shared/teampub
      group: teampub
      perms: "2775"
    - path: /shared/teamsec
      group: teamsec
      perms: "2770"
  
  files:
    - path: /shared/teampub/{suffix}file
      owner: "{account}{suffix}"
      group: teampub
      perms: "0664"
      suffixes: [1, 2, 3]
    
    - path: /shared/teamsec/{suffix}file
      owner: "{account}{suffix}"
      group: teamsec
      perms: "0664"
      suffixes: [4, 5]
````
More descriptive  

```yaml
# Workshop 3: Shared directories for project groups
# Usage: ./check <account> expected_projects.yaml

workshop:
  id: "ws3"
  title: "Shared directories for project groups"
  description: "Verify group collaboration setup with proper permissions"

# Global defaults (can be overridden per check)
defaults:
  baseUser: "${ACCOUNT}"  # Will be substituted with the account parameter
  permissions:
    file: "0664"
    directory: "0775"

checks:
  - name: "teampub group exists"
    type: group
    group: teampub
    required: true

  - name: "teamsec group exists"
    type: group
    group: teamsec
    required: true

  - name: "teampub shared directory"
    type: directory
    path: "/shared/teampub"
    group: teampub
    permissions: "2775"  # SGID bit
    required: true

  - name: "teamsec shared directory"
    type: directory
    path: "/shared/teamsec"
    group: teamsec
    permissions: "2770"  # SGID bit, no world access
    required: true

  - name: "teampub files"
    type: file
    items:
      - path: "/shared/teampub/1file"
        owner: "${ACCOUNT}1"  # Variable substitution
        group: teampub
        permissions: "0664"
      - path: "/shared/teampub/2file"
        owner: "${ACCOUNT}2"
        group: teampub
        permissions: "0664"

  - name: "teamsec files"
    type: file
    items:
      - path: "/shared/teamsec/4file"
        owner: "${ACCOUNT}4"
        group: teamsec
        permissions: "0664"

  - name: "check file contents"
    type: content
    items:
      - path: "/shared/teampub/1file"
        contains:
          - "team collaboration"
          - "shared resource"
        encoding: "utf-8"
      
  - name: "user group memberships"
    type: user_groups
    user: "${ACCOUNT}"
    groups:
      - teampub
      - teamsec
    mode: "any"  # or "all"
````
```yaml
# Workshop Check Specification
# This YAML defines validation checks for Linux Essentials course workshops
# Usage: ./check <account> <yaml_file>

# Workshop metadata (optional but recommended)
workshop:
  id: "ws3"
  title: "Shared directories for project groups"
  description: "Verify group collaboration setup with proper permissions"

# Global defaults - these apply to all checks unless overridden
# Use {account} for variable substitution with the account parameter
defaults:
  base_user: "{account}"           # Default user for ownership checks
  file_perms: "0644"               # Default file permissions
  directory_perms: "0755"          # Default directory permissions
  encoding: "utf-8"                # Default file encoding for content checks
  case_sensitive: true             # Default for content matching

# Main checks section - list of validation checks to perform
checks:
  
  # Check 1: Verify a group exists in the system
  - name: "teampub group exists"
    type: group
    group: teampub                 # Group name to check
    required: true                 # Fail if missing (default: true)

  - name: "teamsec group exists"
    type: group
    group: teamsec

  # Check 2: Verify user group memberships
  - name: "user in collaboration groups"
    type: user_groups
    user: "{account}"              # User to check (uses default base_user)
    groups:
      - teampub
      - teamsec
    mode: "all"                    # Options: "all" (user in all groups) or "any" (user in at least one)

  # Check 3: Verify directories exist with correct permissions
  - name: "teampub shared directory"
    type: directory
    path: "/shared/teampub"
    owner: "root"                  # Optional: check owner
    group: "teampub"               # Optional: check group
    perms: "2775"                  # Permissions (SGID bit set: 2775)
    required: true

  - name: "teamsec shared directory"
    type: directory
    path: "/shared/teamsec"
    group: "teamsec"
    perms: "2770"                  # SGID bit, no world access

  # Check 4: Verify individual files with full specifications
  - name: "configuration file"
    type: file
    path: "/etc/myapp/config.conf"
    owner: "root"
    group: "root"
    perms: "0644"
    contains:                      # Content checks (all strings must be present)
      - "server_enabled=true"
      - "port=8080"
    min_size: 50                   # Minimum file size in bytes

  # Check 5: Multiple similar files using items list
  - name: "teampub collaboration files"
    type: file
    base_path: "/shared/teampub"   # Base directory for all items
    owner_prefix: "{account}"      # Owner pattern: {account}{suffix}
    group: "teampub"               # Common group for all items
    items:
      - suffix: "1"                # Creates path: /shared/teampub/1file
        perms: "0664"              # Specific permissions for this file
        contains:                  # Optional content check
          - "team collaboration"
          - "project alpha"
      
      - suffix: "2"
        perms: "0644"
        contains:
          - "meeting notes"
        min_size: 100              # This file must be at least 100 bytes
      
      - suffix: "3"
        perms: "0666"              # No content check for this file

  # Check 6: Files with "not_contains" validation
  - name: "teamsec secure files"
    type: file
    base_path: "/shared/teamsec"
    owner_prefix: "{account}"
    group: "teamsec"
    items:
      - suffix: "4"
        perms: "0660"
        contains:
          - "confidential"
      
      - suffix: "5"
        perms: "0640"
        not_contains:              # These strings must NOT be present
          - "TODO"
          - "FIXME"
          - "password123"

  # Check 7: Single file with advanced content checks
  - name: "application log file"
    type: file
    path: "/var/log/myapp/app.log"
    owner: "{account}"
    group: "adm"
    perms: "0640"
    contains:
      - "Application started"
      - "Configuration loaded"
    min_size: 200
    min_lines: 10                  # File must have at least 10 lines

  # Check 8: History file check (common workshop requirement)
  - name: "bash history contains commands"
    type: file
    path: "/home/{account}/.bash_history"
    owner: "{account}"
    group: "{account}"
    perms: "0600"
    contains:
      - "sudo groupadd"
      - "sudo mkdir"
      - "chmod"

    case_sensitive: false          # Override default for this check

  # Check 9: Multiple files with different owners but same pattern
  - name: "user home directories"
    type: directory
    items:
      - path: "/home/{account}1"
        owner: "{account}1"
        group: "{account}1"
        perms: "0750"
      
      - path: "/home/{account}2"
        owner: "{account}2"
        group: "{account}2"
        perms: "0750"

  # Check 10: Files that should NOT exist
  - name: "temporary files cleaned up"
    type: file
    path: "/tmp/workshop_temp.txt"
    must_not_exist: true           # Check passes if file does NOT exist

 # Check 11: Regex based contains
 - name: "apache access log"
  type: file
  path: "/var/log/apache2/access.log"
  
  # Simple string search (still supported for ease of use)
  contains:
    - "GET"
    - "POST"
  
  # Regex patterns (more powerful)
  matches:
    - "200.*GET /api/login"              # 200 followed by GET /api/login on same line
    - "ERROR.*database.*connection"       # All three on same line, in order
    - "\\b(started|stopped)\\b"          # Word boundary match
    - "^Port \\d+"                        # Line starts with "Port" followed by numbers
  
  not_matches:
    - "FATAL"                             # Must not contain this pattern
    - "password\\s*=\\s*['\"].*['\"]"   # No plaintext passwords # Matches log line: "192.168.1.1 - - [date] "GET /api/login HTTP/1.1" 200 1234 Mozilla/5.0..."

# Example of a complete workshop check file
# This covers typical Linux Essentials scenarios:
# - Group management
# - Directory permissions and ownership
# - File permissions and ownership
# - Content validation
# - User group memberships
# - Cleanup verification

````

