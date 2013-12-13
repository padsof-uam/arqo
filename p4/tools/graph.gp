set terminal pngcairo
set output out_f
set xtics mirror rotate by -45 scale 0.5 font ",9"
set xlabel x_title
set ylabel y_title
set key left
plot for [col=2:last_col] in_f using 0:col:xtic(1) with lines title columnheader
