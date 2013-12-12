set terminal pngcairo
set output 'Ejer3/imgs/ej3.png'
set xtics mirror rotate by -45
set xlabel "Tamaño de la matriz"
set ylabel "Tiempo de ejecución (s)"
set key left
set key outside
plot for [col=2:6] 'Ejer3/Ejer3.dat' using 0:col:xtic(1) with lines title columnheader
