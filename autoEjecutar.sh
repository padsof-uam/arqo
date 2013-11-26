#!/bin/bash
make clean && make
./scripts/genData
./scripts/genDataCache
./scripts/genDataMatrix
#Una vez tenemos los datos generados vamos a por las gráficas

#Generador de los scripts de gnuplot necesarios
./graficas/tamCache.sh

#Generación de gráficas
gnuplot graficas/*.gp


#Limpia
rm *.out.*
