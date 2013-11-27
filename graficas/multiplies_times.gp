set terminal pngcairo
set output "graficas/fotos/multiplies_times.png"
set xlabel "Tamaños de la matriz"
set ylabel "Tiempo (s)"
set key left
plot 'data/matrix.dat' using 1:2 title "normal" w lines, 'data/matrix.dat' using 1:5 title "great" w lines