
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

