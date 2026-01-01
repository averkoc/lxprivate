Windows doesn't have the ssh-copy-id command. If you generated the keys in Windows and need to copy the public key to server,  
you can use the following one-liner.  It copies the public key to your home directory in the remote server.  

````bat
type  .\.ssh\id_ed25519.pub | ssh student@serverdomainname "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys"  
````
Replace **id_ed25519**, **student** and **serverdomainname** with your own values (the id_ed25519 is the default if there are no prior keys in windows) 


> **I recommend that you use Linux Desktop or even your local Linux server to generate keys and copy the public key to the remote server. It is much less errorprone than using the long command above, which you need to modify according to your values.  One good option is to install WSL to your windows and use it if you don't want use your local Linux VMs from some reason.**

