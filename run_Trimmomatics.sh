#!/usr/bin/env bash

read -p "Forward read: " forward
read -p "Reverse read: " reverse

read -p "Give your output file name identifire: " word

read -p "Give me your minimum length: " length

read -p "Give your expected average quality: " avg

read -p "Do you want Slidingwindow your read(yes/no): " slide

read -p "Do you want to apply adaptive quality trimming approach(yes/no): " trim

if [ $slide == "yes" ]; then
	read -p "Put your starting value: " first
	read -p "Put your ending value: " last
	
	java -jar trimmomatic-0.39.jar PE $forward $reverse "$word"_output_forward_paired.fq.gz "$word"_output_forward_unpaired.fq.gz "$word"_output_reverse_paired.fq.gz "$word"_output_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True SLIDINGWINDOW:$first:$last AVGQUAL:$avg MINLEN:$length

elif [ $trim == "yes" ]; then
	read -p "Give your strictness value(0 to 1): " strict

	java -jar trimmomatic-0.39.jar PE $forward $reverse "$word"_output_forward_paired.fq.gz "$word"_output_forward_unpaired.fq.gz "$word"_output_reverse_paired.fq.gz "$word"_output_reverse_unpaired.fq.gz MAXINFO:$length:$strict MINLEN:$length


else
	read -p "Give me your expected minimum value: " min

	java -jar trimmomatic-0.39.jar PE $forward $reverse "$word"_output_forward_paired.fq.gz "$word"_output_forward_unpaired.fq.gz "$word"_output_reverse_paired.fq.gz "$word"_output_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True TRAILING:$min AVGQUAL:$avg MINLEN:$length)

fi

