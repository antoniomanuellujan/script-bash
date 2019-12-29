#!/bin/bash

OLDIFS=$IFS
IFS=","
ruta='/home/profesor/Escritorio/freecad/'
archivo='P1.fcstd'
#P1_1='P1.fcstd1'

while read nre name password
do
     cp $ruta/$archivo $ruta/alumnos/"$name" #se copian achivos a la carpeta del alumno
     chown "$nre":"$nre" $ruta/alumnos/"$name"/$archivo  #se cambia propietario del archivo al alumno
     chmod 755 $ruta/alumnos/"$name"/$archivo #se ponen permisos de escritura al alumno
     
done < user.csv
