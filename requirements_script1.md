
**My Requirement Description: Automating Student Account Creation**

1. **Objective**: Automate the creation of student accounts on a Linux server.
2. **Source Data**: Use easily accessible data that correlates each Linux account with a specific student. School email addresses are a suitable match for this purpose.
3. **Account Criteria**:
    - Account names should be relatively short (e.g., 6 characters).
    - Account names must adhere to Linux account rules (no dots, no hyphens).
    - Each account name must be unique.
    - Account names should be derived from the leftmost characters of the firstname.lastname@centria.fi email address.
    - Similar account names should be distinguished by appending a numeric suffix (starting from 1).
4. **Consider Existing Accounts**:
    - Take into account both accounts being created from the input file and existing accounts listed in /etc/passwd.
5. **Script Implementation**:
    - Develop a Bash script that accomplishes the above requirements.
    - The script should accept two arguments: the input filename and the starting UID.
    - Ensure the UID is greater than 1001.
    - Create usernames, generate random passwords, set home directories, and specify the shell.
    - Output the user information in the format required by the newusers command.
