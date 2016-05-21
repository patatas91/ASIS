########################
# Cristian Simon Moreno
########################

echo "Nombre del fichero:"
read fichero
#EXISTE
if [ -f $fichero ]
then
	chmod +x $fichero
	echo "Modo final del fichero:"
	#LECTURA
	if [ -r $fichero ]
	then
		echo "Se puede leer"
	else
		echo "No se puede leer"
	fi
	#ESCRITURA
	if [ -w $fichero ]
	then
		echo "Se puede escribir"
	else
		echo "No se puede escribir"
	fi
	#EJECUCION
	if [ -x $fichero ]
	then
		echo "Se puede ejecutar"
	else
		echo "No se puede ejecutar"
	fi
else
	echo "El fichero no existe"
fi







	
