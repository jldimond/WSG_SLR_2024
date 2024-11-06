#!/bin/bash

# Set the directory containing the BAM files
input_dir="/Users/molecularlab/Documents/WSG-SLR_2024/Katharina/data/bam/Cleaned_bam"
output_dir="/Users/molecularlab/Documents/WSG-SLR_2024/Katharina/data/bam/Cleaned_bam/RG_added"  

# Read group information (modify as needed)
rg_id="4"        # Read group ID
rg_lb="lib1"    # Library name
rg_pl="ILLUMINA" # Platform
rg_pu="unit1"   # Platform unit
rg_sm="20"      # Sample name


# Loop through each BAM file in the input directory
for bam_file in "$input_dir"/*.bam; do
    # Check if there are no .bam files
    if [ ! -e "$bam_file" ]; then
        echo "No BAM files found in $input_dir"
        exit 1
    fi
    
    # Get the base name of the BAM file (without the directory path)
    base_name=$(basename "$bam_file")

    # Set the output BAM file name
    output_bam="$output_dir/$base_name"

    # Add read group to the BAM file using Picard
    echo "Processing $bam_file..."
    picard AddOrReplaceReadGroups \
        I="$bam_file" \
        O="$output_bam" \
        SORT_ORDER=coordinate \
        RGID="$rg_id" \
        RGLB="$rg_lb" \
        RGPL="$rg_pl" \
        RGPU="$rg_pu" \
        RGSM="$rg_sm" \
        CREATE_INDEX=True

    echo "Added read groups to $output_bam"
done