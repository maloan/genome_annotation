#!/usr/bin/env bash
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16G
#SBATCH --time=20:00:00
#SBATCH --job-name=04_manual_annotation
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/man%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/man%j.e
##SBATCH --partition=pcourseassembly

WORKDIR=/data/users/akurtz/assembly_annotation_course

# load module
module load Blast/ncbi-blast/2.9.0+

#create directory for blast databases
cd $WORKDIR/annotation/man_annotation/flye
mkdir blast_db_flye

# flye 
makeblastdb \
-in flye_contig_windows.fa \
-dbtype nucl \
-out blast_db_flye/blastn_contig_windows_flye

blastn \
-query flye_contig_windows.fa \
-db blast_db_flye/blastn_contig_windows_flye \
-num_threads 10 -outfmt 6 -perc_identity 80 \
-max_hsps 1 > flye_contig_windows.blastn

#create directory for blast databases
cd $WORKDIR/annotation/man_annotation/canu
mkdir blast_db_canu

# canu
makeblastdb \
-in canu_contig_windows.fa \
-dbtype nucl \
-out blast_db_canu/blastn_contig_windows_canu

blastn \
-query canu_contig_windows.fa \
-db blast_db_canu/blastn_contig_windows_canu \
-num_threads 10 -outfmt 6 -perc_identity 80 \
-max_hsps 1 > canu_contig_windows.blastn
