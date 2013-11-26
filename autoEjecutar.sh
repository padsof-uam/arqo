#!/bin/bash
make clean && make
echo "let's go with ejer 1" >> control.txt
echo "#####################################3">> control.txt
./scripts/genData
echo "Done"
echo "#####################################3">> control.txt
./scripts/genDataCache
echo "#####################################3">> control.txt
echo "Vamos con ejercicio 3">>control.txt
./scripts/genDataMatrix 
#Una vez tenemos los datos generados vamos a por las gráficas
echo "Emepzamos con las gráficas" >> control.txt
#Generador de los scripts de gnuplot necesarios
./graficas/tamCache.sh

#Generación de gráficas
gnuplot graficas/*.gp

echo "limpiamos" >> control.txt
#Limpia
rm *.out.*
