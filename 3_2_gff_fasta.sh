#!/usr/bin/env bash
#SBATCH --mem-per-cpu=16G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=gff_fasta
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/automatic_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/automatic_%j.e
##SBATCH --partition=pcourseassembly

# load module 
module load SequenceAnalysis/GenePrediction/maker/2.31.9;

WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/automatic_annotation

cd $WORKDIR/flye/pilon.maker.output/
gff3_merge -d pilon_master_datastore_index.log
fasta_merge -d pilon_master_datastore_index.log

cd $WORKDIR/canu/pilon.maker.output/
gff3_merge -d pilon_master_datastore_index.log
fasta_merge -d pilon_master_datastore_index.log



