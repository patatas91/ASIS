############################
# Cristian Simon Moreno
# Practica 6 /1º Script
############################

# !/bin/bash

echo ""
# Registrar la hora y fecha en la que se ejecuta el script
echo "--------------------------------------------------"
logger -p local0.info "EJECUCION SCRIPT"
echo "--------------------------------------------------"
echo ""
echo "MAQUINA LOCAL"
echo "_____________"
echo ""
echo "-> Nº de usuarios y carga media de trabajos:"
uptime
echo ""
echo "-> Memoria ocupada y libre, swap utilizado:"
free 
echo ""
echo "-> Espacio ocupado y libre:"
df
echo ""
echo "-> Nº de puertos abiertos y conexiones establecidas:"
netstat
echo ""
echo "-> Nº de programas en ejecucion:"
ps
echo ""
echo "--------------------------------------------------"
echo ""
echo "MAQUINA REMOTA"
echo "_____________"
echo ""
echo "-> Verificar si la maquina remota funciona:"
ping -c 1 192.168.56.1
echo ""
echo "-> Nº de usuarios y carga media de trabajos:"
ssh user@192.168.56.1 uptime
echo ""
echo "-> Memoria ocupada y libre, swap utilizado:"
ssh user@192.168.56.1 free 
echo ""
echo "-> Espacio ocupado y libre:"
ssh user@192.168.56.1 df
echo ""
echo "-> Nº de puertos abiertos y conexiones establecidas:"
ssh user@192.168.56.1 netstat
echo ""
echo "-> Nº de programas en ejecucion:"
ssh user@192.168.56.1 ps
echo ""