### Content_evaluation_1.sge
Running the Trinity approach (https://github.com/trinityrnaseq/trinityrnaseq/wiki/RNA-Seq-Read-Representation-by-Trinity-Assembly) for Read Content assessment.
For each assembly one script (only changing the input files).

### Quality_evaluation.sge
Running Alvars script (adjust.sh) for bowtie2 mapping and statistics.

### Basic_statistics.sge
Running basic N50 statistics on fasta assembly.

### BUSCO_assesment.sge
Checking the completeness of the assembly by using Busco v1.1.


