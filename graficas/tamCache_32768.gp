set terminal png
set output "Cache_32768.png"
set xlabel "Tamaño (32768)"
set ylabel "Fallos en la caché de Datos (nivel 1)"
set key left
plot "data/tamCache_32768.dat" using 1:2 title "slow" w lines, "data/tamCache_32768.dat" using 1:3 title "fast" w lines
