$src = "https://raw.githubusercontent.com/JWHorner/AdultMedia/main/AdultMedia/"
$dest = "C:\temp\mods\"
$files = @("mod.info",
    "poster.png?raw=true",
    "media/lua/client/RecordedMedia/recorded_media.lua",
    "media/lua/shared/Translate/EN/Recorded_Media_EN.txt",
    "media/lua/shared/Translate/EN/Tooltip_EN.txt",
    "media/scripts/AdultLiterature.txt",
    "media/textures/Item_Juggs.png?raw=true",
    "media/textures/Item_hustlerv6_11.png?raw=true",
    "media/textures/Item_playboyjune1980.png?raw=true")
$wc = New-Object System.Net.WebClient

$files | ForEach-Object {
    $fn = $_.Replace("/", "\")
    if ($fn.Contains("?")) {
        $fn = $fn.Substring(0, $fn.IndexOf("?"))
    }

    if ($fn.Contains("\")) {
        $dir = "$($dest)$($fn.Substring(0,$fn.LastIndexOf("\")))"
        if (-not (Test-Path $dir)) {
            mkdir $dir | Out-Null
        }
    }

    "$($dest)$($fn)"

    $wc.DownloadFile("$($src)$($_)", "$($dest)$($fn)")
}