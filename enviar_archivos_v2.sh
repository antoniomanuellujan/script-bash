#!/bin/bash

OLDIFS=$IFS
IFS=","
folder3A='/home/profesor/Escritorio/alumnos/3A'
folder3B='/home/profesor/Escritorio/alumnos/3B'
folder3C='/home/profesor/Escritorio/alumnos/3C'
folder3D='/home/profesor/Escritorio/alumnos/3D'
ruta_archivo='/home/profesor/Escritorio/freecad/'
echo "Nombre del archivo a depositar, sin extensión(p.e P1)"
read nombre_archivo
echo "Extensión del archivo a depositar, (p.e py)"
read ext_archivo

while read curso nre name password
do

if [ "$curso" = "3A" ];then
     carpeta=$folder3A
elif [ "$curso" = "3B" ];then
     carpeta=$folder3B
elif [ "$curso" = "3C" ];then
     carpeta=$folder3C
else
     carpeta=$folder3D
fi
     cp $ruta_archivo/$nombre_archivo"."$ext_archivo $carpeta/"$name" #se copian achivos a la carpeta del alumno
     mv $carpeta/"$name"/$nombre_archivo"."$ext_archivo $carpeta/"$name"/$nombre_archivo"_""$name""."$ext_archivo
     archivo=$nombre_archivo"_""$name""."$ext_archivo  
     chown "$nre":"$nre" $carpeta/"$name"/$archivo  #se cambia propietario del archivo al alumno
     chmod 775 $carpeta/"$name"/$archivo #se ponen permisos de escritura al alumno

done < user3eso.csv
