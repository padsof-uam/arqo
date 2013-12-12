set terminal pngcairo
set output 'imgs/ej3_acc.png'
set xlabel "Tamaño de la matriz"
set ylabel "Tiempo de ejecución (s)"
set key outside
plot for [col=2:5] 'Ejer2_acc.dat' using 0:col:xtic(1) with lines title columnheader
