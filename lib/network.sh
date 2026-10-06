#Модуль проверки сети

check_network() {
    if ping -c 1 -W 2 8.8.8.8 > /dev/null 2>&1; then
        log "INFO" "Сеть: ОК"
    else
        log "ERROR" "Сеть: FAIL (нет интернета)"
    fi
}
