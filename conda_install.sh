#!/usr/bin/bash

echo "Give me your software name: "

read -a file

for i in ${file[@]}
do
	conda install -c bioconda $i
done

