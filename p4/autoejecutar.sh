#!/bin/bash
make clean
make
cd Ejer2
./Ejerc2.sh > Ejer2.dat
python preprocess.py Ejer2.dat
gnuplot Ejer2.gp Ejer2_acc.gp
cd ../Ejer3
./Ejer3.sh > Ejer3.dat
python preprocess.py Ejer3.dat
gnuplot Ejer3_tiempos.gp Ejer3_acc.gp

