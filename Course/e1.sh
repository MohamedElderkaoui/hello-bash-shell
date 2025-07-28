#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Global Variables
START_DIR="$PWD"
DOC_DIR_REL="$HOME/Documentos"
DOC_DIR_ALT="$HOME/Documents"
DOC_DIR_ABS=""
USERNAME=""
CURRENT_DATE=""
CURRENT_TIME=""

show_current_directory() {
    printf "Directorio actual: %s\n" "$PWD"
}

change_to_documents_relative() {
    if [[ -d "$DOC_DIR_REL" ]]; then
        cd "$DOC_DIR_REL"
        DOC_DIR_ABS="$DOC_DIR_REL"
    elif [[ -d "$DOC_DIR_ALT" ]]; then
        cd "$DOC_DIR_ALT"
        DOC_DIR_ABS="$DOC_DIR_ALT"
    else
        printf "No se encontró el directorio Documentos/Documents\n" >&2
        return 1
    fi
    printf "Cambiado a: %s\n" "$DOC_DIR_ABS"
}

change_to_documents_absolute() {
    if [[ -n "$DOC_DIR_ABS" ]] && [[ -d "$DOC_DIR_ABS" ]]; then
        cd "$DOC_DIR_ABS"
        printf "Ruta absoluta usada para volver a: %s\n" "$DOC_DIR_ABS"
    else
        printf "No se puede cambiar usando ruta absoluta, ruta inválida: %s\n" "$DOC_DIR_ABS" >&2
        return 1
    fi
}

go_up_one_level() {
    cd ..
    printf "Subido un nivel, ahora en: %s\n" "$PWD"
}

list_directory_contents() {
    printf "\nFormato simple:\n"
    ls
    printf "\nFormato largo:\n"
    ls -l
    printf "\nIncluyendo archivos ocultos:\n"
    ls -la
}

show_manual() {
    man ls | head -n 10
}

show_help() {
    ls --help | head -n 10
}

show_user_date_time_calendar() {
    USERNAME=$(whoami)
    CURRENT_DATE=$(date '+%Y-%m-%d')
    CURRENT_TIME=$(date '+%H:%M:%S')
    printf "\nUsuario: %s\nFecha: %s\nHora: %s\n\n" "$USERNAME" "$CURRENT_DATE" "$CURRENT_TIME"
    cal
}

return_to_start() {
    cd "$START_DIR"
    printf "\nRegresado al directorio inicial: %s\n" "$START_DIR"
}

clear_screen() {
    clear
}

main() {
    show_current_directory
    change_to_documents_relative
    change_to_documents_absolute
    go_up_one_level
    list_directory_contents
    show_manual
    show_help
    show_user_date_time_calendar
    return_to_start
    clear_screen
}

main "$@"
