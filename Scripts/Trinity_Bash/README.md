### De_novo.sge
Using Trinity (/home/local/bin/trinityrnaseq_r20140717) on merged paired reads (left and right) and the singlets

### Reference_mapping.sge
Using bowtie2 to map paired end reads to 54 Pseudomonas putida strains. 
Forward and reverse paired reads were used as input files.
Reference genomes were downloaded from NCBI. 
Use of adjust.sh script for mapping and statistics.

### adjust.sh

Adjusted script based on Alvar's script (/usr/local/bin/mapping_filtering.sh).
Deletes all large intermediary and result files and keeps only one statistics README file containing the alignment rate.

