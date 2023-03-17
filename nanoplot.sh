#!/bin/bash
#SBATCH --job-name=Group2nanoplot
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1g
#SBATCH --time=02:00:00
#SBATCH --output=/shared/Project1_Resources/Group2/0andE/%x.out
#SBATCH --error=/shared/Project1_Resources/Group2/0andE/%x.err

##Activate conda environment and set working directory
conda activate /shared/Project1_Resources/Group2/shared_envs/nanoplot/
cd /shared/Project1_Resources/Group2/nanopore

##Set folder variables
folder_path="/shared/Project1_Resources/Group2/nanopore"
destination_path="/shared/Project1_Resources/Group2/nanopore/QC/nanoplot"

##For loop to run each long read file through NanoPlot and save results to a new folder in nanopore QC folder
for file in $folder_path/*.fastq.gz; do
	filename=$(basename "$file" .fastq.gz)
	mkdir "$destination_path/$filename"
	NanoPlot --fastq $file --outdir ./QC/nanoplot/$filename
done
