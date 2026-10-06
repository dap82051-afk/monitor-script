#Модуль проверки диска

check_disk() {
    local use
    use=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

    if [ "$use" -gt "$DISK_THRESHOLD" ]; then
        log "WARN" "Диск занят на ${use}% (порог: ${DISK_THRESHOLD}%)"
    else
        log "INFO" "Диск: ${use}%"
    fi
}
