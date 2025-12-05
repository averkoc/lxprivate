
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

