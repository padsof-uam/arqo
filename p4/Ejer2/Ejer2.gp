set terminal pngcairo
set output 'Ejer2/imgs/ej2_tiempos.png'
set xtics mirror rotate by -45
set xlabel "Tamaño de la matriz"
set ylabel "Tiempo de ejecución (s)"
set key left
set key outside
plot for [col=2:6] 'Ejer2/Ejer2.dat' using 0:col:xtic(1) with lines title columnheader
