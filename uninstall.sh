#!/usr/bin/env bash
# Remove o macxfce e restaura o visual anterior.
BIN="$HOME/.local/bin/macxfce"
if [[ -x "$BIN" ]]; then "$BIN" uninstall
else "$(dirname "$(readlink -f "$0")")/bin/macxfce" uninstall; fi
