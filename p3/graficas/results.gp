set terminal pngcairo
set output 'graficas/fotos/ejercicio1.png'
set xlabel "Tamaño de la matriz"
set ylabel "Tiempo de ejecución (s)"
set xrange [0:2150]
set key left
plot 'data/results' using 1:2 title "slow" w lines, 'data/results' using 1:3 title "fast" w lines
