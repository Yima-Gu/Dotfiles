#!/bin/bash
#
# A script to set up symlinks for my dotfiles.

# --- 变量定义 ---
DOTFILES_DIR="$HOME/.dotfiles"

echo "🚀 Starting dotfiles setup..."

# 使用关联数组定义要链接的 WSL 内部文件
# 格式: ["源文件在仓库中的路径"]="目标文件在家目录中的名字"
declare -A files_to_link=(
    ["zsh/.zshrc"]=".zshrc"
    ["zsh/.p10k.zsh"]=".p10k.zsh"
    # --- 你可以在这里添加其他你想管理的配置文件 ---
    # ["git/.gitconfig"]=".gitconfig"
)

# --- 1. 为 WSL 内部文件创建符号链接 ---
echo "🔗 Linking WSL-internal configuration files..."

for src_in_repo in "${!files_to_link[@]}"; do
    dest_in_home="$HOME/${files_to_link[$src_in_repo]}"
    src_full_path="$DOTFILES_DIR/$src_in_repo"

    # 如果目标文件/链接已存在，先删除
    if [ -e "$dest_in_home" ] || [ -L "$dest_in_home" ]; then
        echo "   -> Removing existing link/file at $dest_in_home"
        rm "$dest_in_home"
    fi

    # 创建新的符号链接
    echo "   -> Linking $src_full_path to $dest_in_home"
    ln -s "$src_full_path" "$dest_in_home"
done


# --- 2. 手动处理 .wslconfig 的提醒 ---
echo ""
echo "----------------------------------------------------------------"
echo "下一步：手动处理 .wslconfig 文件"
echo ""
echo "👉 请手动将仓库中的 .wslconfig 文件复制到你的 Windows 用户目录下。"
echo ""
echo "源文件位置 (Source):"
echo "   $DOTFILES_DIR/wsl/.wslconfig"
echo ""
echo "目标位置 (Destination):"
echo "   C:\\Users\\$USERNAME\\"
echo ""
echo "✨ 提示: 每当你修改了仓库中的 .wslconfig, 都需要重新手动复制一次才能生效。"
echo "----------------------------------------------------------------"


# --- 完成 ---
echo "✅ Dotfiles setup complete! Please restart your terminal."