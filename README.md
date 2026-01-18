
# 🚀 My Personal Dotfiles

打造统一、美观且高效的跨平台开发环境（**Windows PowerShell** + **WSL2 Zsh**）。

## ✨ 核心特性

* **双端统一体验**:
* **WSL2**: Zsh + Oh My Zsh + Powerlevel10k，极致速度与功能。
* **Windows**: PowerShell 7 + Oh My Posh，保持与 Linux 一致的视觉体验。


* **美观可视化**: 全面集成 **Nerd Fonts**，支持 Git 状态、环境版本等实时信息显示。
* **模块化管理**: 配置按 `windows/`, `wsl/`, `zsh/` 分类，结构清晰。
* **快速部署**: 包含自动化脚本，一键配置 WSL 环境。

## 📂 目录结构

```text
.
├── install.sh         # WSL 环境一键部署脚本
├── windows/           # Windows 专属配置
│   ├── themes/        # Oh My Posh 主题 (.json)
│   └── Microsoft.PowerShell_profile.ps1
├── wsl/               # WSL 系统级配置
│   └── .wslconfig
└── zsh/               # Zsh 核心配置
    ├── .p10k.zsh
    └── .zshrc

```

## 🔧 前提条件

1. **基础环境**: Windows 10/11 + WSL2 已启用。
2. **字体 (必需)**: 安装一款 **Nerd Font** (推荐 `MesloLGS NF` 或 `FiraCode NF`) 并在终端中启用，否则会出现乱码。
3. **Windows工具**: 建议安装 PowerShell 7 和 Oh My Posh。

## ⚙️ 部署指南

将仓库克隆到本地（建议路径：`D:\Dotfiles` 或 WSL `~/.dotfiles`）。

### 🐧 WSL 环境 (Linux)

1. **克隆仓库**:
```bash
git clone https://github.com/Yima-Gu/Dotfiles.git ~/.dotfiles

```


2. **一键安装**:
```bash
cd ~/.dotfiles && chmod +x install.sh && ./install.sh

```


3. **配置性能 (手动)**:
将 `wsl/.wslconfig` 复制到 Windows 的 `C:\Users\<你的用户名>\` 目录下以优化 WSL2 性能（如镜像网络模式）。

### 🪟 Windows 环境 (PowerShell)

1. **建立软链接**:
以**管理员身份**打开 PowerShell 7，执行以下命令将配置文件指向本仓库（请根据实际路径修改）：
```powershell
# 1. 备份旧配置(如有)
if (Test-Path $PROFILE) { Rename-Item $PROFILE "$PROFILE.bak" }

# 2. 创建软链接 (假设仓库在 D:\Dotfiles)
New-Item -ItemType SymbolicLink -Path $PROFILE -Target "D:\Dotfiles\windows\Microsoft.PowerShell_profile.ps1"

```


2. **重启终端**: 重新打开 PowerShell，享受全新的命令行界面。

## 🎨 日常维护

所有配置均已纳入版本控制。修改配置后，只需执行以下命令同步：

```bash
# 在 Dotfiles 目录下
git add .
git commit -m "chore: update configs"
git push

```

---

*Created by [Yima Gu]*