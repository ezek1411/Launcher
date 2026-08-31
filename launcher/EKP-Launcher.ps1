[CmdletBinding()]
param(
    [switch]$Install,
    [switch]$Uninstall,
    [switch]$Open
)

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$BackupName = '.ekp-backup'

function Find-GeometryDash {
    $roots = @(
        "$env:ProgramFiles(x86)\Steam\steamapps\common",
        "$env:ProgramFiles\Steam\steamapps\common",
        "${env:ProgramFiles(x86)}\SteamLibrary\steamapps\common",
        "$env:ProgramFiles\SteamLibrary\steamapps\common"
    ) | Where-Object { $_ -and (Test-Path $_) }
    foreach ($root in $roots) {
        $hit = Get-ChildItem -Path $root -Filter 'GeometryDash.exe' -Recurse -File -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($hit) { return $hit.Directory.FullName }
    }
    $manual = Read-Host 'Chemin du dossier Geometry Dash (vide pour annuler)'
    if ($manual -and (Test-Path (Join-Path $manual 'GeometryDash.exe'))) { return (Resolve-Path $manual).Path }
    return $null
}

function Install-EKP {
    $game = Find-GeometryDash
    if (-not $game) { throw 'Geometry Dash.exe introuvable.' }
    $payload = Join-Path $Root 'payload'
    if (-not (Test-Path $payload)) { throw 'Dossier payload absent. Ajoutez les fichiers du mod avant installation.' }
    $backup = Join-Path $game $BackupName
    New-Item -ItemType Directory -Force -Path $backup | Out-Null
    Get-ChildItem $payload -Recurse -File | ForEach-Object {
        $relative = $_.FullName.Substring($payload.Length).TrimStart('\')
        $target = Join-Path $game $relative
        $targetDir = Split-Path $target -Parent
        New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
        if (Test-Path $target) { Copy-Item $target (Join-Path $backup $relative) -Force }
        Copy-Item $_.FullName $target -Force
    }
    Write-Host "EKP-Launcher installé dans : $game" -ForegroundColor Green
}

function Uninstall-EKP {
    $game = Find-GeometryDash
    if (-not $game) { throw 'Geometry Dash.exe introuvable.' }
    $payload = Join-Path $Root 'payload'
    $backup = Join-Path $game $BackupName
    if (Test-Path $payload) {
        Get-ChildItem $payload -Recurse -File | ForEach-Object {
            $relative = $_.FullName.Substring($payload.Length).TrimStart('\')
            $target = Join-Path $game $relative
            if (Test-Path $target) { Remove-Item $target -Force }
        }
    }
    if (Test-Path $backup) { Copy-Item "$backup\*" $game -Recurse -Force -ErrorAction SilentlyContinue; Remove-Item $backup -Recurse -Force }
    Write-Host 'EKP-Launcher désinstallé.' -ForegroundColor Green
}

if ($Install) { Install-EKP }
elseif ($Uninstall) { Uninstall-EKP }
elseif ($Open) { $game = Find-GeometryDash; if ($game) { Invoke-Item $game } }
else { Write-Host 'Usage: .\EKP-Launcher.ps1 -Install | -Uninstall | -Open' }
