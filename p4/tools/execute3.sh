#!/bin/bash
tam=1000
echo "Ejercicio 3: Ejecutando serie, paralelo con 1,2,3,4 hilos." 1>&2
echo "Tamaño: $tam" 1>&2
echo "Niveles paralelización: 0, 1, 2, 3" 1>&2
echo -e "\"Hilos\"\t\"Serie\"\t\"Bucle 1\"\t\"Bucle 2\"\t\"Bucle 3\""
for j in $(seq 1 1 4)
do 
	echo -ne "$j"
	echo -ne "Ejecutando para $j hilos...\r" 1>&2
	for i in $(seq 0 1 3)
	do
		echo -ne "\t"
		echo -n $(../bin/mults_$i $tam $j)
	done
	echo
done

