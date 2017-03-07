Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip "D:\ProgrammingFiles\edevsteamtool\etc\steamcmd\steamcmd.zip" "D:\ProgrammingFiles\edevsteamtool\etc\steamcmd"