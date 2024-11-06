#!/bin/bash

# Check if the input file is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <bam_file_list.txt> <output_file.txt>"
    exit 1
fi

# Input and output files
bam_file_list="$1"
output_file="$2"

# Create or clear the output file
> "$output_file"

# Read the BAM file list line by line
while IFS= read -r bam_file; do
    # Check if the BAM file exists
    if [ -f "$bam_file" ]; then
        # Get the average depth using samtools
        avg_depth=$(samtools depth "$bam_file" | awk '{sum += $3} END {if (NR > 0) print sum / NR; else print 0}')

        # Write the average depth to the output file
        echo "$bam_file: $avg_depth" >> "$output_file"
    else
        echo "Warning: $bam_file not found!" >> "$output_file"
    fi
done < "$bam_file_list"

echo "Average depths have been written to $output_file."