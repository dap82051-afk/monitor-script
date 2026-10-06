#Модуль проверки сервисов

check_services() {
    local service
    for service in $SERVICES; do
        if systemctl is-active --quiet "$service"; then
            log "INFO" "$service: OK"
        else
            log "ERROR" "$service: FAIL"
        fi
    done
}
