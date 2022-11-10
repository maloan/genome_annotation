#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=32G
#SBATCH --time=10:20:00
#SBATCH --job-name=2_EDTA
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
bedtools getfasta -s -name -fi $WORKDIR/flye/pilon.fasta -bed $WORKDIR/flye/final_pilon.fasta.mod.EDTA.TEanno.gff3_simplified -fo $WORKDIR/flye/gff_simplified.fasta

cd $WORKDIR/canu
bedtools getfasta -s -name -fi $WORKDIR/canu/pilon.fasta -bed $WORKDIR/canu/final_pilon.fasta.mod.EDTA.TEanno.gff3_simplified -fo $WORKDIR/canu/gff_simplified.fasta
