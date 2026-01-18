
# Dotfiles

旨在提供 Windows (PowerShell) 与 Linux Subsystem for Windows (WSL2) 间高度统一、无缝切换的终端开发体验。

本项目通过模块化管理配置，集成 **Zsh** 与 **PowerShell 7**，实现了跨平台的视觉一致性与工作流同步。

## 核心特性

* **跨平台统一**: 确保 WSL2 (Zsh + Powerlevel10k) 与 Windows (PowerShell + Oh My Posh) 拥有功能对齐的交互体验。
* **模块化架构**: 配置按平台 (`windows`, `wsl`) 和组件 (`zsh`) 隔离，便于维护与扩展。
* **高性能优化**: 集成 WSL2 镜像网络与性能调优配置，降低资源占用。
* **自动化部署**: 提供 Shell 脚本支持 WSL 环境的快速初始化与软链接管理。

## 目录结构

```text
.
├── install.sh                  # WSL 环境初始化脚本
├── windows/
│   ├── themes/                 # Oh My Posh 主题配置 (.json)
│   └── Microsoft.PowerShell_profile.ps1
├── wsl/
│   └── .wslconfig              # WSL 全局配置 (内存限制、网络模式等)
└── zsh/
    ├── .p10k.zsh               # Powerlevel10k 样式定义
    ├── .zshrc_wsl              # WSL2 配置
    └── .zshrc_server           # Linux 服务器配置

```

## 环境依赖

在部署前，请确保满足以下基础条件：

* **System**: Windows 10/11 (Build 19044+), WSL2 Enabled.
* **Shell**: PowerShell 7+, Zsh.
* **Fonts**: 已安装并启用 [Nerd Fonts](https://www.nerdfonts.com/) (推荐 `MesloLGS NF` 或 `FiraCode NF`) 以支持图标渲染。
* **Tools**: Oh My Posh (Windows端), Oh My Zsh (WSL端).

## 部署指南

建议将仓库克隆至 `~/.dotfiles` (WSL) 或 `D:\Dotfiles` (Windows)。

### 1. WSL (Linux) 环境

在 WSL 终端中执行以下命令，完成 Zsh 配置与插件安装：

```bash
git clone https://github.com/Yima-Gu/Dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

> **Note**: 为了启用镜像网络等高级特性，请手动将 `wsl/.wslconfig` 复制到 Windows 用户主目录 (`%UserProfile%`).

### 2. Windows (PowerShell) 环境

以**管理员身份**打开 PowerShell 7，执行以下命令建立配置软链接：

```powershell
# 定义路径变量
$RepoPath = "D:\Dotfiles"  # 请根据实际克隆路径修改
$TargetProfile = "$RepoPath\windows\Microsoft.PowerShell_profile.ps1"

# 备份现有配置
if (Test-Path $PROFILE) { Rename-Item $PROFILE "$PROFILE.bak" }

# 创建软链接
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $TargetProfile

```
重启终端即可生效。


---

*Copyright © 2025 Yima Gu*

