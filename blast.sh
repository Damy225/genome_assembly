#!/bin/bash
#SBATCH --job-name=g2HybBlast
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
conda activate /shared/Project1_Resources/Group2/shared_envs/blast

#Change working directory and assign variables
cd /shared/Project1_Resources/Group2/assemblies
mkdir ./comparison/blast/hybrid
out1=./comparison/blast/hybrid/
HyA1=./hybrid/S1/hybridassembly.fasta
HyA3=./hybrid/S3/hybridassembly.fasta
HyA5=./hybrid/S5/hybridassembly.fasta
cp $HyA1 "$out1"/hybrid1.fasta
cp $HyA3 "$out1"/hybrid3.fasta
cp $HyA5 "$out1"/hybrid5.fasta
out3=./comparison/blast/hybrid/*.fasta
out2=./comparison/blast/
ref=../reference_genomes/H_volcanii_everything.fasta

#Format blast database
makeblastdb -in $ref -dbtype nucl -out ref_genome_db

#Run blast
for file in $out3
do
	filename=$(basename "$file" .fasta)
	blastn -query $file -db ref_genome_db -out "$out2""$filename"blast_output.txt -outfmt 6
done
