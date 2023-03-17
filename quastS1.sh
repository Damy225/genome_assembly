#!/bin/bash
#SBATCH --job-name=quastS1
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
conda activate /shared/Project1_Resources/Group2/shared_envs/quast

#Change working directory and assign variables
cd /shared/Project1_Resources/Group2/assemblies
ShA=./short_read/S1/spades/scaffolds.fasta
LoA=./long_read/S1/assembly.fasta
HyA=./hybrid/S1/assembly.fasta
out=./comparison/quast/S1/

# Run hybrid assembly for sample 1
quast -o $out $ShA $LoA $HyA
