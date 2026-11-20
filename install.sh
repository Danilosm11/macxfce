#!/usr/bin/env bash
# Instala o macxfce no perfil do usuário (sem sudo, sem rede).
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"
PREFIX="$HOME/.local/share/macxfce"
BIN="$HOME/.local/bin"
APPS="$HOME/.local/share/applications"
AUTO="$HOME/.config/autostart"

for c in xfconf-query xfce4-panel python3 xprop xrandr; do
    command -v "$c" >/dev/null || { echo "faltando: $c" >&2; exit 1; }
done
python3 -c 'import gi; gi.require_version("GdkPixbuf","2.0")' 2>/dev/null ||
    { echo "faltando: python3-gi + gir1.2-gdkpixbuf-2.0" >&2; exit 1; }

mkdir -p "$PREFIX/lib" "$BIN" "$APPS" "$AUTO"
install -m 644 lib/wallcolor.py "$PREFIX/lib/wallcolor.py"
install -m 755 bin/macxfce "$BIN/macxfce"
sed "s#@BIN@#$BIN/macxfce#" share/macxfce.desktop >"$APPS/macxfce.desktop"
sed "s#@BIN@#$BIN/macxfce#" share/macxfce-autostart.desktop >"$AUTO/macxfce.desktop"

MODE="${1:-adaptive}"
"$BIN/macxfce" "$MODE"
echo
echo "Instalado. Troque o modo com: macxfce adaptive|dark|light|glass  (ou 'macxfce menu')"
echo "Desativar: macxfce off   |   Reativar: macxfce on   |   Desinstalar: macxfce uninstall"
