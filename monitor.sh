#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/config/monitor.conf"
source "$SCRIPT_DIR/lib/logger.sh"
source "$SCRIPT_DIR/lib/disk.sh"
source "$SCRIPT_DIR/lib/ram.sh"
source "$SCRIPT_DIR/lib/services.sh"

log "INFO" "Мониторинг запущен"

check_disk
check_ram
check_services

log "INFO" "Мониторинг завершён"
