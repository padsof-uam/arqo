#!/bin/bash
best_paral=3
best_tnum=4
tams=$(seq 10 32 1034)

echo "Ejercicio 3B: Ejecutando comparación de versión paralela $best_paral con $best_tnum hilos" 1>&2
echo -e "Tamaño\tSerie\t\"Paralelo $best_paral $best_tnum hilos\""

for i in $tams
do
	echo -ne "$i\t"
	echo -n $(../bin/mults_0 $i $best_tnum)
	echo -ne "\t"
	echo -n $(../bin/mults_$best_paral $i $best_tnum)
	echo
done
