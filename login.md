### Behind the Scenes: Linux Login related scripts and other files

| File | Description | Execution |
|---|---|---|
| `/etc/profile` | Sets environment variables for all users | Once per login session |
| `/etc/profile.d/*.sh` | Contains shell scripts for additional setup | Once per login session |
| `~/.bash_profile` | Sets environment variables for the user | Once per login session |
| `~/.bashrc` | Contains shell functions and aliases | For every new shell instance |
| `~/.bash_aliases` | Contains aliases for the user's shell | For every new shell instance |
| `/etc/motd` | Displays a message of the day | Once per login session |
