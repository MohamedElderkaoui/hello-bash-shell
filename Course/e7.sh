#!/bin/bash

# 1. Crea un script que imprima en pantalla: Hola mundo desde Bash.
echo "Hola mundo desde Bash"

# 2. Crea un script que muestre la fecha y el directorio actual.
echo "Fecha actual: $(date)"
echo "Directorio actual: $(pwd)"

# 3. Crea un script que guarde tu nombre en una variable y lo muestre en pantalla.
nombre="TuNombre"
echo "Mi nombre es $nombre"

# 4. Crea un script que declare dos variables numéricas, las sume, reste y multiplique, mostrando el resultado de cada operación.
a=5
b=3
echo "Suma: $((a + b))"
echo "Resta: $((a - b))"
echo "Multiplicación: $((a * b))"

# 5. Crea un script que pida tu nombre con read y lo muestre.
echo "Introduce tu nombre:"
read nombre_usuario
echo "Hola, $nombre_usuario"

# 6. Crea un script que pida dos números al usuario y muestre su suma.
echo "Introduce el primer número:"
read num1
echo "Introduce el segundo número:"
read num2
echo "La suma es: $((num1 + num2))"

# 7. Crea un script con tres argumentos que muestre el primero y el tercero.
echo "Primer argumento: $1"
echo "Tercer argumento: $3"

# 8. Crea un script con argumentos que muestre el número total.
echo "Número total de argumentos: $#"

# 9. Crea un script que reciba dos números como argumentos y muestre su suma, resta, multiplicación y división.
a=$1
b=$2
echo "Suma: $((a + b))"
echo "Resta: $((a - b))"
echo "Multiplicación: $((a * b))"
echo "División: $((a / b))"

# 10. Crea un script que cree un archivo de texto y guarde tu nombre en su interior.
echo "TuNombre" > archivo.txt
echo "Archivo creado con tu nombre."