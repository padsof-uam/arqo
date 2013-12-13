#!/bin/bash

EJ2_DAT=../data/ej2.dat
EJ2_ACC_DAT=../data/ej2_acc.dat
EJ3_DAT=../data/ej3.dat
EJ3_ACC_DAT=../data/ej3_acc.dat
EJ3B_DAT=../data/ej3b.dat
EJ3B_ACC_DAT=../data/ej3b_acc.dat

reexec=true
do_ej2=true
do_ej3=true
compile=false
makelatex=false

# Force execution in tools directory
cd "$( dirname "${BASH_SOURCE[0]}" )"

for arg in "$@"
do
	if [ $arg == "noexec" ] ; then
		reexec=false
	elif [ $arg == "no2" ] ; then
		do_ej2=false
	elif [ $arg == "no3" ] ; then
		do_ej3=false
	elif [ $arg == "make" ] ; then
		compile=true
	elif [ $arg == "latex" ] ; then
		makelatex=true
	fi
done

plot () {
	gps=$1
	in_file=$2
	title=$3
	num_fields=$4

	if [ -z "$5" ] ; then
		x_title="Tamaño"
	else
		x_title=$5
	fi

	last_col=$(($num_fields+1))
	fname=$(basename $in_file)
	fname=${fname%.*}
	img_out="../imgs/$fname.png"
	echo "Graphing $in_file -> $img_out"
	gnuplot -e "out_f='$img_out'; in_f='$in_file'; y_title='$title'; last_col=$last_col; x_title='$x_title'" $gps
}

if $compile ; then
	cd ..
	make clean
	make
	cd tools
fi

mkdir -p ../imgs
mkdir -p ../data

if $do_ej2 ; then
	echo "Executing ex. 2"	
	if $reexec ; then
		./execute2.sh > $EJ2_DAT
	fi
	./compute_accel.py $EJ2_DAT $EJ2_ACC_DAT
	plot "graph.gp" $EJ2_DAT "Tiempo de ejecución" 5
	plot "graph.gp" $EJ2_ACC_DAT "Aceleración" 5
fi

if $do_ej3 ; then
	echo "Executing ex. 3"
	if $reexec ; then
		./execute3.sh > $EJ3_DAT
		./execute3b.sh > $EJ3B_DAT
	fi
	./compute_accel.py $EJ3_DAT $EJ3_ACC_DAT cell
	./compute_accel.py $EJ3B_DAT $EJ3B_ACC_DAT

	plot "graph.gp" $EJ3_DAT "Tiempo de ejecución" 4 "Número de hilos"
	plot "graph.gp" $EJ3_ACC_DAT "Aceleración" 4 "Número de hilos"

	plot "graph.gp" $EJ3B_DAT "Tiempo de ejecución" 2
	plot "graph.gp" $EJ3B_ACC_DAT "Aceleración" 2
fi

if $makelatex ; then
	cd ../Memoria
	./dat_to_tex.py $EJ3_DAT tables/Ej3_tiempos.tex
	./dat_to_tex.py $EJ3_ACC_DAT tables/Ej3_accel.tex
	./update_images
	latexmk -pdf -silent
fi
