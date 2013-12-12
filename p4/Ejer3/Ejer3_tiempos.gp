set terminal pngcairo
set output 'imgs/ej3.png'
set xtics mirror rotate by -45
set xlabel "Tamaño de la matriz"
set ylabel "Tiempo de ejecución (s)"
set key outside
set xrange[0:4]
plot for [col=1:4] 'Ejer3.dat' using 0:col:xtic(1) with lines title columnheader
