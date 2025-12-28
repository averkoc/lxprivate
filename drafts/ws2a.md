
# 🐚 Shell Workshop 1 — Understanding the Shell & Thinking in Commands

## 🧠 What the Shell Is

The shell is a program that listens to what you type, interprets it, and decides what to run.  
When you enter a command, the shell:

- **Breaks to parts (this is called parsing)** your input into a program name and its arguments  
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

## 🧭 Workshop Overview

This workshop introduces the Linux shell through a series of small investigative challenges.  
You will explore a prepared environment, uncover information, and solve problems using only shell commands.

The focus is on:

- Building a mental model of how the shell works  
- Learning to think in pipelines  
- Understanding how small tools combine into powerful workflows  
- Preparing for log analysis and real‑world troubleshooting in Workshop 2  

All demonstrations and instructions are provided in the accompanying video.  
This page intentionally contains only the conceptual foundation and learning goals.

---

If you want, I can also create a matching **Workshop 2 page** so the pair feels coherent and pedagogically aligned.
