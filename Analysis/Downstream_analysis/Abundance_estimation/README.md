# Introduction

The first step of the downstream analysis is transcript abundance estimation.
There are alignment-based methods (RSEM, eXpress, Cufflinks) and alignment-free methods (examinining k-mer abundances - kallisto, salmon).

This programs will generate two counts values which are important for nearly all further downstream analyses.

Firstly transcript-level estimates of the count of RNA-Seq fragments that were derived from each transcript. 
This count matrices are important for differential expression analyses (EdgeR or DESeq)

Secondly also normalized measurements of transcript expression will be performed. 
This method also takes into account the transcript length, number of reads mapped and total number of reads mapped to any transcript (FPKM).
This values are important for plotting in heatmaps and more downstream analyses.

For now, RSEM will be used. Maybe also eXpress, because it is based on a different algorithm that the other two programs (no maximum-liklihood)

### RSEM-Analysis

For the abundance estimation two scripts were used.

Prep_reference.sge just prepares the assembly. It is a trinity advice to do this seperatly.

all_estimate.sge runs the abundance estimation on each sample at one time. 
Maybe include options to run a few ones at the same time???
Don't know how much time it takes...

The best assembly out of the three assemblies (de_novo_1, de_novo_2 and ref_1) will be used.

The assembly ...... was the best.

### RSEM-output  
