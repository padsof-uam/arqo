#!/bin/bash
tam=1000
echo "Ejercicio 3: Ejecutando serie, paralelo con 1,2,3,4 hilos." 1>&2
echo "Tamaño: $tam" 1>&2
echo "Niveles paralelización: 0, 1, 2, 3" 1>&2
echo -e "Paralelización\t1 hilo\t\t2 hilos\t\t3 hilos\t\t4 hilos"
for j in {0,1,2,3}
do 
	echo -ne "$j\t"

	for i in $(seq 1 1 4)
	do
		echo -ne "\t"
		echo -n $(../bin/mults_$j $tam $i)
	done
	echo
done
