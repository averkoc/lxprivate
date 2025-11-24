## Scripting - activities

**Background**  
<br>In Chapter 11, 'Basic Scripting,' you learned that a script is a text file containing executable commands. In addition to commands, a script file can include variables and control statements such as if statements and loops. Scripts are used to automate repetitive tasks. Later, we will have a case study where I present the use of scripts to automate the management of practical exams.

In this activity, you will be introduced to creating scripts. We develop some scripts related to the activities you have completed during this course.



### Script1 (automate the start of mqttdemo)
* Create a script startdemo.sh that starts your demo.py mqtt application in its virtual environment. To be able to create scripts like this is enough for many users.

### Script2  (walkthrough 4 checking script)
* Create a script wt4check1.sh that tests whether directories /var/projects/teampub and /var/projects/teamsec exists. It should print the existence status for both directories.
    
  ![image](https://github.com/user-attachments/assets/ec422350-9af5-4ef7-86af-837f91d598ed)




* Create a script wt4check2.sh that tests whether directories /var/projects/teampub and /var/projects/teamsec exists and have correct group owners and permissions. The script returns non-zero value if some of the directory requirements are not met. This script could be called e.g by a master test script that executes many subtests and prints Pass/Fail status for each. To test this script you can use e.g. the following:

  ![image](https://github.com/user-attachments/assets/b3736eeb-7a8d-48d1-988f-800eba87c3dd)


### Script3  (script to create a shared directory for a group)
* Create a script mkdir_shared1.sh that could be used to create a shared directory for a specific group. The script takes two arguments: the directory path and group owner. Permissions should be rwxrwsr-x.
* Create a script mkdir_shared2.sh that you can use to create a shared directory for a specific group. The script takes three arguments: the directory path, permissions in numeric form and group owner.  If the creation succeeds, it lists the created directory using ls -ld command.

  ![image](https://github.com/user-attachments/assets/1fc94eea-065f-435b-a158-a96fd4c05e21)



 

### General script related things  
  * [user environment related scripts and files](login.md)
  * hashbang (shebang) row to select a correct shell
  * variables
  * control statements
  * return value
  * x permission to make it executable
  * differencences between `./startdemo.sh`   `bash ./startdemo.sh`  `source ./startdemo.sh`
  * debugging
  * location
