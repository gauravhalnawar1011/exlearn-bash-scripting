#!/usr/bin/env bash
for i in {0..255}; do
   printf '\e[38;5;%dmColour %3d \e[0m\n' "$i" "$i"
done

