#!/usr/bin/bash
# * Crea un script que pida un número y muestre si es positivo, negativo o cero usando if, elif y else.

echo "Introduce un número:"
read number
if [ $number -gt 0 ]; then
    echo "El número es positivo."
elif [ $number -lt 0 ]; then
    echo "El número es negativo."
else
    echo "El número es cero."
fi

# * Pide al usuario dos números y muestra cuál es mayor o si son iguales.
echo "Introduce el primer número:"
read num1
echo "Introduce el segundo número:"
read num2
if [ $num1 -gt $num2 ]; then
    echo "El primer número ($num1) es mayor que el segundo ($num2)."
elif [ $num1 -lt $num2 ]; then
    echo "El segundo número ($num2) es mayor que el primero ($num1)."
else
    echo "Ambos números son iguales."
fi

# * Crea un script que muestre un menú con tres opciones y ejecute la opción correspondiente según la elección del usuario.


echo "Elige una opción:"
echo "1. Mostrar fecha"
echo "2. Mostrar directorio actual"
echo "3. Salir"
read option
case $option in
    1) echo "Fecha actual: $(date)";;
    2) echo "Directorio actual: $(pwd)";;
    3) echo "Saliendo..."; exit;;
    *) echo "Opción no válida";;
esac
    
# * Muestra todos los números del 1 al 10 usando un bucle for.
for i in {1..10}; do
    echo $i
done
# * Crea un script que pida números al usuario hasta que introduzca el número 0. Al final, muestra cuántos números ha introducido en total.
count=0
while true; do
    echo "Introduce un número (0 para salir):"
    read num
    if [ $num -eq 0 ]; then
        break
    fi
    count=$((count + 1))
done
echo "Has introducido $count números."
# * Haz un script que muestre los números del 1 al 10, saltando el 5 y deteniéndose en el 8.
for i in {1..10}; do
    if [ $i -eq 5 ]; then
        continue
    elif [ $i -eq 8 ]; then
        break
    fi
    echo $i
done
# * Crea una función saludar que reciba un nombre como argumento y muestre: Hola `<nombre>`, bienvenido al script.
saludar() {
    echo "Hola $1, bienvenido al script."
}
echo "Introduce tu nombre:"
read nombre
saludar $nombre

# * Crea una función que reciba dos números, calcule su suma y la devuelva usando return. Muestra el resultado en el script principal.
suma() {
    return $(( $1 + $2 ))
}
echo "Introduce el primer número:"
read num1
echo "Introduce el segundo número:" 
read num2
suma $num1 $num2
resultado=$?
echo "La suma de $num1 y $num2 es: $resultado"  

# * Intenta copiar un archivo que no exista y muestra un mensaje de error si el comando falla, usando $? o ||.
cp archivo_inexistente.txt copia.txt || echo "Error: El archivo no existe."
# * Crea un script con un comentario inicial con autor, fecha, descripción y un bucle for que liste todos los archivos .sh en el directorio actual.
echo "# Autor: Tu Nombre
# Fecha: $(date)
# Descripción: Script que lista todos los archivos .sh en el directorio actual" > e8.sh
for file in *.sh; do
    if [ -f "$file" ]; then
        echo "Archivo: $file"
    fi
done    