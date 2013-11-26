set terminal png
set output "Cache_8192.png"
set xlabel "Tamaño (8192)"
set ylabel "Fallos en la caché de Datos (nivel 1)"
set key left
plot "data/tamCache_8192.dat" using 1:2 title "slow write" w lines, "data/tamCache_8192.dat" using 1:3 title "slow fast" w lines
