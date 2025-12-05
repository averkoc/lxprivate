
## Preparing for the Practical Exam

The practical exam tests your understanding and hands-on skills with SSH key-based authentication and file permissions. You will also need basic command-line skills. As with all exams, the ability to correctly interpret instructions is important.

### Setting up Key-Based Authentication on a Remote Server
First, generate an SSH key pair on your local computer using the `ssh-keygen` command.  
Next, copy the generated public key to the server using the `ssh-copy-id` command.

Both commands are executed on your local machine.  
The `ssh-copy-id` program connects to the server, prompts you for your password, and copies your public key into the server’s `~/.ssh/authorized_keys` file.

### File Permissions and Ownership
"AI" have created a [file permission simulator](perms.html) that you can use to explore and experiment with how file ownership (user and group) affects what different users can do with a file.

You can select which user you are logged in as and then check what permissions you have for various files. If the selected account is the file owner, you can also change file permissions using the `chmod` command.
