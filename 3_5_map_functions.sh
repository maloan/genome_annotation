#!/usr/bin/env bash

#SBATCH --mem-per-cpu=16G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=step_6
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/step_8_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/step_8_%j.e
##SBATCH --partition=pcourseassembly
#SBATCH --dependency=afterok:9475054
# module 
module load Blast/ncbi-blast/2.9.0+
WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/automatic_annotation

# flye
cd $WORKDIR/flye/pilon.maker.output/
maker_functional_fasta $WORKDIR/uniprot-plant_reviewed.fasta flye_blastp_output pilon.all.maker.proteins.fasta
maker_functional_gff $WORKDIR/uniprot-plant_reviewed.fasta flye_blastp_output pilon.all.gff

# canu
cd $WORKDIR/canu/pilon.maker.output/
maker_functional_fasta $WORKDIR/uniprot-plant_reviewed.fasta canu_blastp_output pilon.all.maker.proteins.fasta
maker_functional_gff $WORKDIR/uniprot-plant_reviewed.fasta canu_blastp_output pilon.all.gff
