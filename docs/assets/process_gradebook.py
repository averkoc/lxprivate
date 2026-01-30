import csv
import re
import os

# Ask user for input file name
print("=" * 60)
print("Gradebook CSV Processor")
print("=" * 60)
input_file = input("\nEnter the full path to the CSV file to process: ").strip().strip('"')

# Check if file exists
if not os.path.exists(input_file):
    print(f"Error: File not found: {input_file}")
    exit(1)

# Generate output filename
base_dir = os.path.dirname(input_file)
base_name = os.path.splitext(os.path.basename(input_file))[0]
output_file = os.path.join(base_dir, f"{base_name}_processed.csv")

# Define column name abbreviations (4 characters)
column_abbreviations = {
    "NAME": "NAME",
    "EMAIL": "MAIL",
    "Final Exam Submitted": "FEXS",
    "Survey Submitted": "SURS",
    "Completion": "COMP",
    "Final Exam Score": "FEXC",
    "Chapter 02 Exam": "CH02",
    "Chapter 03 Exam": "CH03",
    "Chapter 04 Exam": "CH04",
    "Chapter 05 Exam": "CH05",
    "Chapter 06 Exam": "CH06",
    "Chapter 07 Exam": "CH07",
    "Chapter 08 Exam": "CH08",
    "Chapter 09 Exam": "CH09",
    "Chapter 10 Exam": "CH10",
    "Chapter 11 Exam": "CH11",
    "Chapter 12 Exam": "CH12",
    "Chapter 13 Exam": "CH13",
    "Chapter 14 Exam": "CH14",
    "Chapter 15 Exam": "CH15",
    "Chapter 16 Exam": "CH16",
    "Chapter 17 Exam": "CH17",
    "Chapter 18 Exam": "CH18",
    "Chapter Exams( Average )": "CHAV",
    "Lab 05": "LB05",
    "Lab 06": "LB06",
    "Lab 07": "LB07",
    "Lab 08": "LB08",
    "Lab 09": "LB09",
    "Lab 10": "LB10",
    "Lab 11": "LB11",
    "Lab 12": "LB12",
    "Lab 13": "LB13",
    "Lab 14": "LB14",
    "Lab 15": "LB15",
    "Lab 16": "LB16",
    "Lab 17": "LB17",
    "Lab 18": "LB18",
    "Labs( Average )": "LBAV",
    "Midterm Exam (Modules 2-9)": "MDTE",
    "Final Comprehensive Exam (Modules 2-18)": "FCEX",
    "Exams( Average )": "EXAV",
    "End of Course Feedback": "EOCF",
    "Final Exam (Modules 10-18)": "FE10",
    "Course Completion( Average )": "CCAV",
    "Challenge Lab A: User Management": "CHLA",
    "Challenge Lab B: Bash Scripting": "CHLB",
    "Challenge Lab C: Log File Archiving": "CHLC",
    "Challenge Lab D: Pipes, Redirection and REGEX": "CHLD",
    "Challenge Labs( Average )": "CLAV",
    "Class Grade %": "CLGR"
}

def replace_decimal_separator(value):
    """Replace period with comma for decimal numbers"""
    # Check if it's a number with decimal point
    if isinstance(value, str):
        # Match patterns like 10.0, 77.5, .50, etc.
        if re.match(r'^-?\d*\.\d+$', value.strip()):
            return value.strip().replace('.', ',')
    return value

def count_chapter_exams(row, chapter_columns):
    """Count how many chapter exams have been completed (non-empty values)"""
    count = 0
    for col in chapter_columns:
        value = row.get(col, '').strip()
        # Count if value exists and is not empty
        if value and value != '' and value != ' ':
            count += 1
    return str(count)

# Read the CSV file
with open(input_file, 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    original_headers = reader.fieldnames
    
    # Find chapter exam columns
    chapter_columns = [col for col in original_headers if col.startswith('Chapter ') and col.endswith(' Exam')]
    
    # Create new headers with abbreviations
    new_headers = []
    new_row_order = []  # Store the order for data rows
    
    for i, col in enumerate(original_headers):
        abbr = column_abbreviations.get(col, col[:4].upper())
        new_headers.append(abbr)
        new_row_order.append(i)
        
        # After EMAIL column, insert FCEX, MDTE, and CHCT
        if col == "EMAIL":
            # Find indices for FCEX and MDTE
            fcex_idx = next((j for j, c in enumerate(original_headers) if c == "Final Comprehensive Exam (Modules 2-18)"), None)
            mdte_idx = next((j for j, c in enumerate(original_headers) if c == "Midterm Exam (Modules 2-9)"), None)
            
            # Add FCEX
            if fcex_idx is not None:
                new_headers.append('FCEX')
                new_row_order.append(fcex_idx)
            
            # Add MDTE
            if mdte_idx is not None:
                new_headers.append('MDTE')
                new_row_order.append(mdte_idx)
            
            # Add chapter exam count
            new_headers.append('CHCT')
            new_row_order.append(-1)  # Special marker for chapter count
    
    # Remove FCEX and MDTE from their original positions (keep only after EMAIL)
    final_headers = []
    final_row_order = []
    seen_fcex = False
    seen_mdte = False
    
    for i, (header, order_idx) in enumerate(zip(new_headers, new_row_order)):
        if header == 'FCEX':
            if not seen_fcex:
                final_headers.append(header)
                final_row_order.append(order_idx)
                seen_fcex = True
        elif header == 'MDTE':
            if not seen_mdte:
                final_headers.append(header)
                final_row_order.append(order_idx)
                seen_mdte = True
        else:
            final_headers.append(header)
            final_row_order.append(order_idx)
    
    # Read all rows
    rows = list(reader)

# Write the processed CSV file
with open(output_file, 'w', encoding='utf-8', newline='') as f:
    writer = csv.writer(f, delimiter=',')
    
    # Write headers
    writer.writerow(final_headers)
    
    # Process and write each row
    for row in rows:
        new_row = []
        for order_idx in final_row_order:
            if order_idx == -1:
                # This is the chapter exam count
                chapter_count = count_chapter_exams(row, chapter_columns)
                new_row.append(chapter_count)
            else:
                col = original_headers[order_idx]
                value = row.get(col, '')
                # Replace decimal separator
                value = replace_decimal_separator(value)
                new_row.append(value)
        
        writer.writerow(new_row)

print(f"Processed file saved to: {output_file}")
print(f"\nColumn mapping (original -> abbreviated):")
for orig, abbr in column_abbreviations.items():
    print(f"  {orig[:40]:40} -> {abbr}")
print(f"\nAdded column: CHCT (Chapter Exam Count)")
print(f"\nDecimal separators changed from '.' to ',' for Finnish Excel format")
