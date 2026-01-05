---
layout: default
title: ""
--- 


# Linux Shell Workshop: Getting Started with the Command Line

**Workshop Duration:** ~90 minutes  
**Target:** Complete beginners  
**System:** Debian GNU/Linux with Bash shell

---

## Workshop Goals

By the end of this workshop, you will be able to:
* Understand what the Linux shell is and why it matters
* Navigate the filesystem confidently
* Create, view, copy, move, and delete files and directories
* Combine commands using conditional chaining
* Redirect input and output
* Connect commands using pipes to solve real problems

This workshop emphasizes **thinking in commands**, not memorization.

---

## 1. What Is the Shell (and Why It Matters)

### Purpose / Why It Matters

The **shell** is a program that lets you interact with the operating system using text commands.

System administrators use the shell because it is:
* Fast and precise
* Scriptable and automatable
* Available on every Linux system (including servers with no GUI)

Why Regular Users Should Learn It:  
the shell helps you what ever Linux or cloud system you are using:  

* Work faster: Rename 100 files in one command instead of clicking 100 times, convert image-files to different format while you do something else.
* Automate repetitive tasks
* Access powerful tools: Many programs only have command-line interfaces
* Future-proof your skills: The shell has existed for 50+ years and will outlive any GUI

The shell is essentially the "universal language" of Linux/Unix systems, making it one of the most portable skills in computing. Once you learn it, you can apply it across:

* All Linux distributions (Debian, Ubuntu, Fedora, Arch, etc.)
* Cloud platforms (EC2 instances on AWS, Compute Engine on GCP, VMs on Azure)
* macOS (which has a Unix-based terminal)
* Containers (Docker, Kubernetes)
* Essential for modern tech careers: DevOps, software development, data science, cybersecurity, and cloud engineering all require shell proficiency
* Embedded systems (Raspberry Pi, routers)
* WSL (Windows Subsystem for Linux)
* Etc

On Debian, the default interactive shell for users is **bash** (Bourne Again SHell).

---

### Core Concepts

* **Command**: a program you run (e.g., `ls`)
* **Arguments**: inputs to a command (e.g., `ls /etc`)
* **Options (flags)**: modify command behavior (e.g., `ls -l`)
* **Working directory**: your current location in the filesystem

---

### Your First Command

```bash
pwd
```

**Meaning:** "print working directory"  
It shows where you are in the filesystem.

**Try this now:** Open a terminal and type `pwd`, then press Enter.

---

### Understanding the Prompt

When you open a terminal, you'll see something like:

```bash
user@hostname:~$
```

Let's decode this:
- `user` - your username
- `hostname` - your computer's name
- `~` - your current location (your home directory)
- `$` - indicates you're a regular user (`#` would mean root/admin)

---

## 2. Navigating the Filesystem

### Purpose / Why It Matters

Everything in Linux is organized into a **single directory tree** starting at `/` (called the *root directory*).

You must be able to move around this tree to work with files.

---

### Core Concepts

Linux uses a **hierarchical tree structure**:

```
/                    (root of entire filesystem)
├── home/            (user home directories)
│   └── yourname/    (your personal space)
├── etc/             (system configuration files)
├── var/             (variable data: system and application data that changes over time.)
├── usr/             (user programs and data)
├── tmp/             (temporary files)
└── bin/             (essential command binaries)
```

