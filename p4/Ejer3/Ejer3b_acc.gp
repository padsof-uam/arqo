set terminal pngcairo
set output 'imgs/ej3b_acc.png'
set xtics mirror rotate by -45 scale 0.5 font ",9"
set xlabel "Tamaño de la matriz"
set ylabel "Tiempo de ejecución (s)"
set key left
plot for [col=2:3] 'Ejer3b_acc.dat' using 0:col:xtic(1) with lines title columnheader
