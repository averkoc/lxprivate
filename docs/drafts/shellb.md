---
layout: default
title: ""
---


# Linux Shell Workshop: Getting Started with the Command Line

**Workshop Duration:** ~90 minutes  
**Target:** Complete beginners  
**System:** Debian GNU/Linux with Bash shell

---

## Workshop Overview

By the end of this workshop, you'll be able to:
- Navigate the Linux filesystem confidently
- Understand what commands are and how they work
- Chain commands together intelligently
- Create, move, copy, and delete files
- Redirect command output to files
- Connect commands using pipes

---

## Part 1: Understanding the Shell (10 minutes)

### What is the Shell?

The **shell** is a program that takes commands you type and tells the operating system to execute them. Think of it as a translator between you and the Linux kernel.

**Bash** (Bourne Again SHell) is Debian's default shell. When you open a terminal, you're interacting with Bash.

### Your First Prompt

When you open a terminal, you'll see something like:

```bash
user@hostname:~$
```

Let's decode this:
- `user` - your username
- `hostname` - your computer's name
- `~` - your current location (more on this soon)
- `$` - indicates you're a regular user (`#` would mean root/admin)

**Try this now:** Open a terminal and observe your prompt.

---

## Part 2: The Filesystem - Your Digital Filing Cabinet (15 minutes)

### Why This Matters

Everything in Linux is a file or treated like one. Understanding the filesystem is like learning the layout of a building before working there.

### Core Concepts

Linux uses a **hierarchical tree structure** starting from `/` (called "root" - not to be confused with the root user):

```
/                    (root of entire filesystem)
├── home/            (user home directories)
│   └── yourname/    (your personal space)
├── etc/             (system configuration files)
├── var/             (variable data: logs, caches)
├── usr/             (user programs and data)
├── tmp/             (temporary files)
└── bin/             (essential command binaries)
```

**Important:** Debian (and most Linux systems) use forward slashes `/` for paths, unlike Windows which uses backslashes `\`.

### Navigation Commands

#### `pwd` - Print Working Directory

Shows where you currently are:

```bash
pwd
```

**Example output:**
```
/home/yourname
```

#### `ls` - List

Shows files and directories in your current location:

```bash
ls                    # basic list
ls -l                # long format with details
ls -a                # show hidden files (start with .)
ls -lh               # human-readable file sizes
ls -lah              # combine all options
```

**Try this:**
```bash
ls
ls -la
```

#### `cd` - Change Directory

Move to different locations:

```bash
cd /tmp              # go to /tmp
cd ..                # go up one level
cd                   # go to your home directory
cd ~                 # also goes home
cd -                 # go to previous location
```

**Special symbols:**
- `.` = current directory
- `..` = parent directory
- `~` = your home directory
- `/` = root of filesystem

### Hands-On Exercise 1

```bash
# 1. Where are you?
pwd

# 2. Go to root
cd /

# 3. List what's there
ls

# 4. Go to /tmp
cd /tmp

# 5. Go back home
cd ~

# 6. Verify you're home
pwd
```

**Knowledge Check:** What command would you use to see hidden files in your current directory?

<details>
<summary>Answer</summary>

```bash
ls -a
# or
ls -la  # for more details
```
</details>

---

## Part 3: Commands - The Building Blocks (15 minutes)

### What is a Command?

A **command** is a program that performs a specific task. When you type `ls`, you're running a program located at `/usr/bin/ls`.

### Command Anatomy

```bash
command [options] [arguments]
```

**Example:**
```bash
ls -lh /etc
```
- `ls` - the command
- `-lh` - options (modify behavior)
- `/etc` - argument (what to act on)

### Getting Help

Every command has documentation:

```bash
man ls               # manual page (press 'q' to quit)
ls --help           # quick help summary
```

**Try this now:**
```bash
ls --help | less     # we'll explain the pipe soon!
```

### Essential Commands for Information

#### `file` - Identify file type

```bash
file /bin/ls         # shows: ELF executable
file image.jpg       # shows: JPEG image data
```

#### `which` - Locate a command

```bash
which ls             # shows: /usr/bin/ls
which bash           # shows: /usr/bin/bash
```

#### `echo` - Display text

```bash
echo "Hello, Linux!"
echo $HOME           # display variable value
```

---

## Part 4: Conditional Command Chaining (15 minutes)

### Why This Matters

Chain commands to create workflows: "Do this, and if it works, do that."

### Core Concepts

Three types of chaining operators:

#### `;` - Sequential (always run next)

```bash
cd /tmp ; pwd ; ls
```
Runs all three regardless of success/failure.

#### `&&` - AND (run next only if previous succeeded)

```bash
cd /nonexistent && pwd
# pwd won't run because cd failed
```

```bash
cd /tmp && pwd
# both run because cd succeeded
```

#### `||` - OR (run next only if previous failed)

```bash
cd /tmp || echo "Failed to change directory"
# echo won't run because cd succeeded
```

```bash
cd /nonexistent || echo "Failed to change directory"
# echo runs because cd failed
```

### Practical Examples

```bash
# Create directory and enter it
mkdir myproject && cd myproject

