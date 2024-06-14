'''
Remove the newline character from Lat Long Location
'''

import csv

def replace_newline_with_space(input_file, output_file, delimiter='\t'):
    with open(input_file, 'r', newline='', encoding='utf-8') as infile, open(output_file, 'w', newline='') as outfile:
        reader = csv.DictReader(infile, delimiter=delimiter)
        writer = csv.DictWriter(outfile, fieldnames=reader.fieldnames, delimiter=delimiter)
        writer.writeheader()
        for row in reader:
            # Replace newline characters with spaces in the "Lat Long Location" field
            row["Lat Long Location"] = row["Lat Long Location"].replace("\n", " ")
            writer.writerow(row)


# Example usage
input_filename = 'Restaurant_and_Food_Establishment_Inspections__October_2016_to_Present__20240224.tsv'  # Replace with your actual input TSV file path
output_filename = 'dallas_output.tsv'  # Replace with your desired output TSV file path
replace_newline_with_space(input_filename, output_filename)
print("Newline characters replaced with spaces in the 'Lat Long Location' field. Output written to", output_filename)


