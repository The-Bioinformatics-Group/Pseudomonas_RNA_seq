# Introduction
Pseudomonas putida transcriptome assembly - Strain Berlin 33/2

## Data
Data was transfered from UPPMAX on Wed Oct 21 13:53:33 CEST 2015. A backup of the data ramains on UPPMAX in /proj/b2014338/INBOX/T.Backhaus_15_01

`rsync -hav matst@milou.uppmax.uu.se:/proj/b2014338/INBOX/T.Backhaus_15_01/* .`

```bash
[matst@milou2 T.Backhaus_15_01]$ du -hs *
929M	P2201_101
726M	P2201_102
762M	P2201_103
805M	P2201_104
699M	P2201_105
788M	P2201_106
883M	P2201_107
745M	P2201_108
640M	P2201_109
781M	P2201_110
726M	P2201_111
822M	P2201_112
697M	P2201_113
747M	P2201_114
786M	P2201_115
1.1G	P2201_116
685M	P2201_117
634M	P2201_118
836M	P2201_119
877M	P2201_120
820M	P2201_121
730M	P2201_122
895M	P2201_123
790M	P2201_124
704K	T.Backhaus_15_01_150702_AC6U4VANXX_sample_summary.pdf
64K	T.Backhaus_15_01_project_summary.pdf
```

# Data preparation

### Fastqc analysis
Running fastqc on all samples using the script:
* /Scripts/Data_preparation/fastqc.sge

### Initial fastqc analysis
The files are located in the following directory and are named like this:
* /Initial_quality/Fastqc_ZIP/8_150702_AC6U4VANXX_P2201_101_1_fastqc.zip
* Read length: 126
* %GC: 55-57%

The report from all samples was similar. There were small differences between forward and reverse reads.
The per base sequence quality for the forwards reads was very bad for the first 5 and last approximately 30 bases.
The reverse reads had a better per base sequence quality and only about 10 bad bases in	the end.
All samples had a bad per base sequence	content	and GC content for the first 10 bases.
A high amount of overrepresented sequences and sequence duplication levels was also reported as a problem.
This was expected (diff expression) and therefore didn't need quality trimming.
Another problem was a high k-mer content.
This might be related to the generation of cDNA during library preparation (read more).

### Quality trimming
fastx trimmer and fastq quality trimmer were used for quality trimming
* /Scripts/Data_preparation/fastx_trimmer.sge

The flag Q33 was used for both trimmers (what does it do?)
???

### Final fastqc analysis
The files are located in the following directory and named like this:
* /Initial_quality/Fastqc_ZIP/8_150702_AC6U4VANXX_P2201_101_1.t-20.FQT.2_fastqc.zip
There are more intermediate files in this directory!
* Read length: about 112
* %GC: 55-57%

Per base sequence quality and per base GC content was fixed for all samples.
Per base sequence content was still reported as a minor problem, but further trimming wouldn't have solved this problem.
Overpresented sequences and high sequence duplication levels are still reported as a problem.
Unclear if this is due to differential expression or adapter contamination/cDNA primer.
This might cause problems for de-novo assembly?

### Script - Paired data still paired?
* /Scripts/Data_preparation/paired_reads.sge 

This script was used to check if all reads still have their respective mate on the other strand. 
Uses the pairSeq.py script located on Albiorix
Outputs two files (paired reads and singles) for each forward and reverse file. 

The location of one of this files:
* /data/P2201_1*/*/8_150702_AC6U4VANXX_P2201_101_1.t-20.FQT.2.Pair.fastq
* /data/P2201_1*/*/8_150702_AC6U4VANXX_P2201_101_1.t-20.FQT.2.Singles.fastq

The files for Singles are rather small and contain about 1MB of sequences. 

### Copying files to high_mem server for assembly
For faster Trinity analysis the files (Pairs and Singles) were copied to the high_mem node (state/partition2/Alexheinz).
Afterwards left, right and single reads were merged into one file, respectively (pair1.fastq, pair2.fastq, singles.fastq)
* /Scripts/Data_preparation/Copy_Script.sge

# De novo Assebmly using Trinity (4.04.2016)

### Assembly
Trinity (/home/local/bin/trinityrnaseq_r20140717) was run using the following Script:
* /Scripts/Trinity_Bash/De_novo.sge

I didn't use the newest Trinity version. (Why again???)

# De novo Assembly 2 (11.04.2016)

I forgot to specify the flag for strand specific data (FR).
Repeat the first de_novo assembly (4.04.2016).
Except the SS_lib_type flag, same settings.
Keeping the first assembly to compare them.
Strand specificy was achieved by Illumina TrueSeq Library preperation. 
dTTP is replaced by dUTP in the Second Strand Marking Mix (SMM).
Incorporation of dUTP in the second strain quenches the 2. strain during amplificiation (polymerase can't incorporate past this nucleotide).
Using this protocol means that the strand orientation is RF (reverse forward).
This option was used for the SS_lib_type flag.

# Reference based Assembly using Trinity (18.04.2016)

### Finding the best reference genome
Unfortunatly there was no infomation about closly related strains to Berlin 33/2. 
To find the strain with the highest alignment rate all paired reads were mapped to all avalibable PP genomes on NCBI (54).
The hightest alignment rate (85.16%) had strain 791_PRUT (GCA_001066335.1, http://www.ncbi.nlm.nih.gov/assembly/GCF_001066335.1).
This strain was used for the reference based assembly.

### Bowtie2 Reference Mapping

Reference based assembly needs samtools sorted bam files as input.
Reference alignment was created by bowtie2 mapping (alvars script).

First run: Forgot the flag to keep the intermediary SAM files, which I want. 
Second run: Flag -k to keep intermediary SAM files.

Convert SAM file in sorted BAM file by using samtools -bS view and samtools sort.

Moving the BAM file to high_mem node for faster assembly.

Had to use some different commands compared to the Trinity homepage instructions because I'm not using the latest Trinity version!

### Assembly

Mostly standard settings (https://github.com/trinityrnaseq/trinityrnaseq/wiki/Genome-Guided-Trinity-Transcriptome-Assembly)

Max intron length: 0 (makes sense)

Using SS_lib_type flag.

# Assembly evaluation

### Read content

* Description

Count the number of paired-end reads that properly map to the transcriptome assembly.
Some transcripts may be fragmented or short and only one fragment read of a pair may align.
Using bowtie to align each fragment to the transcriptome.
Use alignment statistics to count all reads mapping back to the assembly.
     
* Results



### BUSCO

* Description

* Results

### Contif Nx and ExNy Statistics

* Description

* Results




# Abundance estimation: Remapping of raw reads to get read counts


# Differential expression or other analysis
