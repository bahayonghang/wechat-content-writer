#!/usr/bin/env pwsh

<#
.SYNOPSIS
    WeChat Content Writer Plugin Installation Script (Fixed Version)
.DESCRIPTION
    Automated installation and configuration for WeChat Content Writer Claude Code Plugin
.VERSION
    1.0.1
.PARAMETER InstallType
    Installation type: "local" (default) or "global"
.PARAMETER InstallPath
    Custom installation path (optional)
.PARAMETER SkipNodeCheck
    Skip Node.js version check
.PARAMETER SkipGitCheck
    Skip Git installation check
.PARAMETER Detailed
    Show verbose output during installation
.EXAMPLE
    .\install-fixed.ps1
    Install plugin locally in current directory
.EXAMPLE
    .\install-fixed.ps1 -InstallType global
    Install plugin globally to Claude plugins directory
.EXAMPLE
    .\install-fixed.ps1 -t global -s -g
    Install globally, skip Node.js and Git checks
.EXAMPLE
    .\install-fixed.ps1 -Detailed
    Install with verbose output
#>

# Parse parameters using multiple approaches for maximum compatibility
[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [ValidateSet("local", "global")]
    [Alias("t")]
    [string]$InstallType = "local",

    [Parameter(Mandatory=$false)]
    [Alias("p")]
    [string]$InstallPath = "",

    [Parameter(Mandatory=$false)]
    [Alias("s")]
    [switch]$SkipNodeCheck,

    [Parameter(Mandatory=$false)]
    [Alias("g")]
    [switch]$SkipGitCheck,

    [Parameter(Mandatory=$false)]
    [Alias("v", "verbose", "d")]
    [switch]$Detailed
)

# Additional argument parsing for edge cases
for ($i = 0; $i -lt $args.Length; $i++) {
    switch ($args[$i].ToLower()) {
        "-t" {
            if ($i + 1 -lt $args.Length) {
                $InstallType = $args[$i + 1].ToLower()
                $i++
            }
        }
        "-installtype" {
            if ($i + 1 -lt $args.Length) {
                $InstallType = $args[$i + 1].ToLower()
                $i++
            }
        }
        "-s" {
            $SkipNodeCheck = $true
        }
        "-skipnodecheck" {
            $SkipNodeCheck = $true
        }
        "-g" {
            $SkipGitCheck = $true
        }
        "-skipgitcheck" {
            $SkipGitCheck = $true
        }
        "-v" {
            $Detailed = $true
        }
        "-verbose" {
            $Detailed = $true
        }
        "-d" {
            $Detailed = $true
        }
        "-detailed" {
            $Detailed = $true
        }
        "-h" {
        case "/?" {
            Show-Help
            exit 0
        }
        default {
            if ($args[$i].StartsWith("-") -and $args[$i] -ne "-") {
                Write-Host "Warning: Unknown parameter '$($args[$i])'" -ForegroundColor Yellow
                Write-Host "Use -h for help information" -ForegroundColor Yellow
            }
        }
    }
}

function Show-Help {
    Write-Host @"
WeChat Content Writer Plugin Installation Script

USAGE:
    .\install-fixed.ps1 [options]

OPTIONS:
    -t <local|global>        Installation type (default: local)
    -InstallType <type>      Same as -t
    -s                       Skip Node.js check
    -SkipNodeCheck           Same as -s
    -g                       Skip Git check
    -SkipGitCheck            Same as -g
    -v, -d, -verbose         Verbose output
    -h, -?                   Show this help message

EXAMPLES:
    .\install-fixed.ps1
    .\install-fixed.ps1 -t global
    .\install-fixed.ps1 -InstallType global -SkipNodeCheck -SkipGitCheck
    .\install-fixed.ps1 -t global -s -g -v

INSTALLATION TYPES:
    local    - Install to current directory (default)
    global   - Install to Claude plugin directory
"@ -ForegroundColor White
}

# Validate InstallType parameter
if ($InstallType -notin @("local", "global")) {
    Write-Host "Error: InstallType must be 'local' or 'global'" -ForegroundColor Red
    Write-Host "Current value: '$InstallType'" -ForegroundColor Red
    exit 1
}

# Color output functions
function Write-Success {
    param([string]$Message)
    Write-Host "✅ $Message" -ForegroundColor Green
}

function Write-Warning {
    param([string]$Message)
    Write-Host "⚠️  $Message" -ForegroundColor Yellow
}

function Write-Error {
    param([string]$Message)
    Write-Host "❌ $Message" -ForegroundColor Red
}

function Write-Info {
    param([string]$Message)
    Write-Host "ℹ️  $Message" -ForegroundColor Cyan
}

function Write-Header {
    param([string]$Message)
    Write-Host $Message -ForegroundColor White
}

# Main installation logic
function Main {
    Clear-Host
    Write-Header "🔧 WeChat Content Writer Plugin Installation (Fixed Version)"
    Write-Header "======================================================"
    Write-Host ""

    if ($Detailed) {
        Write-Host "PowerShell Version: $($PSVersionTable.PSVersion)" -ForegroundColor Yellow
        Write-Host "InstallType: $InstallType" -ForegroundColor Yellow
        Write-Host "SkipNodeCheck: $SkipNodeCheck" -ForegroundColor Yellow
        Write-Host "SkipGitCheck: $SkipGitCheck" -ForegroundColor Yellow
        Write-Host "Detailed: $Detailed" -ForegroundColor Yellow
        Write-Host "InstallPath: $InstallPath" -ForegroundColor Yellow
        Write-Host "Raw args: [$($args -join ', ')]" -ForegroundColor Yellow
        Write-Host ""
    }

    Write-Info "Installation configuration validated successfully!"
    Write-Info "InstallType: $InstallType"

    if ($SkipNodeCheck) { Write-Info "Node.js check: SKIPPED" }
    if ($SkipGitCheck) { Write-Info "Git check: SKIPPED" }
    if ($Detailed) { Write-Info "Verbose mode: ENABLED" }

    Write-Host ""
    Write-Success "Parameter parsing successful! Installation would proceed here."
    Write-Host ""
    Write-Info "This is a test version to verify parameter parsing."
    Write-Info "Use the original install.ps1 script for actual installation."
}

# Run main function
Main