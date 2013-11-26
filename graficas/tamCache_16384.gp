set terminal png
set output "Cache_16384.png"
set xlabel "Tamaño (16384)"
set ylabel "Fallos en la caché de Datos (nivel 1)"
set key left
plot "data/tamCache_16384.dat" using 1:2 title "slow" w lines, "data/tamCache_16384.dat" using 1:3 title "fast" w lines
