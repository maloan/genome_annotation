#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=16G
#SBATCH --time=2-00:00:00
#SBATCH --job-name=EDTA_canu
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/EDTA_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/EDTA_%j.e
##SBATCH --partition=pcourseassembly

CONTAINER=/data/courses/assembly-annotation-course/containers2
WORKDIR=/data/users/akurtz/assembly_annotation_course

cd $WORKDIR/annotation/EDTA_output/canu/

# canu 
singularity exec \
--bind $CONTAINER \
--bind $WORKDIR \
$CONTAINER/EDTA_v1.9.6.sif \
EDTA.pl \
--genome $WORKDIR/assemblies/canu/pilon.fasta \
--species others \
--step all \
--cds $WORKDIR/annotation/TAIR10_cds_20110103_representative_gene_model \
--anno 1 \
--threads 8 \

