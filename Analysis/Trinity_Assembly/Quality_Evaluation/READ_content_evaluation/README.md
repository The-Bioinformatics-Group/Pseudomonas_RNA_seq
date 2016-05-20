### Introdction

Realign reads to transcriptome assembly.
Capture and count all reads that map our transcripts.
Count all properly paired mapped reads and the reads where just one read pair maps.

### Using this approach https://github.com/trinityrnaseq/trinityrnaseq/wiki/RNA-Seq-Read-Representation-by-Trinity-Assembly

Didn't use the -SS_lib_type flag for de_novo_1, because it was also not used for the assembly.

But used it for de_novo_2.

* Results

Didn't work???

### Using alvars mapping_filtering.sh script

* Results

### de_novo_2

160176870 reads; of these:
  160176870 (100.00%) were paired; of these:
    30410872 (18.99%) aligned concordantly 0 times
    8603114 (5.37%) aligned concordantly exactly 1 time
    121162884 (75.64%) aligned concordantly >1 times
    ----
    30410872 pairs aligned concordantly 0 times; of these:
      751845 (2.47%) aligned discordantly 1 time
    ----
    29659027 pairs aligned 0 times concordantly or discordantly; of these:
      59318054 mates make up the pairs; of these:
        29537617 (49.80%) aligned 0 times
        779597 (1.31%) aligned exactly 1 time
        29000840 (48.89%) aligned >1 times
90.78% overall alignment rate


### ref_1

160176870 reads; of these:
  160176870 (100.00%) were paired; of these:
    30586704 (19.10%) aligned concordantly 0 times
    10096360 (6.30%) aligned concordantly exactly 1 time
    119493806 (74.60%) aligned concordantly >1 times
    ----
    30586704 pairs aligned concordantly 0 times; of these:
      876813 (2.87%) aligned discordantly 1 time
    ----
    29709891 pairs aligned 0 times concordantly or discordantly; of these:
      59419782 mates make up the pairs; of these:
        29417465 (49.51%) aligned 0 times
        1237952 (2.08%) aligned exactly 1 time
        28764365 (48.41%) aligned >1 times
90.82% overall alignment rate

### ref_2

160176870 reads; of these:
  160176870 (100.00%) were paired; of these:
    30563751 (19.08%) aligned concordantly 0 times
    9693206 (6.05%) aligned concordantly exactly 1 time
    119919913 (74.87%) aligned concordantly >1 times
    ----
    30563751 pairs aligned concordantly 0 times; of these:
      808653 (2.65%) aligned discordantly 1 time
    ----
    29755098 pairs aligned 0 times concordantly or discordantly; of these:
      59510196 mates make up the pairs; of these:
        29389456 (49.39%) aligned 0 times
        1205679 (2.03%) aligned exactly 1 time
        28915061 (48.59%) aligned >1 times
90.83% overall alignment rate
