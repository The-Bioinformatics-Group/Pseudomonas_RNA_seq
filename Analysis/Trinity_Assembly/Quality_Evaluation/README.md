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


de_novo_1:

################################
## Counts of transcripts, etc.
################################
Total trinity 'genes':  3113
Total trinity transcripts:	4639
Percent GC: 61.67

########################################
Stats based on ALL transcript contigs:
########################################

        Contig N10: 12611
        Contig N20: 9026
        Contig N30: 6477
        Contig N40: 5042
        Contig N50: 3812

        Median contig length: 812
        Average contig: 1771.74
        Total assembled bases: 8219107


#####################################################
## Stats based on ONLY LONGEST ISOFORM per 'GENE':
#####################################################

        Contig N10: 13779
        Contig N20: 10096
        Contig N30: 7326
        Contig N40: 5541
        Contig N50: 4375

        Median contig length: 841
	Average contig: 1914.27
	Total assembled bases: 5959128


de_novo_2:

 ################################
## Counts of transcripts, etc.
################################
Total trinity 'genes':  8931
Total trinity transcripts:	16695
Percent GC: 61.45

########################################
Stats based on ALL transcript contigs:
########################################

        Contig N10: 7722
        Contig N20: 4908
        Contig N30: 3574
        Contig N40: 2641
        Contig N50: 1949

        Median contig length: 544
        Average contig: 1069.09
        Total assembled bases: 17848389


#####################################################
## Stats based on ONLY LONGEST ISOFORM per 'GENE':
#####################################################

        Contig N10: 8773
        Contig N20: 5766
        Contig N30: 4337
        Contig N40: 3282
        Contig N50: 2456

        Median contig length: 570
 	Average contig: 1210.32
       	Total assembled bases: 10809361


ref_1: 



ExN50 statistics:

??
