#!/bin/bash

#SBATCH --partition=longq7
#SBATCH --nodes=1
#SBATCH --mem=150GB
#SBATCH --mail-user=sguo2021@health.fau.edu
#SBATCH --mail-type=ALL

module load bedtools/2.19.1


cd /mnt/beegfs/groups/dllab/sguo/compare_50x

a=`bedtools intersect -s -f 0.1 -a hg38_te_100000_full.bed -b squire_sensitivity.txt -wb | cut -f 7-12|sort -k1,3V -k2,2n|uniq |wc -l `
b=`bedtools intersect -s -f 0.5 -a hg38_te_100000_full.bed -b squire_sensitivity.txt -wb | cut -f 7-12 |sort -k1,3V -k2,2n|uniq |wc -l `
c=`bedtools intersect -s -f 0.75 -a hg38_te_100000_full.bed -b squire_sensitivity.txt -wb | cut -f 7-12 |sort -k1,3V -k2,2n|uniq |wc -l `
d=`bedtools intersect -s -f 1 -a hg38_te_100000_full.bed -b squire_sensitivity.txt -wb | cut -f 7-12 |sort -k1,3V -k2,2n|uniq |wc -l `

#############
e=`bedtools intersect -s -f 0.1 -a hg38_te_100000_full.bed -b  lions_sensitivity.txt -wb | cut -f 7-12 |sort -k1,3V -k2,2n|uniq |wc -l `
f=`bedtools intersect -s -f 0.5 -a hg38_te_100000_full.bed -b  lions_sensitivity.txt -wb | cut -f 7-12 |sort -k1,3V -k2,2n|uniq |wc -l `
g=`bedtools intersect -s -f 0.75 -a hg38_te_100000_full.bed -b  lions_sensitivity.txt -wb | cut -f 7-12 |sort -k1,3V -k2,2n|uniq |wc -l `
h=`bedtools intersect -s -f 1 -a hg38_te_100000_full.bed -b  lions_sensitivity.txt -wb | cut -f 7-12 |sort -k1,3V -k2,2n|uniq |wc -l `



echo "
SQuIRE	$a      $b      $c      $d
LIONS	$e	$f	$g	$h
"
