set terminal pngcairo
set output "graficas/fotos/multiplies_read.png"
set xlabel "Tamaños de la matriz"
set ylabel "Tiempo (s)"
set key left
plot 'data/matrix.dat' using 1:4 title "normal" w lines, 'data/matrix.dat' using 1:7 title "great" w lines