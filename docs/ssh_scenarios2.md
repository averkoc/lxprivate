---
title: ""
layout: default
---

## SSH -sessions related scenarios

This guide covers various scenarios you may encounter when working with SSH authentication.

### Your first connection to a server  

When you connect to a server using SSH for the first time, you might see a prompt like this:
````bash
alpine:~$ ssh student@debian
The authenticity of host 'debian (192.168.1.7)' can't be established.
ED25519 key fingerprint is SHA256:WLMyeSME9J6w0eeYBrvFzKCTVxX5DQWnQdquu13JnSY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
````
This prompt indicates that the server’s fingerprint is not yet in your ~/.ssh/known_hosts file. This is normal when connecting to a server for the first time. If you type yes, the fingerprint will be stored in your ~/.ssh/known_hosts file, and you won’t be asked this question again for future logins.  
Note: The same prompt will appear also when using ssh-copy-id in situation where you have not had any prior ssh logins to the server. 

## You have not copied your public key to a server and password based authentication is not allowed.  
**Permission denied (publickey)**  

````bash
alpine:~$ ssh student@debian
student@debian: Permission denied (publickey).
alpine:~$
````
Typically, production servers do not permit password-based authentication for security reasons. However, during practice exam, I temporarily enable password-based authentication for a short duration on my Linux server on Azure. This allows students to copy their public key to the server using ssh-copy-id from their own computers.

It’s important to note that if you have generated an SSH key pair on your computer but have not copied the public key to the server, you will encounter the above kind of message when trying to connect to server that allows only key-based authentication: 


### Remote host identification has changed  

````bash
alpine:~$ ssh student@debian
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ED25519 key sent by the remote host is
SHA256:GpJD/4nZBWlkigp6OGlhicF420ChcL7SQVo7heUFc8U.
Please contact your system administrator.
Add correct host key in /home/student/.ssh/known_hosts to get rid of this message.
Offending ED25519 key in /home/student/.ssh/known_hosts:1
Host key for debian has changed and you have requested strict checking.
Host key verification failed.
alpine:~$
````



When encountering the “Host key verification failed” message while trying to SSH into a remote server, follow these steps to resolve the issue:

**Understand the Warning:**
This message indicates that the host key for the server you’re trying to connect to has changed. This could be due to a legitimate change (like a server update) or a potential security threat (like a man-in-the-middle attack). In our course environment the reason for warning is typically server's IP change or hostname change.

**Verify the Host Key:**
In production environments contact your system administrator to verify if the host key change is expected. They can confirm if the server’s host key was updated for legitimate reasons.

**Remove the Old Host Key:**
If the change is legitimate, you need to remove the old host key from your known_hosts file. You can do this manually or using a command.
**In windows** you need to do this manually: Open the \.ssh\known_hosts file in a text editor and delete the line containing the old host key for the server. 
**In Linux** run the following command to remove the old host key:
`ssh-keygen -R debian`

After removing the old key, try connecting to the server again and the situation is like your first connection to server:  

````bash
alpine:~$ ssh student@debian
The authenticity of host 'debian (192.168.1.7)' can't be established.
ED25519 key fingerprint is SHA256:WLMyeSME9J6w0eeYBrvFzKCTVxX5DQWnQdquu13JnSY.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
````

## Other common scenarios and quick fixes

### You don't have an SSH key yet
Generate a modern key on your own machine.

- Linux/macOS (Terminal):
```bash
ssh-keygen -t ed25519 -C "student@yourmachine"
```
- Windows (PowerShell):
```powershell
ssh-keygen -t ed25519 -C "student@yourmachine"
```
Files are created under ~/.ssh (Linux/macOS) or %USERPROFILE%\.ssh (Windows).

---

#### Copy your public key to the server
- Linux/macOS:
```bash
ssh-copy-id student@debian
```
- Windows (PowerShell), if ssh-copy-id is not available:
```powershell
$type = Get-Content "$env:USERPROFILE\.ssh\id_ed25519.pub"; \
ssh student@debian "mkdir -p ~/.ssh && chmod 700 ~/.ssh && echo '$type' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
```

---

#### Permission denied (publickey)
Likely causes and fixes:
- No key on your machine yet → generate with ssh-keygen (above).
- Public key not on the server → copy it (above).
- Wrong username/host → double-check: `ssh student@debian`.
- Server uses non-default port → specify it: `ssh -p 22 student@debian`.
- Multiple keys; the wrong one is tried → pick a key explicitly:
```bash
ssh -i ~/.ssh/id_ed25519 student@debian
```

Optional config to always use a key:
```bash
mkdir -p ~/.ssh && chmod 700 ~/.ssh
cat >> ~/.ssh/config <<'EOF'
Host debian
    HostName debian
    User student
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
EOF
chmod 600 ~/.ssh/config
```

---

#### "Load key ...: bad permissions" or "unprotected private key" (Linux/macOS)
Fix local file permissions:
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub ~/.ssh/known_hosts 2>/dev/null || true
chmod 600 ~/.ssh/authorized_keys 2>/dev/null || true
```

Windows tip: Ensure only your user can read the private key. If issues persist on native Windows, try running the same steps inside WSL (Ubuntu on Windows).

---

#### Use the SSH agent (avoid re-typing passphrases)
- Linux/macOS:
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```
- Windows (PowerShell):
```powershell
# Start and enable the built-in ssh-agent
Get-Service ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent
ssh-add $env:USERPROFILE\.ssh\id_ed25519
```

---

#### Select a specific key when you have several
```bash
ssh -i ~/.ssh/id_work_ed25519 student@debian
```
Or add a Host block to ~/.ssh/config (see above) and simply run `ssh debian`.

---

#### Connection timed out / refused
- Check that the host is reachable (IP/hostname correct? VPN on?).
- Ensure the SSH service is running on the server: `sudo systemctl status ssh` or `sudo systemctl status sshd`.
- If the server uses a custom port, include it: `ssh -p 2222 student@debian`.
- Firewalls may block SSH; try from another network if unsure.

---

#### Fingerprint types and algorithms
- Modern default is ED25519. If you see messages about mismatched algorithms, your client or server may be outdated.
- Prefer ED25519 keys: `ssh-keygen -t ed25519`.

---

#### Increase verbosity when troubleshooting
See exactly what SSH is trying:
```bash
ssh -v student@debian        # verbose
ssh -vv student@debian       # more
ssh -vvv student@debian      # most
```


