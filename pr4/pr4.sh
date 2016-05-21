########################
# Cristian Simon Moreno
# Practica 4
########################

#!/bin/bash

#Comprobamos que el numero de parametros es el correcto
if [ $# -ne 3 ]
then
	echo "Orden incorrecta"
	echo "Uso:"
	echo "add/del fichero ficheroHosts"
	exit
fi


#Comprobamos que el fichero existe
if [ -f $2 ] 
then

	#Si la orden ha sido 'add'
	#AÑADIR
	if [ "$1" = "add" ]
	then
		#Extraemos los usuarios del fichero
		cat $2 | \
		while read user pass
		do			
			#Comprueba si el usuario existe ya
			#Si no existe lo añade y si existe actualiza su contraseña		
			egrep "^$user" /etc/passwd > /dev/null
			if [ $? -eq 0 ]; then
				echo "$user ya existe, se le cambiara la contraseña"
				echo "$user:$pass" | chpasswd
			else	
				#Creamos un nuevo grupo con el nombre del usuario
				groupadd $user
				#Añadimos el usuario						
				useradd -g $user -m -d /home/$user -s /bin/bash -m -k /etc/skel $user
				echo "$user:$pass" | chpasswd
				[ $? -eq 0 ] && echo "Usuario $user añadido" || echo "Fallo al añadir" 		
			fi
		done 
	#Si la orden ha sido 'del'
	#ELIMINAR
	elif [ "$1" = "del" ]
	then
		#Creamos (si no existe) una carpeta de nombre "BACKUP" en el directorio HOME 
		#donde se guardaran los backup 
		[[ -d /home/BACKUP ]] || mkdir /home/BACKUP
		#Extraemos los usuarios del fichero
		cat $2 | \
		while read user pass
		do					
			#Comprueba si el usuario existe 
			#En caso contrario no hace nada		
			egrep "^$user" /etc/passwd > /dev/null
			if [ $? -eq 0 ]; then				
				#Hacemos el backup 
				tar -czf $user.tar.gz /home/$user 
				#Movemos el backup a la carpeta creada para los backups
				mv -f $user.tar.gz /home/BACKUP
				#Eliminamos el usuario con su Home
				userdel -r $user
				[ $? -eq 0 ] && echo "Usuario $user eliminado" || echo "Fallo al eliminar"
			else
				echo "$user no esta en el sistema"
			fi
		done
	#Si la orden ha sido erronea
	else
		echo "Orden erronea"
	fi

else
	echo "El fichero indicado no existe"
fi





