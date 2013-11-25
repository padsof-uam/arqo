set terminal pngcairo
set output graficas/multiplies_times.png
set xlabel "Tamaños de la caché"
set ylabel "Tiempo (s)"
plot 'tamCache_multiplies.dat' using 1:2 title "normal" w lines, '$i' using 1:3 title "great" w lines