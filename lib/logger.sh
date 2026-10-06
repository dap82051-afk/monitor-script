#Модуль логирования

log() {
    local level="$1"
    local message="$2"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    echo "$timestamp [$level] $message" >> "$LOG_FILE"

    #и на экран тож
    echo "[$level] $message"

}
