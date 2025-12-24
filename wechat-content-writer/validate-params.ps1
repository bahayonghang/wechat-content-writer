#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Quick parameter validation test for install.ps1
#>

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("local", "global")]
    [Alias("t")]
    [string]$InstallType = "local",

    [Parameter(Mandatory=$false)]
    [Alias("s")]
    [switch]$SkipNodeCheck = $false,

    [Parameter(Mandatory=$false)]
    [Alias("g")]
    [switch]$SkipGitCheck = $false,

    [Parameter(Mandatory=$false)]
    [Alias("v", "d")]
    [switch]$Detailed = $false
)

Write-Host "=== Parameter Validation Test ===" -ForegroundColor Green
Write-Host ""
Write-Host "✅ Parameters parsed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Configuration:" -ForegroundColor Cyan
Write-Host "  InstallType:    $InstallType" -ForegroundColor White
Write-Host "  SkipNodeCheck:  $SkipNodeCheck" -ForegroundColor White
Write-Host "  SkipGitCheck:   $SkipGitCheck" -ForegroundColor White
Write-Host "  Detailed:       $Detailed" -ForegroundColor White
Write-Host ""

if ($Detailed) {
    Write-Host "Detailed Information:" -ForegroundColor Yellow
    Write-Host "  PowerShell Version: $($PSVersionTable.PSVersion)" -ForegroundColor DarkGray
    Write-Host "  OS: $($PSVersionTable.OS)" -ForegroundColor DarkGray
    Write-Host "  Platform: $($PSVersionTable.Platform)" -ForegroundColor DarkGray
    Write-Host ""
}

Write-Host "✅ All parameters validated successfully!" -ForegroundColor Green
Write-Host "You can now run: .\install.ps1 -t $InstallType" -ForegroundColor Cyan
Write-Host ""