#!/bin/bash

set -euo pipefail

NANO_FILE="nota.txt"
VIM_FILE="apuntes.txt"
RECORDATORIO_FILE="recordatorio.txt"
SEARCH_TERM="palabra"

create_nano_file() {
    printf "Primera línea\nSegunda línea\nTercera línea\n" > "$NANO_FILE"
}

append_to_nano_file() {
    printf "Cuarta línea añadida\n" >> "$NANO_FILE"
}

discard_recordatorio_changes() {
    # Simula apertura y salida sin guardar
    printf "Algo que no se guardará\n" | nano "$RECORDATORIO_FILE"
    rm -f "$RECORDATORIO_FILE"
}

search_word_in_nano_file() {
    if ! grep -q "$SEARCH_TERM" "$NANO_FILE"; then
        printf "La palabra '%s' no fue encontrada en %s\n" "$SEARCH_TERM" "$NANO_FILE" >&2
    fi
}

cut_and_paste_nano() {
    local temp; temp=$(mktemp)
    sed '2d' "$NANO_FILE" > "$temp"
    sed -n '2p' "$NANO_FILE" >> "$temp"
    mv "$temp" "$NANO_FILE"
}

create_vim_file() {
    printf "Esta es una frase en modo inserción\n" > "$VIM_FILE"
}

move_cursor_vim() {
    # Movimiento de cursor sin flechas simulados en comandos
    vim -es -u NONE -c 'normal gg' -c 'q' "$VIM_FILE"
}

delete_and_undo_vim() {
    vim -es -u NONE "$VIM_FILE" -c 'normal dd' -c 'undo' -c 'wq'
}

copy_and_paste_vim() {
    vim -es -u NONE "$VIM_FILE" -c 'normal yy' -c 'normal p' -c 'wq'
}

save_and_exit_vim() {
    vim -es -u NONE "$VIM_FILE" -c 'wq'
}

main() {
    create_nano_file
    append_to_nano_file
    discard_recordatorio_changes
    search_word_in_nano_file
    cut_and_paste_nano

    create_vim_file
    move_cursor_vim
    delete_and_undo_vim
    copy_and_paste_vim
    save_and_exit_vim

    printf "Operaciones completadas con nano y vim.\n"
}

main
