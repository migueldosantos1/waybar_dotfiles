#!/bin/bash
# workspace-10.sh — highlight workspace 10 if active

active=$(hyprctl activeworkspace -j | jq '.id')

if [ "$active" -eq 10 ]; then
  echo "[<span foreground='#d7e6e7'>●</span>]"
else
  echo "[10]"
fi