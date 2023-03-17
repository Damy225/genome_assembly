#!/bin/bash
#SBATCH --job-name=shortspadesS5
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project1_Resources/Group2/0andE/%x.out
#SBATCH --error=/shared/Project1_Resources/Group2/0andE/%x.err

# These steps are required to activate conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group2/shared_envs/spades

# Change working directory and assign variables
cd /shared/Project1_Resources/Group2
sh1=./illumina/*S5*R1.fastq.gz
sh2=./illumina/*S5*R2.fastq.gz

# Run short read assembly for sample 1
spades.py -1 $sh1 -2 $sh2 -o /shared/Project1_Resources/Group2/assemblies/short_read/S5/spades
