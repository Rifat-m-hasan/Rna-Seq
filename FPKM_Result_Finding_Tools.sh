#!/usr/bin/bash

read -p "Give me your saved file location: " location

cd 
cd $location

read -p "Give me your file name: " file

read -p "Give me your target gene name (LOC104906857): " gene

read -p "Do you want to save the result (yes/no) " result

if [ $result == "yes" ]; then
	read -p "Give me your file name (name.txt): " save
	grep -0 "$gene" $file | awk '/[a-zA-Z]/{print "Gene Name:", $5, "|", "FPKM Value:", $10}' > $save
	
	echo "Your File is saved successfully in ~$location"
	
else
	grep -0 "$gene" $file | awk '/[a-zA-Z]/{print "Gene Name:", $5, "|", "FPKM Value:", $10}'
	
fi
