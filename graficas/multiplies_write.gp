set terminal pngcairo
set output graficas/fotos/multiplies_write.png
set xlabel "Tamaños de la matriz"
set ylabel "Tiempo (s)"
set key left
plot 'data/matrix.dat' using 1:3 title "normal" w lines, '$i' using 1:6 title "great" w lines