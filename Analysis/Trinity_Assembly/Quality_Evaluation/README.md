# Different methods for quality mesurement

### BUSCO

BUSCO providesquanitative measures of the completeness of transcriptomes in termes of expected gene content.
Genes in the BUSCO datasets (Bacteria) are selected from orthologous gropus with genes present as single-copy orthologs in at least 90% of the species.

Identification of candidate regions by using tBLASTn using BUSCO consensus sequences --> Gene prediction --> classify matches as complete, duplicated, fragmented or missing using HMMER and lineage-specific BUSCO-profiles

### Read content

Realign reads to transcriptome assembly.
Capture and count all reads that map our transcripts.
Count all properly paired mapped reads and the reads where just one read pair maps.

Using two different scripts.
One described at Trinity Github page (https://github.com/trinityrnaseq/trinityrnaseq/wiki/RNA-Seq-Read-Representation-by-Trinity-Assembly)
And Alvar's Trimming and filtering script, which counts properly paired mapped reads and single mapped reads.

### Contig Nx and ExNy Statistics

Nx length statistic: At least x% of the assembled transcript nucleotides are found in contigs that are at least of Nx lenght.
N50: at least half of all assembled bases are in transcrit contigs of at least the N50 lenght value.

Trinity statistics outputs total trinity genes and transcripts, GC, N10, N20, N30, N40, N50, median contig length, Average contig, total assembled bases. 
It also presents the stats based on only the longest isoform per Gene, because sometimes Trinity produces too many isoforms, especially for longer transcripts. Better!

But not really reliable indicator for transcriptome quality.

