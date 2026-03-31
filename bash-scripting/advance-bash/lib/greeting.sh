#!/usr/bin/env bash


greet() {
    echo "hi $1"
}

goodbye() {
    echo "goodbye $1"
}

if ! (return 0 2>/dev/null); then
  # we are called directly, not sourced
    greet ""
    goodbye "" # umcomment it if we want call direct function
fi
