#!/bin/bash
make clean && make
./genData
./genDataCache
./genDataMatrix
#Una vez tenemos los datos generados vamos a por las gráficas

#Generador de los scripts de gnuplot necesarios
./tamCache.sh

#Generación de gráficas
gnuplot graficas/*.gp


#Limpia
rm *.out.*