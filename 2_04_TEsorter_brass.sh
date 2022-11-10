#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=16G
#SBATCH --time=2-00:00:00
#SBATCH --job-name=EDTA_flye
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/EDTA_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/EDTA_%j.e
##SBATCH --partition=pcourseassembly

CONTAINER=/data/courses/assembly-annotation-course/containers2
WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/EDTA_output
FASTA=/data/courses/assembly-annotation-course/CDS_annotation

cd $WORKDIR/brass
singularity exec \
--bind $CONTAINER \
--bind $WORKDIR \
--bind $FASTA \
$CONTAINER/TEsorter_1.3.0.sif \
TEsorter $FASTA/Brassicaceae_repbase_all_march2019.fasta -db rexdb-plant
