#!/usr/bin/bash

echo "Give me your accession number (SRA123456): "

cd ~/GST_RNA-Seq/Raw-Read

read -a sra

for i in ${sra[@]};
do
	fastq-dump -I --split-files --gzip $i
done




