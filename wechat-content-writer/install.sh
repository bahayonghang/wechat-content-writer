#!/bin/bash

# WeChat Content Writer Plugin 安装脚本
# 支持 Linux 和 macOS 系统

set -e  # 遇到错误立即退出

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# 输出函数
log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

log_info() {
    echo -e "${CYAN}ℹ️  $1${NC}"
}

log_header() {
    echo -e "${WHITE}$1${NC}"
}

# 显示帮助信息
show_help() {
    cat << EOF
WeChat Content Writer Plugin 安装脚本

用法: $0 [选项] [安装路径]

选项:
    -h, --help          显示此帮助信息
    -t, --type TYPE     安装类型: local (默认) 或 global
    -s, --skip-node     跳过 Node.js 检查
    -g, --skip-git      跳过 Git 检查
    -v, --verbose       详细输出

示例:
    $0                           # 本地安装到当前目录
    $0 -t global                # 全局安装到 Claude 插件目录
    $0 /opt/wechat-plugin       # 安装到指定路径
    $0 -t global -s             # 全局安装，跳过 Node.js 检查

EOF
}

# 默认参数
INSTALL_TYPE="local"
INSTALL_PATH=""
SKIP_NODE_CHECK=false
SKIP_GIT_CHECK=false
VERBOSE=false

# 解析命令行参数
parse_args() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                show_help
                exit 0
                ;;
            -t|--type)
                INSTALL_TYPE="$2"
                shift 2
                ;;
            -s|--skip-node)
                SKIP_NODE_CHECK=true
                shift
                ;;
            -g|--skip-git)
                SKIP_GIT_CHECK=true
                shift
                ;;
            -v|--verbose)
                VERBOSE=true
                shift
                ;;
            -*)
                log_error "未知选项: $1"
                show_help
                exit 1
                ;;
            *)
                INSTALL_PATH="$1"
                shift
                ;;
        esac
    done
}

# 详细输出函数
verbose_log() {
    if [[ "$VERBOSE" == "true" ]]; then
        log_info "$1"
    fi
}

# 检测操作系统
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
        if command -v apt-get >/dev/null 2>&1; then
            DISTRO="debian"
        elif command -v yum >/dev/null 2>&1; then
            DISTRO="redhat"
        elif command -v pacman >/dev/null 2>&1; then
            DISTRO="arch"
        else
            DISTRO="unknown"
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
        DISTRO="macos"
    else
        log_error "不支持的操作系统: $OSTYPE"
        exit 1
    fi

    verbose_log "检测到操作系统: $OS ($DISTRO)"
}

# 检查权限
check_permissions() {
    if [[ "$INSTALL_TYPE" == "global" ]]; then
        if [[ $EUID -ne 0 ]]; then
            log_error "全局安装需要 root 权限，请使用 sudo 运行此脚本"
            exit 1
        fi
    fi
}

