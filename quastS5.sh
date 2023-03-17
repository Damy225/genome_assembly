#!/bin/bash
#SBATCH --job-name=quastS5
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=2
#SBATCH --mem=15g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project1_Resources/Group2/0andE/%x.out
#SBATCH --error=/shared/Project1_Resources/Group2/0andE/%x.err

# These steps are required to activate Conda
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group2/shared_envs/quast

#Change working directory and assign variables
cd /shared/Project1_Resources/Group2/assemblies
ShA=./short_read/S5/spades/scaffolds.fasta
LoA=./long_read/S5/assembly.fasta
HyA=./hybrid/S5/assembly.fasta
out=./comparison/quast/S5

# Run hybrid assembly for sample 1
quast -o $out $ShA $LoA $HyA
