# 管理员权限问题解决方案

## 🚨 问题描述

运行 `.\install.ps1 -t global` 时出现错误：
```
❌ Global installation requires administrator privileges
```

## 🔧 解决方案

### 方案1：使用用户级安装脚本（推荐）

```powershell
# 使用专用的用户级安装脚本
.\install-user.ps1
```

**优势：**
- ✅ 无需管理员权限
- ✅ 安装到用户目录
- ✅ 自动创建必要的目录结构
- ✅ 包含完整的安装验证

### 方案2：使用本地安装

```powershell
# 安装到当前用户目录
.\install.ps1

# 或者明确指定本地安装
.\install.ps1 -InstallType local
```

### 方案3：手动指定用户安装路径

```powershell
# 安装到用户的Claude插件目录
.\install.ps1 -InstallPath "$env:USERPROFILE\.claude\plugins\wechat-content-writer"

# 或者使用相对路径
.\install.ps1 -InstallPath "..\.claude\plugins\wechat-content-writer"
```

### 方案4：以管理员身份运行（如果需要系统级安装）

1. **右键点击PowerShell** → "以管理员身份运行"
2. **导航到脚本目录**：
   ```powershell
   cd D:\Documents\WechatDoucment\wechat-content-writer
   ```
3. **运行安装脚本**：
   ```powershell
   .\install.ps1 -t global
   ```

## 🎯 推荐方案对比

| 方案 | 权限要求 | 安装位置 | 推荐程度 | 说明 |
|------|---------|---------|----------|------|
| `install-user.ps1` | 无需管理员 | 用户插件目录 | ⭐⭐⭐⭐⭐ | 最简单，推荐使用 |
| `install.ps1` (默认) | 无需管理员 | 用户插件目录 | ⭐⭐⭐⭐ | 自动检测权限 |
| 手动指定路径 | 无需管理员 | 自定义路径 | ⭐⭐⭐ | 灵活但需要手动配置 |
| 管理员安装 | 需要管理员 | 系统插件目录 | ⭐⭐ | 仅当需要系统级安装时 |

## 📁 安装位置说明

### 用户级安装（推荐）
```
C:\Users\{你的用户名}\.claude\plugins\wechat-content-writer\
```

**优点：**
- 无需管理员权限
- 不影响其他用户
- 易于管理和卸载

### 系统级安装
```
C:\ProgramData\Claude\plugins\wechat-content-writer\
```

**适用场景：**
- 多用户共享
- 企业环境部署
- 需要系统级访问

## 🔍 验证安装

无论使用哪种方案，安装后都可以这样验证：

```powershell
# 检查插件文件是否存在
Get-ChildItem "$env:USERPROFILE\.claude\plugins\wechat-content-writer"

# 检查关键文件
Test-Path "$env:USERPROFILE\.claude\plugins\wechat-content-writer\.claude-plugin\plugin.json"
Test-Path "$env:USERPROFILE\.claude\plugins\wechat-content-writer\skills\pdf-analysis\SKILL.md"

# 检查内容目录
Get-ChildItem "..\wechat_doc"
```

## 🛠️ 故障排除

### 常见问题1：无法创建.claude目录

**解决方案：**
```powershell
# 手动创建目录
New-Item -ItemType Directory -Path "$env:USERPROFILE\.claude" -Force
New-Item -ItemType Directory -Path "$env:USERPROFILE\.claude\plugins" -Force
```

### 常见问题2：PowerShell执行策略限制

**解决方案：**
```powershell
# 查看当前执行策略
Get-ExecutionPolicy

# 设置为允许本地脚本执行
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 常见问题3：文件权限问题

**解决方案：**
```powershell
# 以管理员身份运行PowerShell，然后：
# icacls "$env:USERPROFILE\.claude" /grant "{你的用户名}:(OI)(CI)F"
```

## 📋 快速命令参考

### 最简单的安装方式
```powershell
.\install-user.ps1
```

### 验证安装
```powershell
claude --plugin-dir "$env:USERPROFILE\.claude\plugins\wechat-content-writer"
```

### 测试功能
```powershell
# 在Claude Code中测试
/wechat-content-writer:create-article "测试文章" --category="技术分享" --source="manual"
```

## 🔄 卸载和重装

### 卸载
```powershell
# 删除用户级安装
Remove-Item "$env:USERPROFILE\.claude\plugins\wechat-content-writer" -Recurse -Force

# 删除系统级安装（需要管理员权限）
Remove-Item "C:\ProgramData\Claude\plugins\wechat-content-writer" -Recurse -Force
```

### 重装
```powershell
# 先备份现有安装
Rename-Item "$env:USERPROFILE\.claude\plugins\wechat-content-writer" "wechat-content-writer.backup.$(Get-Date -Format 'yyyyMMdd-HHmmss')"

# 重新安装
.\install-user.ps1
```

---

## 💡 最佳实践建议

1. **优先使用用户级安装**：无需管理员权限，更安全
2. **定期备份插件配置**：防止意外丢失
3. **使用专用的用户安装脚本**：`install-user.ps1`是最简单的方式
4. **验证安装**：安装后使用测试命令验证功能正常
5. **检查权限**：如果遇到权限问题，先检查文件夹权限设置

---

*如有其他问题，请查看 README.md 或提交 issue。*