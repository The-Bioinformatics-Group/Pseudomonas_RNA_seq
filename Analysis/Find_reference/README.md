# Finding best reference genome

### Introduction

This analysis was done to find the best possible Pseudomonas putida reference genome for the used strain (Berlin 33/2). 
There are 54 (57) genome assemblies avaliable at NCBI. 
The fasta sequences for all genomes were downloaded from NCBI Refseq DB.

Skipped genomes, because not avaliable (5.04.2016): HB3267, 1A00316, B6-2

A script was used to map the filtered reads to each genome, creating 54 (57) BAM files.
Only paired end data was used since the singlets file only contain few MB of reads.
Bowtie was used as a mapper (Settings?)

A script was used to count the number of reads mapped to each genome.
The genome with the highest percentage of mapped reads may be used for the genome guided assembly.

* Scipt location: /usr/local/bin/mapping_filtering.sh

### Analysis

The script "Reference_mapping.sge" located in the /Scripts/Trinity_Bash directory was used to run Bowtie2 on all 54 genomes. 
The merged paired end reads, located in the /state/partition2/Alexheinz directory were used. They might be moved to the /data directory later.

### Results

 
