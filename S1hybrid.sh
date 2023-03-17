#!/bin/bash
#SBATCH --job-name=hybridS1
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project1_Resources/Group2/0andE/%x.out
#SBATCH --error=/shared/Project1_Resources/Group2/0andE/%x.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group2/shared_envs/unicycler

#Change working directory and assign variables
cd /shared/Project1_Resources/Group2
sh1=./illumina/*S1*R1.fastq.gz
sh2=./illumina/*S1*R2.fastq.gz
long=./nanopore/barcode01pass.fastq.gz


# Run hybrid assembly for sample 1
unicycler --kmers 21,33,55 -1 $sh1 -2 $sh2 -l $long -o /shared/Project1_Resources/Group2/assemblies/hybrid/S1

