set terminal png
set output "graficas/fotos/Cache_8192.png"
set xrange [0:2058]
set xlabel "Tamaño (8192)"
set ylabel "Fallos en la caché de Datos (nivel 1)"
set key left
plot "data/tamCache_8192.dat" using 1:2 title "slow write misses" w lines,"data/tamCache_8192.dat" using 1:3 title "slow read misses" w lines,"data/tamCache_8192.dat" using 1:4 title "fast write misses" w lines,"data/tamCache_8192.dat" using 1:5 title "fast read misses" w lines
