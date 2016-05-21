############################
# Cristian Simon Moreno
# Practica 5 /2º Script
############################

# !/bin/bash

#Comprobamos que el nº de parametros es el correcto
if [ $# -ne 4 ]
then
	echo "Orden incorrecta"
	echo "Uso:"
	echo "grupo volumen particion tamaño(_G/_M)"
fi

#Definimos los parametros
grupo=$1
volumen=$2
particion=$3
size=$4

echo "ATENCION: Asegurese de que la particion, volumen y el tamaño son correctos"

echo ">> Creando volumenes fisicos"
pvcreate $particion
echo ">> Extension del grupo"
vgextend $grupo $particion
echo ">> Extension del volumen"
lvextend -L +$size /dev/$grupo/$volumen
echo ">> Redimensionado del sistema de ficheros"
resize2fs /dev/$grupo/$volumen
echo ">> Ampliacion completada!"
