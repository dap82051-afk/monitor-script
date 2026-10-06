#Модуль логирования

send_telegram() {
    local level="$1"
    local message="$2"

    if [ "$TELEGRAM_ENABLED" != "true" ]; then
        return
    fi

    #Логи ток WARN ERROR
    if [ "$level" != "WARN" ] && [ "$level" != "ERROR" ]; then
        return
    fi

    local text="[${level}] ${message}"
    curl -s -X POST \
        "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
        -d "chat_id=${TELEGRAM_CHAT_ID}" \
        -d "text=${text}" \
        > /dev/null
}

log() {
    local level="$1"
    local message="$2"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    echo "$timestamp [$level] $message" >> "$LOG_FILE"

    #и на экран тож
    echo "[$level] $message"

    #В телегу ток логи WARN и ERROR
    send_telegram "$level" "$message"
}
