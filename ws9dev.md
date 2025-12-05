## Scripting workshop update  
* screen clip where the script is started just by issuing `startdemo.sh` instead of `./startdemo.sh` in home directory. 
* possible: screen clip that shows the execution of some of the example scripts

### How ~./bin was added automatically to PATH  

below is an excerpt from ~/.profile script that is executed automatically in user login:  

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

