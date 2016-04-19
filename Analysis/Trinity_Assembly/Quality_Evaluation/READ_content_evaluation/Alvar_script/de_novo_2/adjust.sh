#!/bin/bash

# Dependencies: bowtie2, samtools, seqtk
# Some code borrowed from https://wikis.utexas.edu/display/bioiteam/Example+BWA+alignment+script

# Test if the correct number of input files are specified
DATABASE=0
DELETE=1
NAME=0
FORWARD=0
REVERSE=0
UNPAIRED=0
CPU=1

HELP="""
	Made by: Alvar Almstedt & Mats Töpel
	
	If there is a problem, contact alvar.almstedt@gmail.com

Flags:

	-d	:	Database to be used for mapping to with bowtie2*
	-u	:	Unpaired read library**
	-1	:	Forward reads (paired)**
	-2	:	Reverse reads (paired)**
	-n	:	User specified analysis Name*
	-k	:	Keep intermediary *.sam files, else deleted after analysis
	-h	:	Help (what you are reading now)
	-t	:	Number of threads bowtie2 will use (default: 1)

*: Mandatory options
**: Either -1 and -2 for paired libraries or -u for unpaired. One of the two options are mandatory.

"""

while getopts :d:u:1:2:n:kht: opt; do
  case $opt in
	d)
		echo "-d (database) was input as $OPTARG" >&2
		DATABASE=$OPTARG
	;;
	u)
		echo "-u (unpaired) was input as $OPTARG" >&2
		UNPAIRED=$OPTARG
	;;
	1)
		echo "-1 (forward) was input as $OPTARG" >&2
		FORWARD=$OPTARG
	;;
	2)
		echo "-2 (reverse) was input as $OPTARG" >&2
		REVERSE=$OPTARG
	;;
	n)
		echo "-n (name) was input as $OPTARG" >&2
		NAME=$OPTARG
	;;
	k)
		echo "-k (keep) was triggered, sam files will be kept" >&2
		DELETE=0
	;;
	h)
		echo "$HELP"
		exit 1
	;;
	t)
		echo "-t number of cores was input as $OPTARG" >&2
		CPU=$OPTARG
	;;
	\?)
		echo "Invalid option: -$OPTARG" >&2
		echo "Type $0 -h for usage"
		exit 1
	;;
  esac
done

if [ $DATABASE = 0 ] ; then
	echo "You must specify a database file. Write $0 -h for usage"
	exit 1
fi

if [ $NAME = 0 ] ; then
	echo "You must specify a name for your analysis. Write $0 -h for usage."
	exit 1
fi

if [ $FORWARD = 0 ] || [ $REVERSE = 0 ] && [ $UNPAIRED = 0 ] ; then
	echo "Paired libraries need forward and reverse files, otherwise do an unpaired analysis. Write $0 for usage"
	exit 1
fi



# Print some informative error meassages
err() {
    echo "$1 exited unexpectedly";
    exit 1;
}

# Function for checking the exit code of a child process
checkExit() {
if [ "$1" == "0" ]; then
	echo "[Done] $2 `date`";
else
	err "[Error] $2 returned non-0 exit code $1";
fi
}

# Assigns names to variables
DATE=`date +%C%y_%m_%d`
SAM_FULL=${NAME}_full_${DATE}.sam
SAM_MAPPER=mapped_reads_${DATE}.sam
SAM_NON_MAPPER=non_mapped_reads_${DATE}.sam
LIST_MAPPER=mappers_${DATE}.lst
LIST_NON_MAPPER=non_mapped_reads_${DATE}.lst
LIST_TRUE_NON_MAPPER=non_mapped_reads.lst
LIST_TRUE_MAPPER=mapped_reads.lst
OUTDIR="$NAME"_$DATE
MAPPING_INFO=README_mapping.txt
wait
FW_FILENAMEONLY="${FORWARD##*/}"
REV_FILENAMEONLY="${REVERSE##*/}"
UNP_FILENAMEONLY="${UNPAIRED##*/}"
wait

# Creates a bowtie2 database and names it by date and a random number
files=$(ls "$DATABASE".?.bt2 2> /dev/null | wc -l)
if [ "$files" = "0" ]; then
	echo "[info] Creating bowtie2 database..."
	bowtie2-build -f $DATABASE $DATABASE
	checkExit $? "bowtie2-build"
else
	echo "[info] bowtie2 database aready exists, proceeding..." 
fi
wait

mkdir $OUTDIR

# Starts bowtie2 mapping
if [ $FORWARD != 0 ] || [ $REVERSE != 0 ] ; then
	echo "[info] Running bowtie2 mapping on paired libraries..."
	bowtie2 -x $DATABASE -1 $FORWARD -2 $REVERSE -S $OUTDIR/$SAM_FULL -p $CPU 2> $OUTDIR/$MAPPING_INFO
	checkExit $? "bowtie2"
	wait
else
	echo "[info] Running bowtie2 mapping on unpaired library..."
	bowtie2 -x $DATABASE -U $UNPAIRED -S $OUTDIR/$SAM_FULL -p $CPU 2> $OUTDIR/$MAPPING_INFO
	checkExit $? "bowtie2"
	wait
fi

# Deletes intermediary *.sam files if desired
if [[ $DELETE = 1 ]] ; then
	echo "[info] Removing intermediary sam files..."
	rm $OUTDIR/*.sam
    else
	echo "[info] Keeping sam files"
fi

echo "Finished running bowtie2 mapping and filtering $(date)"
