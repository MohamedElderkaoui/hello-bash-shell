#!/bin/bash

# 1. Crea un archivo y visualiza sus permisos
touch ejemplo.txt
ls -l ejemplo.txt

# 2. Otorga permisos de ejecución solo al propietario en modo simbólico
chmod u+x ejemplo.txt
ls -l ejemplo.txt

# 3. Cambia sus permisos a 644
chmod 644 ejemplo.txt
ls -l ejemplo.txt

# 4. Elimina los permisos para el grupo
chmod g-r ejemplo.txt
ls -l ejemplo.txt

# 5. Haz que sólo pueda ejecutarse por el propietario
chmod 100 ejemplo.txt
ls -l ejemplo.txt

# 6. Crea una carpeta y dale permisos para que sólo el usuario pueda acceder
mkdir carpeta_privada
chmod 700 carpeta_privada
ls -ld carpeta_privada

# 7. Cámbiale el propietario a otro usuario de tu sistema (si existe y tienes permisos)
# sudo chown otro_usuario ejemplo.txt

# 8. Consulta la máscara de permisos actual y calcula qué permisos por defecto tendrán los nuevos archivos
umask
# Por ejemplo, si umask es 0022, los nuevos archivos tendrán permisos 644 y las carpetas 755

# 9. Cambia la máscara, crea un archivo y consulta los permisos por defecto del archivo
umask 0077
touch archivo_umask.txt
ls -l archivo_umask.txt

# 10. Utiliza un comando como superusuario
# sudo apt update
