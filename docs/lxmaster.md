---
title: ""
layout: default
---


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
* Marked: the value that has been put in Peppi. This way, for example, after a successful resit, you can see that the Peppi column is True but the Marked column before the marking is 0 or empty.
* The Filter column can be used in Word to select the rows that you want to send. Use the Edit Recipients function in Word to specify which values ​​are selected.  


![mailing results](../images/mailing_results.png)

  


  
