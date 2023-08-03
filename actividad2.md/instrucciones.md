Crear un script de bash que realice lo siguiente:
- Leer la variable GITHUB_USER
-Consultar la URL https://api.github.com/users/ concatenando el valor de la variable GITHUB_USER al final
-Imprimir el mensaje: “Hola <github_user>. User ID: <id>. Cuenta fue creada el <created_at>.”
-Crear un log file en /tmp/<fecha>/saludos.log con la salida del mensaje anterior. Donde <fecha> corresponde a la fecha del dia de ejecucion del script
-Crear un cronjob para que el script se ejecute cada 5 minutos.

mi nombre de usuario de git es: sayajin769, para la variable GITHUB_UUSER. Y estoy suando ubuntu 20.04, linux.