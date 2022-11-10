#!/usr/bin/env bash
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16G
#SBATCH --time=20:00:00
#SBATCH --job-name=06_manual_annotation
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/man%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/man%j.e
##SBATCH --partition=pcourseassembly

WORKDIR=/data/users/akurtz/assembly_annotation_course

# load module
module load UHTS/Analysis/SeqKit/0.13.2

#create directory for blast databases
#cd $WORKDIR/annotation/man_annotation/flye
#seqkit grep -n -f $WORKDIR/annotation/man_annotation/flye/blast_db_flye/flye_top_contig_windows.txt flye_contig_windows.fa -o flye_contig_windows_TOP50.fa

#create directory for blast databases
cd $WORKDIR/annotation/man_annotation/canu
seqkit grep -n -f $WORKDIR/annotation/man_annotation/canu/blast_db_canu/canu_top_contig_windows.txt canu_contig_windows.fa -o canu_contig_windows_TOP50.fa
