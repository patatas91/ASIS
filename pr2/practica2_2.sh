########################
# Cristian Simon Moreno
########################

# Guarda los parametros en par
for par in $*
do echo "El fichero es: $par" 
	# Para cada parametro comprueba si existe
	# Si existe lo muestra
	if [ -f $par ]
	then
		echo "Existe\n"
		more $par
		echo "\n==================="
	# Si no existe indica que no existe
	else
		echo "No existe"
		echo "==================="
	fi
done