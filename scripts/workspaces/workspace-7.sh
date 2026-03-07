#!/bin/bash
# workspace-7.sh — highlight workspace 7 if active

active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 7 ]; then
  echo "[<span foreground='#d7e6e7'>●</span>]"
else
  echo "[7]"
fi