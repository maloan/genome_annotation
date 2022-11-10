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
module load UHTS/Analysis/BEDTools/2.29.2;

# working directory 
WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/EDTA_output

# extract nucleotide sequence 
cd $WORKDIR/flye

bedtools getfasta -fi pilon.fasta -bed pilon.fasta.EDTA.intact.gff3_LTR_ref -name > pilon.fasta.mod.EDTA.intact.LTR.fa

