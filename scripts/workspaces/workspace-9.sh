#!/bin/bash
# workspace-9.sh — highlight workspace 9 if active

active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 9 ]; then
  echo "[<span foreground='#d7e6e7'>●</span>]"
else
  echo "[9]"
fi