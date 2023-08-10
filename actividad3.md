(los logs que se imprimieron en la terminal, estan comentados y se pueden ver en la pestaña "code")
# Parte 1: Gestión de Usuarios
## 1. Creación de Usuarios: Crea tres usuarios llamados `usuario1`, `usuario2` y `usuario3`.

### comandos:
sudo adduser usuario1
<!--  
Adding user `usuario1' ...
Adding new group `usuario1' (1001) ...
Adding new user `usuario1' (1001) with group `usuario1' ...
Creating home directory `/home/usuario1' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for usuario1
Enter the new value, or press ENTER for the default
	Full Name []: 
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] 
-->
sudo adduser usuario2
<!--  
Adding user `usuario2' ...
Adding new group `usuario2' (1002) ...
Adding new user `usuario2' (1002) with group `usuario2' ...
Creating home directory `/home/usuario2' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for usuario2
Enter the new value, or press ENTER for the default
	Full Name []: 
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] 
-->
sudo adduser usuario3
<!--  
Adding user `usuario3' ...
Adding new group `usuario3' (1003) ...
Adding new user `usuario3' (1003) with group `usuario3' ...
Creating home directory `/home/usuario3' ...
Copying files from `/etc/skel' ...
New password: 
Retype new password: 
passwd: password updated successfully
Changing the user information for usuario3
Enter the new value, or press ENTER for the default
	Full Name []: 
	Room Number []: 
	Work Phone []: 
	Home Phone []: 
	Other []: 
Is the information correct? [Y/n] 
-->

## 2. Asignación de Contraseñas: Establece una nueva contraseñas para cada usuario creado.

### comandos:
sudo passwd usuario1
<!--  
New password: 
Retype new password: 
passwd: password updated successfully
-->
sudo passwd usuario2
<!--
New password: 
Retype new password: 
passwd: password updated successfully
-->
sudo passwd usuario3
<!--
New password: 
Retype new password: 
passwd: password updated successfully
-->

## 3. Información de Usuarios: Muestra la información de `usuario1` usando el comando `id`.

### comandos:
id usuario1
<!-- 
 uid=1001(usuario1) gid=1001(usuario1) groups=1001(usuario1)
-->
id usuario2
 <!-- 
 uid=1002(usuario2) gid=1002(usuario2) groups=1002(usuario2)
-->
id usuario3
 <!-- 
 uid=1003(usuario3) gid=1003(usuario3) groups=1003(usuario3)
-->

## 4. Eliminación de Usuarios: Elimina `usuario3`, pero conserva su directorio principal.

### comandos:
sudo userdel usuario3
<!--  
-->


# Parte 2: Gestión de Grupos
## 1. Creación de Grupos: Crea dos grupos llamados `grupo1` y `grupo2`.

### comandos:
sudo addgroup grupo1
<!--  
-Adding group `grupo1' (GID 1003) ...
Done.
-->
sudo addgroup grupo2
<!--  
Adding group `grupo2' (GID 1004) ...
Done.
-->

## 2. Agregar Usuarios a Grupos: Agrega `usuario1` a `grupo1` y `usuario2` a `grupo2`.

### comandos:
sudo usermod -aG grupo1 usuario1
<!--  
-->
sudo usermod -aG grupo2 usuario2
<!--  
-->

## 3. Verificar Membresía: Verifica que los usuarios han sido agregados a los grupos utilizando el comando `groups`.

### comandos:
groups usuario1
<!--  
usuario1 : usuario1 grupo1
-->
groups usuario2
<!--  
-usuario2 : usuario2 grupo2
-->

## 4. Eliminar Grupo: Elimina `grupo2`.

### comandos:
sudo delgroup grupo2
<!--  
Removing group `grupo2' ...
Done.
-->

# Parte 3: Gestión de Permisos

## 1. Creación de Archivos y Directorios: 
 ### Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él. 
 ### comandos:

     su usuario1
<!-- Password:  -->
    cd ..
    cd ..
    cd /home/usuario1
    echo "Contenido del archivo 1" > archivo1.txt
<!-- 
parece que no se escribio naa en el archivo, pero si se creo
-->

 ### Crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.
 ### comandos:
 cd /home/usuario1
 mkdir directorio1
 cd directorio1
 touch archivo2.txt

## 2. Verificar Permisos: Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.
### comandos:
    ls -l /home/usuario1/archivo1.txt
<!-- -rw-rw-r-- 1 usuario1 usuario1 24 ago  9 18:21 /home/usuario1/archivo1.txt -->
    ls -ld /home/usuario1/directorio1
<!-- drwxrwxr-x 2 usuario1 usuario1 4096 ago  9 18:29 /home/usuario1/directorio1 -->


## 3. Modificar Permisos usando `chmod` con Modo Numérico: Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.
### comandos:
chmod 640 /home/usuario1/archivo1.txt

## 4. Modificar Permisos usando `chmod` con Modo Simbólico: Agrega permiso de ejecución al propietario del `archivo2.txt`.
### comandos:
cd /home/usuario1/directorio1
chmod u+x archivo2.txt

## 5. Cambiar el Grupo Propietario: Cambia el grupo propietario de `archivo2.txt` a `grupo1`.
cd /home/usuario1/directorio1
chown :grupo1 archivo2.txt

## 6. Configurar Permisos de Directorio: Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.
cd /home/usuario1
chmod 710 directorio1

## 7. Comprobación de Acceso: Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.
su - usuario2
<!-- Password:  -->
cd ..
cat /home/usuario1/archivo1.txt
<!-- cat: /home/usuario1/archivo1.txt: Permiso denegado -->
cat /home/usuario1/directorio1/archivo2.txt
<!-- cat: /home/usuario1/directorio1/archivo2.txt: Permiso denegado -->

## 8. Verificación Final: Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.
### comandos:
ls -l /home/usuario1/archivo1.txt
<!-- -rw-r----- 1 usuario1 usuario1 24 ago  9 18:21 /home/usuario1/archivo1.txt -->
ls -l /home/usuario1/directorio1/archivo2.txt
<!-- ls: no se puede acceder a '/home/usuario1/directorio1/archivo2.txt': Permiso denegado -->
ls -ld /home/usuario1/directorio1
<!-- drwx--x--- 2 usuario1 usuario1 4096 ago  9 18:29 /home/usuario1/directorio1 -->

# PREGUNTAS

### ¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?
##### es importante porque permite tener un huen control de seguridad, privacidad y acceso a la informacion, controlar los accesos, prevenir errores, filtraciones de datos. Lo cual resulta ser muy beneficioso en seguridad de la informacion, tanto para leerla, acceder a ella, editarla o incluso borrarla.

### ¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?
##### Aun no conozco a profunidad el tema, asi que no conozco mayor informacion acerca de otras tecnicas para la gestion de permisos en este sistema operativo
