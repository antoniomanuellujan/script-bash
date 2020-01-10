#!/bin/bash

OLDIFS=$IFS
IFS=","
ruta='/home/profesor/Escritorio/alumnos/1BCH' #¡CAMBIAR!
echo "Nombre del archivo a depositar, sin extensión(p.e P1)"
read nombre_archivo
echo "Extensión del archivo a depositar, (p.e py)"
read ext_archivo

while read curso nre name password
do
     rm $ruta/"$name"/$nombre_archivo"_""$name""."$ext_archivo #se borran achivos
 
done < user1bch.csv #¡CAMBIAR!
