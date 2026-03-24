#!/bin/bash

# ================================
# NETWORKING COMMANDS DEMO
# ================================

log() {
  echo "$(date '+%F %T') [INFO] $1"
}

# -------------------------------
# 1. Ping Check (Host Reachability)
# -------------------------------
check_ping() {
  local host=$1

  if ping -c 2 "$host" > /dev/null 2>&1; then
    log "Ping to $host SUCCESS"
  else
    log "Ping to $host FAILED"
  fi
}

# -------------------------------
# 2. HTTP Check using curl
# -------------------------------
check_http() {
  local url=$1

  status=$(curl -o /dev/null -s -w "%{http_code}" "$url")

  if [[ "$status" -eq 200 ]]; then
    log "HTTP check SUCCESS for $url (Status: $status)"
  else
    log "HTTP check FAILED for $url (Status: $status)"
  fi
}

# -------------------------------
# 3. Download file using wget
# -------------------------------
download_file() {
  local url=$1

  log "Downloading from $url"
  wget -q "$url" -O /tmp/test_download

  if [[ $? -eq 0 ]]; then
    log "Download SUCCESS"
  else
    log "Download FAILED"
  fi
}

# -------------------------------
# 4. Combined Health Check
# -------------------------------
health_check() {
  local host=$1
  local url=$2

  log "Starting health check..."

  check_ping "$host"
  check_http "$url"

  log "Health check completed"
}

# -------------------------------
# MAIN
# -------------------------------
main() {
  check_ping "google.com"
  echo "-----------------------------"

  check_http "https://google.com"
  echo "-----------------------------"

  download_file "https://example.com"
  echo "-----------------------------"

  health_check "google.com" "https://google.com"
}

main