# 检查 Node.js 安装
check_nodejs() {
    if [[ "$SKIP_NODE_CHECK" == "true" ]]; then
        log_warning "跳过 Node.js 检查"
        return 0
    fi

    if command -v node >/dev/null 2>&1; then
        NODE_VERSION=$(node --version)
        VERSION_NUMBER=${NODE_VERSION#v}
        MAJOR_VERSION=${VERSION_NUMBER%%.*}

        if [[ $MAJOR_VERSION -ge 14 ]]; then
            log_success "Node.js 已安装 (版本: $NODE_VERSION)"
            return 0
        else
            log_warning "Node.js 版本过低 ($NODE_VERSION)，需要 14.0 或更高版本"
            return 1
        fi
    else
        log_warning "未检测到 Node.js 安装"
        return 1
    fi
}

# 安装 Node.js
install_nodejs() {
    log_info "正在安装 Node.js..."

    case $DISTRO in
        debian)
            log_info "使用 apt 安装 Node.js..."
            curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
            sudo apt-get install -y nodejs
            ;;
        redhat)
            log_info "使用 yum 安装 Node.js..."
            curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -
            sudo yum install -y nodejs npm
            ;;
        arch)
            log_info "使用 pacman 安装 Node.js..."
            sudo pacman -S --noconfirm nodejs npm
            ;;
        macos)
            if command -v brew >/dev/null 2>&1; then
                log_info "使用 Homebrew 安装 Node.js..."
                brew install node
            else
                log_info "下载 Node.js 安装包..."
                NODE_VERSION="20.10.0"
                if [[ "$(uname -m)" == "arm64" ]]; then
                    ARCH="arm64"
                else
                    ARCH="x64"
                fi

                NODE_PKG="node-v${NODE_VERSION}-darwin-${ARCH}.tar.gz"
                NODE_URL="https://nodejs.org/dist/v${NODE_VERSION}/${NODE_PKG}"

                cd /tmp
                curl -O "$NODE_URL"
                tar -xzf "$NODE_PKG"
                sudo mv node-v${NODE_VERSION}-darwin-${ARCH} /usr/local/node
                sudo ln -sf /usr/local/node/bin/* /usr/local/bin/
                rm -f "$NODE_PKG"
            fi
            ;;
        *)
            log_error "不支持的发行版，请手动安装 Node.js: https://nodejs.org/"
            return 1
            ;;
    esac

    # 验证安装
    if command -v node >/dev/null 2>&1; then
        log_success "Node.js 安装完成 ($(node --version))"
        return 0
    else
        log_error "Node.js 安装失败"
        return 1
    fi
}

# 检查 Git 安装
check_git() {
    if [[ "$SKIP_GIT_CHECK" == "true" ]]; then
        log_warning "跳过 Git 检查"
        return 0
    fi

    if command -v git >/dev/null 2>&1; then
        log_success "Git 已安装 ($(git --version))"
        return 0
    else
        log_warning "未检测到 Git 安装"
        return 1
    fi
}

# 安装 Git
install_git() {
    log_info "正在安装 Git..."

    case $DISTRO in
        debian)
            sudo apt-get update
            sudo apt-get install -y git
            ;;
        redhat)
            sudo yum install -y git
            ;;
        arch)
            sudo pacman -S --noconfirm git
            ;;
        macos)
            if command -v brew >/dev/null 2>&1; then
                brew install git
            else
                log_info "下载 Xcode Command Line Tools..."
                xcode-select --install
            fi
            ;;
        *)
            log_error "不支持的发行版，请手动安装 Git: https://git-scm.com/"
            return 1
            ;;
    esac

    # 验证安装
    if command -v git >/dev/null 2>&1; then
        log_success "Git 安装完成 ($(git --version))"
        return 0
    else
        log_error "Git 安装失败"
        return 1
    fi
}

# 获取 Claude 插件目录
get_claude_plugin_path() {
    local claude_config="$HOME/.claude"

    if [[ -d "$claude_config" ]]; then
        local plugin_dir="$claude_config/plugins"
        mkdir -p "$plugin_dir" 2>/dev/null
        echo "$plugin_dir"
    else
        mkdir -p "$claude_config"
        mkdir -p "$claude_config/plugins" 2>/dev/null
        echo "$claude_config/plugins"
    fi
}

# 安装插件
install_plugin() {
    local source_path="$1"
    local target_path="$2"

    log_info "正在安装 WeChat Content Writer 插件..."
    verbose_log "源路径: $source_path"
    verbose_log "目标路径: $target_path"

    # 创建 wechat_doc 目录结构（在项目根目录）
    local project_root="$(dirname "$source_path")"
    local wechat_doc_path="$project_root/wechat_doc"
    
    log_info "正在创建内容目录结构..."
    mkdir -p "$wechat_doc_path/AI工业应用"
    mkdir -p "$wechat_doc_path/文献解读"
    mkdir -p "$wechat_doc_path/AI-Coding"
    mkdir -p "$wechat_doc_path/技术分享"
    mkdir -p "$wechat_doc_path/行业动态"
    
    log_success "内容目录已创建: $wechat_doc_path"

    # 备份现有安装
    if [[ -d "$target_path" ]]; then
        local backup_path="${target_path}.backup.$(date +%Y%m%d-%H%M%S)"
        log_warning "检测到现有插件安装，正在备份到: $backup_path"
        mv "$target_path" "$backup_path"
    fi

    # 复制插件文件
    if cp -r "$source_path" "$target_path"; then
        # 设置权限
        chmod -R 755 "$target_path"

        log_success "插件安装完成: $target_path"
        return 0
    else
        log_error "插件复制失败"
        return 1
    fi
}

# 测试插件安装
test_plugin_installation() {
    local plugin_path="$1"

    log_info "正在测试插件安装..."

    local test_files=(
        "$plugin_path/.claude-plugin/plugin.json"
        "$plugin_path/skills/literature-research/SKILL.md"
        "$plugin_path/skills/pdf-analysis/SKILL.md"
        "$plugin_path/commands/search-content.md"
        "$plugin_path/commands/create-article.md"
        "$plugin_path/commands/manage-categories.md"
        "$plugin_path/agents/content-writer.md"
    )

    local all_tests_passed=true

    for file in "${test_files[@]}"; do
        if [[ -f "$file" ]]; then
            log_success "✓ $(basename "$file")"
        else
            log_error "✗ 缺失文件: $file"
            all_tests_passed=false
        fi
    done

    if [[ "$all_tests_passed" == "true" ]]; then
        log_success "插件测试通过！"
        return 0
    else
        log_error "插件测试失败！"
        return 1
    fi
}

# 显示使用说明
show_usage_instructions() {
    local plugin_path
    if [[ "$INSTALL_TYPE" == "global" ]]; then
        plugin_path="$(get_claude_plugin_path)/wechat-content-writer"
    else
        plugin_path="$INSTALL_PATH"
    fi

    echo
    log_header "🎉 WeChat Content Writer 插件安装成功！"
    echo
    log_header "📋 使用方法:"
    echo "   启动 Claude Code 并加载插件:"
    echo "   claude --plugin-dir \"$plugin_path\""
    echo
    echo "   或者在启动后使用:"
    echo "   /plugin-dir \"$plugin_path\""
    echo
    log_header "🚀 可用命令:"
    echo "   /wechat-content-writer:search-content <主题>     - 搜索内容"
    echo "   /wechat-content-writer:create-article <标题>     - 创建文章"
    echo "   /wechat-content-writer:manage-categories <操作>   - 管理分类"
    echo
    log_header "🧠 自动技能:"
    echo "   搜索文献时自动触发 literature-research 技能"
    echo "   分析PDF时自动触发 pdf-analysis 技能"
    echo "   内容创作时自动使用 content-writer 代理"
    echo
    log_header "📖 更多信息:"
    echo "   查看 README.md 获取详细使用说明"
    echo "   插件位置: $plugin_path"
    echo
    log_header "🔧 快速测试:"
    echo "   试试问: \"搜索最新的AI研究论文\""
    echo "   或者:  \"分析这个PDF文档\""
}

# 主安装流程
main() {
    # 解析参数
    parse_args "$@"

    # 清屏并显示标题
    clear
    log_header "🔧 WeChat Content Writer 插件安装程序"
    log_header "======================================"
    echo

    # 检测操作系统
    detect_os

    # 检查权限
    check_permissions

    # 获取脚本目录
    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    local plugin_source_path="$script_dir/wechat-content-writer"

    # 检查源路径
    if [[ ! -d "$plugin_source_path" ]]; then
        log_error "未找到插件源目录: $plugin_source_path"
        log_info "请确保此脚本与 wechat-content-writer 目录在同一位置"
        exit 1
    fi

    log_info "插件源目录: $plugin_source_path"
    verbose_log "操作系统: $OS ($DISTRO)"
    verbose_log "安装类型: $INSTALL_TYPE"
    echo

    # 环境检查
    log_header "🔍 环境检查"
    echo "--------------------"

    # Node.js 检查
    if ! check_nodejs; then
        echo
        read -p "是否自动安装 Node.js? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            if ! install_nodejs; then
                exit 1
            fi
        else
            log_error "需要 Node.js 14.0 或更高版本"
            exit 1
        fi
    fi

    # Git 检查
    if ! check_git; then
        echo
        read -p "是否自动安装 Git? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            if ! install_git; then
                log_warning "某些功能可能需要 Git"
            fi
        else
            log_warning "某些功能可能需要 Git"
        fi
    fi

    echo

    # 确定安装路径
    if [[ "$INSTALL_TYPE" == "global" ]]; then
        if [[ -z "$INSTALL_PATH" ]]; then
            INSTALL_PATH="$(get_claude_plugin_path)/wechat-content-writer"
        fi
    else
        if [[ -z "$INSTALL_PATH" ]]; then
            INSTALL_PATH="$script_dir/wechat-content-writer-installed"
        fi
    fi

    log_header "📦 安装插件"
    echo "--------------------"
    log_info "安装类型: $INSTALL_TYPE"
    log_info "目标路径: $INSTALL_PATH"
    echo

    # 创建目标目录
    mkdir -p "$(dirname "$INSTALL_PATH")"

    # 安装插件
    if ! install_plugin "$plugin_source_path" "$INSTALL_PATH"; then
        exit 1
    fi

    echo

    # 测试安装
    log_header "🧪 测试安装"
    echo "--------------------"

    if ! test_plugin_installation "$INSTALL_PATH"; then
        exit 1
    fi

    echo

    # 完成
    show_usage_instructions

    echo
    log_header "安装完成！按任意键退出..."
    read -n 1
}

# 错误处理
trap 'log_error "安装过程中发生错误，退出码: $?"' ERR

# 运行主程序
main "$@"