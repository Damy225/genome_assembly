#!/bin/bash
#SBATCH --job-name=g2prokkaS3
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-node=1
#SBATCH --mem=30g
#SBATCH --time=24:00:00
#SBATCH --output=/shared/Project1_Resources/Group2/0andE/%x.out
#SBATCH --output=/shared/Project1_Resources/Group2/0andE/%x.err

##Activate cond environment and set working directory 
source $HOME/.bash_profile
conda activate /shared/Project1_Resources/Group2/shared_envs/prokka/ 
cd /shared/Project1_Resources/Group2/assemblies

##Set folder variables
HyA=./hybrid/S3/assembly.fasta
LoA=./long_read/S3/assembly.fasta
ShA=./short_read/S3/spades/scaffolds.fasta
out=./comparison/prokka/S3/

#Run Prokka on the hyrbid assembly
prokka --outdir "$out"/hybrid --force --prefix s3hybrid --genus Haloferax --species volcanii $HyA

#Run Prokka on the long assembly
prokka --outdir "$out"/long --force --prefix s3long --genus Haloferax --species volcanii $LoA

#Run Prokka on the short assembly
prokka --outdir "$out"/short --force --prefix s3short --genus Haloferax --species volcanii $ShA




