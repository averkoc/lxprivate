---
title: ""
layout: default
---  

### Copying a python program to other computer  
In your application's virtual environment  
```bash
pip freeze > requirements.txt
```
* Copy the program and requirements.txt to other computer where you have created a directory for the program


Inside the target computer's directory that you created:
```bash
# Create virtual environment  
python -m venv venv
# activate virtual environment
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies from requirements.txt Assuming you've copied your script and requirements.txt into this directory:
pip install -r requirements.txt
# Run your script
python your_script.py
```
