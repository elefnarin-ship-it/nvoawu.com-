# =========================================================================
# rasterize.ps1 - PowerShell port of scripts/rasterize.py
# Emits PNG raster fallbacks for the N VoaWu illustrations using
# System.Drawing. Used when Python + Pillow + cairosvg are not available.
# =========================================================================

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

$root = (Resolve-Path "$PSScriptRoot\..").Path
$imgDir = Join-Path $root 'images'
if (-not (Test-Path $imgDir)) { New-Item -ItemType Directory -Path $imgDir | Out-Null }

# ---------- Color tokens (mirror css/tokens.css) ----------
function C {
    param([int]$A, [int]$R, [int]$G, [int]$B)
    return [System.Drawing.Color]::FromArgb($A, $R, $G, $B)
}
$ink900     = C 255 10  13  20
$ink800     = C 255 17  21  31
$ink700     = C 255 26  31  44
$paper      = C 255 246 247 251
$accent     = C 255 42  82  255
$accentLite = C 255 126 200 255
$lilac      = C 255 197 168 255
$coral      = C 255 255 138 107
$mint       = C 255 107 227 183
$butter     = C 255 255 216 107
$sky        = C 255 126 200 255
$rose       = C 255 255 179 209
$white      = C 255 255 255 255
$charcoal   = C 255 26  31  44
$graphite   = C 255 74  80  99
$steel      = C 255 110 116 136
$silver     = C 255 166 173 190
$mist       = C 255 236 239 245
$borderDark = C 255 42  47  61

# ---------- Helpers ----------
function New-Canvas {
    param([int]$W, [int]$H, $Bg)
    $bmp = New-Object System.Drawing.Bitmap($W, $H)
    $g   = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode     = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.PixelOffsetMode   = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::ClearTypeGridFit
    $g.Clear($Bg)
    return @{ Bitmap = $bmp; Graphics = $g }
}

function Save-Canvas {
    param($Canvas, [string]$Path, [int]$W, [int]$H)
    $Canvas.Graphics.Dispose()
    $Canvas.Bitmap.Save($Path, [System.Drawing.Imaging.ImageFormat]::Png)
    $Canvas.Bitmap.Dispose()
    $size = (Get-Item $Path).Length
    Write-Host ("[rasterize] {0,-44}  {1}x{2}  {3:N0} bytes" -f (Split-Path $Path -Leaf), $W, $H, $size)
}

function B { param($Color) New-Object System.Drawing.SolidBrush($Color) }

