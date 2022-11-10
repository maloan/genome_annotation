#!/usr/bin/env bash

#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=16G
#SBATCH --cpus-per-task=8
#SBATCH --partition=pall
#SBATCH --job-name=salmon
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/salmon%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/salmon%j.e

WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/automatic_annotation
READS=/data/users/akurtz/assembly_annotation_course/assembly/participant_3/RNAseq
CONTAINER=/software/singularity/containers

cd $WORKDIR/flye/salmon

singularity exec \
--bind $WORKDIR \
--bind $CONTAINER \
--bind $READS \
$CONTAINER/salmon-1.7.0-1.ubuntu18.sif \
salmon quant -i flye_transcripts_index -l A -1 <(zcat $READS/ERR754061_1.fastq.gz) -2 <(zcat $READS/ERR754061_2.fastq.gz) --validateMappings -o flye_transcripts_quant

cd $WORKDIR/canu/salmon

singularity exec \
--bind $WORKDIR \
--bind $CONTAINER \
--bind $READS \
$CONTAINER/salmon-1.7.0-1.ubuntu18.sif \
salmon quant -i canu_transcripts_index -l A -1 <(zcat $READS/ERR754061_1.fastq.gz) -2 <(zcat $READS/ERR754061_2.fastq.gz) --validateMappings -o canu_transcripts_quant
