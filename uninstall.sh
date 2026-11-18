#!/usr/bin/env bash
# Remove o macxfce e restaura o visual anterior.
set -uo pipefail
BIN="$HOME/.local/bin/macxfce"
[[ -x "$BIN" ]] && "$BIN" restore
rm -f "$BIN" "$HOME/.local/share/applications/macxfce.desktop" "$HOME/.config/autostart/macxfce.desktop"
rm -rf "$HOME/.local/share/macxfce" "${XDG_CONFIG_HOME:-$HOME/.config}/macxfce" "${XDG_STATE_HOME:-$HOME/.local/state}/macxfce"
echo "macxfce removido."
