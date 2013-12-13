#!/bin/bash
ejec=20

echo "Ejercicio 2: Ejecutando serie, paralelo con 1,2,3,4 hilos." 1>&2
echo "Tamaños: 100000, 200000, 500000, 1000000, 2000000, 3000000, 4000000, 5000000, 10000000" 1>&2
echo "N. medidas por ejecucion: $ejec" 1>&2
echo -e "\"Tamaño\"\t\"Serie\"\t\t\"1 hilo\"\t\t\"2 hilos\"\t\t\"3 hilos\"\t\t\"4 hilos"
for j in {100000,200000,500000,1000000,2000000,3000000,4000000,5000000,10000000}
do 
	echo -ne "$j\t"
	echo -ne "Ejecutando tamaño $j...\r" 1>&2
	echo -n $(../bin/pescalar_serie $j $i $ejec)

	for i in $(seq 1 1 4)
	do
		echo -ne "\t"
		echo -n $(../bin/pescalar_par2 $j $i $ejec)
	done
	echo
done
