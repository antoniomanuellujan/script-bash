#!/bin/bash

OLDIFS=$IFS
IFS=","
carpetas='/home/profesor/Escritorio/alumnos/1BCH'

while read curso nre name password
do
     useradd -c "$name" -s /sbin/nologin "$nre" #se crean los usuarios sin permisos para el shell
     (echo "$password";echo "$password") |  passwd "$nre" #se le da contraseña al usuario de UNIX
     (echo "$password";echo "$password") |  smbpasswd -a "$nre"  #se le da contraseña al usuario samba
     mkdir $carpetas/"$name" #se crea carpeta del alumno con el nombre del alumno
     chown  -R "$nre":"$nre" $carpetas/"$name" #el alumno pasa a ser el nuevo propietario		     
     chmod -R 775 $carpetas/"$name" #permisos escritura propietario y grupo(puede entrar el profesor)
done < user1bch.csv
