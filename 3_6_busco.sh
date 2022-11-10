#!/usr/bin/env bash

#SBATCH --time=10:00:00
#SBATCH --mem-per-cpu=16G
#SBATCH --cpus-per-task=8
#SBATCH --partition=pall
#SBATCH --job-name=busco
#SBATCH --mail-user=ananda.kurth@students.unibe.ch
#SBATCH --mail-type=begin,end,fail
#SBATCH --output=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/output_busco_%j.o
#SBATCH --error=/data/users/akurtz/assembly_annotation_course/annotation/scripts/outputs/error_busco_%j.e

# set the directories
PRODJDIR=/data/users/akurtz/assembly_annotation_course/
WORKDIR=/data/users/akurtz/assembly_annotation_course/annotation/automatic_annotation

# load busco and specify the running params
module load UHTS/Analysis/busco/4.1.4;

# make sure we have augustus (we copy the cluster default Augustus to our own location)
if [[ ! -d "augustus_config" ]]; then
    echo "Copying augustus_config to parent directory";
    cp -r /software/SequenceAnalysis/GenePrediction/augustus/3.3.3.1/config augustus_config
fi
export AUGUSTUS_CONFIG_PATH=./augustus_config

# flye 
cd $WORKDIR/flye/pilon.maker.output/
busco -i pilon.all.maker.proteins.fasta -l brassicales_odb10 -m proteins -c 16 -o busco_flye

# canu 
cd $WORKDIR/canu/pilon.maker.output/
busco -i pilon.all.maker.proteins.fasta -l brassicales_odb10 -m proteins -c 16 -o busco_canu
