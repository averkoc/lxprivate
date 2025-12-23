### Session commands directly to .bash_history 
Put the following either to `/etc/profile` or `/etc/profile.d/` with some descriptive name.  
PROMPT_COMMAND is a special variable where you can put commands that bash execute just before it shows prompt again. It can contain multiple commands.
The ` PROMPT_COMMAND="history -a; $PROMPT_COMMAND"` just appends the immediate writing to history in the from of possible existing commands in PROMPT_COMMAND variable.


```bash
# Append to history file after every command
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
    
# Ensure sessions append rather than overwrite
shopt -s histappend
    
# Optional: Increase history capacity for these users
export HISTSIZE=10000
export HISTFILESIZE=20000
````