# Try to remove file, report if it fails
rm nonexistent.txt || echo "File not found"

# Chain multiple commands
cd /tmp && pwd && ls -l
```

### Hands-On Exercise 2

```bash
# 1. Try to go to a fake directory and show error
cd /fakedir || echo "Directory doesn't exist"

# 2. Create a test directory and enter it
mkdir ~/testdir && cd ~/testdir && pwd

# 3. Sequential commands
echo "First" ; echo "Second" ; echo "Third"
```

**Common Beginner Mistake:** Confusing `&&` with `;`. Use `&&` when the second command only makes sense if the first succeeds.

---

## Part 5: File Operations (20 minutes)

### Why This Matters

You'll spend much of your time creating, organizing, and managing files.

### Creating Files and Directories

#### `touch` - Create empty file or update timestamp

```bash
touch newfile.txt
touch file1.txt file2.txt file3.txt    # multiple files
```

#### `mkdir` - Make directory

```bash
mkdir documents
mkdir -p projects/web/css    # -p creates parent directories
```

**Warning:** `-p` is powerful but hides errors. Use carefully.

### Copying and Moving

#### `cp` - Copy

```bash
cp source.txt destination.txt           # copy file
cp source.txt /tmp/                     # copy to directory
cp -r documents/ documents_backup/      # copy directory recursively
```

**Note:** `-r` (recursive) is required for directories.

#### `mv` - Move or rename

```bash
mv oldname.txt newname.txt              # rename
mv file.txt /tmp/                       # move to directory
mv *.txt documents/                     # move all .txt files
```

**Important:** `mv` doesn't need `-r` for directories.

### Deleting

#### `rm` - Remove

```bash
rm file.txt                             # delete file
rm file1.txt file2.txt                  # delete multiple
rm -r directory/                        # delete directory
rm -i file.txt                          # interactive (asks confirmation)
```

**⚠️ WARNING:** `rm` is permanent. There's no trash bin. Deleted = gone forever.

**NEVER run:** `rm -rf /` (destroys your system)

#### `rmdir` - Remove empty directory

```bash
rmdir emptydir/
```

Only works if directory is empty. Use `rm -r` for non-empty directories.

### Viewing File Contents

#### `cat` - Concatenate and display

```bash
cat file.txt                            # display file
cat file1.txt file2.txt                 # display multiple
```

#### `less` - Page through file

```bash
less largefile.txt                      # use arrows to scroll, 'q' to quit
```

**Tip:** Use `less` for large files, `cat` for small ones.

#### `head` and `tail` - Show beginning or end

```bash
head file.txt                           # first 10 lines
head -n 5 file.txt                      # first 5 lines
tail file.txt                           # last 10 lines
tail -n 20 file.txt                     # last 20 lines
```

### Hands-On Exercise 3

```bash
# 1. Create a practice environment
cd ~
mkdir -p workshop/files && cd workshop/files

# 2. Create some files
touch alpha.txt beta.txt gamma.txt
echo "This is a test" > alpha.txt

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

