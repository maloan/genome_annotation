#!/usr/bin/env bash
#BATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8G
#SBATCH --time=00:30:00
#SBATCH --job-name=01_a_manual_annotation
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/01_a_flye%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/01_a_flye%j.e
##SBATCH --partition=pcourseassembly

WORKDIR=/data/users/akurtz/assembly_annotation_course

cd $WORKDIR/annotation/man_annotation

# load module 
module load UHTS/Analysis/SeqKit/0.13.2

# print all sequences length
cd $WORKDIR/annotation/man_annotation/flye
seqkit fx2tab -l -n $WORKDIR/assemblies/flye/pilon.fasta 
