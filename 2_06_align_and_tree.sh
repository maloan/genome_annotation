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

# load modules 
module load SequenceAnalysis/MultipleSequenceAlignment/clustal-omega/1.2.4
module load Phylogeny/FastTree/2.1.10


cd $WORKDIR/annotation/EDTA_output/flye

clustalo -i copia_merge.fasta -o copia_protein_align.fasta
clustalo -i gypsy_merge.fasta -o gypsy_protein_align.fasta

FastTree -out copia_tree copia_protein_align.fasta
FastTree -out gypsy_tree gypsy_protein_align.fasta



