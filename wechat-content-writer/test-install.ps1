#!/usr/bin/env pwsh

<#
.SYNOPSIS
    Test parameter parsing for WeChat Content Writer Plugin Installation Script
#>

param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("local", "global")]
    [Alias("t")]
    [string]$InstallType = "local",

    [Parameter(Mandatory=$false)]
    [switch]$SkipNodeCheck = $false,

    [Parameter(Mandatory=$false)]
    [switch]$SkipGitCheck = $false,

    [Parameter(Mandatory=$false)]
    [switch]$Detailed = $false
)

# Handle legacy short-form arguments for compatibility
for ($i = 0; $i -lt $args.Length; $i++) {
    switch ($args[$i]) {
        "-t" {
            if ($i + 1 -lt $args.Length) {
                $InstallType = $args[$i + 1]
                $i++
            } else {
                Write-Error "Parameter -t requires a value"
                exit 1
            }
        }
        "-s" {
            $SkipNodeCheck = $true
        }
        "-g" {
            $SkipGitCheck = $true
        }
        "-v" {
            $Detailed = $true
        }
        "-h" {
            Write-Host "Test WeChat Content Writer Plugin Installation Script"
            Write-Host ""
            Write-Host "Usage: .\test-install.ps1 [options]"
            Write-Host ""
            Write-Host "Options:"
            Write-Host "  -t <local|global>    Installation type (default: local)"
            Write-Host "  -s                   Skip Node.js check"
            Write-Host "  -g                   Skip Git check"
            Write-Host "  -v                   Verbose output"
            Write-Host "  -h                   Show this help message"
            Write-Host ""
            Write-Host "Examples:"
            Write-Host "  .\test-install.ps1"
            Write-Host "  .\test-install.ps1 -t global"
            Write-Host "  .\test-install.ps1 -t global -s -g"
            exit 0
        }
        default {
            if ($args[$i].StartsWith("-") -and $args[$i] -ne "-") {
                Write-Error "Unknown parameter: $($args[$i])"
                Write-Host "Use -h for help information" -ForegroundColor Yellow
                exit 1
            }
        }
    }
}

Write-Host "=== Parameter Test Results ===" -ForegroundColor Green
Write-Host "InstallType: $InstallType" -ForegroundColor Cyan
Write-Host "SkipNodeCheck: $SkipNodeCheck" -ForegroundColor Cyan
Write-Host "SkipGitCheck: $SkipGitCheck" -ForegroundColor Cyan
Write-Host "Detailed: $Detailed" -ForegroundColor Cyan
Write-Host "Raw args: [$($args -join ', ')]" -ForegroundColor Cyan
Write-Host "Parameter parsing successful!" -ForegroundColor Green