**First: clone the github repo to local computer**
```bash
git clone https://github.com/averkoc/lx.git
```

**Second: Repository History Cleanup Procedure**

This procedure creates a fresh, history-free `main` branch while preserving all current files - you run these in your local repo

```bash
# copies the remote as an independent local branch fresh-start
git checkout --orphan fresh-start

# add all files and subdirs to the current branch
git add .

# commit
git commit -m "Clean history"

# deletes local old main
git branch -D main

# renames the fresh-start to main
git branch -m main

# forces the local history-free main to origin in github
git push -f origin main