# 7. View the file content
cat alpha.txt
```

**Knowledge Check:** How would you copy an entire directory called `photos` to `photos_backup`?

<details>
<summary>Answer</summary>

```bash
cp -r photos/ photos_backup/
```
The `-r` flag is essential for copying directories.
</details>

---

## Part 6: Redirection - Controlling Input and Output (15 minutes)

### Why This Matters

Every command has three data streams. Controlling them lets you save output, combine files, and chain workflows.

### Core Concepts

Three standard streams:
- **stdin** (0) - standard input (keyboard by default)
- **stdout** (1) - standard output (screen by default)
- **stderr** (2) - standard error (screen by default)

### Output Redirection

#### `>` - Redirect stdout (overwrites)

```bash
ls -l > filelist.txt                    # save output to file
echo "Hello" > greeting.txt             # create file with content
```

**Warning:** `>` overwrites the file if it exists.

#### `>>` - Redirect stdout (appends)

```bash
echo "Line 1" > log.txt
echo "Line 2" >> log.txt                # adds to end
```

#### `2>` - Redirect stderr

```bash
ls /nonexistent 2> errors.txt           # save errors to file
```

#### `&>` - Redirect both stdout and stderr

```bash
command &> output.txt                   # Bash shorthand
```

**Debian note:** Older scripts use `2>&1` to redirect stderr to stdout. Both work.

### Input Redirection

#### `<` - Redirect stdin

```bash
sort < unsorted.txt                     # read from file instead of keyboard
```

### Practical Examples

```bash
# Save directory listing
ls -lh > directory_contents.txt

# Append date to log
date >> activity.log

# Suppress errors
ls /root 2> /dev/null                   # /dev/null = black hole

# Save both output and errors
command > output.txt 2> errors.txt
```

### Hands-On Exercise 4

```bash
# 1. Create a file with output
echo "Workshop Files" > inventory.txt

# 2. Append more content
ls >> inventory.txt

# 3. View the result
cat inventory.txt

# 4. Save errors separately
ls /root > out.txt 2> err.txt
cat err.txt

# 5. Combine multiple files
cat alpha.txt alpha_backup.txt > combined.txt
```

**Common Beginner Mistake:** Using `>` when you meant `>>`. This will erase your file!

---

## Part 7: Pipes - Connecting Commands (15 minutes)

### Why This Matters

Pipes let you create powerful workflows by connecting simple commands. This is the Unix philosophy: do one thing well, then combine.

### Core Concept

The **pipe** (`|`) takes stdout from one command and feeds it as stdin to the next:

```bash
command1 | command2 | command3
```

### Essential Commands for Pipes

#### `grep` - Search for patterns

```bash
grep "word" file.txt                    # find lines containing "word"
grep -i "word" file.txt                 # case-insensitive
grep -r "word" directory/               # search recursively
```

#### `sort` - Sort lines

```bash
sort file.txt                           # alphabetically
sort -n file.txt                        # numerically
sort -r file.txt                        # reverse order
```

#### `wc` - Word count

```bash
wc file.txt                             # lines, words, characters
wc -l file.txt                          # just line count
```

#### `uniq` - Remove duplicates

```bash
uniq file.txt                           # must be sorted first!
sort file.txt | uniq                    # proper usage
```

### Practical Pipe Examples

```bash
# Count files in current directory
ls | wc -l

# Find all .txt files
ls -l | grep ".txt"

# Sort file list by name
ls | sort

# Find unique words in a file
cat file.txt | tr ' ' '\n' | sort | uniq

# Show top 5 largest files
ls -lh | sort -k5 -h | tail -5

# Search command history
history | grep "mkdir"
```

### Advanced: Combining Pipes and Redirection

```bash
# Save sorted list
ls | sort > sorted_files.txt

# Count matches and save
grep "error" log.txt | wc -l > error_count.txt

# Filter, sort, and save
cat data.txt | grep "important" | sort | uniq > results.txt
```

### Hands-On Exercise 5

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

# 4. Count each fruit (with duplicates)
sort fruits.txt | uniq -c

# 5. Save sorted unique list
sort fruits.txt | uniq > unique_fruits.txt

# 6. Find files containing "alpha"
ls | grep "alpha"

# 7. Complex pipeline: count .txt files
ls | grep ".txt" | wc -l
```

### Real-World Example

Find all log files modified today and count errors:

```bash
find /var/log -name "*.log" -mtime 0 | xargs grep -i "error" | wc -l
```

Don't worry if this looks complex—you'll learn `find` and `xargs` later!

---

## Part 8: Bringing It All Together (10 minutes)

### Comprehensive Challenge

Create a complete workflow combining everything you've learned:

