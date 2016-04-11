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

### Changes to the script

Because of the size of the paired read files (88G) I had to adjust the script to remove large files once the analysis is done for each genome.
The script adjust.sh (Trinity_Bash) included several commands to delete all large files.
It will just keep one text file containing the information we need.

### Results

The file "Results.md" included the overall alignment rate for all 54 genomes. 
These genomes have the highest alignment rate (above 80%):

PP_791_PRUT.fna 

160176870 reads; of these:
  160176870 (100.00%) were paired; of these:
    39346862 (24.56%) aligned concordantly 0 times
    120715223 (75.36%) aligned concordantly exactly 1 time
    114785 (0.07%) aligned concordantly >1 times
    ----
    39346862 pairs aligned concordantly 0 times; of these:
      13815345 (35.11%) aligned discordantly 1 time
    ----
    25531517 pairs aligned 0 times concordantly or discordantly; of these:
      51063034 mates make up the pairs; of these:
        47555120 (93.13%) aligned 0 times
        3411669 (6.68%) aligned exactly 1 time
        96245 (0.19%) aligned >1 times
85.16% overall alignment rate


PP_KF703.fna: 

  160176870 (100.00%) were paired; of these:
    40788105 (25.46%) aligned concordantly 0 times
    119214476 (74.43%) aligned concordantly exactly 1 time
    174289 (0.11%) aligned concordantly >1 times
    ----
    40788105 pairs aligned concordantly 0 times; of these:
      13270276 (32.53%) aligned discordantly 1 time
    ----
    27517829 pairs aligned 0 times concordantly or discordantly; of these:
      55035658 mates make up the pairs; of these:
        51055642 (92.77%) aligned 0 times
        3838297 (6.97%) aligned exactly 1 time
        141719 (0.26%) aligned >1 times
84.06% overall alignment rate


PP_JCM18452 

160176870 reads; of these:
  160176870 (100.00%) were paired; of these:
    41302826 (25.79%) aligned concordantly 0 times
    118682468 (74.09%) aligned concordantly exactly 1 time
    191576 (0.12%) aligned concordantly >1 times
    ----
    41302826 pairs aligned concordantly 0 times; of these:
      13041944 (31.58%) aligned discordantly 1 time
    ----
    28260882 pairs aligned 0 times concordantly or discordantly; of these:
      56521764 mates make up the pairs; of these:
        52359880 (92.64%) aligned 0 times
        3924895 (6.94%) aligned exactly 1 time
        236989 (0.42%) aligned >1 times
83.66% overall alignment rate

Pseudonomas putida strain 791_PRUT was used for the reference based assembly!
 
