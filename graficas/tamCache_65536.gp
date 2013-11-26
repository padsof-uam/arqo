set terminal png
set output "Cache_65536.png"
set xlabel "Tamaño (65536)"
set ylabel "Fallos en la caché de Datos (nivel 1)"
set key left
plot "data/tamCache_65536.dat" using 1:2 title "slow" w lines, "data/tamCache_65536.dat" using 1:3 title "fast" w lines