```bash
# 1. Set up workspace
cd ~
mkdir -p workshop_final/data workshop_final/results && cd workshop_final

# 2. Create sample data
echo "apple 5" > data/inventory.txt
echo "banana 3" >> data/inventory.txt
echo "apple 2" >> data/inventory.txt
echo "cherry 8" >> data/inventory.txt

# 3. Process and analyze
cat data/inventory.txt | sort > results/sorted.txt

# 4. Create backup
cp -r data/ data_backup/

# 5. Generate report
echo "Inventory Report" > results/report.txt
echo "Generated: $(date)" >> results/report.txt
echo "---" >> results/report.txt
cat results/sorted.txt >> results/report.txt

# 6. View final report
cat results/report.txt

# 7. Count entries
echo "Total items: $(cat data/inventory.txt | wc -l)" >> results/report.txt
```

### Summary of Key Commands

| Command | Purpose | Common Options |
|---------|---------|----------------|
| `pwd` | Show current directory | - |
| `cd` | Change directory | `..` (up), `~` (home), `-` (previous) |
| `ls` | List files | `-l` (long), `-a` (all), `-h` (human-readable) |
| `mkdir` | Create directory | `-p` (create parents) |
| `touch` | Create/update file | - |
| `cp` | Copy | `-r` (recursive) |
| `mv` | Move/rename | - |
| `rm` | Remove | `-r` (recursive), `-i` (interactive) |
| `cat` | Display/concatenate | - |
| `grep` | Search text | `-i` (ignore case), `-r` (recursive) |
| `sort` | Sort lines | `-n` (numeric), `-r` (reverse) |
| `wc` | Count lines/words | `-l` (lines only) |

### Operators Summary

| Operator | Purpose | Example |
|----------|---------|---------|
| `;` | Run sequentially | `cmd1 ; cmd2` |
| `&&` | Run if previous succeeded | `cmd1 && cmd2` |
| `||` | Run if previous failed | `cmd1 || cmd2` |
| `>` | Redirect output (overwrite) | `cmd > file` |
| `>>` | Redirect output (append) | `cmd >> file` |
| `<` | Redirect input | `cmd < file` |
| `|` | Pipe output to input | `cmd1 | cmd2` |

---

## Common Beginner Mistakes & How to Avoid Them

1. **Using `rm` without thinking** → Always use `rm -i` when learning, or check `ls` first
2. **Forgetting `-r` with `cp` for directories** → Remember: files don't need it, directories do
3. **Confusing `>` and `>>`** → `>` erases, `>>` adds. When in doubt, use `>>`
4. **Not reading error messages** → stderr tells you what went wrong—read it!
5. **Typing `cd..` instead of `cd ..`** → Space matters in Unix commands
6. **Forgetting quotes around filenames with spaces** → Use `"my file.txt"` or `my\ file.txt`

---

## What to Practice Next

1. **Navigation drill:** Navigate to `/usr/share/doc` and back home 10 times using different paths
2. **File operations:** Create a mock project structure with directories and placeholder files
3. **Pipelines:** Find creative ways to combine `ls`, `grep`, `sort`, and `wc`
4. **Log analysis:** Download a sample log file and use `grep` + `wc` to count error types

---

## Final Knowledge Check

**Question 1:** What's the difference between these two commands?
```bash
ls /tmp ; cd /tmp
ls /tmp && cd /tmp
```

<details>
<summary>Answer</summary>

First command: Both always run (`;` is sequential)  
Second command: `cd` only runs if `ls` succeeds (`&&` is conditional)

For this specific case, both will likely behave the same since `/tmp` exists. But if `/tmp` didn't exist, the second command wouldn't try to `cd` into it.
</details>

**Question 2:** How would you count the number of `.txt` files in your current directory?

<details>
<summary>Answer</summary>

```bash
ls | grep ".txt" | wc -l
# or more precisely:
ls *.txt | wc -l
# or using find:
find . -maxdepth 1 -name "*.txt" | wc -l
```
</details>

**Question 3:** What happens if you run `echo "Hello" > file.txt` twice?

<details>
<summary>Answer</summary>

The file will only contain `Hello` once. The `>` operator overwrites the file on the second run. Use `>>` to append instead.
</details>

---

## Resources for Continued Learning

- **Debian Reference Manual:** https://www.debian.org/doc/manuals/debian-reference/
- **Bash Guide for Beginners:** Use `man bash` on your system
- **Practice:** https://overthewire.org/wargames/bandit/ (free command-line challenges)

**Remember:** The shell is incredibly powerful, but with power comes responsibility. Always think before you execute, especially with `rm`, `mv`, and commands run as root.

Welcome to the Linux command line! 🐧
