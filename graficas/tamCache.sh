#!/bin/bash
for i in data/tamCache_*.dat
do
	echo $i
	name=$i
	tam=$(echo $i | cut -d '_' -f 2 | cut -d . -f 1)
	echo $tam
	echo set terminal png > graficas/tamCache_$tam.gp
	echo set output '"'graficas/fotos/Cache_$tam.png'"' >> graficas/tamCache_$tam.gp
	echo set xrange [0:2058] >> graficas/tamCache_$tam.gp
	echo set xlabel '"'"Tamaño ("$tam")"'"'  >> graficas/tamCache_$tam.gp
	echo set ylabel '"'"Fallos en la caché de Datos (nivel 1)"'"'  >> graficas/tamCache_$tam.gp
	echo set key left  >> graficas/tamCache_$tam.gp
	echo plot '"'$i'"' using 1:2 title '"'"slow write misses"'"' w lines,'"'$i'"' using 1:3 title '"'"slow read misses"'"' w lines,'"'$i'"' using 1:4 title '"'"fast write misses"'"' w lines,'"'$i'"' using 1:5 title '"'"fast read misses"'"' w lines >> graficas/tamCache_$tam.gp
done