**Important:** Debian (and most Linux systems) use forward slashes `/` for paths, unlike Windows which uses backslashes `\`.

---

### Special Path Symbols

These symbols are shortcuts you'll use constantly:

* `/` - Root of the entire filesystem (the very top)
* `.` - Current directory (where you are right now)
* `..` - Parent directory (one level up)
* `~` - Your home directory (e.g., `/home/yourname`)

**Example:**
```bash
pwd                  # shows: /home/yourname/documents
cd ..                # moves to: /home/yourname
cd ~                 # moves to: /home/yourname (from anywhere)
cd /                 # moves to: / (root)
```

---

### Key Commands

#### List files and directories

```bash
ls
```

**Common options:**
* `-l` - Long listing (permissions, size, owner)
* `-a` - Show hidden files (those starting with `.`)
* `-h` - Human-readable file sizes (with `-l`)

**Combined:**
```bash
ls -la
ls -lh
```

---

#### Change directory

```bash
cd /etc              # go to /etc
cd ..                # go up one level
cd                   # go to your home directory
cd ~                 # also goes home
cd -                 # go to previous location
```

---

### Practical Exercise

```bash
cd ~
pwd
ls
cd /etc
ls
cd ..
pwd
cd ~
```

**What happened?** You navigated from your home directory to `/etc`, then up to `/`, then back home.

---

### Common Beginner Mistakes

* Forgetting spaces between command and arguments (`cd/etc` won't work - use `cd /etc`)
* Confusing `/` (root) with `~` (home)
* Assuming file order has meaning (it usually does not)
* Typing `cd..` instead of `cd ..` (space matters!)

---

### Knowledge Check

**Question 1:** What does `cd ..` do?

<details>
<summary>Answer</summary>

Moves you up one directory level to the parent directory.
</details>

**Question 2:** What directory does `cd` with no arguments go to?

<details>
<summary>Answer</summary>

Your home directory (`~`), same as `cd ~`.
</details>

---

## 3. Creating and Managing Files and Directories

### Purpose / Why It Matters

Linux administration involves constant file manipulation: logs, configs, scripts, backups. You need to create, organize, copy, move, and delete files efficiently.

---

### Core Concepts

* Files and directories are separate objects
* Commands generally **do one thing well**
* Most commands do **not ask for confirmation** before acting
* **Deletion is permanent** - there is no trash bin

---

### Creating Directories

#### `mkdir` - Make directory

```bash
mkdir workshop
```

**Create nested directories:**
```bash
mkdir -p workshop/notes/day1
```

The `-p` flag creates parent directories as needed.

---

### Creating Files

#### `touch` - Create empty file or update timestamp

```bash
touch notes.txt
```

Creates an empty file called `notes.txt` (or updates its timestamp if it already exists).

**Create multiple files:**
```bash
touch file1.txt file2.txt file3.txt
```

---

### Copying Files and Directories

#### `cp` - Copy

```bash
cp notes.txt backup.txt              # copy file
cp notes.txt workshop/               # copy to directory
```

**Copy directories recursively:**
```bash
cp -r workshop workshop_backup
```

**Note:** The `-r` (recursive) flag is required for directories.

---

### Moving and Renaming

#### `mv` - Move or rename

```bash
mv notes.txt notes-old.txt           # rename file
mv notes-old.txt workshop/           # move to directory
```

**Important:** `mv` doesn't need `-r` for directories - it moves them as-is.

---

### Deleting Files and Directories

⚠️ **WARNING:** Deletion is permanent. There is no trash bin. Deleted = gone forever.

#### `rm` - Remove

```bash
rm backup.txt                        # delete file
rm -r workshop_backup                # delete directory and contents
rm -i important.txt                  # interactive mode (asks confirmation)
```

**NEVER run:** `rm -rf /` (this will attempt to destroy your entire system)

#### `rmdir` - Remove empty directory

```bash
rmdir emptydir
```

Only works on empty directories. Use `rm -r` for directories with contents.

---

### Practical Exercise

```bash
# 1. Create a practice environment
cd ~
mkdir -p workshop/files && cd workshop/files

# 2. Create some files
touch alpha.txt beta.txt gamma.txt

# 3. Copy a file
cp alpha.txt alpha_backup.txt

# 4. Rename a file
mv beta.txt beta_renamed.txt

# 5. Create a subdirectory and move a file
mkdir archive
mv gamma.txt archive/

# 6. List everything
ls -la
ls -la archive/

