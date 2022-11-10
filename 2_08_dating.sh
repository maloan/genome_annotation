#!/usr/bin/env bash

#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8G
#SBATCH --time=00:20:00
#SBATCH --job-name=EDTA
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/EDTA_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/EDTA_%j.e
##SBATCH --partition=pcourseassembly

# load module 
module add Emboss/EMBOSS/6.6.0;

# working directory 
WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/EDTA_output/flye/dating

cd $WORKDIR

# use split_flat to split the fasta file into multiple ones.
scripts/LTR An1_ N 

# use the perl script LTR to align the two LTR sequences of each TE with Water (EMBOSS package)
scripts/split_flat pilon.fasta.mod.EDTA.intact.LTR.fa

# use the perl script date_pair to estimate the divergence time between the LTR sequences of each TE.
scripts/date_pair > date.summary
