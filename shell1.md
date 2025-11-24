# 🐧 Linux Shell Assignment: "Getting Comfortable with Bash"

## 🎯 Learning Goals
Students will:
- Practice essential shell commands (`cd`, `ls`, `touch`, `echo`, `cat`, `mv`, `cp`, `rm`, `chmod`)
- Use control structures (`&&`, `||`)
- Understand quoting (`'single'`, `"double"`, and escaping)
- Briefly explore redirection (`>`, `>>`) and piping (`|`)

---

## 👨‍💻 Part 1: Interactive Tasks

Perform the following tasks manually in your own VM terminal. Do **not** use `sudo` or root privileges.

### 🔧 Tasks

1. **Setup**
   - Create a directory called `bash_intro`
   - Move into it using `cd`

2. **File Operations**
   - Create three files: `one.txt`, `two.txt`, `three.txt`
   - Add the line `"Bash is cool"` to `one.txt` using double quotes
   - Add the line `'Learning shell scripting'` to `two.txt` using single quotes
   - Use `cat` and `echo` to append the contents of `one.txt` and `two.txt` into `three.txt`

3. **Control Structures**
   - Use `&&` to create a file `success.txt` only if `three.txt` exists
   - Use `||` to create a file `fail.txt` only if `nonexistent.txt` does not exist

4. **Permissions and Execution**
   - Create a script `hello.sh` that prints `Hello, $USER!`
   - Make it executable and run it, redirecting output to `hello_output.txt`

5. **Piping and Redirection**
   - Use `ls | wc -l` to count files and save the result to `file_count.txt`

---

## 🧪 Part 2: Verification Script

You are provided with a base script `verify.sh`. Complete it to check your own work. It:
- Verifies task completion
- Ensures the script is run by the correct user
- Outputs a verdict file `verdict.txt` with PASS/FAIL status per task

### 🧩 Provided `verify.sh`

```bash
#!/bin/bash

VERDICT="verdict.txt"
echo "Verification Results:" > "$VERDICT"

# Check user identity
EXPECTED_USER=$(whoami)
echo "Running as user: $EXPECTED_USER" >> "$VERDICT"

# Check working directory
cd ~/bash_intro || { echo "❌ Directory bash_intro missing" >> "$VERDICT"; exit 1; }

# Task checks
[[ -f one.txt ]] && echo "✅ one.txt exists" >> "$VERDICT" || echo "❌ one.txt missing" >> "$VERDICT"
grep -q "Bash is cool" one.txt && echo "✅ Content in one.txt correct" >> "$VERDICT" || echo "❌ Content in one.txt incorrect" >> "$VERDICT"

[[ -f two.txt ]] && echo "✅ two.txt exists" >> "$VERDICT" || echo "❌ two.txt missing" >> "$VERDICT"
grep -q "Learning shell scripting" two.txt && echo "✅ Content in two.txt correct" >> "$VERDICT" || echo "❌ Content in two.txt incorrect" >> "$VERDICT"

[[ -f three.txt ]] && echo "✅ three.txt exists" >> "$VERDICT" || echo "❌ three.txt missing" >> "$VERDICT"

[[ -f success.txt ]] && echo "✅ success.txt created with &&" >> "$VERDICT" || echo "❌ success.txt missing" >> "$VERDICT"
[[ -f fail.txt ]] && echo "✅ fail.txt created with ||" >> "$VERDICT" || echo "❌ fail.txt missing" >> "$VERDICT"

[[ -f hello_output.txt ]] && grep -q "Hello, $EXPECTED_USER" hello_output.txt && echo "✅ hello.sh output correct" >> "$VERDICT" || echo "❌ hello.sh output incorrect" >> "$VERDICT"

[[ -f file_count.txt ]] && echo "✅ file_count.txt exists" >> "$VERDICT" || echo "❌ file_count.txt missing" >> "$VERDICT"

echo "Verification complete." >> "$VERDICT"