# 7. Clean up one file
rm alpha_backup.txt
```

---

### Common Beginner Mistakes

* Using `rm -r` without checking the path first
* Assuming `mv` copies files (it moves them - the original is gone)
* Forgetting `-r` when copying directories
* Not using `-i` (interactive mode) when learning `rm`

---

### Knowledge Check

**Question 1:** What is the difference between `cp` and `mv`?

<details>
<summary>Answer</summary>

`cp` creates a copy, leaving the original file in place.  
`mv` moves the file to a new location (or renames it) - the original is gone.
</details>

**Question 2:** Why is `rm` considered dangerous?

<details>
<summary>Answer</summary>

Because deletion is permanent - there's no "undo" or trash bin. Once deleted with `rm`, files are gone forever. This is especially dangerous with `rm -r` (recursive deletion) or when run as root.
</details>

---

## 4. Viewing File Contents

### Purpose / Why It Matters

Administrators read configuration files, logs, and command output constantly. You need efficient ways to view file contents without opening an editor.

---

### View Small Files

#### `cat` - Concatenate and display

```bash
cat notes.txt
```

Displays the entire file content at once. Good for small files.

**View multiple files:**
```bash
cat file1.txt file2.txt
```

---

### View Large Files (Recommended)

#### `less` - Page through file content

```bash
less /etc/services
```

**Navigation inside `less`:**
* `↑` / `↓` or `j` / `k` - Scroll line by line
* `Space` or `f` - Forward one page
* `b` - Backward one page
* `/text` - Search for "text"
* `n` - Next search result
* `q` - Quit

**Why use `less`?** It doesn't load the entire file into memory, making it perfect for large log files.

---

### View Beginning or End of Files

#### `head` - Show first lines

```bash
head notes.txt                       # first 10 lines
head -n 5 notes.txt                  # first 5 lines
```

#### `tail` - Show last lines

```bash
tail notes.txt                       # last 10 lines
tail -n 20 notes.txt                 # last 20 lines
tail -f /var/log/syslog              # follow (watch file grow)
```

**Tip:** `tail -f` is invaluable for watching log files in real-time. Press `Ctrl+C` to stop.

---

### Practical Exercise

```bash
# 1. Create a test file
cat > test.txt << EOF
Line 1
Line 2
Line 3
Line 4
Line 5
EOF

# 2. View entire file
cat test.txt

# 3. View first 2 lines
head -n 2 test.txt

# 4. View last 2 lines
tail -n 2 test.txt

# 5. View a system file with less
less /etc/passwd
# (press 'q' to quit)
```

---

### Common Beginner Mistakes

* Using `cat` on very large files (floods your screen)
* Forgetting how to exit `less` (it's `q`)
* Not using `tail -f` for watching live logs

---

## 5. Conditional Command Chaining

### Purpose / Why It Matters

Command chaining allows you to **control execution flow** without writing scripts. You can say: "Do this, and if it works, do that" or "Try this, and if it fails, do something else."

---

### Core Concepts

Linux commands return an **exit status** (also called exit code):
* `0` = success
* Non-zero (1, 2, etc.) = failure

You can use this to control which commands run next.

---

### Three Types of Chaining

#### `;` - Sequential (always run next)

Runs all commands regardless of success or failure:

```bash
cd /nonexistent ; pwd ; ls
```

All three commands will attempt to run, even though `cd` fails.

---

#### `&&` - AND (run next only if previous succeeded)

Run second command **only if first succeeds**:

```bash
mkdir testdir && cd testdir
```

If `mkdir` fails, `cd` won't run (preventing errors).

**Better example:**
```bash
cd /nonexistent && echo "Success!"
# "Success!" won't print because cd failed
```

```bash
cd /tmp && echo "Success!"
# "Success!" prints because cd succeeded
```

---

#### `||` - OR (run next only if previous failed)

Run second command **only if first fails**:

```bash
cd /nonexistent || echo "Directory not found"
# Prints message because cd failed
```

```bash
cd /tmp || echo "Directory not found"
# Nothing prints because cd succeeded
```

---

### Practical Examples

```bash
# Create directory and enter it (safe workflow)
mkdir myproject && cd myproject && echo "Ready to work!"

# Try command, report if it fails
rm important.txt || echo "File not found or couldn't delete"

# Sequential tasks regardless of outcome
echo "Starting..." ; ls ; echo "Done"

# Combining multiple conditions
cd /tmp && touch test.txt && echo "File created successfully"
```

---

### Practical Exercise

```bash
# 1. Test AND operator
cd /fakedir && echo "This won't print"

# 2. Test OR operator
cd /fakedir || echo "Directory doesn't exist"

# 3. Safe directory creation workflow
mkdir ~/testdir && cd ~/testdir && pwd

# 4. Sequential execution
echo "First" ; echo "Second" ; echo "Third"

