#!/usr/bin/env bash
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8G
#SBATCH --time=00:30:00
#SBATCH --job-name=02_manual_annotation
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/output_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/error_%j.e
##SBATCH --partition=pcourseassembly

WORKDIR=/data/users/akurtz/assembly_annotation_course
cd $WORKDIR/annotation/EDTA_output/flye

module load UHTS/Analysis/SeqKit/0.13.2

seqkit grep -f copia.txt gff_simplified.fasta.rexdb-plant.cls.pep -o copia.fa
seqkit grep -f gypsy.txt gff_simplified.fasta.rexdb-plant.cls.pep -o gypsy.fa

cd $WORKDIR/annotation/EDTA_output/brass

seqkit grep -f copia.txt *.pep -o brass_copia.fa
seqkit grep -f gypsy.txt *.pep -o brass_gypsy.fa
