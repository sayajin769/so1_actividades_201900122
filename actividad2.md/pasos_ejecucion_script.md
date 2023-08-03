1. Crear el archivo del script:
    -En este caso ua se encuentra creado el script github_script.sh
    -Si se desean cambiar datos se debe edita rel archivo, guardar y cerrarlo antes de ejecutarlo
2. Dar permisos de ejecución al archivo del script:
    -chmod +x github_script.sh
3. COnfigurar el cronjob
    - ejecutar este comando en la terminal: crontab -e
    - Agregar la siguiente línea al final del archivo crontab para ejecutar el script cada 5 minutos: */5 * * * * /ruta del /archivo/github_script.sh
    -presionar: CTRL + O
    -presionar: ENTER
    -presionar: CTRL + X
4. Revisar los logs
    -en la terminal colocar la ruta del archivo: ruta del /archivo/github_script.sh
    -esto imprimira el mensaje,
    -despues revisar la carpeta tmp con la fecha de ejecucion del script para revisar como se agregan los logs al archivo