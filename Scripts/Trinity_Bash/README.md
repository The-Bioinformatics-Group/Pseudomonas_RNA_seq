### De_novo.sge
Using Trinity (/home/local/bin/trinityrnaseq_r20140717) on merged paired reads (left and right) and the singlets

### De_novo2.sge
Same as De_novo.sge, but also includes the SS_lib_type FR flag to specify that we have strand specific data with the Forward Reverse orientation.

### Ref_based1.sge 
Using Trinity (/home/local/bin/trinityrnaseq_r20140717) on reference genome (791_PRUT) mapped data.
Input file is the sorted bam file, created by bowtie2 mapping (script: 791_PRUT_mapping.sge)

### Reference_mapping.sge
Using bowtie2 to map paired end reads to 54 Pseudomonas putida strains. 
Forward and reverse paired reads were used as input files.
Reference genomes were downloaded from NCBI. 
Use of adjust.sh script for mapping and statistics.

### Create Bam + Create Sam
Using Alvars /usr/local/bin/mapping_filtering.sh script to map and sort all paired end reads to 791_PRUT reference genome.
Keeping the final bam file as input for Trinity.

### adjust.sh
Adjusted script based on Alvar's script (/usr/local/bin/mapping_filtering.sh).
Deletes all large intermediary and result files and keeps only one statistics README file containing the alignment rate.

