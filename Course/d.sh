#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

# Global Variables
TARGET_DIR="./ejemplo_dir"
FILE_TO_COPY="./archivo_ejemplo.txt"
MOVED_FILE="./ejemplo_movido.txt"
RENAMED_FILE="./ejemplo_renombrado.txt"
SEARCH_TYPE="*.log"

create_directory() {
    mkdir -p "$TARGET_DIR"
    printf "Directorio creado: %s\n" "$TARGET_DIR"
}

delete_directory() {
    if [[ -d "$TARGET_DIR" ]]; then
        rm -rf "$TARGET_DIR"
        printf "Directorio eliminado: %s\n" "$TARGET_DIR"
    else
        printf "El directorio no existe: %s\n" "$TARGET_DIR" >&2
        return 1
    fi
}

create_sample_file() {
    if [[ ! -f "$FILE_TO_COPY" ]]; then
        printf "Contenido de ejemplo\n" > "$FILE_TO_COPY"
    fi
}

copy_file_inside_and_outside() {
    local inside_copy; inside_copy="$TARGET_DIR/archivo_ejemplo.txt"
    cp "$FILE_TO_COPY" "$inside_copy"
    cp "$FILE_TO_COPY" "./archivo_copia.txt"
    printf "Archivo copiado dentro de %s y fuera (archivo_copia.txt)\n" "$TARGET_DIR"
}

move_file() {
    if [[ -f "./archivo_copia.txt" ]]; then
        mv "./archivo_copia.txt" "$MOVED_FILE"
        printf "Archivo movido a: %s\n" "$MOVED_FILE"
    else
        printf "El archivo a mover no existe\n" >&2
        return 1
    fi
}

rename_file() {
    if [[ -f "$MOVED_FILE" ]]; then
        mv "$MOVED_FILE" "$RENAMED_FILE"
        printf "Archivo renombrado a: %s\n" "$RENAMED_FILE"
    else
        printf "No se encontró el archivo para renombrar\n" >&2
        return 1
    fi
}

list_files_by_type() {
    local matches; matches=(*.txt)
    if [[ ${#matches[@]} -gt 0 ]]; then
        printf "Archivos .txt encontrados:\n"
        ls -1 *.txt
    else
        printf "No hay archivos .txt en el directorio actual\n"
    fi
}

recursive_directory_delete() {
    local dir_to_delete="./borrame_dir"
    mkdir -p "$dir_to_delete/subdir"
    touch "$dir_to_delete/test.log"
    rm -rf "$dir_to_delete"
    printf "Directorio %s eliminado de forma recursiva\n" "$dir_to_delete"
}

delete_files_by_type() {
    touch archivo1.log archivo2.log archivo3.log
    rm -f *.log
    printf "Todos los archivos *.log eliminados\n"
}

show_directory_tree() {
    if ! command -v tree >/dev/null 2>&1; then
        printf "El comando 'tree' no está instalado. Instálalo para usar esta función.\n" >&2
        return 1
    fi
    tree .
}

find_specific_file() {
    local filename="archivo_ejemplo.txt"
    local result; result=$(find . -maxdepth 1 -type f -name "$filename")
    if [[ -n "$result" ]]; then
        printf "Archivo encontrado: %s\n" "$result"
    else
        printf "Archivo '%s' no encontrado en el directorio actual\n" "$filename"
    fi
}

main() {
    create_directory
    create_sample_file
    copy_file_inside_and_outside
    move_file
    rename_file
    list_files_by_type
    recursive_directory_delete
    delete_files_by_type
    show_directory_tree || true
    find_specific_file
    delete_directory
}

main "$@"
