---
title: ""
layout: default
---

## LXMASTER_GRP.xlsx excel file structure  

| Filter | Last      | First      | Name                 | Email                          | group         | FCE | WST | Account | Key     | Files   | Exam  | Peppi | Marked |
|--------|-----------|------------|----------------------|--------------------------------|---------------|-----|-----|---------|---------|---------|-------|-------|--------|
| 1      | Virta     | Matti      | Matti, Virta         | matti.virta@centria.fi         | NTISXX        | 60  |30   | mattivi | mattivi |         | FALSE | FALSE | 0      |
| 1      | Virta     | Juho       | Juho,  Virta         | juho.virta@centria.fi          | NTISXX        | 55  |30   | juhovi  | juhovi  | juhovi  | TRUE  | TRUE  | S      |


1) Prepare the table by downloading course's students from Peppi 2) delete extra columns and add column name 3) the other columns, presented above, can be added later.    


Name column formula: =Last&", "&First  
* Name column is used to retrieve WST-value from ItsLearning Gradebook that is exported and copied as one sheet (named to Its) in the Excel-file. The WST value is the sum of workshop-points calculated column in Its-sheet
* Email is used to retrieve Account from Accounts-sheet
* Account is used to retrieve Key and Files value from sheet that contain practical exam key and files task values
* Email is used to retrieve FCE (Final Comprehensive value) from netacad-sheet that contains netacad gradebook
* Exam column formula: =AND(Key=Account;Files=Account)
* Peppi column formula: =AND(WST>30;EXAM;FCE>52)
* Marked: the value that has been put in Peppi. You can download Peppi-grades and copying the sheet and using XLOOKUP-function. Coloring passed values and passed grade it easy to see if there is some grade missing.  
* The Filter column can be used in Word to select the rows that you want to send. Use the Edit Recipients function in Word to specify which values ​​are selected.  

--- 
### Processing netacad gradebook  

The FCE (Final Comprehensive Exam) column gets its values from netacad sheet that is got by downloading netacad gradebook and processing it by [process_gradebook.py](../assets/process_gradebook.py) program before adding to the master-file.   




---- 
### Mailing  
The following screenshots show how word mailing feature can be used to send emails to users that are based on the excel data. It also contains some mailing function related features that may be interesting in some other situations. 

![mailing results](../images/mailing_results.png)  

> In mailing you can toggle the visibility of field codes with alt-f9. Sometimes you may want to insert a calculation - a formula can be inserted by ctrl-9.  

  


  
