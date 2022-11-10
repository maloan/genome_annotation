#!/usr/bin/env bash
#SBATCH --mem-per-cpu=16G
#SBATCH --time=1-00:00:00
#SBATCH --job-name=step_6
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/step_6_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/step_6_%j.e
##SBATCH --partition=pcourseassembly

module load SequenceAnalysis/GenePrediction/maker/2.31.9;
module load Blast/ncbi-blast/2.9.0+

WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/automatic_annotation

#flye
cd $WORKDIR/flye/pilon.maker.output/
maker_map_ids --prefix An1_ pilon.all.gff > flye.all.id.map
map_fasta_ids flye.all.id.map pilon.all.maker.transcripts.fasta
map_fasta_ids flye.all.id.map pilon.all.maker.proteins.fasta
map_gff_ids flye.all.id.map pilon.all.gff

# canu
cd $WORKDIR/canu/pilon.maker.output/
maker_map_ids --prefix An1_ pilon.all.gff > canu.all.id.map
map_fasta_ids canu.all.id.map pilon.all.maker.transcripts.fasta
map_fasta_ids canu.all.id.map pilon.all.maker.proteins.fasta
map_gff_ids canu.all.id.map pilon.all.gff
