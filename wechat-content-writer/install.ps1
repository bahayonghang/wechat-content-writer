#!/usr/bin/env pwsh

<#
.SYNOPSIS
    WeChat Content Writer Plugin Installation Script
.DESCRIPTION
    Automated installation and configuration for WeChat Content Writer Claude Code Plugin
.VERSION
    1.0.0
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
    .\install.ps1
    Install plugin locally in current directory
.EXAMPLE
    .\install.ps1 -t global
    Install plugin globally to Claude plugins directory
.EXAMPLE
    .\install.ps1 -t global -s -g
    Install globally, skip Node.js and Git checks
.EXAMPLE
    .\install.ps1 -v
    Install with detailed output
.EXAMPLE
    .\install.ps1 -Detailed
    Install with detailed output (full parameter name)
#>

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
    [switch]$SkipNodeCheck = $false,

    [Parameter(Mandatory=$false)]
    [Alias("g")]
    [switch]$SkipGitCheck = $false,

    [Parameter(Mandatory=$false)]
    [Alias("v", "d")]
    [switch]$Detailed = $false
)

# Verbose logging function
function Write-Verbose-Custom {
    param([string]$Message)
    if ($Detailed) {
        Write-Host "  [VERBOSE] $Message" -ForegroundColor DarkGray
    }
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

# Check for administrator rights
function Test-Administrator {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Check Node.js installation
function Test-NodeInstallation {
    try {
        $nodeVersion = node --version 2>$null
        if ($nodeVersion) {
            $versionNumber = $nodeVersion -replace 'v', ''
            $majorVersion = [int]($versionNumber.Split('.')[0])
            if ($majorVersion -ge 14) {
                Write-Success "Node.js installed (version: $nodeVersion)"
                return $true
            } else {
                Write-Warning "Node.js version too low ($nodeVersion), need 14.0 or higher"
                return $false
            }
        }
    } catch {
        # Node.js not in PATH
    }

    Write-Warning "Node.js not detected"
    return $false
}

# Check Git installation
function Test-GitInstallation {
    try {
        $gitVersion = git --version 2>$null
        if ($gitVersion) {
            Write-Success "Git installed ($gitVersion)"
            return $true
        }
    } catch {
        # Git not in PATH
    }

    Write-Warning "Git not detected"
    return $false
}

# Get Claude Code plugin directory (user-level)
function Get-ClaudePluginPath {
    $claudeConfigPath = "$env:USERPROFILE\.claude"

    # Ensure .claude directory exists
    if (-not (Test-Path $claudeConfigPath)) {
        try {
            New-Item -ItemType Directory -Path $claudeConfigPath -Force | Out-Null
            Write-Verbose "Created .claude directory: $claudeConfigPath"
        } catch {
            Write-Warning "Could not create .claude directory: $($_.Exception.Message)"
            return $null
        }
    }

    $pluginPath = Join-Path $claudeConfigPath "plugins"
    if (-not (Test-Path $pluginPath)) {
        try {
            New-Item -ItemType Directory -Path $pluginPath -Force | Out-Null
            Write-Verbose "Created plugins directory: $pluginPath"
        } catch {
            Write-Warning "Could not create plugins directory: $($_.Exception.Message)"
            return $null
        }
    }

    return $pluginPath
}

# Get system-level Claude Code plugin directory
function Get-SystemClaudePluginPath {
    $programDataPath = "$env:PROGRAMDATA\Claude"
    if (-not (Test-Path $programDataPath)) {
        try {
            New-Item -ItemType Directory -Path $programDataPath -Force | Out-Null
        } catch {
            Write-Warning "Could not create system Claude directory: $($_.Exception.Message)"
            return $null
        }
    }

    $pluginPath = Join-Path $programDataPath "plugins"
    if (-not (Test-Path $pluginPath)) {
        try {
            New-Item -ItemType Directory -Path $pluginPath -Force | Out-Null
        } catch {
            Write-Warning "Could not create system plugins directory: $($_.Exception.Message)"
            return $null
        }
    }

    return $pluginPath
}

# Install plugin
function Install-Plugin {
    param([string]$SourcePath, [string]$TargetPath)

    Write-Info "Installing WeChat Content Writer plugin..."

    try {
        if (Test-Path $TargetPath) {
            Write-Warning "Existing plugin installation detected, backing up..."
            $backupPath = "$TargetPath.backup.$(Get-Date -Format 'yyyyMMdd-HHmmss')"
            Move-Item $TargetPath $backupPath
        }

        # Create wechat_doc directory structure (in project root)
        $projectRoot = Split-Path $SourcePath -Parent
        $wechatDocPath = Join-Path $projectRoot "wechat_doc"
        
        Write-Info "Creating content directory structure..."
        New-Item -Path "$wechatDocPath\AI工业应用" -ItemType Directory -Force | Out-Null
        New-Item -Path "$wechatDocPath\文献解读" -ItemType Directory -Force | Out-Null
        New-Item -Path "$wechatDocPath\AI-Coding" -ItemType Directory -Force | Out-Null
        New-Item -Path "$wechatDocPath\技术分享" -ItemType Directory -Force | Out-Null
        New-Item -Path "$wechatDocPath\行业动态" -ItemType Directory -Force | Out-Null
        
        Write-Success "Content directories created: $wechatDocPath"

        # Copy plugin files
        Copy-Item -Path $SourcePath -Destination $TargetPath -Recurse -Force

        # Set permissions
        $acl = Get-Acl $TargetPath
        $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
            $env:USERNAME, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow"
        )
        $acl.SetAccessRule($accessRule)
        Set-Acl $TargetPath $acl

        Write-Success "Plugin installed successfully: $TargetPath"
        return $true
    } catch {
        Write-Error "Plugin installation failed: $($_.Exception.Message)"
        return $false
    }
}

# Test plugin installation
function Test-PluginInstallation {
    param([string]$PluginPath)

    Write-Info "Testing plugin installation..."

    $pluginJsonPath = Join-Path $PluginPath ".claude-plugin\plugin.json"
    $skillsPath = Join-Path $PluginPath "skills"
    $commandsPath = Join-Path $PluginPath "commands"
    $agentsPath = Join-Path $PluginPath "agents"

    $allTestsPassed = $true

    # Test critical files
    $testFiles = @(
        $pluginJsonPath,
        (Join-Path $skillsPath "literature-research\SKILL.md"),
        (Join-Path $skillsPath "pdf-analysis\SKILL.md"),
        (Join-Path $commandsPath "search-content.md"),
        (Join-Path $commandsPath "create-article.md"),
        (Join-Path $commandsPath "manage-categories.md"),
        (Join-Path $agentsPath "content-writer.md")
    )

    foreach ($file in $testFiles) {
        if (Test-Path $file) {
            Write-Success "✓ $(Split-Path $file -Leaf)"
        } else {
            Write-Error "✗ Missing file: $file"
            $allTestsPassed = $false
        }
    }

    if ($allTestsPassed) {
        Write-Success "Plugin tests passed!"
        return $true
    } else {
        Write-Error "Plugin tests failed!"
        return $false
    }
}

# Show usage instructions
function Show-UsageInstructions {
    $pluginPath = Get-ClaudePluginPath
    $fullPluginPath = Join-Path $pluginPath "wechat-content-writer"

    Write-Host ""
    Write-Header "🎉 WeChat Content Writer Plugin installed successfully!"
    Write-Host ""
    Write-Header "📋 Usage:"
    Write-Host "   Start Claude Code and load plugin:"
    Write-Host "   claude --plugin-dir `"$fullPluginPath`""
    Write-Host ""
    Write-Host "   Or use after startup:"
    Write-Host "   /plugin-dir `"$fullPluginPath`""
    Write-Host ""
    Write-Header "🚀 Available commands:"
    Write-Host "   /wechat-content-writer:search-content <topic>     - Search content"
    Write-Host "   /wechat-content-writer:create-article <title>     - Create article"
    Write-Host "   /wechat-content-writer:manage-categories <action> - Manage categories"
    Write-Host ""
    Write-Header "🧠 Auto skills:"
    Write-Host "   literature-research skill triggers on literature search"
    Write-Host "   pdf-analysis skill triggers on PDF analysis"
    Write-Host "   content-writer agent for professional content creation"
    Write-Host ""
    Write-Header "📖 More info:"
    Write-Host "   Check README.md for detailed usage instructions"
    Write-Host "   Plugin location: $fullPluginPath"
}

# Main installation process
function Main {
    Clear-Host
    Write-Header "🔧 WeChat Content Writer Plugin Installer"
    Write-Header "======================================"
    Write-Host ""

    # Check permissions and suggest alternatives if needed
    if ($InstallType -eq "global" -and -not (Test-Administrator)) {
        Write-Warning "Global installation requires administrator privileges"
        Write-Host ""
        Write-Header "Available Options:"
        Write-Host "1. Run PowerShell as Administrator and retry"
        Write-Host "2. Use user-level installation (recommended):"
        Write-Host "   .\install.ps1"
        Write-Host "3. Specify custom user directory:"
        Write-Host "   .\install.ps1 -InstallPath `"C:\Users\$env:USERNAME\.claude\plugins\wechat-content-writer`""
        Write-Host ""
        
        $choice = Read-Host "Would you like to install to user directory? (y/N)"
        if ($choice -match '^[Yy]') {
            $InstallType = "local"
            $InstallPath = "$env:USERPROFILE\.claude\plugins\wechat-content-writer"
            Write-Info "Switching to user-level installation..."
            Write-Info "Target path: $InstallPath"
        } else {
            Write-Error "Installation cancelled. Please run as administrator or choose user-level installation."
            exit 1
        }
    }

    # Get script directory
    $ScriptDir = if ($PSScriptRoot) { $PSScriptRoot } else { Split-Path -Parent $MyInvocation.MyCommand.Definition }

    # Check if we're already in the wechat-content-writer directory
    $currentDir = Get-Location
    if ($currentDir.Path -like "*wechat-content-writer*") {
        $PluginSourcePath = $currentDir.Path
        Write-Info "Plugin source directory detected: $PluginSourcePath"
    } else {
        $PluginSourcePath = Join-Path $ScriptDir "wechat-content-writer"
    }

    if (-not (Test-Path $PluginSourcePath)) {
        Write-Error "Plugin source directory not found: $PluginSourcePath"
        Write-Info "Make sure this script is in the wechat-content-writer directory or its parent directory"
        exit 1
    }

    Write-Info "Plugin source directory: $PluginSourcePath"

    if ($Detailed) {
        Write-Info "Install type: $InstallType"
        Write-Info "Skip Node.js check: $SkipNodeCheck"
        Write-Info "Skip Git check: $SkipGitCheck"
    }
    Write-Host ""

    # Environment check
    Write-Header "🔍 Environment Check"
    Write-Host "--------------------"

    # Node.js check
    if (-not $SkipNodeCheck) {
        $nodeOk = Test-NodeInstallation
        if (-not $nodeOk) {
            Write-Host ""
            Write-Warning "Please install Node.js 14.0 or higher from: https://nodejs.org/"
            exit 1
        }
    } else {
        Write-Warning "Skipping Node.js check"
    }

    # Git check
    if (-not $SkipGitCheck) {
        $gitOk = Test-GitInstallation
        if (-not $gitOk) {
            Write-Host ""
            Write-Warning "Some features may require Git. Install from: https://git-scm.com/"
        }
    } else {
        Write-Warning "Skipping Git check"
    }

    Write-Host ""

    # Determine install path
    if ($InstallType -eq "global") {
        if ([string]::IsNullOrEmpty($InstallPath)) {
            # For global installation, try system-level first, fallback to user-level
            if (Test-Administrator) {
                $targetPath = Get-SystemClaudePluginPath
                $targetPath = Join-Path $targetPath "wechat-content-writer"
            } else {
                Write-Info "Administrator privileges not available, installing to user directory..."
                $targetPath = Get-ClaudePluginPath
                if ($targetPath) {
                    $targetPath = Join-Path $targetPath "wechat-content-writer"
                    Write-Info "Using user-level installation path: $targetPath"
                } else {
                    Write-Error "Could not determine suitable installation path"
                    exit 1
                }
            }
        } else {
            $targetPath = $InstallPath
        }
    } else {
        if ([string]::IsNullOrEmpty($InstallPath)) {
            # For local installation, default to user plugins directory
            $userPluginPath = Get-ClaudePluginPath
            if ($userPluginPath) {
                $targetPath = Join-Path $userPluginPath "wechat-content-writer"
                Write-Info "Using user plugins directory: $targetPath"
            } else {
                # Fallback to script directory
                $targetPath = Join-Path $ScriptDir "wechat-content-writer-installed"
                Write-Info "Using local directory: $targetPath"
            }
        } else {
            $targetPath = $InstallPath
        }
    }

    Write-Header "📦 Installing Plugin"
    Write-Host "--------------------"
    Write-Info "Install type: $InstallType"
    Write-Info "Target path: $targetPath"
    Write-Host ""

    # Install plugin
    if (-not (Install-Plugin -SourcePath $PluginSourcePath -TargetPath $targetPath)) {
        exit 1
    }

    Write-Host ""

    # Test installation
    Write-Header "🧪 Testing Installation"
    Write-Host "--------------------"

    if (-not (Test-PluginInstallation -PluginPath $targetPath)) {
        exit 1
    }

    Write-Host ""

    # Complete
    Show-UsageInstructions

    Write-Host ""
    Write-Header "Installation complete! Press any key to exit..."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

# Error handling
trap {
    Write-Error "Installation failed: $($_.Exception.Message)"
    exit 1
}

# Run main program
Main