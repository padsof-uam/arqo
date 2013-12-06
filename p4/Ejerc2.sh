#!/bin/bash
ejec=20

echo "Ejercicio 2: Ejecutando serie, paralelo con 1,2,3,4 hilos." 1>&2
echo "Tamaños: 1000, 2000, 5000, 10000, 20000, 30000, 40000, 50000, 100000" 1>&2
echo "N. medidas por ejecucion: $ejec" 1>&2
echo -e "Tamaño\tSerie\t\t1 hilo\t\t2 hilos\t\t3 hilos\t\t4 hilos"
for j in {1000,2000,5000,10000,20000,30000,40000,50000,100000}
do 
	echo -ne "$j\t"
	echo -n $(./pescalar_serie $j $i $ejec)

	for i in $(seq 1 1 4)
	do
		echo -ne "\t"
		echo -n $(./pescalar_par2 $j $i $ejec)
	done
	echo
done
