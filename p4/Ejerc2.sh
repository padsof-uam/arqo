#!/bin/bash
ejec=10
for j in {1000,2000,5000,10000,20000,30000,40000,50000,100000}
do 
	echo -n "$j "
	echo -n $(./pescalar_serie $j $i $ejec)

	for i in $(seq 1 1 4)
	do
		echo -n " "
		echo -n $(./pescalar_par2 $j $i $ejec)
	done
	echo
done
