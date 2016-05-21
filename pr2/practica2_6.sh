########################
# Cristian Simon Moreno
########################

dirbin=$HOME/bin
FI=0

#Comprueba si existe el directorio bin y si no existe lo crea
[ -d $dirbin ] || mkdir $dirbin

for I in ./*  
do
	if [ -f $I ]; then		
		echo "ARCHIVO MOVIDOS: $I"		
		mv -f $I $dirbin
		FI=`expr $FI + 1`		
	fi	
done
echo "TOTAL DE ARCHIVOS MOVIDOS: $FI"