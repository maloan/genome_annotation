#!/usr/bin/env bash
#SBATCH --mem-per-cpu=64G
#SBATCH --time=3-00:00:00
#SBATCH --job-name=automatic_MAKER
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/automatic_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/automatic_%j.e
##SBATCH --partition=pcourseassembly

# load module 
module load SequenceAnalysis/GenePrediction/maker/2.31.9;

cd /data/users/akurtz/assembly_annotation_course/annotation/automatic_annotation/flye
maker
