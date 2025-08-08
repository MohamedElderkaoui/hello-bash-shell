#!/bin/bash

# 1. Muestra todo el contenido de un archivo
cat archivo.txt

# 2. Muestra el contenido paginado de un archivo
less archivo.txt

# 3. Muestra las 15 primeras líneas de un archivo
head -15 archivo.txt

# 4. Muestra las 15 últimas líneas de un archivo
tail -15 archivo.txt

# 5. Busca una palabra en un archivo
grep "palabra" archivo.txt

# 6. Cuenta las líneas de un archivo
wc -l archivo.txt

# 7. Redirige una salida y guárdala en un archivo
echo "Texto de ejemplo" > salida.txt

# 8. Añade una nueva salida al archivo anterior
echo "Otra línea" >> salida.txt

# 9. Encadena 3 comandos
echo "Uno" && echo "Dos" && echo "Tres"

# 10. Crea una variable local y muéstrala
mi_variable="Hola Mundo"
echo $mi_variable
