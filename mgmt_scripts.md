## Linux Essentials - Practical exam management scripts

### Create accounts  
* input: student emails
* output: input file for newusers command
* Requirements for account:
  * six characters from the user's email's firstname.lastname part (dot and hyphen omitted)
  * should be distinct from the possible similar names in /etc/passwd by adding a distinguishable number
  * should be distinct from the possible similar names that are already generated during the execution by adding a distinguishable number
  
* Other requirements
  * /etc/passwd should contain the user's email as a comment in order to match it with other user data
  * users from certain class should be differentiable from other classes

### Create groups and assign students to different groups (teams)

### Create shared directories for student groups

### Enbale/Disable password based authentication

### Lock/Unlock student accounts for a specific class

### Check keybased authentication success

### Check file task success

### Inform students about the successful result