# 5. Complex chain
cd ~ && mkdir -p test/subdir && cd test && ls -la
```

---

### Common Beginner Mistakes

* Using `;` when `&&` is intended (allows errors to propagate)
* Assuming chained commands run simultaneously (they run one after another)
* Forgetting that `||` runs on failure, not success

---

### Knowledge Check

**Question:** When would `&&` be safer than `;`?

<details>
<summary>Answer</summary>

Use `&&` when the second command only makes sense if the first succeeds. For example:

```bash
cd important_directory && rm *
```

With `&&`, if the `cd` fails, the `rm` won't run (preventing you from deleting files in the wrong directory).

With `;`, the `rm` would run even if `cd` failed - potentially disastrous!
</details>

---

## 6. Redirection (Input and Output)

### Purpose / Why It Matters

Redirection lets you **save output to files**, **reuse command results**, or **silence noisy commands**. This is essential for logging, automation, and data processing.

---

### Core Concepts

Every command has three data streams:

* **stdin (0)**: standard input (keyboard by default)
* **stdout (1)**: standard output (screen by default)
* **stderr (2)**: standard error messages (screen by default)

Redirection lets you control where these streams go.

---

### Output Redirection

#### `>` - Redirect stdout (overwrites)

```bash
ls -l > files.txt
```

Saves the output to `files.txt` (creates or **overwrites** the file).

⚠️ **Warning:** `>` will erase the file if it exists!

---

#### `>>` - Redirect stdout (appends)

```bash
ls -l >> files.txt
```

Adds output to the end of `files.txt` (creates file if it doesn't exist).

**Example:**
```bash
echo "Log entry 1" > log.txt
echo "Log entry 2" >> log.txt
echo "Log entry 3" >> log.txt
cat log.txt
```

---

#### `2>` - Redirect stderr (error messages)

```bash
ls /doesnotexist 2> errors.txt
```

Saves error messages to `errors.txt`, while normal output still goes to screen.

---

#### `&>` - Redirect both stdout and stderr

```bash
command &> output.txt
```

Saves both normal output and errors to the same file. (Bash shorthand)

**Alternative (older syntax):**
```bash
command > output.txt 2>&1
```

This means: "redirect stdout to `output.txt`, then redirect stderr to wherever stdout is going."

---

### Discarding Output

#### `/dev/null` - The black hole

```bash
ls /doesnotexist > /dev/null 2>&1
```

`/dev/null` is a special file that discards everything written to it. Use this to suppress all output.

---

### Input Redirection

#### `<` - Redirect stdin

```bash
sort < unsorted.txt
```

Reads from `unsorted.txt` instead of waiting for keyboard input.

---

### Practical Examples

```bash
# Save directory listing
ls -lh > directory_contents.txt

# Append date to log
date >> activity.log

# Save errors separately from output
command > output.txt 2> errors.txt

# Suppress all output
noisy_command > /dev/null 2>&1

# Combine multiple files
cat file1.txt file2.txt > combined.txt
```

---

### Practical Exercise

```bash
# 1. Create a file with command output
echo "Workshop Files" > inventory.txt

# 2. Append more content
ls >> inventory.txt
date >> inventory.txt

# 3. View the result
cat inventory.txt

# 4. Test error redirection
ls /root > out.txt 2> err.txt
cat err.txt

