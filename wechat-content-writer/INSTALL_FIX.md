# PowerShell 安装脚本修复说明

## 🐛 问题描述

运行 `.\install.ps1 -t global` 时报错：
```
install.ps1: A parameter cannot be found that matches parameter name 't'.
```

## 🔧 修复方案

### 方法1：使用完整参数名（推荐）
```powershell
.\install.ps1 -InstallType global
```

### 方法2：使用修复版本的脚本
```powershell
.\install-fixed.ps1 -t global
```

### 方法3：测试参数解析
```powershell
.\test-install.ps1 -t global
```

## 📋 可用的参数格式

### PowerShell 标准格式：
```powershell
.\install.ps1 -InstallType global
.\install.ps1 -SkipNodeCheck
.\install.ps1 -SkipGitCheck
.\install.ps1 -Detailed
```

### 简短别名格式：
```powershell
.\install.ps1 -t global
.\install.ps1 -s
.\install.ps1 -g
.\install.ps1 -v
```

### 组合使用：
```powershell
.\install.ps1 -t global -s -g -v
.\install.ps1 -InstallType global -SkipNodeCheck -SkipGitCheck -Detailed
```

## 🎯 测试命令

测试所有参数是否正常工作：

```powershell
# 测试1：基本参数
.\test-install.ps1 -t global

# 测试2：组合参数
.\test-install.ps1 -t global -s -g -v

# 测试3：完整参数名
.\test-install.ps1 -InstallType local -SkipNodeCheck

# 测试4：显示帮助
.\test-install.ps1 -h
```

## 🔄 故障排除

### 如果仍然出现参数错误：

1. **检查PowerShell版本**：
   ```powershell
   $PSVersionTable.PSVersion
   ```
   建议使用PowerShell 5.1或更高版本

2. **检查执行策略**：
   ```powershell
   Get-ExecutionPolicy
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. **使用完整路径**：
   ```powershell
   .\install.ps1 -InstallType global
   ```

4. **使用修复版本**：
   ```powershell
   .\install-fixed.ps1 -t global
   ```

### 常见错误及解决方法

| 错误 | 解决方法 |
|------|----------|
| "A parameter cannot be found" | 使用完整参数名或修复版本脚本 |
| "Script is disabled" | 设置执行策略：`Set-ExecutionPolicy RemoteSigned` |
| "Access denied" | 以管理员身份运行PowerShell |
| "File not found" | 确保在正确的目录中运行脚本 |

## 📝 验证安装

安装完成后，验证插件是否正确安装：

```powershell
# 检查插件目录
Get-ChildItem $env:USERPROFILE\.claude\plugins\wechat-content-writer

# 检查内容目录
Get-ChildItem ..\wechat_doc

# 测试技能功能
# 在Claude Code中运行：/wechat-content-writer:create-article "测试文章" --category="技术分享" --source="manual"
```

---

*如果问题持续存在，请提供完整的错误信息以便进一步诊断。*