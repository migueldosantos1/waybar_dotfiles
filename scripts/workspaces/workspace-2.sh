#!/bin/bash
# workspace-2.sh — highlight workspace 2 if active

active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 2 ]; then
  echo "[<span foreground='#d7e6e7'>●</span>]"
else
  echo "[2]"
fi