# 5. Suppress errors
ls /root 2> /dev/null
```

---

### Common Beginner Mistakes

* Using `>` when you meant `>>` (accidentally erasing files)
* Forgetting `2>` for error messages
* Not understanding that `>` creates/overwrites files without warning
* Redirecting to the same file you're reading from (causes unpredictable results)

---

### Knowledge Check

**Question:** What is the difference between `>` and `>>`?

<details>
<summary>Answer</summary>

`>` overwrites the file (creates it if it doesn't exist, erases it if it does).  
`>>` appends to the file (creates it if it doesn't exist, adds to end if it does).

**Rule of thumb:** Use `>>` for logs, use `>` when you want a fresh file.
</details>

---

## 7. Pipes: Connecting Commands

### Purpose / Why It Matters

Pipes allow you to build **powerful command chains** from simple tools. This is the Unix philosophy: each tool does one thing well, then you combine them to solve complex problems.

---

### Core Concepts

* The **pipe** symbol `|` sends stdout of one command to stdin of the next
* Commands run simultaneously (not sequentially like `;` or `&&`)
* Each command in the pipeline does one focused job
* You can chain as many commands as needed

**Mental model:** Think of data flowing through a pipeline, being transformed at each stage.

---

### Essential Commands for Pipes

#### `grep` - Search for patterns

```bash
grep "error" logfile.txt             # find lines containing "error"
grep -i "error" logfile.txt          # case-insensitive search
grep -v "debug" logfile.txt          # invert match (exclude lines)
```

#### `sort` - Sort lines

```bash
sort file.txt                        # alphabetically
sort -n file.txt                     # numerically
sort -r file.txt                     # reverse order
```

#### `uniq` - Remove duplicate lines

```bash
uniq file.txt                        # must be sorted first!
sort file.txt | uniq                 # proper usage
uniq -c file.txt                     # count occurrences
```

#### `wc` - Word count

```bash
wc file.txt                          # lines, words, characters
wc -l file.txt                       # just line count
wc -w file.txt                       # just word count
```

---

### Simple Pipe Examples

#### List files and search

```bash
ls /etc | grep ssh
```

Finds all files/directories in `/etc` containing "ssh".

---

#### Count files in directory

```bash
ls | wc -l
```

Counts how many items are in current directory.

---

#### Sort file list

```bash
ls -l | sort
```

Shows files sorted alphabetically.

---

### Practical Real-World Examples

#### Find how many users exist on the system

```bash
cat /etc/passwd | wc -l
```

(Note: `wc -l /etc/passwd` works too, but this demonstrates pipes)

---

#### Search command history

```bash
history | grep "mkdir"
```

Finds all times you used `mkdir`.

---

#### Find unique words in a file

```bash
cat file.txt | tr ' ' '\n' | sort | uniq
```

This pipeline:
1. Displays the file
2. Converts spaces to newlines (one word per line)
3. Sorts words
4. Removes duplicates

---

#### Count occurrences of each word

```bash
cat file.txt | tr ' ' '\n' | sort | uniq -c | sort -rn
```

Shows word frequency, most common first.

---

### Combining Pipes and Redirection

```bash
# Search, sort, and save results
grep "error" logfile.txt | sort | uniq > error_summary.txt

# Count matches and save
grep "failed" /var/log/auth.log | wc -l > failed_login_count.txt

# Complex pipeline with saved output
cat data.txt | grep "important" | sort | uniq > results.txt
```

---

### Practical Exercise

```bash
# 1. Create test data
cat > fruits.txt << EOF
apple
banana
apple
cherry
banana
apple
date
EOF

# 2. Count total lines
cat fruits.txt | wc -l

# 3. Find unique fruits
sort fruits.txt | uniq

# 4. Count each fruit (with frequency)
sort fruits.txt | uniq -c

# 5. Sort by frequency (most common first)
sort fruits.txt | uniq -c | sort -rn

# 6. Save sorted unique list
sort fruits.txt | uniq > unique_fruits.txt

# 7. Find files containing "txt"
ls | grep "txt"

# 8. Count .txt files
ls | grep ".txt" | wc -l
```

---

### Real-World System Administration Example

Find the top 10 largest files in a directory:

```bash
ls -lh | sort -k5 -hr | head -10
```

This pipeline:
1. Lists files with human-readable sizes
2. Sorts by 5th column (size) in reverse
3. Shows top 10

---

### Common Beginner Mistakes

* Confusing `|` (pipe) with `>` (redirect to file)
* Expecting pipes to include error output (they don't by default - only stdout flows through)
* Forgetting to sort before `uniq`
* Building overly complex pipes when a simpler command exists

---

### Knowledge Check

**Question:** What's the difference between these two commands?

```bash
ls > files.txt
ls | cat > files.txt
```

<details>
<summary>Answer</summary>

Both produce the same result in this case (saving `ls` output to `files.txt`).

The first is direct redirection (simpler, preferred).  
The second unnecessarily pipes through `cat` before redirecting.

**Lesson:** Use the simplest approach. Don't overcomplicate with unnecessary pipes.
</details>

---

## Final Mental Model

Think of working in the shell as:

* **Commands** are small, focused tools
* **Pipes** connect tools to transform data
* **Redirection** controls where data comes from and goes to
* **Chaining** controls which commands run based on success/failure

**The shell is about composing behavior** - combining simple pieces to solve complex problems.

---

## Bringing It All Together: Comprehensive Example

Let's create a complete workflow using everything you've learned:

```bash
# 1. Set up workspace
cd ~
mkdir -p workshop_final/data workshop_final/results && cd workshop_final

# 2. Create sample data
cat > data/inventory.txt << EOF
apple 5
banana 3
apple 2
cherry 8
banana 1
EOF

# 3. View the data
cat data/inventory.txt

# 4. Sort the data and save
sort data/inventory.txt > results/sorted.txt

