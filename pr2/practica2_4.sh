########################
# Cristian Simon Moreno
########################

echo "Pulse una tecla: "
read TECLA  
case $TECLA in
  #NUMERO
  [0-9]) echo "Es un numero";;
  #LETRA
  [a-zA-Z]) echo "Es una letra";;
  #CARACTER ESPECIAL
  [!0-9a-zA-Z]) echo "Es un caracter especial";;  
esac
 