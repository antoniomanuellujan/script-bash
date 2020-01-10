#!/bin/bash

OLDIFS=$IFS
IFS=","
folder3A='/home/profesor/Escritorio/alumnos/3A'
folder3B='/home/profesor/Escritorio/alumnos/3B'
folder3C='/home/profesor/Escritorio/alumnos/3C'
folder3D='/home/profesor/Escritorio/alumnos/3D'

while read curso nre name password
do
      useradd -c "$name" -s /sbin/nologin "$nre" #se crean los usuarios sin permisos para el shell
     (echo "$password";echo "$password") |  passwd "$nre" #se le da contraseña al usuario de UNIX
     (echo "$password";echo "$password") |  smbpasswd -a "$nre"  #se le da contraseña al usuario samba

if [ "$curso" = "3A" ];then
     carpeta=$folder3A
elif [ "$curso" = "3B" ];then
     carpeta=$folder3B
elif [ "$curso" = "3C" ];then
     carpeta=$folder3C
else
     carpeta=$folder3D
fi

     mkdir $carpeta/"$name" #se crea carpeta del alumno con el nombre del alumno
     chown  -R "$nre":"$nre" $carpeta/"$name" #el alumno pasa a ser el nuevo propietario
     chmod -R 770 $carpeta/"$name" #permisos escritura propietario y grupo(puede entrar el profesor)

done < user3eso.csv
