#!/bin/bash

# 1. Muestra todos los procesos del sistema
ps aux

# 2. Muestra el monitor interactivo de procesos
top

# 3. Utiliza el comando free de manera correcta
free -h

# 4. Lanza sleep 100 en la terminal, suspéndelo, mándalo al segundo plano y tráelo al primer plano
sleep 100
# (Suspende con Ctrl+Z, luego 'bg' para segundo plano y 'fg' para primer plano en terminal)

# 5. Lanza un proceso como sleep y termínalo usando su PID
sleep 100 &
kill $!

# 6. Consulta el espacio en disco
df -h

# 7. Consulta el historial
history

# 8. Repite el último comando (en script no se recomienda '!!', pero puedes usar 'history' para ver y copiar el comando)
# Para terminal interactiva: !!

# 9. Crea y prueba un alias
alias saluda='echo "Hola!"'
saluda

# 10. Elimina el alias que acabas de crear
unalias saluda
