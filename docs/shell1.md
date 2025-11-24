---
title: ""
layout: default
---

## 🧪 Linux Shell - introductory walkthrough

Welcome to the Linux Shell introductory walkthrough! These mini tasks are designed to give you hands-on experience with basic and intermediate shell commands besides the introduction we have on session.

---

#### 🔹 1. Basic Navigation & File Management
```bash
# List all files (including hidden ones) in your home directory
ls -la ~

# Create a new directory called lab1 and move into it
mkdir lab1 && cd lab1

# Create three empty files named alpha.txt, beta.txt, and gamma.txt
touch alpha.txt beta.txt gamma.txt
```

#### 🔹 2. Redirection and viewing file content
```bash
# Write the phrase "Hello Linux" into alpha.txt
echo "Hello Linux" > alpha.txt

# Append the current date to alpha.txt
date >> alpha.txt

# View the contents of alpha.txt
cat alpha.txt
````

#### 🔹 3. Conditional Command Chaining
```bash

# Search for the word "error" in beta.txt, and if not found, print a message
grep "error" beta.txt || echo "No errors found"

# Check if a file exists and print a message accordingly
[ -f report.txt ] && echo "Report found." || echo "Report missing."
````

#### 🔹 4. Pipes & Sorting
```bash
# List all files in /etc, filter those containing "conf", and sort them
ls /etc | grep "conf" | sort

# Count how many .txt files exist in your current directory
ls *.txt | wc -l
````

#### 🔹 5. Permissions & Execution
```bash
# Create a script file called hello.sh that prints "Welcome to Linux <username>"
echo 'echo "Welcome to Linux $USER"' > hello.sh
chmod +x hello.sh
./hello.sh

````
#### Linux shell globbing (wildcards) examples

| #  | Pattern    | Description                           | Example Command   | Matches / Effect                    |
|----|------------|--------------------------------------|------------------|------------------------------------|
| 1  | `*`        | Matches any number of characters      | `ls *.txt`       | All files ending in `.txt`         |
| 2  | `?`        | Matches exactly one character         | `ls file?.log`   | `file1.log`, `fileA.log`           |
| 3  | `[abc]`    | Matches any one character in brackets | `ls report[12].*`| `report1.txt`, `report2.pdf`       |



### Nice to Know: History, Bash Completion, Brace expansion

| #  | Feature              | Key/Command          | What It Does / Example Use                          |
|----|---------------------|----------------------|-----------------------------------------------------|
| 1  | Browse history      | ↑ / ↓ (arrow keys)   | Cycle through previously entered commands           |
| 2  | Search history      | Ctrl+ r + text        | Reverse search: find and reuse a previous command   |
| 3  | Repeat last command | !!                   | Executes the last command again                     |
| 4  | Tab completion      | Tab         | Auto-complete file or command names|
 | 5  | Brace expansion  | cp {jan,feb}.csv backup/ | Expands to `cp jan.csv feb.csv backup/` before execution |

