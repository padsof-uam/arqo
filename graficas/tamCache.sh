#!/bin/bash
for i in tamCache_*.dat
do
	name=$i
	tam=echo $i | cut -d '_' -f 2 | cut -d . -f 1
	echo set terminal png > graficas/tamCache.gp
	echo set output $i.png >> graficas/tamCache.gp
	echo set xlabel "Tamaño ("$tam")"  >> graficas/tamCache.gp
	echo set ylabel "Tiempo de ejecución (s)"  >> graficas/tamCache.gp
	echo set key left  >> graficas/tamCache.gp
	echo plot '$i' using 1:2 title "slow" w lines, '$i' using 1:3 title "fast" w lines >> graficas/tamCache.gp
done
