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

ExN50 statistics: More appropraite approach for transcriptome assembly. Here n50 statistics are limited to the top most expressed transcripts (x% of total normalized expression data).
This requires a transcript abundance estimation. 
E90N50 (90% contigs, n50 value) should be better and substantially greater than normal n50, because all lowly expressed transcripts get discarded. 
E90 number of transcripts is just a fraction of total number of transcripts (for which n50 statistic was based).

Profile/graph of Ex vs N50 can be a useful indicator for overall assembly quality. A high E90N50 peak is an indicator for a sufficient number of reads and therefore are good assembly. 
= Mesurement of read depth!

--> First estimate abundance! 


