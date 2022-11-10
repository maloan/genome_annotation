#!/usr/bin/env bash

#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=16G
#SBATCH --cpus-per-task=4
#SBATCH --partition=pall
#SBATCH --job-name=5_2_star
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/output_star_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/error_star_%j.e

module add UHTS/Aligner/STAR/2.7.9a

WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/automatic_annotation
FASTA=/data/users/akurtz/assembly_annotation_course/assembly/assemblies
#mkdir $WORKDIR/flye/flye_star
#mkdir $WORKDIR/canu/canu_star
#cd $WORKDIR/flye/flye_star

STAR \
--runThreadN 4 \
--runMode genomeGenerate \
--genomeDir $WORKDIR/flye/flye_star/ \
--genomeFastaFiles $FASTA/flye/pilon.fasta \
--sjdbGTFfile $WORKDIR/flye/pilon.maker.output/pilon.all.gtf \
--genomeSAindexNbases 12

#cd $WORKDIR/canu/canu_star
STAR \
--runThreadN 4 \
--runMode genomeGenerate \
--genomeDir $WORKDIR/canu/canu_star/ \
--genomeFastaFiles $FASTA/canu/pilon.fasta \
--sjdbGTFfile $WORKDIR/canu/pilon.maker.output/pilon.all.gtf \
--genomeSAindexNbases 12

