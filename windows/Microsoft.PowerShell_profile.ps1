# =============================================================================
# Lecture Lens 开发环境配置
# =============================================================================

# 1. 启动 Oh My Posh (使用云端配置文件，彻底解决本地路径找不到的问题)
oh-my-posh init pwsh --config 'D:\Dotfiles\windows\themes\my-theme.json' | Invoke-Expression

# 2. 设置别名 (Alias) - 让你在 Windows 下也能用 Linux 的肌肉记忆
Set-Alias -Name ll -Value ls
Set-Alias -Name grep -Value findstr
Set-Alias -Name g -Value git

# 3. 优化 Git 显示 (防止 Git Log 中文乱码)
$env:LESSCHARSET='utf-8'

# 4. (可选) 可以在这里加一行进入你的插件目录，每次打开终端自动跳转
# Set-Location "D:\Doc\Obsidian\.obsidian\plugins\obsidian-lecture-lens"