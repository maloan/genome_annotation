#!/usr/bin/env bash
#BATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=8G
#SBATCH --time=10:00:00
#SBATCH --job-name=03_manual_annotation
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/clust%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/clust%j.e
##SBATCH --partition=pcourseassembly

WORKDIR=/data/users/akurtz/assembly_annotation_course
cd $WORKDIR/annotation/man_annotation/flye


# load module
module load Emboss/EMBOSS/6.6.0

cons -sequence TEL1_family.fa -outseq flye_TE1_family.cons -name flye_TE1_cons

cons -sequence TEL2_family.fa -outseq flye_TE2_family.cons -name flye_TE2_cons
