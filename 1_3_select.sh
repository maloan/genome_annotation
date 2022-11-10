#!/usr/bin/env bash
#BATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8G
#SBATCH --time=00:30:00
#SBATCH --job-name=02_manual_annotation
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/01_a_flye%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/01_a_flye%j.e
##SBATCH --partition=pcourseassembly

WORKDIR=/data/users/akurtz/assembly_annotation_course

cd $WORKDIR/annotation/man_annotation

# load module
module load UHTS/Analysis/SeqKit/0.13.2

# extract the selected contig from genome
seqkit grep -n -f $WORKDIR/annotation/man_annotation/flye/ID_flye.txt $WORKDIR/assemblies/flye/pilon.fasta -o flye_contigs.fa
seqkit grep -n -f $WORKDIR/annotation/man_annotation/canu/ID_canu.txt $WORKDIR/assemblies/canu/pilon.fasta -o canu_contigs.fa 
