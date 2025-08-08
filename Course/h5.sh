#!/bin/bash

# Global Constants
ALIAS_NAME="pruebaalias"
ALIAS_CMD="ls -lh"

show_all_processes() {
    if ! ps aux; then
        printf "Error: No se pudieron mostrar los procesos.\n" >&2
        return 1
    fi
}

show_interactive_process_monitor() {
    if ! command -v top >/dev/null 2>&1; then
        printf "Error: El comando 'top' no está disponible.\n" >&2
        return 1
    fi
    top
}

show_memory_usage() {
    if ! free -h; then
        printf "Error: Fallo al ejecutar el comando 'free'.\n" >&2
        return 1
    fi
}

launch_suspend_bg_fg_sleep() {
    sleep 100 &
    local pid=$!
    if [[ -z "$pid" ]]; then
        printf "Error: No se pudo lanzar sleep.\n" >&2
        return 1
    fi
    kill -STOP "$pid"
    sleep 1
    bg
    fg
}

launch_and_kill_sleep_by_pid() {
    sleep 200 &
    local pid=$!
    if [[ -z "$pid" ]]; then
        printf "Error: Fallo al iniciar sleep.\n" >&2
        return 1
    fi
    sleep 1
    if ! kill "$pid"; then
        printf "Error: No se pudo terminar el proceso con PID %s\n" "$pid" >&2
        return 1
    fi
}

check_disk_space() {
    if ! df -h; then
        printf "Error: Fallo al consultar espacio en disco.\n" >&2
        return 1
    fi
}

show_history() {
    if ! history; then
        printf "Error: No se pudo mostrar el historial.\n" >&2
        return 1
    fi
}

repeat_last_command() {
    if ! fc -s; then
        printf "Error: No se pudo repetir el último comando.\n" >&2
        return 1
    fi
}

create_and_test_alias() {
    alias "$ALIAS_NAME"="$ALIAS_CMD"
    if ! type "$ALIAS_NAME" >/dev/null 2>&1; then
        printf "Error: No se pudo crear el alias.\n" >&2
        return 1
    fi
    "$ALIAS_NAME"
}

remove_alias() {
    unalias "$ALIAS_NAME"
    if type "$ALIAS_NAME" >/dev/null 2>&1; then
        printf "Error: No se pudo eliminar el alias.\n" >&2
        return 1
    fi
}

main() {
    show_all_processes
    show_interactive_process_monitor
    show_memory_usage
    launch_suspend_bg_fg_sleep
    launch_and_kill_sleep_by_pid
    check_disk_space
    show_history
    repeat_last_command
    create_and_test_alias
    remove_alias
}

main