# 5. Find unique items
cat data/inventory.txt | cut -d' ' -f1 | sort | uniq > results/unique_items.txt

# 6. Create backup
cp -r data/ data_backup/

# 7. Generate a report
echo "Inventory Report" > results/report.txt
echo "Generated: $(date)" >> results/report.txt
echo "---" >> results/report.txt
cat results/sorted.txt >> results/report.txt
echo "---" >> results/report.txt
echo "Total entries: $(cat data/inventory.txt | wc -l)" >> results/report.txt

# 8. View final report
cat results/report.txt
```

---

## Summary: Essential Commands Reference

| Command | Purpose | Common Options |
|---------|---------|----------------|
| `pwd` | Show current directory | - |
| `cd` | Change directory | `..` (up), `~` (home), `-` (previous) |
| `ls` | List files | `-l` (long), `-a` (all), `-h` (human) |
| `mkdir` | Create directory | `-p` (create parents) |
| `touch` | Create/update file | - |
| `cp` | Copy | `-r` (recursive for directories) |
| `mv` | Move/rename | - |
| `rm` | Remove | `-r` (recursive), `-i` (interactive) |
| `cat` | Display file | - |
| `less` | Page through file | `q` to quit |
| `head` | Show first lines | `-n` (number of lines) |
| `tail` | Show last lines | `-n` (number), `-f` (follow) |
| `grep` | Search text | `-i` (ignore case), `-v` (invert) |
| `sort` | Sort lines | `-n` (numeric), `-r` (reverse) |
| `uniq` | Remove duplicates | `-c` (count occurrences) |
| `wc` | Count lines/words | `-l` (lines), `-w` (words) |

---

## Operators Summary

| Operator | Purpose | Example | When to Use |
|----------|---------|---------|-------------|
| `;` | Sequential | `cmd1 ; cmd2` | Run all regardless |
| `&&` | AND | `cmd1 && cmd2` | Second only if first succeeds |
| `||` | OR | `cmd1 || cmd2` | Second only if first fails |
| `>` | Redirect output (overwrite) | `cmd > file` | Save output, fresh file |
| `>>` | Redirect output (append) | `cmd >> file` | Add to existing file |
| `2>` | Redirect errors | `cmd 2> file` | Save error messages |
| `<` | Redirect input | `cmd < file` | Read from file |
| `|` | Pipe | `cmd1 | cmd2` | Chain commands |

---

## Suggested Practice (Homework)

1. **Navigation drill:** Navigate between `/`, `/etc`, `/var/log`, and `~` ten times using different path styles (absolute and relative)

2. **File operations:** Create a mock project structure:
   ```
   ~/project/
   ├── src/
   ├── docs/
   ├── tests/
   └── README.txt
   ```

3. **Pipeline practice:** Download a text file or use `/var/log/syslog` and:
   - Count total lines
   - Find unique words
   - Count how many times "error" appears
   - Find the 10 most common words

4. **Redirection practice:** Create a script that:
   - Lists all `.txt` files
   - Counts them
   - Saves results to a report file with timestamp

5. **Command chaining:** Create safe workflows using `&&` for tasks like:
   - Create directory → enter it → create files
   - Check if file exists → process it → save results

---

## What's Next?

If you want to continue learning, the next workshop could cover:

* **Permissions and ownership** (`chmod`, `chown`, understanding `rwx`)
* **Searching with `find` and advanced `grep`**
* **Environment variables and configuration** (`$PATH`, `.bashrc`)
* **Text processing** (`sed`, `awk`, `cut`)
* **Basic shell scripting** (automating your workflows)

---

## Quick Reference Card

Save this for quick lookup:

```bash
# Navigation
pwd                  # where am I?
cd /path            # go somewhere
cd ..               # up one level
cd ~                # go home
ls -lah             # list everything

# Files
touch file          # create
cp src dst          # copy
mv old new          # move/rename
rm file             # delete
mkdir -p path       # make directories

# Viewing
cat file            # show small file
less file           # page through (q to quit)
head -n 5 file      # first 5 lines
tail -n 5 file      # last 5 lines

# Chaining
cmd1 ; cmd2         # always run both
cmd1 && cmd2        # second if first succeeds
cmd1 || cmd2        # second if first fails

# Redirection
cmd > file          # save output (overwrite)
cmd >> file         # save output (append)
cmd 2> file         # save errors
cmd | cmd2          # pipe to next command
```

---

