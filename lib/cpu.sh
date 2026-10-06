#Модуль проверки CPU

check_cpu() {
    local load
    local cores
    local use

    #loadaverage за 1 минуту(мжоно будет расшрить до 5 и 15 минут)
    load=$(awk '{print $1}' /proc/loadavg)

    #кол-во ядер
    cores=$(nproc)

    #% загрзуи ( load * cores ) * 100
    use=$(awk "BEGIN {printf \"%d\", ($load / $cores) * 100}")

    if [ "$use" -gt "$CPU_THRESHOLD" ]; then
        log "WARN" "CPU: ${use}% (порог: ${CPU_THRESHOLD})"
    else
        log "INFO" "CPU: ${use}%"
    fi
}
