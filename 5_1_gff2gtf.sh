#!/usr/bin/env bash

#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=16G
#SBATCH --cpus-per-task=8
#SBATCH --partition=pall
#SBATCH --job-name=gff2gtf
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/output_busco_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/error_busco_%j.e

module load UHTS/Assembler/cufflinks/2.2.1;

WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/automatic_annotation

gffread $WORKDIR/flye/pilon.maker.output/pilon.all.gff -o $WORKDIR/flye/pilon.maker.output/pilon.all.gtf
gffread $WORKDIR/canu/pilon.maker.output/pilon.all.gff -o $WORKDIR/canu/pilon.maker.output/pilon.all.gtf
