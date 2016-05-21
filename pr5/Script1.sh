############################
# Cristian Simon Moreno
# Practica 5 /1º Script
############################

# !/bin/bash

echo ">> Discos duros disponibles y su tamaño:"
sfdisk -s | awk '$1!="total:" {printf"%-15s %sMB\n",$1,$2/1024}'
echo ">> Particiones y su tamaño:"
sfdisk -l | awk '/dev/ && $1!="Disco" {printf "%-15s %sMB\n",$1,$6/1024}' 
echo ">> Volumenes logicos:"
pvs
vgs
lvs
echo ">> Informacion montaje de sistemas de ficheros:"
df -hT | awk '$2!="tmpfs" {printf"%-10s %-10s %-15% %-10s %-10s\n",$1,$2,$7,$3,$5}'