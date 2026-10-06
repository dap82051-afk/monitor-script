#Модуль проверки RAM

check_ram() {
    local use
    use=$(free | awk 'NR==2 {print int($3/$2*100)}')

    if [ "$use" -gt "$RAM_THRESHOLD" ]; then
        log "WARN" "RAM занята на ${use}% (порог: ${RAM_THRESHOLD}%)"
    else
        log "INFO" "RAM: ${use}%"
    fi
}
