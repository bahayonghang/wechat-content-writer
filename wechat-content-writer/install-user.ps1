#!/usr/bin/env pwsh

<#
.SYNOPSIS
    User-Level Installation Script for WeChat Content Writer Plugin
.DESCRIPTION
    Install WeChat Content Writer plugin to user directory without administrator privileges
.VERSION
    1.0.0
.EXAMPLE
    .\install-user.ps1
    Install plugin to user directory
#>

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

# Get user plugin directory
function Get-UserPluginPath {
    $claudeConfigPath = "$env:USERPROFILE\.claude"

    # Create .claude directory if it doesn't exist
    if (-not (Test-Path $claudeConfigPath)) {
        try {
            New-Item -ItemType Directory -Path $claudeConfigPath -Force | Out-Null
            Write-Verbose "Created .claude directory: $claudeConfigPath"
        } catch {
            Write-Error "Could not create .claude directory: $($_.Exception.Message)"
            return $null
        }
    }

    $pluginPath = Join-Path $claudeConfigPath "plugins"
    if (-not (Test-Path $pluginPath)) {
        try {
            New-Item -ItemType Directory -Path $pluginPath -Force | Out-Null
            Write-Verbose "Created plugins directory: $pluginPath"
        } catch {
            Write-Error "Could not create plugins directory: $($_.Exception.Message)"
            return $null
        }
    }

    return $pluginPath
}

# Install plugin
function Install-Plugin {
    param([string]$SourcePath, [string]$TargetPath)

    Write-Info "Installing WeChat Content Writer plugin to user directory..."

    try {
        # Backup existing installation
        if (Test-Path $TargetPath) {
            Write-Warning "Existing plugin installation detected, backing up..."
            $backupPath = "$TargetPath.backup.$(Get-Date -Format 'yyyyMMdd-HHmmss')"
            Move-Item $TargetPath $backupPath
            Write-Info "Backup created: $backupPath"
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
        Write-Info "Copying plugin files..."
        Copy-Item -Path $SourcePath -Destination $TargetPath -Recurse -Force

        # Set permissions (user-level)
        try {
            $acl = Get-Acl $TargetPath
            $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
                $env:USERNAME, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow"
            )
            $acl.SetAccessRule($accessRule)
            Set-Acl $TargetPath $acl
        } catch {
            Write-Warning "Could not set permissions: $($_.Exception.Message)"
        }

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

    $testFiles = @(
        (Join-Path $PluginPath ".claude-plugin\plugin.json"),
        (Join-Path $PluginPath "skills\literature-research\SKILL.md"),
        (Join-Path $PluginPath "skills\pdf-analysis\SKILL.md"),
        (Join-Path $PluginPath "commands\create-article.md"),
        (Join-Path $PluginPath "commands\manage-categories.md"),
        (Join-Path $PluginPath "config.json")
    )

    $allTestsPassed = $true

    foreach ($file in $testFiles) {
        if (Test-Path $file) {
            Write-Success "✓ Found: $(Split-Path $file -Leaf)"
        } else {
            Write-Error "✗ Missing: $file"
            $allTestsPassed = $false
        }
    }

    if ($allTestsPassed) {
        Write-Success "Plugin installation test passed!"
        return $true
    } else {
        Write-Error "Plugin installation test failed!"
        return $false
    }
}

# Main installation function
function Main {
    Clear-Host
    Write-Header "🔧 WeChat Content Writer Plugin - User Level Installation"
    Write-Header "============================================================"
    Write-Host ""

    Write-Info "This script installs the plugin to your user directory."
    Write-Info "No administrator privileges required."
    Write-Host ""

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

    # Get user plugin path
    $userPluginPath = Get-UserPluginPath
    if (-not $userPluginPath) {
        Write-Error "Could not determine user plugin directory"
        exit 1
    }

    $targetPath = Join-Path $userPluginPath "wechat-content-writer"

    Write-Host ""
    Write-Header "📦 Installation Details"
    Write-Host "--------------------"
    Write-Info "Source: $PluginSourcePath"
    Write-Info "Target: $targetPath"
    Write-Host ""

    # Confirm installation
    $continue = Read-Host "Continue with installation? (Y/n)"
    if ($continue -and $continue -notmatch '^[Nn]') {
        # Install plugin
        Write-Header "🚀 Installing Plugin"
        Write-Host "--------------------"

        if (Install-Plugin -SourcePath $PluginSourcePath -TargetPath $targetPath) {
            Write-Host ""

            # Test installation
            Write-Header "🧪 Testing Installation"
            Write-Host "--------------------"

            if (Test-PluginInstallation -PluginPath $targetPath) {
                Write-Host ""
                Show-UsageInstructions -PluginPath $targetPath
            } else {
                Write-Error "Installation test failed. Please check the logs above."
                exit 1
            }
        } else {
            Write-Error "Installation failed. Please check the error message above."
            exit 1
        }
    } else {
        Write-Info "Installation cancelled."
        exit 0
    }
}

# Show usage instructions
function Show-UsageInstructions {
    param([string]$PluginPath)

    Write-Header "🎉 Installation Successful!"
    Write-Host ""
    Write-Header "📋 How to Use:"
    Write-Host "1. Start Claude Code with the plugin:"
    Write-Host "   claude --plugin-dir `"$PluginPath`""
    Write-Host ""
    Write-Host "2. Or load the plugin after starting Claude Code:"
    Write-Host "   /plugin-dir `"$PluginPath`""
    Write-Host ""
    Write-Header "🚀 Available Commands:"
    Write-Host "   /wechat-content-writer:search-content <topic>        - Search for content"
    Write-Host "   /wechat-content-writer:create-article <title>       - Create article"
    Write-Host "   /wechat-content-writer:manage-categories <action>   - Manage categories"
    Write-Host ""
    Write-Header "🧠 Auto Skills:"
    Write-Host "   PDF analysis automatically triggers pdf-analysis skill"
    Write-Host "   Content creation automatically uses objective templates"
    Write-Host ""
    Write-Header "📖 More Information:"
    Write-Host "   - View README.md for detailed usage guide"
    Write-Host "   - Check WRITING_STYLE_GUIDE.md for professional writing tips"
    Write-Host "   - Plugin location: $PluginPath"
    Write-Host ""
    Write-Header "🔧 Quick Test:"
    Write-Host "   Try asking: \"帮我分析这个PDF文档\""
    Write-Host "   Or: \"基于搜索结果创建一篇技术文章\""
    Write-Host ""
    Write-Success "Happy content creation!"
}

# Run main function
try {
    Main
} catch {
    Write-Error "An unexpected error occurred: $($_.Exception.Message)"
    Write-Host "Please report this issue to the plugin maintainers."
    exit 1
}

Write-Host ""
Write-Info "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")