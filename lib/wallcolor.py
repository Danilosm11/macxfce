#!/usr/bin/env python3
"""Amostra a cor média de uma faixa do wallpaper (bottom = dock, top = barra).
Saída: "r g b lum" (floats 0..1). Só usa GdkPixbuf (já vem com o XFCE)."""
import sys
import gi
gi.require_version("GdkPixbuf", "2.0")
from gi.repository import GdkPixbuf

def sample(path, edge="bottom", region=0.18):
    pb = GdkPixbuf.Pixbuf.new_from_file_at_scale(path, 96, 54, False)
    w, h, n, rs = pb.get_width(), pb.get_height(), pb.get_n_channels(), pb.get_rowstride()
    px = pb.get_pixels()
    y0, y1 = (int(h * (1 - region)), h) if edge == "bottom" else (0, max(1, int(h * 0.06)))
    r = g = b = c = 0
    for y in range(y0, y1):
        for x in range(w):
            i = y * rs + x * n
            r += px[i]; g += px[i + 1]; b += px[i + 2]; c += 1
    r, g, b = r / c / 255, g / c / 255, b / c / 255
    lin = lambda v: v / 12.92 if v <= 0.04045 else ((v + 0.055) / 1.055) ** 2.4
    lum = 0.2126 * lin(r) + 0.7152 * lin(g) + 0.0722 * lin(b)
    return r, g, b, lum

if __name__ == "__main__":
    try:
        print("%.4f %.4f %.4f %.4f" % sample(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else "bottom"))
    except Exception as e:
        print("erro: %s" % e, file=sys.stderr)
        sys.exit(1)
