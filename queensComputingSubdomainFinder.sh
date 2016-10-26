#!/bin/bash

#Deven Bernard - 10099810
#Marissa Huang - 10179169
#Kevin Zuern - 10134425
#Quentin Petraroia - 10145835


for i in $(seq 0 255);do
	for j in $(seq 0 255);do
		nslookup 130.15.$i.$j 1> subdomain.txt
		subD=$(grep -e "name = " subdomain.txt | awk '{print $4}')
		if [[ "$subD" = *.cs.queensu.ca* ]];then
			echo "130.15.$i.$j        $subD";
		fi;
	done;
done

