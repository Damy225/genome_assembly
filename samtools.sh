#!/bin/bash
#SBATCH --job-name=g2samtools
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=2
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project1_Resources/Group2/0andE/%x.out
#SBATCH --error=/shared/Project1_Resources/Group2/0andE/%x.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group2/shared_envs/samtools2

#change directory
cd /shared/Project!_Resources/Group2/assemblies/comparison/blast/hybrid

#samtools cut out part of sequence
samtools faidx hybrid3.fasta 1:597076-598995 -o h3insert.fasta
samtools faidx hybrid1.fasta 1:377800-378772 -o h3delete.fasta
