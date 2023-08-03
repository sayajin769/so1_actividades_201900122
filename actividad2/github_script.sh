#!/bin/bash

# Leer la variable GITHUB_USER
GITHUB_USER="sayajin769"

# Consultar la URL y almacenar la respuesta en una variable
API_URL="https://api.github.com/users/$GITHUB_USER"
response=$(curl -s "$API_URL")

# Extraer la información requerida del JSON de respuesta sin jq
github_user=$(echo "$response" | grep -o '"login": *"[^"]*' | sed 's/"login": *"\(.*\)/\1/')
user_id=$(echo "$response" | grep -o '"id": *[0-9]*' | sed 's/"id": *//')
created_at=$(echo "$response" | grep -o '"created_at": *"[^"]*' | sed 's/"created_at": *"\(.*\)/\1/')

# Imprimir el mensaje
echo "Hola $github_user. User ID: $user_id. Cuenta fue creada el $created_at."

# Crear el log file
fecha=$(date +"%Y-%m-%d")
log_file="/tmp/$fecha/saludos.log"
mkdir -p "$(dirname "$log_file")"
echo "Hola $github_user. User ID: $user_id. Cuenta fue creada el $created_at." >> "$log_file"