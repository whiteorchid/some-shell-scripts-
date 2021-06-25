#!/bin/bash

#######  get brief info of the erv annotation file
less HERV_rmsk.hg38.v2.2.gtf |awk '{if ($3 ~ "gene"){print $0}}'   > tele_annot.gtf

less -S tele_annot.gtf |awk -F  '[\t;]' '{print $1,$4,$5,$7,$11}' |cut -d ' ' -f 1-4,7 |sed 's/"//g' > tele_annot_brief.gtf

##### extract the chr start end by awk
awk 'NR==FNR{a[$1]=$3;next} $5 in a{print $1,$2,$3,"0","0",$4,a[$5]}' telescope-telescope_report_50x.tsv tele_annot_brief.gtf > telescope.txt

##### filter to get bed format file 
less telescope.txt |awk '{if($7>0){print $0}}' > telescope_sensitivity.txt

less telescope.txt |awk '{if($7>10){print $0}}' > telescope_precision.txt


