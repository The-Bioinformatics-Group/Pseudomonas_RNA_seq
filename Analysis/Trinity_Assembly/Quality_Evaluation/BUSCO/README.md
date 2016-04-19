### Introduction

User manual: http://busco.ezlab.org/files/BUSCO_userguide.pdf

BUSCO providesquanitative measures of the completeness of transcriptomes in termes of expected gene content.
Genes in the BUSCO datasets (Bacteria) are selected from orthologous gropus with genes present as single-copy orthologs in at least 90% of the species.

Identification of candidate regions by using tBLASTn using BUSCO consensus sequences --> Gene prediction --> classify matches as complete, duplicated, fragmented or missing using HMMER and lineage-specific BUSCO profiles.

### Usage requirements

Installation of Python 3, HMMER 3.1, Blast+, EMBOSS transeq.

Not 100% sure, but all programs should be installed.

Only python v2.7 installed. Maybe need to install version 3.
#python 3 is installed and will be used

### Downloading BUSCO v.1.1b and Bacteria data set

wget http://busco.ezlab.org/files/BUSCO_v1.1b1.tar.gz

wget http://busco.ezlab.org/files/bacteria_buscos.tar.gz

tar -zxvf BUSCO_v1.1b.tar.gz 

### Running BUSCO 

Standard settings.

Running BUSCO on all assemblies.

### Results





 
