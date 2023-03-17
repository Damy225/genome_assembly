#!/bin/bash
#SBATCH --job-name=Group2merge
#SBATCH --partition=hpc
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=1g
#SBATCH --time=01:00:00
#SBATCH --output=/shared/Project1_Resources/Group2/0andE/%x.out
#SBATCH --error=/shared/Project1_Resources/Group2/0andE/%x.err

cd /shared/Project1_Resources/source_data/ds989matt/20211022_045448/Fastq
#Merge illumina data
cat H164_S1_L*_R1_*.fastq.gz > /shared/Project1_Resources/Group2/illumina/H164_S1_AllLanes_R1.fastq.gz
cat H164_S1_L*_R2_*.fastq.gz > /shared/Project1_Resources/Group2/illumina/H164_S1_AllLanes_R2.fastq.gz
cat H3931_S3_L*_R1_*.fastq.gz > /shared/Project1_Resources/Group2/illumina/H3931_S3_AllLanes_R1.fastq.gz
cat H3931_S3_L*_R2_*.fastq.gz > /shared/Project1_Resources/Group2/illumina/H3931_S3_AllLanes_R2.fastq.gz
cat H1804_S5_L*_R1_*.fastq.gz > /shared/Project1_Resources/Group2/illumina/H1804_S5_AllLanes_R1.fastq.gz
cat H1804_S5_L*_R2_*.fastq.gz > /shared/Project1_Resources/Group2/illumina/H1804_S5_AllLanes_R2.fastq.gz

cd /shared/Project1_Resources/source_data/ds989matt/ds989/DS989_1_M1/20211124_1546_X3_FAQ09231_45399ec3

#Merge Nanopore data
cat ./fastq_pass/barcode01/*.fastq.gz > /shared/Project1_Resources/Group2/nanopore/barcode01pass.fastq.gz
cat ./fastq_pass/barcode03/*.fastq.gz > /shared/Project1_Resources/Group2/nanopore/barcode03pass.fastq.gz
cat ./fastq_pass/barcode05/*.fastq.gz > /shared/Project1_Resources/Group2/nanopore/barcode05pass.fastq.gz
cat ./fastq_fail/barcode01/*.fastq.gz > /shared/Project1_Resources/Group2/nanopore/barcode01fail.fastq.gz
cat ./fastq_fail/barcode03/*.fastq.gz > /shared/Project1_Resources/Group2/nanopore/barcode03fail.fastq.gz
cat ./fastq_fail/barcode05/*.fastq.gz > /shared/Project1_Resources/Group2/nanopore/barcode05fail.fastq.gz

