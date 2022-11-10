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

makeblastdb -in $WORKDIR/assemblies/flye/pilon.fasta -dbtype nucl -out blast_db_flye/flye_genome

blastn -query flye_window.fa -db $WORKDIR/annotation/man_annotation/flye/blast_db_flye/flye_genome -outfmt 6 -num_threads 10 -perc_identity 80 -qcov_hsp_perc 80 -max_hsps 1 > flye_window.blastn
