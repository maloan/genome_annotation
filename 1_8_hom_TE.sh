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

cd $WORKDIR/annotation/man_annotation/flye
seqkit subseq --bed  $WORKDIR/annotation/man_annotation/flye/flye_window.bed $WORKDIR/assemblies/flye/pilon.fasta -u 2000 -d 2000 > flye_window.bed.fa
