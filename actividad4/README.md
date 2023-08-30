## Creación y Configuración de un Servicio Systemd en Ubuntu 20.04

en este caso mi nombre de usuario es steve

1. Crear el Script
Crea un archivo llamado `saludo_script.sh` en la carpeta home del usuario. 
y darle los permisos para poder acceder a el, desde la consola ejecutamos el comando:

chmod +x ~/saludo_script.sh

Luego se le agrega el contenido al archivo:

#!/bin/bash
echo "Hola, este es un saludo desde mi script."
echo "La fecha actual es: $(date)"

### 2. Crear el Archivo de Unidad Systemd
Crea un archivo llamado saludo.service en la carpeta /etc/systemd/system/:

echo "[Unit]
Description=Script de saludo y fecha

[Service]
Type=simple
ExecStart=/home/steve/saludo_script.sh

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/saludo.service


### 3. Habilitar y Arrancar el Servicio
Ejecuta los siguientes comandos:

sudo systemctl daemon-reload
sudo systemctl enable saludo.service
sudo systemctl start saludo.service

### 4. Verificar el Estado del Servicio
Verifica si el servicio se ejecuta correctamente:

sudo systemctl status saludo.service

### 5. Verificar los Registros
Si hay problemas, verifica los registros para más detalles:

journalctl -xe -u saludo.service

## Imagenes con proceso realizaod en ubuntu 20.04:
EN mi caso olvide colocar los permisos al archivo saludo_script.sh, pero se le colocaron durante el proceso cuando se hallo un error:

![](/1.png)
![](/2.png)
![](/3.png)
![](/4.png)
![](/5.png)
![](/6.png)
![](/7.png)