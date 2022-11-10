#!/usr/bin/env bash
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16G
#SBATCH --time=20:00:00
#SBATCH --job-name=04_manual_annotation
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/man%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/man%j.e
##SBATCH --partition=pcourseassembly

WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/man_annotation/flye
FASTA=/data/courses/assembly-annotation-course

# load module
module load Blast/ncbi-blast/2.9.0+

#create directory for blast databases
cd $WORKDIR
#mkdir blast_brass

#makeblastdb -in $FASTA/Brassicaceae_repbase_all_march2019.fasta -dbtype nucl -out $WORKDIR/blast_brass/brass_genome

blastn -query $WORKDIR/flye_TE1_family.cons -db $WORKDIR/blast_brass/brass_genome -outfmt 6 -num_threads 10 -perc_identity 80 -qcov_hsp_perc 80 -max_hsps 1 > $WORKDIR/blast_brass/consens_1.blastn
blastn -query $WORKDIR/flye_TE2_family.cons -db $WORKDIR/blast_brass/brass_genome -outfmt 6 -num_threads 10 -perc_identity 80 -qcov_hsp_perc 80 -max_hsps 1 > $WORKDIR/blast_brass/consens_2.blastn
