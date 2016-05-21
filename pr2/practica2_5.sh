########################
# Cristian Simon Moreno
########################

echo "Introduzca un directorio: "
read DIRECTORIO 
DIR=0
FICH=0
for I in $DIRECTORIO/* 
do
    #ARCHIVO
	if [ -f $I ]; then
		FICH=`expr $FICH + 1`
	fi
	#DIRECTORIO
	if [ -d $I ]; then
		DIR=`expr $DIR + 1`
	fi	
done
echo "ARCHIVOS : $FICH"
echo "DIRECTORIOS : $DIR"




