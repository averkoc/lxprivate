---
title: ""
layout: default
---



### Shared Directory Permission Alternatives Overview – Special Bits Included

This section compares three common approaches for managing **team-shared directories** in Linux environments.  
User memberships are defined as follows:

- **john1, john2, john3** → members of **team1**  
- **john3, john4** → members of **team3** and **team4**

We can use the following **descriptive (non-official)** names for the alternatives:
- **First - Solo Shared Directory** – simple shared space, no special bits.  
- **Second - Co-operative Shared Directory** – group-coordinated with `setgid`.  
- **Third - Protected Shared Directory** – secure collaboration with both `setgid` and `sticky bit`.

---

### Team Directory Permissions Summary

| **Team** | **Directory** | **Permission** | **Group Owner** | **Members can create files** | **New files’ group** | **Members can modify others’ files** | **Members can delete/rename others’ files** |
|-----------|----------------|----------------|------------------|-------------------------------|----------------------|--------------------------------------|----------------------------------------------|
| team1 | `team1files` | `drwxrwxr-x`  | team1 | Yes | Creator’s primary group | No (group may differ) | Yes |
| team2 | `team2files` | `drwxrwsr-x`  | team2 | Yes | `team2` (via setgid) | Yes (if group-writable) | Yes |
| team3 | `team3files` | `drwxrwsr-t`  | team3 | Yes | `team3` (via setgid) | Yes/**No** * | No (sticky bit prevents) |

---

### Notes
- `setgid` bit (`s` in group) ensures new files inherit the directory’s group, supporting consistent team ownership.  
- `sticky bit` (`t`) prevents users from deleting or renaming files they do not own.  
- Group write permission allows team members to modify shared files, if file permissions permit.  
- \* Kernel hardening may prevent even modification by others when the sticky bit is set — **this is the default on many modern Linux distributions.**
