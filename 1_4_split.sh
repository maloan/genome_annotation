#!/usr/bin/env bash
#BATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8G
#SBATCH --time=00:30:00
#SBATCH --job-name=03_manual_annotation
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/man%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/man%j.e
##SBATCH --partition=pcourseassembly

WORKDIR=/data/users/akurtz/assembly_annotation_course

# load module
module load UHTS/Analysis/SeqKit/0.13.2

# Split the contig into 500bp windows
#cd $WORKDIR/annotation/man_annotation/flye
#seqkit sliding -s 500 -W 500 -g flye_contigs.fa > flye_contig_windows.fa

cd $WORKDIR/annotation/man_annotation/canu
seqkit sliding -s 500 -W 500 -g canu_contigs.fa > canu_contig_windows.fa
