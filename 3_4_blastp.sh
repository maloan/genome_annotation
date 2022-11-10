#!/usr/bin/env bash
#SBATCH --mem-per-cpu=10G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=step_7
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/step_7_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/step_7_%j.e
##SBATCH --partition=pcourseassembly

# module 
module load Blast/ncbi-blast/2.9.0+

WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/automatic_annotation

# create the database 
#makeblastdb -in $WORKDIR/uniprot-plant_reviewed.fasta -dbtype prot -out $WORKDIR/uniprot_db/uniprot_db

# flye 
cd $WORKDIR/flye/pilon.maker.output/
blastp -query pilon.all.maker.proteins.fasta -db $WORKDIR/uniprot_db/uniprot_db -num_threads 10 -outfmt 6 -evalue 1e-10 > flye_blastp_output

# canu
cd $WORKDIR/canu/pilon.maker.output/
blastp -query pilon.all.maker.proteins.fasta -db $WORKDIR/uniprot_db/uniprot_db -num_threads 10 -outfmt 6 -evalue 1e-10 > canu_blastp_output
