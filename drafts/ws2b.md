Linux contains a lot of small programs - commands - targeted to specific things e.g.

* head - shows the beginning of a file
* tail - shows the end of a file
* sort - sorts lines
* uniq - removes or counts duplicate lines
* grep - searches for patterns
* cut - extracts columns from structured text
* wc - counts words, lines, or characters


These commands can be combined using pipes (|) to create powerful data processing workflows

Each command does one thing well
The output of one command becomes the input of the next
Example concept: command1 | command2 | command3


This modular approach allows you to solve complex problems by chaining simple tools together  

Workshop Overview: Applying Commands to Real Data Analysis
In this workshop, you'll work with a real Linux authentication log file (auth.log) to practice combining Linux commands for security analysis and system monitoring. The tasks progress from simple operations to more complex multi-step solutions.
What you'll do:

Extract specific portions of log files - getting exactly the entries you need from large system logs
Sort and organize authentication data - arranging log entries by different criteria
Find and count patterns - identifying failed login attempts and their frequencies
Filter and search - locating specific authentication events (invalid users, failed passwords)
Parse structured log data - extracting usernames, IP addresses, and timestamps from log entries
Build multi-step pipelines - chaining commands together to answer security questions like "Which usernames had the most failed login attempts?" or "What IP addresses attempted invalid logins?"

The dataset:
You'll work with auth.log, a real authentication log file containing login attempts, sudo commands, and other security-related events. This is the type of file system administrators analyze daily to monitor security.
Your goal:
By the end, you should be able to take a security analysis question (e.g., "What are the top 10 IP addresses with failed SSH login attempts?") and independently construct a command pipeline to answer it - just like you would in real system administration work.
Watch the screencasts to see how to approach each problem, understand the reasoning behind command choices, and learn debugging strategies when things don't work as expected.
