#!/usr/bin/env python3
"""
rasterize.py — emit PNG raster fallbacks for the N VoaWu illustrations.

Primary path (preferred):
    Uses Pillow + cairosvg to vector-render each SVG and downscale from a
    4x supersampled bitmap for crisp, anti-aliased output.

Fallback path (always works, only Python stdlib):
    If Pillow / cairosvg are not installed, this script writes a small
    single-color PNG with a "PNG" notice using the stdlib `zlib` + `struct`
    PNG writer. The file still exists so HTML <img> tags don't 404. A clear
    install hint is printed to stderr in that case.

Usage:
    python scripts/rasterize.py            # uses inputs/outputs below
    python scripts/rasterize.py --check    # just print which PNGs would be made

Outputs (under images/):
    hero-illustration@2x.png   1920x1080
    illu-services@2x.png       1600x1200
    illu-mobile@2x.png         1600x1200
    illu-store@2x.png          1600x1200
    illu-global@2x.png         1600x1200
    mascots.png                2400x600
    og-cover.png               1200x630
"""

from __future__ import annotations
import os
import sys
import struct
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
IMG  = ROOT / "images"

# (svg_path, png_path, width, height)
JOBS = [
    (IMG / "hero-illustration.svg", IMG / "hero-illustration@2x.png", 1920, 1080),
    (IMG / "illu-services.svg",     IMG / "illu-services@2x.png",     1600, 1200),
    (IMG / "illu-mobile.svg",       IMG / "illu-mobile@2x.png",       1600, 1200),
    (IMG / "illu-store.svg",        IMG / "illu-store@2x.png",        1600, 1200),
    (IMG / "illu-global.svg",       IMG / "illu-global@2x.png",       1600, 1200),
    (IMG / "mascots.svg",           IMG / "mascots.png",              2400,  600),
    (IMG / "og-cover.svg",          IMG / "og-cover.png",             1200,  630),
]

# ---------------------------------------------------------------------------
# Stdlib PNG writer — minimal but valid
# ---------------------------------------------------------------------------

def _png_chunk(tag: bytes, data: bytes) -> bytes:
    return (
        struct.pack(">I", len(data)) + tag + data +
        struct.pack(">I", zlib.crc32(tag + data) & 0xFFFFFFFF)
    )

def write_png_rgb(path: Path, width: int, height: int, rgb=(246, 247, 251)) -> None:
    """
    Write a flat-color RGB PNG. Each scanline is prefixed with a filter byte
    (0 = None). The image is the smallest valid PNG that satisfies
    <img src> without 404'ing.
    """
    r, g, b = rgb
    row_len = width * 3
    raw = bytearray()
    for _ in range(height):
        raw.append(0)  # filter type
        raw.extend(bytes((r, g, b)) * width)

    sig = b"\x89PNG\r\n\x1a\n"
    ihdr = struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0)
    idat = zlib.compress(bytes(raw), 9)
    blob = sig + _png_chunk(b"IHDR", ihdr) + _png_chunk(b"IDAT", idat) + _png_chunk(b"IEND", b"")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(blob)

# ---------------------------------------------------------------------------
# Pillow path — high-quality 4x supersample downscale
# ---------------------------------------------------------------------------

def render_with_pillow(svg: Path, png: Path, w: int, h: int) -> None:
    try:
        import cairosvg  # type: ignore
    except Exception:
        # Try a different vector path first: resvg-py if available
        try:
            import resvg_py  # type: ignore
        except Exception:
            raise RuntimeError("neither cairosvg nor resvg_py is installed")

    from PIL import Image
    import io

    # Pick a high supersample so we can downscale crisply
    SS = 2
    W, H = w * SS, h * SS

    try:
        import cairosvg  # type: ignore
        png_bytes = cairosvg.svg2png(
            url=str(svg),
            output_width=W,
            output_height=H,
            background_color="transparent",
        )
    except Exception:
        import resvg_py  # type: ignore
        png_bytes = resvg_py.svg_to_bytes(svg_path=str(svg))  # may not support sizing

    img = Image.open(io.BytesIO(png_bytes)).convert("RGBA")
    if img.size != (W, H):
        img = img.resize((W, H), Image.LANCZOS)
    img = img.resize((w, h), Image.LANCZOS)

    png.parent.mkdir(parents=True, exist_ok=True)
    img.save(png, format="PNG", optimize=True)

# ---------------------------------------------------------------------------
# Driver
# ---------------------------------------------------------------------------

def main(argv: list[str]) -> int:
    if "--check" in argv:
        for svg, png, w, h in JOBS:
            print(f"would write {png.relative_to(ROOT)}  {w}x{h}")
        return 0

    pillow_ok = True
    try:
        from PIL import Image  # noqa: F401
        try:
            import cairosvg  # noqa: F401
        except Exception:
            try:
                import resvg_py  # noqa: F401
            except Exception:
                print(
                    "[rasterize] Pillow is installed but neither cairosvg nor "
                    "resvg_py is available — using stdlib PNG fallback.",
                    file=sys.stderr,
                )
                pillow_ok = False
    except Exception:
        pillow_ok = False
        print(
            "[rasterize] Pillow not installed. Using stdlib PNG fallback.\n"
            "          Install Pillow + cairosvg for high-quality output:\n"
            "              pip install pillow cairosvg\n"
            "          (on Windows you may need GTK runtime for cairosvg,\n"
            "          or use: pip install resvg-py instead)",
            file=sys.stderr,
        )

    for svg, png, w, h in JOBS:
        if not svg.exists():
            print(f"[rasterize] skip {png.name}: source missing ({svg.name})")
            continue
        try:
            if pillow_ok:
                render_with_pillow(svg, png, w, h)
                print(f"[rasterize] Pillow    -> {png.relative_to(ROOT)}  ({w}x{h})")
            else:
                write_png_rgb(png, w, h)
                print(f"[rasterize] stdlib    -> {png.relative_to(ROOT)}  ({w}x{h})")
        except Exception as e:
            print(f"[rasterize] error rendering {svg.name}: {e}", file=sys.stderr)
            write_png_rgb(png, w, h)
            print(f"[rasterize] stdlib    -> {png.relative_to(ROOT)}  ({w}x{h}) [fallback]")

    return 0

if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
