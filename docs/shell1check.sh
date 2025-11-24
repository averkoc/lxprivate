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
