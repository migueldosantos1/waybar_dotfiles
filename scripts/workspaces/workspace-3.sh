#!/bin/bash
# workspace-3.sh — highlight workspace 3 if active

active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 3 ]; then
  echo "[<span foreground='#d7e6e7'>●</span>]"
else
  echo "[3]"
fi