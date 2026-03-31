#!/usr/bin/env bash

log_file="/tmp/server_control.log"

case "$1" in
  shutdown)
    echo "$(date) - Shutting down server" >> "$log_file"
    # shutdown -h now   # commented for safety
    ;;
  
  start)
    echo "$(date) - Server startup triggered" >> "$log_file"
    ;;
  
  *)
    echo "Usage: $0 {shutdown|start}"
    ;;
esac
