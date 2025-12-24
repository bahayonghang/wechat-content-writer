# PowerShell 安装脚本修复完成

## ✅ 问题已解决

**原始错误：**
```
.\install.ps1: The parameter 'Verbose' cannot be specified because it conflicts with the parameter alias of the same name for parameter 'Detailed'.
```

**根本原因：**
PowerShell有一个内置的 `-Verbose` 参数（来自 `[CmdletBinding()]`），与自定义参数的别名冲突。

**修复方案：**
移除了 `verbose` 别名，只保留 `v` 和 `d` 作为 `Detailed` 参数的别名。

---

## 🚀 现在可以正常使用

### 基本安装命令

```powershell
# 全局安装（推荐）
.\install.ps1 -t global

# 本地安装
.\install.ps1 -t local

# 或使用完整参数名
.\install.ps1 -InstallType global
```

### 跳过检查（快速安装）

```powershell
# 跳过Node.js和Git检查
.\install.ps1 -t global -s -g

# 或使用完整参数名
.\install.ps1 -InstallType global -SkipNodeCheck -SkipGitCheck
```

### 详细输出模式

```powershell
# 使用简短别名
.\install.ps1 -t global -v

# 或使用另一个别名
.\install.ps1 -t global -d

# 或使用完整参数名
.\install.ps1 -InstallType global -Detailed
```

### 组合使用

```powershell
# 全局安装 + 跳过检查 + 详细输出
.\install.ps1 -t global -s -g -v
```

---

## 🧪 测试参数解析

在实际安装前，可以先测试参数是否正常工作：

```powershell
# 测试基本参数
.\validate-params.ps1 -t global

# 测试所有参数
.\validate-params.ps1 -t global -s -g -v

# 测试完整参数名
.\validate-params.ps1 -InstallType local -Detailed
```

---

## 📋 可用参数列表

| 参数 | 别名 | 类型 | 默认值 | 说明 |
|------|------|------|--------|------|
| `-InstallType` | `-t` | string | `local` | 安装类型：`local` 或 `global` |
| `-InstallPath` | `-p` | string | (空) | 自定义安装路径 |
| `-SkipNodeCheck` | `-s` | switch | `false` | 跳过Node.js版本检查 |
| `-SkipGitCheck` | `-g` | switch | `false` | 跳过Git安装检查 |
| `-Detailed` | `-v`, `-d` | switch | `false` | 显示详细输出 |

---

## 🔧 安装后验证

安装完成后，验证插件是否正确安装：

### 1. 检查插件目录

```powershell
# 全局安装位置
Get-ChildItem $env:USERPROFILE\.claude\plugins\wechat-content-writer

# 本地安装位置
Get-ChildItem .\wechat-content-writer-installed
```

### 2. 检查内容目录

```powershell
# 检查wechat_doc目录结构
Get-ChildItem ..\wechat_doc

# 应该看到以下目录：
# - AI工业应用
# - 文献解读
# - AI-Coding
# - 技术分享
# - 行业动态
```

### 3. 验证配置文件

```powershell
# 检查配置文件
Get-Content .\wechat-content-writer\config.json | ConvertFrom-Json
```

---

## ⚠️ 常见问题

### Q1: 仍然出现参数错误？

**解决方案：**
1. 确保使用最新版本的脚本
2. 使用完整参数名：`-InstallType` 而不是 `-t`
3. 检查PowerShell版本：`$PSVersionTable.PSVersion`（建议5.1+）

### Q2: 执行策略错误？

```powershell
# 查看当前策略
Get-ExecutionPolicy

# 设置为允许本地脚本
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Q3: 权限不足？

```powershell
# 以管理员身份运行PowerShell
# 右键点击PowerShell图标 -> "以管理员身份运行"
```

### Q4: 找不到文件？

```powershell
# 确保在正确的目录中
cd D:\Documents\WechatDoucment\wechat-content-writer

# 列出所有.ps1文件
Get-ChildItem *.ps1
```

---

## 📝 修复历史

### v1.0.1 (2025-12-20)
- ✅ 修复了 `Verbose` 参数冲突问题
- ✅ 移除了 `verbose` 别名，保留 `v` 和 `d`
- ✅ 添加了自定义详细输出函数
- ✅ 更新了文档和示例

### v1.0.0 (初始版本)
- ✅ 基本安装功能
- ✅ 参数别名支持
- ✅ 自动创建wechat_doc目录

---

## 🎉 成功安装后

安装成功后，你可以：

1. **启动Claude Code并加载插件**：
   ```bash
   claude --plugin-dir "D:\Documents\WechatDoucment\wechat-content-writer"
   ```

2. **使用技能创建文章**：
   ```
   /wechat-content-writer:create-article "文章标题" --category="AI工业应用" --source="pdf"
   ```

3. **查看生成的文章**：
   ```powershell
   Get-ChildItem ..\wechat_doc\AI工业应用
   ```

---

*如有其他问题，请查看 README.md 或提交 issue。*