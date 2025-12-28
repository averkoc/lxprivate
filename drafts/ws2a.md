

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

```bash
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
````


newusers-command input file  
```bash
alismi:kA7fQ2mB:1100:1100:Alice Smith <alice.smith@example.edu>:/home/alismi:/bin/bash
bobjon:P8dM4sQa:1101:1101:Bob Johnson <bob.johnson@example.edu>:/home/bobjon:/bin/bash
carbro:mZ9K2HqA:1102:1102:Carol Brown <carol.brown@example.edu>:/home/carbro:/bin/bash
davwil:R4FQx6aM:1103:1103:David Wilson <david.wilson@example.edu>:/home/davwil:/bin/bash
emidav:q7H9A2Lm:1104:1104:Emily Davis <emily.davis@example.edu>:/home/emidav:/bin/bash
fraand:JQ8s2M4K:1105:1105:Frank Anderson <frank.anderson@example.edu>:/home/fraand:/bin/bash
gratha:Fm9A6qZ4:1106:1106:Grace Taylor <grace.taylor@example.edu>:/home/gratha:/bin/bash
henmoo:AQ6K4m9F:1107:1107:Henry Moore <henry.moore@example.edu>:/home/henmoo:/bin/bash
isacla:4mFZQK9A:1108:1108:Isaac Clark <isaac.clark@example.edu>:/home/isacla:/bin/bash
jaclee:Q9A4m6KF:1109:1109:Jack Lee <jack.lee@example.edu>:/home/jaclee:/bin/bash
karkim:Z4F9mK6A:1110:1110:Karen Kim <karen.kim@example.edu>:/home/karkim:/bin/bash
larwhi:6QFmA9K4:1111:1111:Larry White <larry.white@example.edu>:/home/larwhi:/bin/bash
mictho:KZQ9F4mA:1112:1112:Michael Thompson <michael.thompson@example.edu>:/home/mictho:/bin/bash
natgar:4A9mKQFZ:1113:1113:Natalie Garcia <natalie.garcia@example.edu>:/home/natgar:/bin/bash
oliper:FZ9K4mQA:1114:1114:Oliver Perez <oliver.perez@example.edu>:/home/oliper:/bin/bash
pammar:QmF94AZK:1115:1115:Pamela Martinez <pamela.martinez@example.edu>:/home/pammar:/bin/bash
quirob:9Z4mFQKA:1116:1116:Quinn Roberts <quinn.roberts@example.edu>:/home/quirob:/bin/bash
racsan:AFQmZ4K9:1117:1117:Rachel Sanchez <rachel.sanchez@example.edu>:/home/racsan:/bin/bash
samlew:4F9QmZKA:1118:1118:Samuel Lewis <samuel.lewis@example.edu>:/home/samlew:/bin/bash
tinwal:QAFZ94mK:1119:1119:Tina Walker <tina.walker@example.edu>:/home/tinwal:/bin/bash
ulyhal:mFZKQ49A:1120:1120:Ulysses Hall <ulysses.hall@example.edu>:/home/ulyhal:/bin/bash
vicall:Z9A4KQFm:1121:1121:Victoria Allen <victoria.allen@example.edu>:/home/vicall:/bin/bash
wilyou:4ZQK9mFA:1122:1122:William Young <william.young@example.edu>:/home/wilyou:/bin/bash
xavher:Q9mF4ZKA:1123:1123:Xavier Hernandez <xavier.hernandez@example.edu>:/home/xavher:/bin/bash
yasflo:KQ4Z9mFA:1124:1124:Yasmin Flores <yasmin.flores@example.edu>:/home/yasflo:/bin/bash
zacram:F9m4QZKA:1125:1125:Zachary Ramirez <zachary.ramirez@example.edu>:/home/zacram:/bin/bash
annnel:ZK4F9mQA:1126:1126:Anna Nelson <anna.nelson@example.edu>:/home/annnel:/bin/bash
benmit:9QmFKZ4A:1127:1127:Benjamin Mitchell <benjamin.mitchell@example.edu>:/home/benmit:/bin/bash
chrcox:4FZ9mQKA:1128:1128:Chris Cox <chris.cox@example.edu>:/home/chrcox:/bin/bash
deaper:Q9F4mZKA:1129:1129:Dean Peterson <dean.peterson@example.edu>:/home/deaper:/bin/bash
elisca:KZQ49mFA:1130:1130:Elisa Carter <elisa.carter@example.edu>:/home/elisca:/bin/bash
felmur:ZQmF4K9A:1131:1131:Felix Murray <felix.murray@example.edu>:/home/felmur:/bin/bash
giariv:4QZ9mFKA:1132:1132:Gina Rivera <gina.rivera@example.edu>:/home/giariv:/bin/bash
howcoo:FQZ4m9KA:1133:1133:Howard Cooper <howard.cooper@example.edu>:/home/howcoo:/bin/bash
ianree:9KQZ4FmA:1134:1134:Ian Reed <ian.reed@example.edu>:/home/ianree:/bin/bash
julbau:4ZQF9mKA:1135:1135:Julia Bauer <julia.bauer@example.edu>:/home/julbau:/bin/bash
kevpat:QZ9m4FKA:1136:1136:Kevin Patel <kevin.patel@example.edu>:/home/kevpat:/bin/bash
linhug:ZQ4mF9KA:1137:1137:Linda Hughes <linda.hughes@example.edu>:/home/linhug:/bin/bash
marflo:9mFQ4ZKA:1138:1138:Mark Flores <mark.flores@example.edu>:/home/marflo:/bin/bash
nikwat:FZ4Q9mKA:1139:1139:Nina Watson <nina.watson@example.edu>:/home/nikwat:/bin/bash
oscben:Z9F4mQKA:1140:1140:Oscar Bennett <oscar.bennett@example.edu>:/home/oscben:/bin/bash
paigra:QmZ49FKA:1141:1141:Paige Grant <paige.grant@example.edu>:/home/paigra:/bin/bash
quiwoo:4QZFm9KA:1142:1142:Quincy Wood <quincy.wood@example.edu>:/home/quiwoo:/bin/bash
ronhug:Z4QF9mKA:1143:1143:Ronald Hughes <ronald.hughes@example.edu>:/home/ronhug:/bin/bash
sarjen:9mQ4ZFKA:1144:1144:Sarah Jenkins <sarah.jenkins@example.edu>:/home/sarjen:/bin/bash
tomkir:FZ9Q4mKA:1145:1145:Thomas Kirk <thomas.kirk@example.edu>:/home/tomkir:/bin/bash
ursbla:Q4mZ9FKA:1146:1146:Ursula Black <ursula.black@example.edu>:/home/ursbla:/bin/bash
valort:ZQF9m4KA:1147:1147:Valerie Ortiz <valerie.ortiz@example.edu>:/home/valort:/bin/bash
wesnor:4ZQ9mFKA:1148:1148:Wesley Norris <wesley.norris@example.edu>:/home/wesnor:/bin/bash
````
Examples using the above data: pick emails (AI), pick account and password: `cut -d":" -f1,2 /etc/passwd |tr : " " > part1`  `paste part1 emails`

-----
Cleanup if accidentally created  
```bash
#!/bin/bash

INPUT_FILE="newusers.txt"

if [[ ! -f "$INPUT_FILE" ]]; then
    echo "ERROR: $INPUT_FILE not found."
    exit 1
fi

echo "Starting cleanup using $INPUT_FILE"
echo "----------------------------------"

while IFS=: read -r username _ uid gid _ home _; do
    # Skip empty or malformed lines
    [[ -z "$username" || -z "$uid" ]] && continue

    echo "Processing user: $username (UID=$uid, GID=$gid)"

    # Remove user and home directory
    if id "$username" &>/dev/null; then
        userdel -r "$username"
        echo "  User $username removed"
    else
        echo "  User $username does not exist"
    fi

    # Remove private group
    if getent group "$gid" &>/dev/null; then
        groupdel "$gid"
        echo "  Group $gid removed"
    else
        echo "  Group $gid does not exist"
    fi

done < "$INPUT_FILE"

echo "----------------------------------"
echo "Cleanup complete"
````