function Fnt {
    param([single]$Size)
    $fam = New-Object System.Drawing.FontFamily('Segoe UI')
    return New-Object System.Drawing.Font($fam, $Size, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
}
function FntR {
    param([single]$Size)
    $fam = New-Object System.Drawing.FontFamily('Segoe UI')
    return New-Object System.Drawing.Font($fam, $Size, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
}

function DText {
    param($G, [string]$Text, $Font, $Brush, [single]$X, [single]$Y, [string]$Align = 'Left')
    $sf = New-Object System.Drawing.StringFormat
    if ($Align -eq 'Center') { $sf.Alignment = [System.Drawing.StringAlignment]::Center }
    elseif ($Align -eq 'Right') { $sf.Alignment = [System.Drawing.StringAlignment]::Far }
    $G.DrawString($Text, $Font, $Brush, $X, $Y, $sf)
    $sf.Dispose()
}

function FillRRect {
    param($G, $Brush, [single]$X, [single]$Y, [single]$W, [single]$H, [single]$R)
    if ($R -le 0) { $G.FillRectangle($Brush, $X, $Y, $W, $H); return }
    $path = New-Object System.Drawing.Drawing2D.GraphicsPath
    $d = $R * 2
    $path.AddArc($X, $Y, $d, $d, 180, 90)
    $path.AddArc($X + $W - $d, $Y, $d, $d, 270, 90)
    $path.AddArc($X + $W - $d, $Y + $H - $d, $d, $d, 0, 90)
    $path.AddArc($X, $Y + $H - $d, $d, $d, 90, 90)
    $path.CloseFigure()
    $G.FillPath($Brush, $path)
    $path.Dispose()
}

# VGradient - vertical gradient brush (3 stops max for simplicity)
function VGradient {
    param([System.Drawing.Color]$C1, [System.Drawing.Color]$C2, [int]$H = 100)
    $b = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        (New-Object System.Drawing.Point(0, 0)),
        (New-Object System.Drawing.Point(0, $H)),
        $C1, $C2)
    return $b
}

# HGradient - horizontal gradient brush
function HGradient {
    param([System.Drawing.Color]$C1, [System.Drawing.Color]$C2, [int]$W = 100)
    $b = New-Object System.Drawing.Drawing2D.LinearGradientBrush(
        (New-Object System.Drawing.Point(0, 0)),
        (New-Object System.Drawing.Point($W, 0)),
        $C1, $C2)
    return $b
}

# RadialGlow - radial gradient at a point
function RadialGlow {
    param([int]$CX, [int]$CY, [int]$R, $Color)
    $gp = New-Object System.Drawing.Drawing2D.GraphicsPath
    $gp.AddEllipse($CX - $R, $CY - $R, $R * 2, $R * 2)
    $b = New-Object System.Drawing.Drawing2D.PathGradientBrush($gp)
    $b.CenterColor = C 180 $Color.R $Color.G $Color.B
    $b.SurroundColors = @((C 0 $Color.R $Color.G $Color.B))
    $gp.Dispose()
    return $b
}

# PolygonFill - takes flat coord list: x1,y1,x2,y2,x3,y3
function PolygonFill {
    param($G, $Brush, $Coords)
    $n = [int]($Coords.Count / 2)
    $pf = New-Object 'System.Drawing.PointF[]' $n
    for ($i = 0; $i -lt $n; $i++) {
        $pf[$i] = New-Object System.Drawing.PointF([float]$Coords[$i * 2], [float]$Coords[$i * 2 + 1])
    }
    $G.FillPolygon($Brush, $pf)
}

function PolygonStroke {
    param($G, $Pen, $Coords)
    $n = [int]($Coords.Count / 2)
    $pf = New-Object 'System.Drawing.PointF[]' $n
    for ($i = 0; $i -lt $n; $i++) {
        $pf[$i] = New-Object System.Drawing.PointF([float]$Coords[$i * 2], [float]$Coords[$i * 2 + 1])
    }
    $G.DrawPolygon($Pen, $pf)
}

# =========================================================================
# HERO - 1920x1080
# =========================================================================
function Build-Hero {
    $W = 1920; $H = 1080
    $c = New-Canvas $W $H $ink900
    $bg = VGradient $ink900 $ink700 $H
    $c.Graphics.FillRectangle($bg, 0, 0, $W, $H)
    $bg.Dispose()

    # Mesh blobs
    $c.Graphics.FillEllipse((RadialGlow ([int]($W * 0.18)) ([int]($H * 0.22)) 600 $accent),     ([int]($W * 0.18)) - 600, ([int]($H * 0.22)) - 600, 1200, 1200)
    $c.Graphics.FillEllipse((B (C 120 126 200 255)), [int]($W * 0.82) - 500, [int]($H * 0.18) - 500, 1000, 1000)
    $c.Graphics.FillEllipse((B (C 110 197 168 255)), [int]($W * 0.78) - 600, [int]($H * 0.82) - 600, 1200, 1200)
    $c.Graphics.FillEllipse((B (C 80 255 138 107)),  [int]($W * 0.20) - 500, [int]($H * 0.85) - 500, 1000, 1000)

    # Orbit ellipses
    $pen1 = New-Object System.Drawing.Pen((C 120 126 200 255), 2)
    for ($i = 0; $i -lt 4; $i++) {
        $c.Graphics.DrawEllipse($pen1, [int]($W * 0.30), [int]($H * 0.36), [int]($W * 0.40), [int]($H * 0.30))
    }
    $pen1.Dispose()

    # Network nodes (flat coord list)
    $nodes = @(
        560, 380,  820, 290,  1080, 380, 1340, 310,
        440, 580,  700, 660,  960,  760, 1240, 650,
        620, 840,  1180, 860
    )
    $pen2 = New-Object System.Drawing.Pen((C 110 126 200 255), 1.5)
    $nodeCount = [int]($nodes.Count / 2)
    for ($i = 0; $i -lt $nodeCount - 1; $i++) {
        if (($i % 2) -eq 0) {
            $c.Graphics.DrawLine($pen2, [int]$nodes[$i * 2], [int]$nodes[$i * 2 + 1], [int]$nodes[($i + 1) * 2], [int]$nodes[($i + 1) * 2 + 1])
        }
    }
    $pen2.Dispose()
    $nodeBrush = B (C 220 126 200 255)
    for ($i = 0; $i -lt $nodeCount; $i++) {
        $c.Graphics.FillEllipse($nodeBrush, [int]$nodes[$i * 2] - 4, [int]$nodes[$i * 2 + 1] - 4, 8, 8)
    }
    $nodeBrush.Dispose()

    # Decorative shapes
    $pen3 = New-Object System.Drawing.Pen((C 180 147 174 255), 3)
    $c.Graphics.DrawEllipse($pen3, 240, 140, 240, 240)
    $pen3.Dispose()
    $pen4 = New-Object System.Drawing.Pen((C 200 126 200 255), 3)
    PolygonStroke $c.Graphics $pen4 @(1460, 170, 1540, 320, 1380, 320)
    $pen4.Dispose()
    $c.Graphics.FillEllipse((B $butter), 1640, 220, 14, 14)
    $c.Graphics.FillEllipse((B $mint), 180, 510, 14, 14)

    # Laptop
    $lapX = 940; $lapY = 480; $lapW = 640; $lapH = 400
    FillRRect $c.Graphics (B $ink700) $lapX $lapY $lapW $lapH 24
    FillRRect $c.Graphics (HGradient $ink800 $ink700 $lapW) ($lapX + 18) ($lapY + 18) ($lapW - 36) ($lapH - 36) 14
    $c.Graphics.FillRectangle((B (C 120 10 13 20)), $lapX + 18, $lapY + 18, $lapW - 36, 40)
    $c.Graphics.FillEllipse((B $coral),  $lapX + 38, $lapY + 30, 14, 14)
    $c.Graphics.FillEllipse((B $butter), $lapX + 62, $lapY + 30, 14, 14)
    $c.Graphics.FillEllipse((B $mint),   $lapX + 86, $lapY + 30, 14, 14)

    $cardY = $lapY + 78
    for ($i = 0; $i -lt 3; $i++) {
        $cx = $lapX + 44 + ($i * 200)
        if ($i -eq 0) {
            $cardBrush = HGradient $accent $lilac 170
        } else {
            $cardBrush = B (C 28 255 255 255)
        }
        FillRRect $c.Graphics $cardBrush $cx $cardY 170 120 14
        $cardBrush.Dispose()
        $c.Graphics.FillRectangle((B (C 220 255 255 255)), $cx + 20, $cardY + 24, 110, 8)
        $c.Graphics.FillRectangle((B (C 150 255 255 255)), $cx + 20, $cardY + 40, 80, 6)
        $c.Graphics.FillRectangle((B (C 220 ($i * 70 + 100) 200 255)), $cx + 20, $cardY + 92, 60, 18)
    }

    # Chart
    $chartX = $lapX + 44; $chartY = $cardY + 140; $chartW = 570; $chartH = 150
    FillRRect $c.Graphics (B (C 18 255 255 255)) $chartX $chartY $chartW $chartH 14
    $penA = New-Object System.Drawing.Pen($accentLite, 3)
    $penA.LineJoin = [System.Drawing.Drawing2D.LineJoin]::Round
    $penA.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $penA.EndCap   = [System.Drawing.Drawing2D.LineCap]::Round
    $pts1 = @(20, 110, 80, 84, 140, 96, 200, 60, 260, 72, 320, 36, 380, 50, 550, 22)
    for ($i = 0; $i -lt 8; $i++) {
        $c.Graphics.DrawLine($penA, ($chartX + $pts1[$i * 2]), ($chartY + $pts1[$i * 2 + 1]), ($chartX + $pts1[($i + 1) * 2]), ($chartY + $pts1[($i + 1) * 2 + 1]))
    }
    $penA.Dispose()
    $penB = New-Object System.Drawing.Pen((C 200 197 168 255), 2.4)
    $pts2 = @(20, 122, 80, 102, 140, 112, 200, 86, 260, 96, 320, 64, 380, 78, 550, 50)
    for ($i = 0; $i -lt 8; $i++) {
        $c.Graphics.DrawLine($penB, ($chartX + $pts2[$i * 2]), ($chartY + $pts2[$i * 2 + 1]), ($chartX + $pts2[($i + 1) * 2]), ($chartY + $pts2[($i + 1) * 2 + 1]))
    }
    $penB.Dispose()
    FillRRect $c.Graphics (B $borderDark) ($lapX - 36) ($lapY + $lapH) ($lapW + 72) 18 8

    # Phone
    $phX = 720; $phY = 420; $phW = 200; $phH = 420
    FillRRect $c.Graphics (B $ink900) $phX $phY $phW $phH 32
    FillRRect $c.Graphics (VGradient $accent $accentLite $phH) ($phX + 8) ($phY + 8) ($phW - 16) ($phH - 16) 24
    FillRRect $c.Graphics (B $ink900) ($phX + 72) ($phY + 14) 56 14 7
    FillRRect $c.Graphics (B (C 50 255 255 255)) ($phX + 18) ($phY + 60) ($phW - 36) 96 14
    $c.Graphics.FillEllipse((B (C 220 255 255 255)), ($phX + 30), ($phY + 86), 28, 28)
    $c.Graphics.FillRectangle((B (C 220 255 255 255)), ($phX + 70), ($phY + 80), 90, 8)
    $c.Graphics.FillRectangle((B (C 150 255 255 255)), ($phX + 70), ($phY + 96), 70, 6)
    FillRRect $c.Graphics (B (C 40 255 255 255)) ($phX + 18) ($phY + 172) ($phW - 36) 96 14
    $c.Graphics.FillRectangle((B (C 220 255 255 255)), ($phX + 30), ($phY + 184), 130, 8)
    $c.Graphics.FillRectangle((B (C 140 255 255 255)), ($phX + 30), ($phY + 200), 100, 6)
    $c.Graphics.FillRectangle((B $butter), ($phX + 30), ($phY + 232), 50, 14)
    FillRRect $c.Graphics (B (C 40 255 255 255)) ($phX + 18) ($phY + 284) ($phW - 36) 80 14

    # Fox mascot bottom-left
    $mX = 80; $mY = 820; $mS = 240
    PolygonFill $c.Graphics (B $coral) @(([int]($mX + 60)), ([int]($mY + 50)), ([int]($mX + 80)), ([int]($mY + 30)), ([int]($mX + 96)), ([int]($mY + 90)))
    PolygonFill $c.Graphics (B $coral) @(([int]($mX + 180)), ([int]($mY + 50)), ([int]($mX + 160)), ([int]($mY + 30)), ([int]($mX + 144)), ([int]($mY + 90)))
    PolygonFill $c.Graphics (B (C 255 255 194 161)) @(([int]($mX + 70)), ([int]($mY + 56)), ([int]($mX + 80)), ([int]($mY + 40)), ([int]($mX + 88)), ([int]($mY + 80)))
    PolygonFill $c.Graphics (B (C 255 255 194 161)) @(([int]($mX + 170)), ([int]($mY + 56)), ([int]($mX + 160)), ([int]($mY + 40)), ([int]($mX + 152)), ([int]($mY + 80)))
    $c.Graphics.FillEllipse((B $coral), $mX, $mY + 50, $mS, $mS - 30)
    $c.Graphics.FillEllipse((B (C 255 255 247 242)), $mX + 50, $mY + 140, $mS - 100, 80)
    $c.Graphics.FillEllipse((B $charcoal), $mX + 70, $mY + 110, 22, 22)
    $c.Graphics.FillEllipse((B $charcoal), $mX + 148, $mY + 110, 22, 22)
    $c.Graphics.FillEllipse((B $white), $mX + 76, $mY + 114, 6, 6)
    $c.Graphics.FillEllipse((B $white), $mX + 154, $mY + 114, 6, 6)
    $c.Graphics.FillEllipse((B $charcoal), $mX + 112, $mY + 150, 16, 10)
    $c.Graphics.FillEllipse((B (C 160 255 179 209)), $mX + 56, $mY + 146, 16, 16)
    $c.Graphics.FillEllipse((B (C 160 255 179 209)), $mX + 168, $mY + 146, 16, 16)
    $penSmile = New-Object System.Drawing.Pen($charcoal, 3.5)
    $penSmile.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $c.Graphics.DrawArc($penSmile, $mX + 92, $mY + 158, 56, 26, 0, 180)
    $penSmile.Dispose()

    # Sparkles
    $c.Graphics.FillEllipse((B $butter), 1320, 250, 14, 14)
    $c.Graphics.FillEllipse((B $butter), 480,  720, 10, 10)
    $c.Graphics.FillEllipse((B $butter), 1620, 640, 8,  8)

    Save-Canvas $c (Join-Path $imgDir 'hero-illustration@2x.png') $W $H
}

# =========================================================================
# SERVICES
# =========================================================================
function Build-Services {
    $W = 1600; $H = 1200
    $c = New-Canvas $W $H $paper
    $c.Graphics.FillEllipse((B (C 45 197 168 255)), 80, 80, 320, 320)
    $c.Graphics.FillEllipse((B (C 40 126 200 255)), ($W - 380), ($H - 380), 360, 360)

    $titles = @(
        @{ Title='Casual Games';     Sub='Single-player and daily fun'; Accent=$coral;  Sym='GP' },
        @{ Title='Mobile Manager';   Sub='Run your studio on the go';   Accent=$accent; Sym='MM' },
        @{ Title='User Acquisition'; Sub='Ads, ASO and creatives';      Accent=$butter; Sym='UA' },
        @{ Title='Brand and Design'; Sub='Identity, UI and motion';     Accent=$lilac;  Sym='BD' },
        @{ Title='Cloud and APIs';   Sub='Realtime data and sync';      Accent=$mint;   Sym='CL' },
        @{ Title='Always-on Support';Sub='Timezone-friendly team';      Accent=$sky;    Sym='SU' }
    )
    $col0 = 100; $row0 = 100; $tileW = 440; $tileH = 320; $gap = 28
    $titleFont = Fnt 22
    $subFont   = FntR 16
    $iconFont  = Fnt 48

    for ($i = 0; $i -lt $titles.Count; $i++) {
        $row = [math]::Floor($i / 3); $col = $i % 3
        $x = $col0 + $col * ($tileW + $gap)
        $y = $row0 + $row * ($tileH + $gap)
        $t = $titles[$i]

        FillRRect $c.Graphics (B $white) $x $y $tileW $tileH 24
        $c.Graphics.DrawRectangle((New-Object System.Drawing.Pen($mist, 1.2)), $x, $y, $tileW, $tileH)
        $rail = HGradient $accent $accentLite $tileW
        $c.Graphics.FillRectangle($rail, $x, $y, $tileW, 8)
        $rail.Dispose()
        FillRRect $c.Graphics (B (C 28 42 82 255)) ($x + 28) ($y + 38) 96 96 20
        $c.Graphics.FillEllipse((B $t.Accent), $x + 52, $y + 62, 48, 48)
        DText $c.Graphics $t.Sym $iconFont (B $white) ($x + 76) ($y + 64) 'Center'
        DText $c.Graphics $t.Title $titleFont (B $charcoal) ($x + 28) ($y + 196)
        DText $c.Graphics $t.Sub   $subFont   (B $graphite) ($x + 28) ($y + 232)
    }

    # Cat mascot
    $mX = $W - 320; $mY = $H - 360; $mS = 300
    $c.Graphics.FillEllipse((B $sky), $mX, $mY, $mS, $mS - 30)
    $c.Graphics.FillEllipse((B (C 255 240 247 255)), $mX + 50, $mY + 140, $mS - 100, 80)
    PolygonFill $c.Graphics (B $sky) @(($mX + 50), ($mY + 80), ($mX + 75), ($mY + 10), ($mX + 130), ($mY + 70))
    PolygonFill $c.Graphics (B $sky) @(($mX + 250), ($mY + 80), ($mX + 225), ($mY + 10), ($mX + 170), ($mY + 70))
    $c.Graphics.FillEllipse((B $charcoal), $mX + 90, $mY + 110, 18, 24)
    $c.Graphics.FillEllipse((B $charcoal), $mX + 192, $mY + 110, 18, 24)
    PolygonFill $c.Graphics (B $coral) @(($mX + 140), ($mY + 168), ($mX + 160), ($mY + 168), ($mX + 150), ($mY + 184))
    $penW = New-Object System.Drawing.Pen($charcoal, 2)
    $c.Graphics.DrawLine($penW, ($mX + 70), ($mY + 174), ($mX + 30), ($mY + 170))
    $c.Graphics.DrawLine($penW, ($mX + 70), ($mY + 184), ($mX + 30), ($mY + 190))
    $c.Graphics.DrawLine($penW, ($mX + 230), ($mY + 174), ($mX + 270), ($mY + 170))
    $c.Graphics.DrawLine($penW, ($mX + 230), ($mY + 184), ($mX + 270), ($mY + 190))
    $penW.Dispose()
    $penM = New-Object System.Drawing.Pen($charcoal, 3)
    $penM.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $c.Graphics.DrawArc($penM, $mX + 130, $mY + 178, 18, 16, 0, 180)
    $c.Graphics.DrawArc($penM, $mX + 152, $mY + 178, 18, 16, 0, 180)
    $penM.Dispose()

    Save-Canvas $c (Join-Path $imgDir 'illu-services@2x.png') $W $H
}

# =========================================================================
# MOBILE
# =========================================================================
function Build-Mobile {
    $W = 1600; $H = 1200
    $c = New-Canvas $W $H $paper
    $c.Graphics.FillEllipse((B (C 45 197 168 255)), 80, 80, 320, 320)
    $c.Graphics.FillEllipse((B (C 40 126 200 255)), ($W - 380), ($H - 380), 360, 360)

    $phX = 600; $phY = 120; $phW = 400; $phH = 880
    FillRRect $c.Graphics (B $ink900) $phX $phY $phW $phH 56
    FillRRect $c.Graphics (VGradient $ink800 $ink700 $phH) ($phX + 10) ($phY + 10) ($phW - 20) ($phH - 20) 48
    FillRRect $c.Graphics (B $ink900) ($phX + 144) ($phY + 22) 112 24 12

    $titleFont = Fnt 30
    $subFont   = FntR 16
    $smallFont = FntR 13
    $boldSmall = Fnt 14

    DText $c.Graphics 'Good morning,' $smallFont (B (C 180 255 255 255)) ($phX + 32) ($phY + 90)
    DText $c.Graphics 'Studio Lead'   $titleFont (B $white) ($phX + 32) ($phY + 110)

    $hcX = $phX + 32; $hcY = $phY + 170; $hcW = $phW - 64; $hcH = 180
    FillRRect $c.Graphics (HGradient $accent $accentLite $hcW) $hcX $hcY $hcW $hcH 20
    DText $c.Graphics 'REVENUE - TODAY' $smallFont (B (C 220 255 255 255)) ($hcX + 18) ($hcY + 18)
    DText $c.Graphics '$ 12,480' (Fnt 40) (B $white) ($hcX + 18) ($hcY + 38)
    DText $c.Graphics 'Up 18.4% vs yesterday' $smallFont (B (C 220 255 255 255)) ($hcX + 18) ($hcY + 130)

    $srY = $hcY + $hcH + 16
    for ($i = 0; $i -lt 2; $i++) {
        $sx = $hcX + ($i * (($hcW / 2) + 8))
        $sw = ($hcW / 2) - 4; $sh = 120
        FillRRect $c.Graphics (B (C 20 255 255 255)) $sx $srY $sw $sh 16
        $label = @('DAU','ROAS')[$i]
        $val   = @('38.2k','2.74x')[$i]
        $col   = @($mint, $butter)[$i]
        DText $c.Graphics $label $smallFont (B (C 180 255 255 255)) ($sx + 14) ($srY + 18)
        DText $c.Graphics $val (Fnt 28) (B $white) ($sx + 14) ($srY + 36)
        $penL = New-Object System.Drawing.Pen($col, 2.4)
        $penL.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
        $penL.EndCap   = [System.Drawing.Drawing2D.LineCap]::Round
        $sx2 = $sx + 14; $sy2 = $srY + 96
        for ($k = 0; $k -lt 6; $k++) {
            $j = $k + 1
            $c.Graphics.DrawLine($penL, ($sx2 + $k * 14), ($sy2 - ($k * 4)), ($sx2 + $j * 14), ($sy2 - ($j * 4)))
        }
        $penL.Dispose()
    }

    $alY = $srY + 140
    DText $c.Graphics 'Your apps' $boldSmall (B $white) $hcX $alY
    $apps = @(
        @{ Name='Puzzle Pop';  Meta='Stable - 4.7 stars - 1.2M installs'; Color=$coral },
        @{ Name='ToolBox Pro'; Meta='Stable - 4.5 stars - 860k installs'; Color=$sky }
    )
    for ($i = 0; $i -lt $apps.Count; $i++) {
        $ay = $alY + 22 + ($i * 64)
        FillRRect $c.Graphics (B (C 18 255 255 255)) $hcX $ay $hcW 54 12
        $c.Graphics.FillRectangle((B $apps[$i].Color), ($hcX + 12), ($ay + 12), 30, 30)
        DText $c.Graphics $apps[$i].Name $boldSmall (B $white) ($hcX + 52) ($ay + 10)
        DText $c.Graphics $apps[$i].Meta $smallFont (B (C 160 255 255 255)) ($hcX + 52) ($ay + 30)
        DText $c.Graphics '+8.2%' $boldSmall (B $mint) ($hcX + $hcW - 12) ($ay + 18) 'Right'
    }

    $tx = 80; $ty = 200; $tw = 360; $th = 130
    FillRRect $c.Graphics (B $white) $tx $ty $tw $th 18
    $c.Graphics.DrawRectangle((New-Object System.Drawing.Pen($mist, 1.2)), $tx, $ty, $tw, $th)
    FillRRect $c.Graphics (B $accent) ($tx + 18) ($ty + 22) 70 70 18
    $penC = New-Object System.Drawing.Pen($white, 4)
    $penC.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $penC.EndCap   = [System.Drawing.Drawing2D.LineCap]::Round
    $c.Graphics.DrawLine($penC, ($tx + 34), ($ty + 56), ($tx + 50), ($ty + 72))
    $c.Graphics.DrawLine($penC, ($tx + 50), ($ty + 72), ($tx + 74), ($ty + 44))
    $penC.Dispose()
    DText $c.Graphics 'Build deployed' $boldSmall (B $charcoal) ($tx + 100) ($ty + 26)
    DText $c.Graphics 'Puzzle Pop - v 2.4.1' $smallFont (B $graphite) ($tx + 100) ($ty + 50)
    DText $c.Graphics 'Just now' $smallFont (B $steel) ($tx + 100) ($ty + 72)

    $px = $W - 460; $py = $H - 220; $pw = 380; $ph = 110
    FillRRect $c.Graphics (B $ink900) $px $py $pw $ph 55
    $dot = B (C 255 74 222 128)
    $c.Graphics.FillEllipse($dot, ($px + 24), ([int]($py + $ph/2 - 24)), 48, 48)
    $dot.Dispose()
    DText $c.Graphics 'All systems healthy' (Fnt 18) (B $white) ($px + 90) ($py + 26)
    DText $c.Graphics 'No incidents - last 30 days' $smallFont (B $silver) ($px + 90) ($py + 56)

    # Rabbit mascot
    $mX = 100; $mY = $H - 380; $mS = 280
    $c.Graphics.FillEllipse((B $white), ($mX + 70), $mY, 36, 100)
    $c.Graphics.FillEllipse((B $white), ($mX + 174), $mY, 36, 100)
    $c.Graphics.FillEllipse((B $rose), ($mX + 78), $mY + 10, 20, 76)
    $c.Graphics.FillEllipse((B $rose), ($mX + 182), $mY + 10, 20, 76)
    $c.Graphics.FillEllipse((B $white), $mX, $mY + 90, $mS, $mS - 60)
    $c.Graphics.FillEllipse((B $charcoal), ($mX + 80), ($mY + 160), 14, 22)
    $c.Graphics.FillEllipse((B $charcoal), ($mX + 188), ($mY + 160), 14, 22)
    PolygonFill $c.Graphics (B $coral) @(($mX + 132), ($mY + 198), ($mX + 148), ($mY + 198), ($mX + 140), ($mY + 212))
    $penM = New-Object System.Drawing.Pen($charcoal, 3)
    $penM.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $c.Graphics.DrawArc($penM, $mX + 122, $mY + 208, 18, 18, 0, 180)
    $c.Graphics.DrawArc($penM, $mX + 140, $mY + 208, 18, 18, 0, 180)
    $penM.Dispose()
    $c.Graphics.FillRectangle((B $white), ($mX + 132), ($mY + 216), 8, 18)
    $c.Graphics.FillRectangle((B $white), ($mX + 142), ($mY + 216), 8, 18)
    $c.Graphics.DrawRectangle((New-Object System.Drawing.Pen($charcoal, 1)), ($mX + 132), ($mY + 216), 8, 18)
    $c.Graphics.DrawRectangle((New-Object System.Drawing.Pen($charcoal, 1)), ($mX + 142), ($mY + 216), 8, 18)

    Save-Canvas $c (Join-Path $imgDir 'illu-mobile@2x.png') $W $H
}

# =========================================================================
# STORE
# =========================================================================
function Build-Store {
    $W = 1600; $H = 1200
    $c = New-Canvas $W $H $paper
    $c.Graphics.FillEllipse((B (C 45 255 179 209)), 80, 80, 320, 320)
    $c.Graphics.FillEllipse((B (C 40 197 168 255)), ($W - 380), ($H - 380), 360, 360)

    $phX1 = 80;  $phX2 = 920; $phY = 200; $phW = 420; $phH = 800
    FillRRect $c.Graphics (B $ink900) $phX1 $phY $phW $phH 56
    FillRRect $c.Graphics (VGradient $ink800 $ink700 $phH) ($phX1 + 10) ($phY + 10) ($phW - 20) ($phH - 20) 48
    FillRRect $c.Graphics (B $ink900) ($phX1 + 152) ($phY + 22) 116 24 12
    FillRRect $c.Graphics (B $ink900) $phX2 $phY $phW $phH 56
    FillRRect $c.Graphics (VGradient $ink800 $ink700 $phH) ($phX2 + 10) ($phY + 10) ($phW - 20) ($phH - 20) 48
    FillRRect $c.Graphics (B $ink900) ($phX2 + 152) ($phY + 22) 116 24 12

    $titleFont = Fnt 22
    $subFont   = FntR 14
    $smallFont = FntR 13
    $boldSmall = Fnt 14

    DText $c.Graphics 'Featured'  $titleFont (B $white) ($phX1 + 28) ($phY + 80)
    DText $c.Graphics 'Curated by N VoaWu' $smallFont (B (C 180 255 255 255)) ($phX1 + 28) ($phY + 112)

    $fcX = $phX1 + 28; $fcY = $phY + 144; $fcW = 364; $fcH = 200
    FillRRect $c.Graphics (HGradient $accent $lilac $fcW) $fcX $fcY $fcW $fcH 20
    $c.Graphics.FillEllipse((B $white), ($fcX + 24), ($fcY + 50), 80, 80)
    DText $c.Graphics 'P' (Fnt 48) (B $accent) ($fcX + 50) ($fcY + 56)
    DText $c.Graphics 'Puzzle Pop' (Fnt 24) (B $white) ($fcX + 120) ($fcY + 56)
    DText $c.Graphics 'Match-3 - Casual' $smallFont (B (C 220 255 255 255)) ($fcX + 120) ($fcY + 88)
    FillRRect $c.Graphics (B $ink900) ($fcX + 120) ($fcY + 120) 130 44 22
    DText $c.Graphics 'GET' (Fnt 18) (B $white) ($fcX + 185) ($fcY + 130)

    $apps = @(
        @{ L='ToolBox Pro';  S='Utilities';     R='4.5'; Color=$sky },
        @{ L='CamCue';       S='Photo/Video';  R='4.7'; Color=$butter },
        @{ L='FitTrack';     S='Health';       R='4.6'; Color=$mint },
        @{ L='NoteNimbus';   S='Productivity'; R='4.8'; Color=$lilac }
    )
    for ($i = 0; $i -lt $apps.Count; $i++) {
        $col = $i % 2; $row = [math]::Floor($i / 2)
        $ax = $fcX + ($col * 188)
        $ay = $fcY + $fcH + 20 + ($row * 140)
        $aw = 176; $ah = 130
        FillRRect $c.Graphics (B (C 22 255 255 255)) $ax $ay $aw $ah 18
        $c.Graphics.FillRectangle((B $apps[$i].Color), ($ax + 16), ($ay + 16), 56, 56)
        DText $c.Graphics $apps[$i].L $boldSmall (B $white) ($ax + 16) ($ay + 84)
        DText $c.Graphics $apps[$i].S $smallFont (B (C 150 255 255 255)) ($ax + 16) ($ay + 102)
        DText $c.Graphics $apps[$i].R $smallFont (B $mint) ($ax + 16) ($ay + 122)
    }

    DText $c.Graphics 'Top Charts'  $titleFont (B $white) ($phX2 + 28) ($phY + 80)
    DText $c.Graphics 'This week'   $smallFont (B (C 180 255 255 255)) ($phX2 + 28) ($phY + 112)

    $ranks = @(
        @{ Rk=1; N='Puzzle Pop';   S='Casual - 4.7';        Color=$accent },
        @{ Rk=2; N='ToolBox Pro';  S='Utilities - 4.5';     Color=$sky },
        @{ Rk=3; N='CamCue';       S='Photo - 4.7';         Color=$coral },
        @{ Rk=4; N='FitTrack';     S='Health - 4.6';        Color=$mint },
        @{ Rk=5; N='NoteNimbus';   S='Productivity - 4.8';  Color=$lilac }
    )
    for ($i = 0; $i -lt $ranks.Count; $i++) {
        $rx = $phX2 + 28; $ry = $phY + 144 + ($i * 90); $rw = 364; $rh = 78
        FillRRect $c.Graphics (B (C 22 255 255 255)) $rx $ry $rw $rh 14
        $rkColor = if ($ranks[$i].Rk -eq 1) { $butter } else { $silver }
        DText $c.Graphics ([string]$ranks[$i].Rk) (Fnt 22) (B $rkColor) ($rx + 14) ($ry + 24)
        $c.Graphics.FillRectangle((B $ranks[$i].Color), ($rx + 50), ($ry + 14), 50, 50)
        $letter = $ranks[$i].N.Substring(0, 1)
        DText $c.Graphics $letter (Fnt 22) (B $white) ($rx + 66) ($ry + 22)
        DText $c.Graphics $ranks[$i].N $boldSmall (B $white) ($rx + 116) ($ry + 18)
        DText $c.Graphics $ranks[$i].S $smallFont (B (C 160 255 255 255)) ($rx + 116) ($ry + 44)
    }

    $bx = $W/2 - 200; $by = 280
    foreach ($b in @(@('GET IT ON', 'Android Store'), @('DOWNLOAD ON', 'iOS Store'))) {
        FillRRect $c.Graphics (B $ink900) $bx $by 400 116 18
        FillRRect $c.Graphics (B $accent) ($bx + 24) ($by + 26) 64 64 14
        DText $c.Graphics $b[0] $smallFont (B $silver) ($bx + 110) ($by + 38)
        DText $c.Graphics $b[1] (Fnt 26) (B $white) ($bx + 110) ($by + 60)
        $by += 138
    }

    # Bear mascot
    $mX = $W - 360; $mY = -40; $mS = 300
    $c.Graphics.FillEllipse((B (C 255 165 122 74)), $mX + 30, $mY + 30, 80, 80)
    $c.Graphics.FillEllipse((B (C 255 165 122 74)), $mX + 190, $mY + 30, 80, 80)
    $c.Graphics.FillEllipse((B (C 255 181 136 88)), $mX, $mY + 80, $mS, $mS - 30)
    $c.Graphics.FillEllipse((B (C 255 224 185 138)), $mX + 50, $mY + 50, 40, 40)
    $c.Graphics.FillEllipse((B (C 255 224 185 138)), $mX + 210, $mY + 50, 40, 40)
    $c.Graphics.FillEllipse((B (C 255 224 185 138)), $mX + 90, $mY + 180, 120, 80)
    $c.Graphics.FillEllipse((B $charcoal), $mX + 90, $mY + 130, 18, 18)
    $c.Graphics.FillEllipse((B $charcoal), $mX + 192, $mY + 130, 18, 18)
    $c.Graphics.FillEllipse((B $charcoal), $mX + 138, $mY + 180, 24, 14)
    $penM = New-Object System.Drawing.Pen($charcoal, 3)
    $penM.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $c.Graphics.DrawArc($penM, $mX + 120, $mY + 196, 60, 24, 0, 180)
    $penM.Dispose()

    Save-Canvas $c (Join-Path $imgDir 'illu-store@2x.png') $W $H
}

# =========================================================================
# GLOBAL
# =========================================================================
function Build-Global {
    $W = 1600; $H = 1200
    $c = New-Canvas $W $H $ink900
    $c.Graphics.FillEllipse((B (C 110 42 82 255)), 480, 240, 1200, 1200)

    $penR = New-Object System.Drawing.Pen((C 40 126 200 255), 2)
    for ($i = 0; $i -lt 3; $i++) { $c.Graphics.DrawEllipse($penR, 480, 320, 640, 480) }
    $penR.Dispose()

    $gX = 800; $gY = 620; $gR = 360
    $globeBrush = RadialGlow ($gX - 100) ($gY - 100) $gR (C 255 74 114 255)
    $c.Graphics.FillEllipse($globeBrush, $gX - $gR, $gY - $gR, $gR * 2, $gR * 2)
    $globeBrush.Dispose()
    $c.Graphics.FillEllipse((B (C 40 255 255 255)), $gX - 280, $gY - 280, 240, 140)

    $penM = New-Object System.Drawing.Pen((C 90 126 200 255), 1.5)
    $c.Graphics.DrawEllipse($penM, $gX - $gR, $gY - $gR, $gR * 2, $gR * 2)
    for ($i = 1; $i -lt 6; $i++) {
        $rx = [int]($gR * (1 - ($i * 0.16)))
        $c.Graphics.DrawEllipse($penM, $gX - $rx, $gY - $gR, $rx * 2, $gR * 2)
    }
    for ($i = 1; $i -lt 4; $i++) {
        $ry = [int]($gR * (1 - ($i * 0.22)))
        $c.Graphics.DrawEllipse($penM, $gX - $gR, $gY - $ry, $gR * 2, $ry * 2)
    }
    $penM.Dispose()

    $cBrush = B (C 190 126 200 255)
    $c.Graphics.FillEllipse($cBrush, $gX - 240, $gY - 200, 140, 160)
    $c.Graphics.FillEllipse($cBrush, $gX - 60, $gY - 220, 160, 180)
    $c.Graphics.FillEllipse($cBrush, $gX + 100, $gY - 60, 200, 180)
    $cBrush.Dispose()

    $pins = @(@(640, 540, $coral), @(800, 500, $butter), @(960, 620, $mint))
    foreach ($p in $pins) {
        $c.Graphics.FillEllipse((B (C 100 $p[2].R $p[2].G $p[2].B)), $p[0] - 28, $p[1] - 28, 56, 56)
        $c.Graphics.FillEllipse((B $p[2]), $p[0] - 12, $p[1] - 12, 24, 24)
    }

    $penA = New-Object System.Drawing.Pen((C 140 126 200 255), 2)
    $penA.DashStyle = [System.Drawing.Drawing2D.DashStyle]::Dash
    $c.Graphics.DrawArc($penA, 200, 360, 800, 200, 0, 180)
    $c.Graphics.DrawArc($penA, 700, 800, 700, 200, 0, 180)
    $c.Graphics.DrawArc($penA, 600, 200, 700, 200, 0, 180)
    $penA.Dispose()

    $stats = @(
        @{ X=80;   Y=120; W=320; H=130; Big='32';   BigColor=$accent; Lbl='Countries';      Sub='Active users' },
        @{ X=1180; Y=120; W=320; H=130; Big='4.6';  BigColor=$coral;  Lbl='Avg rating';      Sub='Across stores' },
        @{ X=80;   Y=920; W=340; H=130; Big='14';   BigColor=$mint;   Lbl='Languages';       Sub='Localized apps' },
        @{ X=1160; Y=920; W=340; H=130; Big='24/7'; BigColor=$lilac;  Lbl='Follow-the-sun';  Sub='EU - US - APAC' }
    )
    foreach ($s in $stats) {
        FillRRect $c.Graphics (B (C 20 255 255 255)) $s.X $s.Y $s.W $s.H 18
        $c.Graphics.FillRectangle((B $s.BigColor), ($s.X + 20), ($s.Y + 24), 80, 80)
        DText $c.Graphics $s.Big (Fnt 28) (B $white) ($s.X + 36) ($s.Y + 42)
        DText $c.Graphics $s.Lbl (Fnt 18) (B $white) ($s.X + 116) ($s.Y + 36)
        DText $c.Graphics $s.Sub (FntR 14) (B $silver) ($s.X + 116) ($s.Y + 70)
    }

    # Mini mascots around the globe
    $c.Graphics.FillEllipse((B $coral),  120 + 50,        320 + 30,         36, 36)
    $c.Graphics.FillEllipse((B $coral),  120 + 124,       320 + 30,         36, 36)
    $c.Graphics.FillEllipse((B $coral),  120,             320 + 54,         200, 140)
    $c.Graphics.FillEllipse((B (C 255 255 247 242)), 120 + 40, 320 + 110, 120, 44)
    $c.Graphics.FillEllipse((B $charcoal), 120 + 60, 320 + 84, 20, 20)
    $c.Graphics.FillEllipse((B $charcoal), 120 + 120, 320 + 84, 20, 20)

    $c.Graphics.FillEllipse((B $charcoal), ($W - 320) + 20, 320 + 20, 44, 44)
    $c.Graphics.FillEllipse((B $charcoal), ($W - 320) + 136, 320 + 20, 44, 44)
    $c.Graphics.FillEllipse((B (C 255 246 247 251)), ($W - 320), 320 + 36, 200, 140)
    $c.Graphics.FillEllipse((B $charcoal), ($W - 320) + 44, 320 + 80, 32, 44)
    $c.Graphics.FillEllipse((B $charcoal), ($W - 320) + 124, 320 + 80, 32, 44)

    $c.Graphics.FillEllipse((B $sky), 200, ($H - 380) + 32, 180, 126)
    $c.Graphics.FillEllipse((B $charcoal), 200 + 50, ($H - 380) + 76, 18, 25)
    $c.Graphics.FillEllipse((B $charcoal), 200 + 112, ($H - 380) + 76, 18, 25)

    $c.Graphics.FillEllipse((B $white), ($W - 380) + 50, ($H - 380), 28, 76)
    $c.Graphics.FillEllipse((B $white), ($W - 380) + 100, ($H - 380), 28, 76)
    $c.Graphics.FillEllipse((B $white), ($W - 380), ($H - 380) + 60, 180, 110)
    $c.Graphics.FillEllipse((B $charcoal), ($W - 380) + 54, ($H - 380) + 100, 14, 22)
    $c.Graphics.FillEllipse((B $charcoal), ($W - 380) + 110, ($H - 380) + 100, 14, 22)

    $starBrush = B (C 160 255 255 255)
    $starPositions = @(80,60, 160,40, 240,80, 640,50, 720,100, 560,80, 80,1140, 180,1170, 700,1140, 640,1100)
    for ($i = 0; $i -lt $starPositions.Count; $i += 2) {
        $c.Graphics.FillEllipse($starBrush, $starPositions[$i], $starPositions[$i + 1], 4, 4)
    }
    $starBrush.Dispose()

    Save-Canvas $c (Join-Path $imgDir 'illu-global@2x.png') $W $H
}

# =========================================================================
# MASCOTS strip - 2400x600
# =========================================================================
function Build-Mascots {
    $W = 2400; $H = 600
    $c = New-Canvas $W $H $paper
    $c.Graphics.FillEllipse((B (C 40 197 168 255)), 0, 0, 600, 600)
    $c.Graphics.FillEllipse((B (C 40 255 138 107)), ($W - 600), 0, 600, 600)

    $cellW = [int]($W / 5)

    # Fox at cell 0
    $cx0 = [int]($cellW * 0.5); $cy0 = [int]($H / 2 - 20); $S0 = 280
    $X0 = [int]($cx0 - $S0 / 2); $Y0 = [int]($cy0 - $S0 / 2)
    PolygonFill $c.Graphics (B $coral) @(($X0 + 73), ($Y0 + 56), ($X0 + 98), ($Y0 + 28), ($X0 + 118), ($Y0 + 101))
    PolygonFill $c.Graphics (B $coral) @(($X0 + 207), ($Y0 + 56), ($X0 + 182), ($Y0 + 28), ($X0 + 162), ($Y0 + 101))
    $c.Graphics.FillEllipse((B $coral), $X0, ($Y0 + 50), $S0, [int]($S0 * 0.78))
    $c.Graphics.FillEllipse((B (C 255 255 247 242)), ($X0 + 56), ($Y0 + 154), [int]($S0 * 0.60), [int]($S0 * 0.22))
    $c.Graphics.FillEllipse((B $charcoal), ($X0 + 84), ($Y0 + 118), 28, 28)
    $c.Graphics.FillEllipse((B $charcoal), ($X0 + 168), ($Y0 + 118), 28, 28)
    DText $c.Graphics 'Mochi' (Fnt 18) (B $graphite) $cx0 ($Y0 + $S0 + 12) 'Center'

    # Panda at cell 1
    $cx1 = [int]($cellW * 1.5); $cy1 = $cy0
    $X1 = [int]($cx1 - $S0 / 2); $Y1 = $Y0
    $c.Graphics.FillEllipse((B $charcoal), ($X1 + 34), ($Y1 + 28), 62, 62)
    $c.Graphics.FillEllipse((B $charcoal), ($X1 + 184), ($Y1 + 28), 62, 62)
    $c.Graphics.FillEllipse((B (C 255 246 247 251)), $X1, ($Y1 + 50), $S0, [int]($S0 * 0.78))
    $c.Graphics.FillEllipse((B $charcoal), ($X1 + 56), ($Y1 + 112), 50, 67)
    $c.Graphics.FillEllipse((B $charcoal), ($X1 + 174), ($Y1 + 112), 50, 67)
    $c.Graphics.FillEllipse((B $white), ($X1 + 70), ($Y1 + 130), 22, 22)
    $c.Graphics.FillEllipse((B $white), ($X1 + 188), ($Y1 + 130), 22, 22)
    DText $c.Graphics 'Bao' (Fnt 18) (B $graphite) $cx1 ($Y1 + $S0 + 12) 'Center'

    # Cat at cell 2
    $cx2 = [int]($cellW * 2.5); $cy2 = $cy0
    $X2 = [int]($cx2 - $S0 / 2); $Y2 = $Y0
    PolygonFill $c.Graphics (B $sky) @(($X2 + 56), ($Y2 + 101), ($X2 + 84), ($Y2 + 28), ($X2 + 129), ($Y2 + 84))
    PolygonFill $c.Graphics (B $sky) @(($X2 + 224), ($Y2 + 101), ($X2 + 196), ($Y2 + 28), ($X2 + 151), ($Y2 + 84))
    $c.Graphics.FillEllipse((B $sky), $X2, ($Y2 + 50), $S0, [int]($S0 * 0.78))
    $c.Graphics.FillEllipse((B (C 255 240 247 255)), ($X2 + 62), ($Y2 + 154), [int]($S0 * 0.56), [int]($S0 * 0.22))
    $c.Graphics.FillEllipse((B $charcoal), ($X2 + 84), ($Y2 + 118), 28, 39)
    $c.Graphics.FillEllipse((B $charcoal), ($X2 + 168), ($Y2 + 118), 28, 39)
    DText $c.Graphics 'Lumi' (Fnt 18) (B $graphite) $cx2 ($Y2 + $S0 + 12) 'Center'

    # Bear at cell 3
    $cx3 = [int]($cellW * 3.5); $cy3 = $cy0
    $X3 = [int]($cx3 - $S0 / 2); $Y3 = $Y0
    $c.Graphics.FillEllipse((B (C 255 165 122 74)), ($X3 + 28), ($Y3 + 39), 62, 62)
    $c.Graphics.FillEllipse((B (C 255 165 122 74)), ($X3 + 190), ($Y3 + 39), 62, 62)
    $c.Graphics.FillEllipse((B (C 255 181 136 88)), $X3, ($Y3 + 56), $S0, [int]($S0 * 0.78))
    $c.Graphics.FillEllipse((B (C 255 224 185 138)), ($X3 + 78), ($Y3 + 154), 123, 84)
    $c.Graphics.FillEllipse((B $charcoal), ($X3 + 78), ($Y3 + 118), 22, 22)
    $c.Graphics.FillEllipse((B $charcoal), ($X3 + 180), ($Y3 + 118), 22, 22)
    DText $c.Graphics 'Coco' (Fnt 18) (B $graphite) $cx3 ($Y3 + $S0 + 12) 'Center'

    # Rabbit at cell 4
    $cx4 = [int]($cellW * 4.5); $cy4 = $cy0
    $X4 = [int]($cx4 - $S0 / 2); $Y4 = $Y0
    $c.Graphics.FillEllipse((B $white), ($X4 + 78), $Y4, 45, 118)
    $c.Graphics.FillEllipse((B $white), ($X4 + 157), $Y4, 45, 118)
    $c.Graphics.FillEllipse((B $rose), ($X4 + 84), ($Y4 + 17), 28, 84)
    $c.Graphics.FillEllipse((B $rose), ($X4 + 163), ($Y4 + 17), 28, 84)
    $c.Graphics.FillEllipse((B $white), $X4, ($Y4 + 95), $S0, [int]($S0 * 0.62))
    $c.Graphics.FillEllipse((B $charcoal), ($X4 + 84), ($Y4 + 146), 22, 33)
    $c.Graphics.FillEllipse((B $charcoal), ($X4 + 174), ($Y4 + 146), 22, 33)
    DText $c.Graphics 'Pip' (Fnt 18) (B $graphite) $cx4 ($Y4 + $S0 + 12) 'Center'

    Save-Canvas $c (Join-Path $imgDir 'mascots.png') $W $H
}

# =========================================================================
# OG COVER - 1200x630
# =========================================================================
function Build-OG {
    $W = 1200; $H = 630
    $c = New-Canvas $W $H $ink900
    $bg = VGradient $ink900 $ink700 $H
    $c.Graphics.FillRectangle($bg, 0, 0, $W, $H)
    $bg.Dispose()
    $c.Graphics.FillEllipse((B (C 150 42 82 255)), -120, -120, 700, 700)
    $c.Graphics.FillEllipse((B (C 120 197 168 255)), 800, 300, 600, 600)
    $c.Graphics.FillEllipse((B (C 80 255 138 107)), 700, -100, 500, 500)

    $penG = New-Object System.Drawing.Pen((C 40 126 200 255), 1)
    for ($x = 0; $x -lt $W; $x += 48) { $c.Graphics.DrawLine($penG, $x, 0, $x, $H) }
    for ($y = 0; $y -lt $H; $y += 48) { $c.Graphics.DrawLine($penG, 0, $y, $W, $y) }
    $penG.Dispose()

    # Fox mascot
    $mX = 820; $mY = 250; $mS = 320
    PolygonFill $c.Graphics (B $coral) @(($mX + 80), ($mY + 70), ($mX + 110), ($mY + 30), ($mX + 130), ($mY + 130))
    PolygonFill $c.Graphics (B $coral) @(($mX + 240), ($mY + 70), ($mX + 210), ($mY + 30), ($mX + 190), ($mY + 130))
    $c.Graphics.FillEllipse((B $coral), $mX, $mY + 60, $mS, $mS - 30)
    $c.Graphics.FillEllipse((B (C 255 255 247 242)), ($mX + 70), ($mY + 200), ($mS - 140), 110)
    $c.Graphics.FillEllipse((B $charcoal), ($mX + 96), ($mY + 150), 30, 30)
    $c.Graphics.FillEllipse((B $charcoal), ($mX + 196), ($mY + 150), 30, 30)
    $c.Graphics.FillEllipse((B $white), ($mX + 104), ($mY + 156), 8, 8)
    $c.Graphics.FillEllipse((B $white), ($mX + 204), ($mY + 156), 8, 8)
    $c.Graphics.FillEllipse((B $charcoal), ($mX + 150), ($mY + 210), 22, 14)
    $penS = New-Object System.Drawing.Pen($charcoal, 4)
    $penS.StartCap = [System.Drawing.Drawing2D.LineCap]::Round
    $c.Graphics.DrawArc($penS, $mX + 124, $mY + 220, 76, 32, 0, 180)
    $penS.Dispose()

    DText $c.Graphics 'N VoaWu' (Fnt 64) (B $white) 80 200
    DText $c.Graphics 'Build, launch, and run apps' (FntR 22) (B $white) 80 280
    DText $c.Graphics 'that travel well.'           (Fnt 22)  (B $white) 80 314
    DText $c.Graphics 'STUDIO - DIGITAL - APPS' (Fnt 14) (B $silver) 80 380
    DText $c.Graphics 'nvoawu.com' (Fnt 18) (B $accentLite) 80 540

    $c.Graphics.FillEllipse((B $butter), 480, 90, 14, 14)
    $c.Graphics.FillEllipse((B $butter), 700, 540, 10, 10)

    Save-Canvas $c (Join-Path $imgDir 'og-cover.png') $W $H
}

# =========================================================================
# Run all
# =========================================================================
Write-Host "--- rasterize.ps1 (System.Drawing) ---"
Build-Hero
Build-Services
Build-Mobile
Build-Store
Build-Global
Build-Mascots
Build-OG
Write-Host "--- done ---"
