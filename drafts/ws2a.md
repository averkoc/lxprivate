

# 🐚 Shell Workshop 1 — Understanding the Shell & Thinking in Commands

## 🧠 What the Shell Is

The shell is a program that listens to what you type, interprets it, and decides what to run.  
When you enter a command, the shell:

- **Breaks the command into parts (this is called parsing)** — the program name and its arguments  
- **Searches** for that program in a list of directories defined by the `PATH` environment variable  
- **Executes** the program if it is found  
- **Reports an error** if it is not  

This means the shell itself does not perform the work — it coordinates small, focused programs that each do one thing well.  
The power of the shell comes from combining these programs into workflows.

### How the Shell Sees a Command
- The first word is the **program**  
- The following words are **options** and **arguments**, and the shell passes them to the program it runs  
- The shell expands patterns (globs), variables, and operators before running anything  

### How the Shell Connects Programs
- **Pipes** send the output of one program into another  
- **Redirection** sends output to files or reads input from files  
- **Command chaining** allows decisions based on success or failure  

### Features That Help You Work Efficiently
The shell also provides features that make everyday work faster and smoother:

- **Command history** (arrow keys and search) so you can reuse and refine previous commands  
- **Customization through profile files**, allowing you to tailor your environment  
- **Built‑in commands** for many frequently used operations, executed directly by the shell  

These features help you focus on solving problems rather than retyping or repeating work.

Understanding these ideas is more important than memorizing commands.  
Once you see the shell as a tool for connecting programs, everything else becomes easier.

---

## 🎯 Learning Outcomes

After completing this workshop, you will be able to:

- Explain what the shell does and how it finds and runs programs  
- Navigate the Linux filesystem with confidence  
- Create, inspect, and manipulate files using essential shell tools  
- Use pipes and redirection to transform and combine program output  
- Apply globbing and pattern matching to select groups of files  
- Write and execute a simple shell script  
- Use command chaining to automate checks and decisions  
- Approach shell tasks as problem‑solving exercises rather than memorized sequences  

---

Hands-on related to this table - put to wget accessible format in a separate file (or copy paste to nano)

course,lab_name,hours
CSE,linux-basics,3
CSE,files-and-permissions,4
CSE,process-management,5
CSE,shell-scripting,6
CSE,environment-variables,3
CSE,package-management,4
CSE,system-logging,5
CSE,cron-and-scheduling,4
CSE,resource-monitoring,5
CSE,system-troubleshooting,6
NET,network-fundamentals,3
NET,tcp-ip-analysis,4
NET,dns-and-dhcp,5
NET,firewall-configuration,6
NET,routing-basics,4
NET,subnetting-practice,5
NET,network-troubleshooting,6
NET,packet-capture,4
NET,wireless-security,5
NET,network-performance-testing,6
DBA,sql-basics,3
DBA,data-modeling,4
DBA,joins-and-views,5
DBA,backup-and-recovery,6
DBA,indexing-strategies,4
DBA,query-optimization,5
DBA,stored-procedures,6
DBA,transaction-management,4
DBA,replication-basics,5
DBA,database-security,6
SEC,security-fundamentals,3
SEC,user-and-group-hardening,4
SEC,file-integrity-monitoring,5
SEC,log-analysis,6
SEC,access-control-lists,4
SEC,patch-management,5
SEC,incident-response-basics,6
SEC,vulnerability-scanning,4
SEC,intrusion-detection,5
SEC,security-auditing,6
CLD,cloud-basics,3
CLD,virtual-machine-deployment,4
CLD,storage-management,5
CLD,networking-in-cloud,6
CLD,identity-and-access-management,4
CLD,autoscaling-configurations,5
CLD,monitoring-and-alerting,6
CLD,backup-strategies,4
CLD,cost-optimization,5
CLD,cloud-security-basics,6
