<#
.SYNOPSIS
    Installer script untuk menyalin Agent Skills ke lingkungan lokal atau global.

.DESCRIPTION
    Script ini memungkinkan Anda menginstal custom AI skills ke:
    1. Global user profile (~/.gemini/config/skills) agar otomatis aktif di semua project.
    2. Local project folder (./skills atau ./.agents/skills) untuk project tertentu.

.PARAMETER Target
    Tujuan instalasi: 'Global' (default) atau 'Local'.

.PARAMETER Destination
    Path khusus jika ingin menentukan folder tujuan sendiri secara manual.

.PARAMETER IncludeBuiltin
    Apakah menyertakan builtin skills juga (default: false, hanya custom skills).

.EXAMPLE
    .\install.ps1 -Target Global
    .\install.ps1 -Target Local -Destination "D:\Flutter Projects\my_app\.agents\skills"
#>

[CmdletBinding()]
param(
    [ValidateSet('Global', 'Local')]
    [string]$Target = 'Global',

    [string]$Destination = '',

    [switch]$IncludeBuiltin
)

$sourceSkills = Join-Path $PSScriptRoot "skills"
$sourceBuiltin = Join-Path $PSScriptRoot "builtin-skills"

if (-not (Test-Path $sourceSkills)) {
    Write-Error "Folder 'skills' tidak ditemukan di $PSScriptRoot"
    exit 1
}

if ([string]::IsNullOrWhiteSpace($Destination)) {
    if ($Target -eq 'Global') {
        $Destination = Join-Path $env:USERPROFILE ".gemini\config\skills"
    } else {
        $Destination = Join-Path (Get-Location) "skills"
    }
}

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  AI Agent Skills Installer" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Sumber Skill   : $sourceSkills"
Write-Host "Tujuan Target  : $Destination ($Target)"
Write-Host "Include Builtin: $IncludeBuiltin"
Write-Host "------------------------------------------"

if (-not (Test-Path $Destination)) {
    New-Item -ItemType Directory -Force -Path $Destination | Out-Null
    Write-Host "[+] Folder tujuan berhasil dibuat: $Destination" -ForegroundColor Green
}

# Salin Custom & Engineering Skills
$customSkills = Get-ChildItem -Path $sourceSkills -Directory
foreach ($skill in $customSkills) {
    if ($skill.Name -eq "jakubkrehel") {
        # Unpack sub-skills agar langsung terdeteksi oleh agent
        $subSkills = Get-ChildItem -Path $skill.FullName -Directory
        foreach ($sub in $subSkills) {
            $targetSub = Join-Path $Destination $sub.Name
            Copy-Item -Path $sub.FullName -Destination $targetSub -Recurse -Force
            Write-Host "[✓] Terinstal: $($sub.Name)" -ForegroundColor Green
        }
    } else {
        $targetSkillPath = Join-Path $Destination $skill.Name
        Copy-Item -Path $skill.FullName -Destination $targetSkillPath -Recurse -Force
        Write-Host "[✓] Terinstal: $($skill.Name)" -ForegroundColor Green
    }
}

# Salin Builtin Skills jika diminta
if ($IncludeBuiltin -and (Test-Path $sourceBuiltin)) {
    $builtinSkills = Get-ChildItem -Path $sourceBuiltin -Directory
    foreach ($skill in $builtinSkills) {
        $targetSkillPath = Join-Path $Destination $skill.Name
        Copy-Item -Path $skill.FullName -Destination $targetSkillPath -Recurse -Force
        Write-Host "[✓] Terinstal (Built-in): $($skill.Name)" -ForegroundColor Yellow
    }
}

Write-Host "------------------------------------------"
Write-Host "[SELESAI] Semua skill berhasil disalin ke $Destination!" -ForegroundColor Cyan
Write-Host "Agent AI Anda sekarang siap menggunakan skill tersebut." -ForegroundColor Cyan
