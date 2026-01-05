---
layout: default
title: ""
--- 


# Introductory Linux Shell Workshop

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

On Debian, the default interactive shell for users is **bash**.

---

### Core Concepts

* **Command**: a program you run (e.g., `ls`)
* **Arguments**: inputs to a command (e.g., `ls /etc`)
* **Options (flags)**: modify command behavior (e.g., `ls -l`)
* **Working directory**: your current location in the filesystem

---

### First Command

```bash
pwd
```

**Meaning:** “print working directory”
It shows where you are in the filesystem.

---

## 2. Navigating the Filesystem

### Purpose / Why It Matters

Everything in Linux is organized into a **single directory tree** starting at `/` (called the *root directory*).
You must be able to move around this tree to work with files.

---

### Core Concepts

* `/` : root of the filesystem
* `.` : current directory
* `..` : parent directory
* `~` : your home directory (e.g., `/home/alice`)

---

### Key Commands

#### List files

```bash
ls
```

Common options:

* `-l` long listing (permissions, size, owner)
* `-a` show hidden files (those starting with `.`)

```bash
ls -la
```

---

#### Change directory

```bash
cd /etc
cd ..
cd ~
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
```

---

### Common Beginner Mistakes

* Forgetting spaces between command and arguments
* Confusing `/` (root) with `~` (home)
* Assuming file order has meaning (it usually does not)

---

### Knowledge Check

* What does `cd ..` do?
* What directory does `cd` with no arguments go to?

---

## 3. Creating and Managing Files and Directories

### Purpose / Why It Matters

Linux administration involves constant file manipulation: logs, configs, scripts, backups.

---

### Core Concepts

* Files and directories are separate objects
* Commands generally **do one thing well**
* Most commands do **not ask for confirmation**

---

### Create Directories

```bash
mkdir workshop
mkdir -p workshop/notes/day1
```

`-p` creates parent directories as needed.

---

### Create Files

```bash
touch notes.txt
```

Creates an empty file or updates its timestamp.

---

### Copy Files

```bash
cp notes.txt backup.txt
cp notes.txt workshop/
```

Copy directories recursively:

```bash
cp -r workshop workshop_backup
```

---

### Move / Rename Files

```bash
mv notes.txt notes-old.txt
mv notes-old.txt workshop/
```

---

### Delete Files and Directories

⚠️ **WARNING:** Deletion is permanent. There is no trash bin.

```bash
rm backup.txt
rm -r workshop_backup
```

---

### Common Beginner Mistakes

* Using `rm -r` without checking the path
* Assuming `mv` copies instead of moves
* Forgetting `-r` for directories

---

### Knowledge Check

* What is the difference between `cp` and `mv`?
* Why is `rm` considered dangerous?

---

## 4. Viewing File Contents

### Purpose / Why It Matters

Administrators read configuration files, logs, and output constantly.

---

### View Small Files

```bash
cat notes.txt
```

---

### View Large Files (Recommended)

```bash
less /etc/services
```

Navigation inside `less`:

* `↑` / `↓` scroll
* `/text` search
* `q` quit

---

### Common Beginner Mistakes

* Using `cat` on very large files
* Forgetting how to exit `less`

---

## 5. Conditional Command Chaining

### Purpose / Why It Matters

Command chaining allows you to **control execution flow** without writing scripts.

---

### Core Concepts

Linux commands return an **exit status**:

* `0` = success
* non-zero = failure

---

### AND (`&&`)

Run second command **only if first succeeds**:

```bash
mkdir testdir && cd testdir
```

---

### OR (`||`)

Run second command **only if first fails**:

```bash
cd /nonexistent || echo "Directory not found"
```

---

### Command Separator (`;`)

Run commands regardless of success:

```bash
cd /nonexistent ; echo "This always runs"
```

---

### Common Beginner Mistakes

* Using `;` when `&&` is intended
* Assuming chained commands run simultaneously (they do not)

---

### Knowledge Check

* When would `&&` be safer than `;`?

---

## 6. Redirection (Input and Output)

### Purpose / Why It Matters

Redirection lets you **save output**, **reuse it**, or **silence commands**.

---

### Core Concepts

* **stdin**: standard input
* **stdout**: standard output
* **stderr**: standard error

---

### Output Redirection

```bash
ls > files.txt
```

Overwrite file.

Append instead:

```bash
ls >> files.txt
```

---

### Redirect Errors

```bash
ls /doesnotexist 2> errors.txt
```

---

### Discard Output

```bash
ls /doesnotexist > /dev/null 2>&1
```

(`/dev/null` is a special “black hole” file.)

---

### Common Beginner Mistakes

* Overwriting files unintentionally with `>`
* Forgetting `2>` is for errors

---

### Knowledge Check

* What is the difference between `>` and `>>`?

---

## 7. Pipes: Connecting Commands

### Purpose / Why It Matters

Pipes allow you to build **powerful command chains** from simple tools.

---

### Core Concepts

* `|` sends stdout of one command to stdin of another
* Each command does one job

---

### Examples

List services and search for ssh:

```bash
ls /etc | grep ssh
```

View sorted file list:

```bash
ls -l | sort
```

Count files:

```bash
ls | wc -l
```

---

### Practical Real-World Example

Find how many users exist on the system:

```bash
cat /etc/passwd | wc -l
```

(Note: later you will learn better tools, but this demonstrates pipes.)

---

### Common Beginner Mistakes

* Confusing `|` with `>`
* Expecting pipes to include error output (they do not, by default)

---

## Final Mental Model

* Commands are small tools
* Pipes connect tools
* Redirection controls data flow
* The shell is about **composing behavior**

---

## Suggested Practice (Homework)

1. Create a directory tree under `~/workshop`
2. Create and populate text files
3. Use pipes to search and count content
4. Redirect output into files
5. Chain commands safely with `&&`

---

If you want, the next workshop can cover:

* Permissions and ownership
* Searching with `find` and `grep`
* Environment variables
* Basic shell scripting

State the next topic when ready.
