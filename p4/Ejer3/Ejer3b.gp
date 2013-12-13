set terminal pngcairo
set output 'imgs/ej3b.png'
set xtics mirror rotate by -45
set xlabel "Tamaño de la matriz"
set ylabel "Tiempo de ejecución (s)"
set key left
plot for [col=2:3] 'Ejer3b.dat' using 0:col:xtic(1) with lines title columnheader
