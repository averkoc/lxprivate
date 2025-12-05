
## Preparing to practical exam

The exam tests your understanding and practice skills about ssh key-based authentication and file permissions. Besides these you need basic command shell skills. 
Instructions interpreting are also needed like in all exams :)

### Setting up key-based configuration to remote server  
You need first generate key-pair in your local computer using `keygen` command. Then you copy the generated public key to server using `ssh-copy-id` command.
Both of these command you execyte in your local computer. The `ssh-copy-id` program connects to server asking your password and copies the public key to ~/.ssh/authorized_keys file in the server. 

### File permissions an ownerships  
"I have created" a [file permission simulator](perms.md) 





 
