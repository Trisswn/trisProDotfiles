#!/usr/bin/env bash

BARS=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)

cava -p ~/.config/cava/waybar.conf | while IFS=';' read -r -a values; do
  output=""
  silent=true

  for v in "${values[@]}"; do
    if [[ "$v" =~ ^[1-9]$ ]]; then
      silent=false
    fi
    output+="${BARS[$v]}"
  done

  # Si todo es silencio → no imprimir nada
  if $silent; then
    continue
  fi

  echo "$output"
done
