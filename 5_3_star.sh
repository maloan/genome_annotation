#!/usr/bin/env bash

#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=16G
#SBATCH --cpus-per-task=8
#SBATCH --partition=pall
#SBATCH --job-name=5_3_star
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/output_star_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/error_star_%j.e

module add UHTS/Aligner/STAR/2.7.9a

WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/automatic_annotation
READS=/data/users/akurtz/assembly_annotation_course/assembly/participant_3/RNAseq

STAR \
--runThreadN 8 \
--genomeDir $WORKDIR/flye/flye_star/ \
--readFilesIn <(zcat $READS/ERR754061_1.fastq.gz) <(zcat $READS/ERR754061_2.fastq.gz) \
--outFileNamePrefix $WORKDIR/flye/flye_star/rna_map \
--outSAMtype BAM SortedByCoordinate \
--outFilterMultimapNmax 10 \
--outFilterMismatchNoverLmax 0.01 \
--alignIntronMax 60000 \


STAR \
--runThreadN 8 \
--genomeDir $WORKDIR/canu/canu_star/ \
--readFilesIn <(zcat $READS/ERR754061_1.fastq.gz) <(zcat $READS/ERR754061_2.fastq.gz) \
--outFileNamePrefix $WORKDIR/canu/canu_star/rna_map \
--outSAMtype BAM SortedByCoordinate \
--outFilterMultimapNmax 10 \
--outFilterMismatchNoverLmax 0.01 \
--alignIntronMax 60000 \
