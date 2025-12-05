~/.bin and ~/.local/bin are added to PATH by .profile script if they exist. The profile script is shell agnostic script that is run automatically in the login. 
```bash
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
````
**Extra**
### Bash Login Shell Initialization on Debian

#### 1. System-wide login initialization
When Bash is started as a **login shell**, it first reads:

1. `/etc/profile`
2. `/etc/profile.d/*.sh`  
   *(sourced indirectly through `/etc/profile`)*

---

#### 2. User login initialization
Bash then reads **the first existing and readable file** in the user's home directory:

1. `~/.bash_profile`
2. `~/.bash_login`
3. `~/.profile`

> Bash stops after the first file found.  
> So `~/.profile` is executed only if the first two do not exist.

---

#### 3. `.bashrc` and `.bash_aliases`
- Bash **does not automatically read `~/.bashrc`** for login shells.  
- On Debian/Ubuntu, `~/.bashrc` is typically sourced from the login file (`~/.bash_profile` or `~/.profile`):

